import android.content.Context;
import android.content.SharedPreferences;
import java.io.*;
import java.nio.file.Files;
import java.util.*;
import java.util.zip.*;
public class SLModBackupTest {
    static class Prefs implements SharedPreferences {
        Map<String,Object> data = new HashMap<>(); boolean fail;
        public Map<String, ?> getAll() { return new HashMap<>(data); }
        public Editor edit() { return new E(); }
        class E implements Editor {
            Map<String,Object> d = new HashMap<>(data);
            public Editor clear() { d.clear(); return this; }
            public Editor putString(String k,String v){d.put(k,v);return this;}
            public Editor putBoolean(String k,boolean v){d.put(k,v);return this;}
            public Editor putInt(String k,int v){d.put(k,v);return this;}
            public Editor putLong(String k,long v){d.put(k,v);return this;}
            public Editor putFloat(String k,float v){d.put(k,v);return this;}
            public Editor putStringSet(String k,Set<String> v){d.put(k,new HashSet<>(v));return this;}
            public boolean commit(){data=new HashMap<>(d); if(fail){fail=false;return false;} return true;}
        }
    }
    static class Ctx extends Context {
        Map<String,Prefs> prefs = new HashMap<>();
        public Prefs getSharedPreferences(String n,int m){ if(!prefs.containsKey(n)) prefs.put(n,new Prefs()); return prefs.get(n); }
    }
    static void check(boolean b){if(!b)throw new AssertionError();}
    public static void main(String[] args)throws Exception {
        Ctx c=new Ctx();
        Prefs mod=c.getSharedPreferences("sl_mod_settings",0), switches=c.getSharedPreferences("sl_agenda_prefs_v1",0), agenda=c.getSharedPreferences("sl_agenda_panel_v1",0);
        mod.data.put("glass_clock_style",3); mod.data.put("glass_clock_opacity",.4f); mod.data.put("enabled",true); mod.data.put("unicode","اردو"); mod.data.put("set",new HashSet<>(Arrays.asList("a","b"))); mod.data.put("long",12345678901L);
        switches.data.put("ios26_glass_switches_v1",true); agenda.data.put("items_json","[{\"title\":\"Personal task\"}]"); agenda.data.put("expenses_json_v1","private");
        Map<String,?> before=mod.getAll(), expectedAgenda=agenda.getAll();
        ByteArrayOutputStream bytes=new ByteArrayOutputStream(); ZipOutputStream zip=new ZipOutputStream(bytes); zip.putNextEntry(new ZipEntry("original")); zip.write(1); zip.closeEntry(); SLModBackup.write(c,zip); zip.close();
        File dir=Files.createTempDirectory("mod-backup").toFile(); byte[] payload=null;
        try(ZipInputStream in=new ZipInputStream(new ByteArrayInputStream(bytes.toByteArray()))) { ZipEntry ent; while((ent=in.getNextEntry())!=null) if(ent.getName().equals("sl_mod_backup_v1.bin")){ ByteArrayOutputStream o=new ByteArrayOutputStream(); byte[] b=new byte[512]; int n; while((n=in.read(b))!=-1)o.write(b,0,n); payload=o.toByteArray(); }}
        check(payload!=null); File f=new File(dir,"sl_mod_backup_v1.bin"); Files.write(f.toPath(),payload);
        mod.data.clear(); mod.data.put("obsolete",5); agenda.data.clear(); switches.data.clear(); SLModBackup.restore(c,dir);
        check(mod.getAll().equals(before)); check(agenda.getAll().equals(expectedAgenda)); check(switches.data.get("ios26_glass_switches_v1").equals(true));
        mod.data.put("sentinel",42); byte[] bad=Arrays.copyOf(payload,payload.length-1); Files.write(f.toPath(),bad); try {SLModBackup.restore(c,dir);throw new AssertionError();} catch(IOException expected){} check(mod.data.get("sentinel").equals(42));
        f.delete(); SLModBackup.restore(c,dir); check(mod.data.get("sentinel").equals(42));
        Files.write(f.toPath(),payload); switches.fail=true; Map<String,?> prior=mod.getAll(); try {SLModBackup.restore(c,dir);throw new AssertionError();}catch(IOException expected){} check(mod.getAll().equals(prior));
        f.delete(); dir.delete();
        System.out.println("PASS: typed settings and private agenda ZIP roundtrip, old backups, corruption, rollback");
    }
}
