from pathlib import Path
from zipfile import ZipFile
import re,sys
base,result,apk=map(Path,sys.argv[1:])
def norm(s): return [line.strip() for line in s.splitlines() if line.strip() and line.strip()!='nop']
grid=Path('smali/ginlemon/flower/panels/drawer/view/GridRecyclerView.smali')
click=Path('smali/ginlemon/flower/glass/SLDrawerSearchClick.smali')
for d in ('smali','smali_classes2','smali_classes3','smali_classes4','smali_classes5'):
    old={p.relative_to(base) for p in (base/d).rglob('*.smali')}
    new={p.relative_to(result) for p in (result/d).rglob('*.smali')}
    assert old==new,d
    for p in old-{grid,click}: assert norm((base/p).read_text())==norm((result/p).read_text()),str(p)
def methods(path):
    return {m.group(1):m.group(0) for m in re.finditer(r'^\.method ([^\n]+)\n.*?^\.end method',path.read_text(),re.M|re.S)}
a,b=methods(base/grid),methods(result/grid)
assert b.keys()-a.keys()=={'protected getTopFadingEdgeStrength()F'}
assert all(norm(a[k])==norm(b[k]) for k in a)
assert 'const/4 v0, 0x0' in b['protected getTopFadingEdgeStrength()F']
a,b=methods(base/click),methods(result/click)
assert norm(a['public onClick(Landroid/view/View;)V'].replace('public onClick','public open',1))==norm(b['public open(Landroid/view/View;)V'])
assert 'SLDrawerAnimation;->start' in b['public onClick(Landroid/view/View;)V']
old={p.relative_to(base) for p in (base/'res').rglob('*') if p.is_file()}
new={p.relative_to(result) for p in (result/'res').rglob('*') if p.is_file()}
assert old==new
for p in old: assert (base/p).read_bytes()==(result/p).read_bytes(),str(p)
assert norm((base/'AndroidManifest.xml').read_text())==norm((result/'AndroidManifest.xml').read_text())
assert 'versionCode: 660306' in (result/'apktool.yml').read_text()
with ZipFile(apk) as z: assert z.read('classes6.dex')==Path('patches/search-drawer-fix/classes6.dex').read_bytes()
assert not (result/'smali_classes6/ginlemon/flower/glass/SLDrawerSearchClick.smali').exists()
assert (result/'smali_classes6/ginlemon/flower/glass/SLDrawerAnimation.smali').exists()
panel=(result/'smali/ginlemon/flower/panels/drawer/DrawerPanel.smali').read_text()
assert 'setVerticalFadingEdgeEnabled(Z)V' in panel
print('PASS: top-only fade removal, unchanged drawer navigation and launcher code, retained resources and signed helper')
