from pathlib import Path
from zipfile import ZipFile
import re, sys
base, result, apk = map(Path, sys.argv[1:])
def norm(path): return [line.strip() for line in path.read_text().splitlines() if line.strip() and line.strip() != 'nop']
panel = Path('smali/ginlemon/flower/searchPanel/SearchPanel.smali')
for d in ('smali','smali_classes2','smali_classes3','smali_classes4','smali_classes5'):
    a = {p.relative_to(base) for p in (base/d).rglob('*.smali')}
    b = {p.relative_to(result) for p in (result/d).rglob('*.smali')}
    assert a == b, d
    for p in a - {panel}: assert norm(base/p) == norm(result/p), str(p)
for d in ('res',):
    a = {p.relative_to(base) for p in (base/d).rglob('*') if p.is_file()}
    b = {p.relative_to(result) for p in (result/d).rglob('*') if p.is_file()}
    assert a == b
    for p in a: assert (base/p).read_bytes() == (result/p).read_bytes(), str(p)
assert norm(base/'AndroidManifest.xml') == norm(result/'AndroidManifest.xml')
def methods(path):
    text = path.read_text()
    return {m.group(1):m.group(0) for m in re.finditer(r'^\.method ([^\n]+)\n.*?^\.end method', text, re.M|re.S)}
old,new = methods(base/panel), methods(result/panel)
assert old.keys() == new.keys()
changed = {'public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V', 'public final w()V','public final y()V','public final onDetachedFromWindow()V'}
for key in old.keys()-changed:
    normal=lambda s:[l.strip() for l in s.splitlines() if l.strip() and l.strip()!='nop']
    assert normal(old[key]) == normal(new[key]),key
assert 'invoke-direct {v13, v14, v10, v9, v12}, LSLSearchAnimation;-><init>' in new[next(k for k in changed if k.startswith('public constructor'))]
assert 'LSLSearchAnimation;->start()V' in new['public final w()V']
for k in ('public final y()V','public final onDetachedFromWindow()V'): assert 'LSLSearchAnimation;->stop()V' in new[k]
for p in (result/'smali_classes6').glob('*.smali'): assert p.name.startswith('SLSearchAnimation')
assert len(list((result/'smali_classes6').glob('*.smali'))) == 3
with ZipFile(apk) as z: assert z.read('classes6.dex') == Path('patches/search-bar-animation/classes6.dex').read_bytes()
assert 'versionCode: 660304' in (result/'apktool.yml').read_text()
print('PASS: scoped search lifecycle hooks; preserved launcher classes, menus, GIF helper, resources and manifest')
