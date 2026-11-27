"""Compare decoded 660292 with 660291, preserving WhatsApp search behavior."""
from pathlib import Path
import sys

before, after = map(Path, sys.argv[1:])
def normalized(text):
    return [line.strip() for line in text.splitlines() if line.strip() and line.strip() != 'nop'
            and not line.strip().startswith(('.line ', '.local ', '.end local', '.restart local'))]
def method(text, name):
    start = text.index(name)
    return text[start:text.index('.end method', start) + len('.end method')]
old = (before / 'smali_classes4/SLWaContactSearch.smali').read_text()
new = (after / 'smali_classes4/SLWaContactSearch.smali').read_text()
for name in ('private schedule()V', 'private cancel()V', 'private findContacts(',
             'private openWhatsApp(', 'private askContacts()', 'onAttachedToWindow()',
             'onDetachedFromWindow()', 'onWindowFocusChanged(', 'public static attach(', 'private addChip('):
    assert normalized(method(old, name)) == normalized(method(new, name)), name
for p in (before / 'smali_classes4').glob('SLWaContactSearch$*.smali'):
    assert normalized(p.read_text()) == normalized((after / 'smali_classes4' / p.name).read_text()), p.name
assert normalized((before / 'smali_classes4/SLWaPhone.smali').read_text()) == normalized((after / 'smali_classes4/SLWaPhone.smali').read_text())
for value in ('LSLAgendaTheme;->resolve(', '->getApplicationIcon(', '->setContentDescription(',
              'Landroid/graphics/drawable/RippleDrawable;', '->setPaddingRelative(',
              '->setTextDirection(', '->setOnClickListener('):
    assert value in new, value
assert 'versionCode: 660292' in (after / 'apktool.yml').read_text()
for path in ('AndroidManifest.xml', 'res/layout', 'res/anim', 'res/animator', 'res/color', 'res/drawable', 'res/values'):
    a, b = before / path, after / path
    if a.is_file():
        assert a.read_bytes() == b.read_bytes(), path
    elif a.is_dir():
        assert {p.relative_to(a): p.read_bytes() for p in a.rglob('*') if p.is_file()} == {p.relative_to(b): p.read_bytes() for p in b.rglob('*') if p.is_file()}, path
for path in ('smali/rx7.smali', 'smali_classes4/SLSearchFallback.smali', 'smali/ginlemon/flower/searchPanel/SearchPanel.smali', 'smali_classes4/SLSearchHook.smali'):
    assert normalized((before / path).read_text()) == normalized((after / path).read_text()), path
print('PASS: contact behavior, native search, resources, permissions and navigation preserved; theme and accessibility hooks present')
