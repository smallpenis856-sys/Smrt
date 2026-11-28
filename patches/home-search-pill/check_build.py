from pathlib import Path
from zipfile import ZipFile
import re,sys
base,result,apk=map(Path,sys.argv[1:])
home=Path('smali/f75.smali'); edit=Path('smali/w65.smali')
def normal(text):
    lines=[l.strip() for l in text.splitlines() if l.strip() and l.strip()!='nop' and not l.strip().startswith('#')]
    mapping={}
    def sub(m):
        key=m.group(0)
        if key not in mapping:mapping[key]=':label'+str(len(mapping))
        return mapping[key]
    result=[]
    for line in lines:
        if line.startswith('.method '): mapping.clear()
        result.append(re.sub(r':(?:cond|goto|pswitch|sswitch|try_start|try_end|catch|catchall|pswitch_data|sswitch_data|array_data)_[0-9a-f]+',sub,line))
    return result
for d in ('smali','smali_classes2','smali_classes3','smali_classes4','smali_classes5'):
    old={p.relative_to(base) for p in (base/d).rglob('*.smali')}
    new={p.relative_to(result) for p in (result/d).rglob('*.smali')}
    assert old==new,d
    for p in old-{home,edit}: assert normal((base/p).read_text())==normal((result/p).read_text()),str(p)
hs=(result/home).read_text()
patch='''    const/16 v14, 0xa

    if-ne v1, v14, :cond_1

    invoke-static {v2, v4, v3, v13}, LSLHomeSearch;->install(Landroid/widget/FrameLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    :cond_1
'''
assert hs.count(patch)==1
hs=hs.replace(patch,'')
assert normal((base/home).read_text())==normal(hs),'home changed beyond install'
es=(result/edit).read_text()
patch='    invoke-static {p0, v1}, LSLHomeSearch;->editVisibility(Landroid/view/View;I)V\n'
assert es.count(patch)==1
assert normal((base/edit).read_text())==normal(es.replace(patch,'')),'edit collector changed beyond visibility hook'
old={p.relative_to(base) for p in (base/'res').rglob('*') if p.is_file()};new={p.relative_to(result) for p in (result/'res').rglob('*') if p.is_file()}
assert old==new
for p in old: assert (base/p).read_bytes()==(result/p).read_bytes(),str(p)
assert normal((base/'AndroidManifest.xml').read_text())==normal((result/'AndroidManifest.xml').read_text())
assert 'versionCode: 660308' in (result/'apktool.yml').read_text()
with ZipFile(apk) as z: assert z.read('classes6.dex')==Path('patches/home-search-pill/classes6.dex').read_bytes()
assert not (result/'smali_classes6/ginlemon/flower/HomeScreen.smali').exists()
assert 'Lginlemon/flower/HomeScreen;->H()V' in (result/'smali_classes6/SLHomeSearch$1.smali').read_text()
assert 'SLSearchAnimation' not in (result/'smali/ginlemon/flower/searchPanel/SearchPanel.smali').read_text()
assert 'getTopFadingEdgeStrength()F' not in (result/'smali/ginlemon/flower/panels/drawer/view/GridRecyclerView.smali').read_text()
print('PASS: home-only pill hooks; unchanged launcher, search, menus, GIFs, drawer, resources and manifest')
