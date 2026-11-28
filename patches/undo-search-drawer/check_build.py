"""Verify only version/signature differ from the pre-animation 660303 APK."""
from pathlib import Path
from zipfile import ZipFile
import struct,sys
base,result,decoded=map(Path,sys.argv[1:])
sigs={'META-INF/LAUNCHER.SF','META-INF/LAUNCHER.RSA','META-INF/MANIFEST.MF'}
with ZipFile(base) as old, ZipFile(result) as new:
    names=set(old.namelist())-sigs
    assert len(old.namelist())==len(set(old.namelist()))
    assert len(new.namelist())==len(set(new.namelist()))
    assert names==set(new.namelist())-sigs
    assert 'classes6.dex' not in names
    for n in names:
        a,b=old.read(n),new.read(n)
        if n=='AndroidManifest.xml':
            before=struct.pack('<I',660303);after=struct.pack('<I',660307)
            assert a.count(before)==1 and b==a.replace(before,after)
        else: assert a==b,n
assert 'versionCode: 660307' in (decoded/'apktool.yml').read_text()
panel=(decoded/'smali/ginlemon/flower/searchPanel/SearchPanel.smali').read_text()
click=(decoded/'smali/ginlemon/flower/glass/SLDrawerSearchClick.smali').read_text()
grid=(decoded/'smali/ginlemon/flower/panels/drawer/view/GridRecyclerView.smali').read_text()
assert 'SLSearchAnimation' not in panel and 'SLDrawerAnimation' not in click
assert 'getTopFadingEdgeStrength()F' not in grid
assert 'Lf58;->q(Lj48;ZFLcs4;)V' in click and 'slReturnPanel' in click
assert not (decoded/'smali_classes6').exists()
print('PASS: identical pre-animation 660303 launcher, grid, search navigation, GIFs and resources; only manifest version and signature changed')
