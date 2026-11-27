from pathlib import Path
import sys
b,a=map(Path,sys.argv[1:])
def get(root, file): return (root/file).read_text()
def norm(t): return [s.strip() for s in t.splitlines() if s.strip() and s.strip()!='nop']
def method(t, sig):
    start=t.index('.method '+sig)
    return t[start:t.index('.end method',start)+len('.end method')]
for name in ('sb0','rn'):
    old=get(b,f'smali_classes2/{name}.smali'); new=get(a,f'smali_classes4/{name}.smali')
    assert not (a/f'smali_classes2/{name}.smali').exists()
    assert 'const v0, 0x7f140139' not in method(new,'public constructor <init>')
    for sig in ('public o()Z', 'public p()Lgg;', 'public q()Lgg4;'): assert new.count('.method '+sig)==1
    assert 'Lhgb;->y(Landroid/content/Context;IZ)Lgg;' in method(new,'public p()Lgg;')
    assert '-0x14141500000000L' in method(new,'public q()Lgg4;')
    assert norm(method(old,'public final k('))==norm(method(new,'public final k('))
shape=method(get(a,'smali_classes2/vr5.smali'),'public static final v(')
assert 'if-nez v9' in shape and '-0x14141500000000L' in shape and 'cmp-long v20, v10, v18' in shape
assert shape.count('Lwi9;->b(F)Lvi9;')==2
assert shape.count('-0x14141500000000L')==2 and 'move/from16 v16, v14' in shape
for p in ('smali_classes2/ab0.smali','smali_classes2/ki0.smali','smali_classes2/q1.smali','smali_classes2/f01.smali',
          'smali_classes2/j82.smali','smali_classes2/lw5.smali','smali_classes2/yj4.smali',
          'smali_classes4/SLModBackup.smali','smali_classes4/SLSearchHook.smali',
          'smali/ginlemon/flower/launchable/view/LaunchableView.smali',
          'smali_classes4/ginlemon/flower/pickers/iconPicker/IconPickerActivity.smali',
          'smali/ginlemon/flower/searchPanel/SearchPanel.smali','AndroidManifest.xml'):
    assert norm(get(b,p))==norm(get(a,p)),p
for p in (b/'smali_classes5').glob('*.smali'):
    assert norm(p.read_text())==norm((a/p.relative_to(b)).read_text()),p
old={p.relative_to(b) for p in (b/'res').rglob('*') if p.is_file()}
new={p.relative_to(a) for p in (a/'res').rglob('*') if p.is_file()}
assert old==new
for p in old: assert (b/p).read_bytes()==(a/p).read_bytes(),p
assert 'versionCode: 660301' in get(a,'apktool.yml')
print('PASS: scoped light popover and round shape, unchanged actions, folders, GIF, search, backup, manifest and resources')
