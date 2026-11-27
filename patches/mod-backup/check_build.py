from pathlib import Path
import sys
before, after = map(Path, sys.argv[1:])
def read(root, path): return (root/path).read_text()
def clean(text): return [x.strip() for x in text.splitlines() if x.strip() and x.strip() != 'nop']
p = 'smali_classes2/h0.smali'
old, new = read(before,p), read(after,p)
insert = '''    move-object/from16 v4, p0
    iget-object v4, v4, Lh0;->i:Ljava/lang/Object;
    check-cast v4, Lxi0;
    iget-object v4, v4, Lxi0;->a:Landroid/content/Context;
    invoke-static {v4, v5}, LSLModBackup;->write(Landroid/content/Context;Ljava/util/zip/ZipOutputStream;)V
'''
assert clean(insert) == clean(new[new.index('    move-object/from16 v4, p0', new.index('    :cond_27')):new.index('    :try_end_4', new.index('    :cond_27'))])
assert new.index('LSLModBackup;->write') < new.index(':try_end_4') < new.index('ZipOutputStream;->close()')
start = '    invoke-static {v4, v0, v3, v5, v1}, Lr4b;->f(Ljava/io/File;Ljava/io/File;Ljava/util/List;Ljava/util/zip/ZipOutputStream;[B)V'
end = '    invoke-virtual {v5}, Ljava/util/zip/ZipOutputStream;->close()V'
assert clean(old[:old.index(start)]) == clean(new[:new.index(start)])
assert clean(old[old.index(end):]) == clean(new[new.index(end):])
section = new[new.index(start):new.index(end)]
assert 'goto :goto_15' in section and ':cond_27' in section and ':catchall_2' in section
p='smali_classes2/yx0.smali'; old,new=read(before,p),read(after,p)
hook='    invoke-static/range {v16 .. v17}, LSLModBackup;->restore(Landroid/content/Context;Ljava/io/File;)V\n'
assert new.count(hook)==1 and ':cond_11\n'+hook in new
assert clean(old)==clean(new.replace(hook,''))
assert 'move-object/from16 v16, v4' in new and 'move-object/from16 v17, v3' in new
helper=read(after,'smali_classes4/SLModBackup.smali')
for s in ('sl_mod_settings','sl_agenda_prefs_v1','sl_agenda_panel_v1','sl_mod_backup_v1.bin','Ljava/util/zip/ZipOutputStream;->putNextEntry', 'Landroid/content/SharedPreferences$Editor;->commit'):
    assert s in helper, s
for p in ('AndroidManifest.xml','smali_classes4/SLGlassClockView.smali','smali_classes4/SLClockTask.smali','smali_classes4/SLAgendaStore.smali','smali_classes4/SLAgendaPanel.smali','smali_classes2/vx0.smali','smali_classes2/ux0.smali'):
    assert clean(read(before,p))==clean(read(after,p)), p
for p in (before/'res').rglob('*'):
    if p.is_file(): assert p.read_bytes()==(after/p.relative_to(before)).read_bytes(), p
assert 'versionCode: 660298' in read(after,'apktool.yml')
print('PASS: zip writer and post-validation restore hooks, unchanged clock/agenda/other restore logic')
