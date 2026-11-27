import android.content.Context;
import android.content.SharedPreferences;
import java.io.*;
import java.nio.ByteBuffer;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/** Embedded, versioned snapshots; never parse or clear anything for an older backup. */
public final class SLModBackup {
    private static final String FILE = "sl_mod_backup_v1.bin";
    private static final String[] NAMES = {"sl_mod_settings", "sl_agenda_prefs_v1", "sl_agenda_panel_v1"};
    private static final int LIMIT = 32 * 1024 * 1024, MAX_ITEMS = 20000;
    private static final int MAGIC = 0x534c4d31;

    public static void write(Context context, ZipOutputStream zip) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        DataOutputStream out = new DataOutputStream(bytes);
        out.writeInt(MAGIC);
        out.writeInt(NAMES.length);
        for (String name : NAMES) {
            writeString(out, name);
            Map<String, ?> values = context.getSharedPreferences(name, 0).getAll();
            if (values.size() > MAX_ITEMS) throw new IOException("Too many mod settings");
            out.writeInt(values.size());
            for (Map.Entry<String, ?> e : values.entrySet()) {
                writeString(out, e.getKey());
                Object v = e.getValue();
                if (v instanceof String) { out.writeByte(1); writeString(out, (String) v); }
                else if (v instanceof Boolean) { out.writeByte(2); out.writeBoolean((Boolean)v); }
                else if (v instanceof Integer) { out.writeByte(3); out.writeInt((Integer)v); }
                else if (v instanceof Long) { out.writeByte(4); out.writeLong((Long)v); }
                else if (v instanceof Float && Float.isFinite((Float)v)) { out.writeByte(5); out.writeFloat((Float)v); }
                else if (v instanceof Set) {
                    Set<?> set = (Set<?>)v;
                    if (set.size() > MAX_ITEMS) throw new IOException("Too many set entries");
                    out.writeByte(6); out.writeInt(set.size());
                    for (Object s : set) { if (!(s instanceof String)) throw new IOException("Invalid set value"); writeString(out, (String)s); }
                } else throw new IOException("Unsupported mod preference value");
                if (bytes.size() > LIMIT) throw new IOException("Mod backup too large");
            }
        }
        out.flush();
        if (bytes.size() > LIMIT) throw new IOException("Mod backup too large");
        zip.putNextEntry(new ZipEntry(FILE));
        bytes.writeTo(zip);
        zip.closeEntry();
    }
    public static void restore(Context context, File dir) throws IOException {
        File file = new File(dir, FILE);
        if (!file.exists()) return;
        if (!file.isFile() || file.length() > LIMIT) throw new IOException("Invalid mod backup size");
        List<Map<String, Object>> values = new ArrayList<>();
        try (DataInputStream in = new DataInputStream(new BufferedInputStream(new FileInputStream(file)))) {
            if (in.readInt() != MAGIC || in.readInt() != NAMES.length) throw new IOException("Invalid mod backup header");
            for (String name : NAMES) {
                if (!name.equals(readString(in))) throw new IOException("Invalid mod backup section");
                int count = in.readInt();
                if (count < 0 || count > MAX_ITEMS) throw new IOException("Invalid preference count");
                Map<String, Object> map = new LinkedHashMap<>();
                for (int i = 0; i < count; i++) {
                    String key = readString(in);
                    if (map.containsKey(key)) throw new IOException("Duplicate preference");
                    int type = in.readUnsignedByte(); Object value;
                    switch (type) {
                        case 1: value = readString(in); break;
                        case 2: { int b = in.readUnsignedByte(); if (b > 1) throw new IOException("Invalid boolean"); value = b == 1; break; }
                        case 3: value = in.readInt(); break;
                        case 4: value = in.readLong(); break;
                        case 5: { float f = in.readFloat(); if (!Float.isFinite(f)) throw new IOException("Invalid float"); value = f; break; }
                        case 6: {
                            int n = in.readInt(); if (n < 0 || n > MAX_ITEMS) throw new IOException("Invalid set size");
                            Set<String> set = new HashSet<>();
                            for (int j = 0; j < n; j++) if (!set.add(readString(in))) throw new IOException("Duplicate set item");
                            value = set; break;
                        }
                        default: throw new IOException("Unknown preference type");
                    }
                    map.put(key, value);
                }
                values.add(map);
            }
            if (in.read() != -1) throw new IOException("Unexpected mod backup content");
        }
        List<Map<String, ?>> previous = new ArrayList<>();
        for (String name : NAMES) previous.add(new HashMap<>(context.getSharedPreferences(name, 0).getAll()));
        try {
            for (int i = 0; i < NAMES.length; i++) if (!replace(context.getSharedPreferences(NAMES[i], 0), values.get(i))) throw new IOException("Could not restore mod settings");
        } catch (Exception ex) {
            for (int i = 0; i < NAMES.length; i++) try { replace(context.getSharedPreferences(NAMES[i], 0), previous.get(i)); } catch (Exception ignored) { }
            throw new IOException("Mod restore failed; rollback attempted", ex);
        }
    }
    private static boolean replace(SharedPreferences prefs, Map<String, ?> values) throws IOException {
        SharedPreferences.Editor e = prefs.edit().clear();
        for (Map.Entry<String, ?> entry : values.entrySet()) {
            String k = entry.getKey(); Object v = entry.getValue();
            if (v instanceof String) e.putString(k, (String)v);
            else if (v instanceof Boolean) e.putBoolean(k, (Boolean)v);
            else if (v instanceof Integer) e.putInt(k, (Integer)v);
            else if (v instanceof Long) e.putLong(k, (Long)v);
            else if (v instanceof Float) e.putFloat(k, (Float)v);
            else if (v instanceof Set) {
                Set<String> set = new HashSet<>();
                for (Object s : (Set<?>)v) { if (!(s instanceof String)) throw new IOException("Invalid set"); set.add((String)s); }
                e.putStringSet(k, set);
            } else throw new IOException("Unsupported preference");
        }
        return e.commit();
    }
    private static void writeString(DataOutputStream out, String s) throws IOException {
        if (s == null) throw new IOException("Null string");
        byte[] b = s.getBytes(StandardCharsets.UTF_8);
        if (b.length > LIMIT) throw new IOException("Mod value too large");
        out.writeInt(b.length); out.write(b);
    }
    private static String readString(DataInputStream in) throws IOException {
        int n = in.readInt(); if (n < 0 || n > LIMIT) throw new IOException("Invalid string size");
        byte[] b = new byte[n]; in.readFully(b);
        try { return StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT).onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(b)).toString(); }
        catch (java.nio.charset.CharacterCodingException ex) { throw new IOException("Invalid UTF-8", ex); }
    }
}
