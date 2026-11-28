from pathlib import Path
from zipfile import ZipFile
import xml.etree.ElementTree as ET
import sys
base, result, apk = map(Path,sys.argv[1:])
def norm(p): return [line.strip() for line in p.read_text().splitlines() if line.strip() and line.strip() != 'nop']
for d in ('smali','smali_classes2','smali_classes3','smali_classes4','smali_classes5'):
    old = {p.relative_to(base) for p in (base/d).rglob('*.smali')}
    new = {p.relative_to(result) for p in (result/d).rglob('*.smali')}
    assert old == new, d
    for p in old: assert norm(base/p)==norm(result/p), p
old = {p.relative_to(base) for p in (base/'res').rglob('*') if p.is_file()}
new = {p.relative_to(result) for p in (result/'res').rglob('*') if p.is_file()}
assert old == new
for p in old: assert (base/p).read_bytes()==(result/p).read_bytes(), p
assert norm(base/'AndroidManifest.xml')==norm(result/'AndroidManifest.xml')
layout=ET.parse(result/'res/layout/search_panel.xml').getroot()
container=layout[0]
assert container[0].tag == 'ginlemon.flower.glass.SLDrawerSearchLayout'
assert container[1].tag == 'ginlemon.library.widgets.EditTextBackEvent'
panel=(result/'smali/ginlemon/flower/searchPanel/SearchPanel.smali').read_text()
assert panel.count('LSLSearchAnimation;->start()V') == 1 and panel.count('LSLSearchAnimation;->stop()V') == 2
helper=(result/'smali_classes6/SLSearchAnimation.smali').read_text()
for s in ('Landroid/view/animation/PathInterpolator;', 'ginlemon.flower.glass.SLDrawerSearchLayout','setScaleX(F)V','isShown()Z'):
    assert s in helper,s
assert 'setTranslationX(F)V' not in helper
with ZipFile(apk) as z: assert z.read('classes6.dex') == Path('patches/search-bar-motion/classes6.dex').read_bytes()
assert 'versionCode: 660305' in (result/'apktool.yml').read_text()
print('PASS: untouched 660304 launcher code, resources, hooks, GIF and menu; revised helper and expected backdrop layout')
