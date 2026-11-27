"""Check a decoded 660291 build against decoded 660290; no device is required."""
from pathlib import Path
import sys

before, after = map(Path, sys.argv[1:])

def normalized(text):
    return [line.strip() for line in text.splitlines() if line.strip() and line.strip() != 'nop']

def method(text, name):
    start = text.index('.method public ' + name + '(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I')
    end = text.index('.end method', start) + len('.end method')
    return text[start:end]

old = (before / 'smali/rx7.smali').read_text()
new = (after / 'smali/rx7.smali').read_text()
original = method(old, 'd')
retained = method(new, 'slNativeScore').replace('slNativeScore(', 'd(', 1)
assert normalized(original) == normalized(retained), 'native scoring changed'
wrapper = method(new, 'd')
assert wrapper.count('->slNativeScore(') == 1 and wrapper.count('LSLSearchFallback;->score(') == 1
assert 'if-lez v0' in wrapper, 'positive native scores must be preserved'
assert normalized(old.replace(original, '')) == normalized(new.replace(wrapper, '').replace(method(new, 'slNativeScore'), ''))

assert (after / 'smali_classes4/SLSearchFallback.smali').exists()
for path in ('AndroidManifest.xml', 'res/layout', 'res/anim', 'res/animator', 'res/color', 'res/drawable', 'res/values'):
    a, b = before / path, after / path
    if a.is_file():
        assert b.read_bytes() == a.read_bytes(), path
    elif a.is_dir():
        aa = {p.relative_to(a): p.read_bytes() for p in a.rglob('*') if p.is_file()}
        bb = {p.relative_to(b): p.read_bytes() for p in b.rglob('*') if p.is_file()}
        assert aa == bb, path
for path in ('smali/ginlemon/flower/searchPanel/SearchPanel.smali', 'smali_classes4/SLSearchHook.smali', 'smali_classes4/SLWaContactSearch.smali'):
    assert normalized((before / path).read_text()) == normalized((after / path).read_text()), path
assert 'versionCode: 660291' in (after / 'apktool.yml').read_text()
print('PASS: preserved native scorer, no layout/theme/animation/manifest or search UI code changes')
