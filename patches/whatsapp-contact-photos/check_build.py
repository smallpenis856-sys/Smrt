"""Check decoded 660293 against decoded 660292; no device required."""
from pathlib import Path
import sys

before, after = map(Path, sys.argv[1:])
def norm(text):
    return [line.strip() for line in text.splitlines() if line.strip() and line.strip() != 'nop'
            and not line.strip().startswith(('.line ', '.local ', '.end local', '.restart local'))]
def method(text, name):
    start = text.index(name)
    return text[start:text.index('.end method', start) + len('.end method')]
old = (before / 'smali_classes4/SLWaContactSearch.smali').read_text()
new = (after / 'smali_classes4/SLWaContactSearch.smali').read_text()
for name in ('private schedule()V', 'private cancel()V', 'private openWhatsApp(', 'private askContacts()',
             'onAttachedToWindow()', 'onDetachedFromWindow()', 'onWindowFocusChanged(',
             'public static attach(', 'private addChip(', 'private show('):
    assert norm(method(old, name)) == norm(method(new, name)), name
for p in (before / 'smali_classes4').glob('SLWaContactSearch$*.smali'):
    if p.name.endswith('$Contact.smali'):
        continue
    assert norm(p.read_text()) == norm((after / 'smali_classes4' / p.name).read_text()), p.name
assert norm((before / 'smali_classes4/SLWaPhone.smali').read_text()) == norm((after / 'smali_classes4/SLWaPhone.smali').read_text())
assert 'photo_thumb_uri' in method(new, 'private queryContacts(')
loader = method(new, 'private loadPhoto(')
for value in ('com.android.contacts', '"content"', '->isCanceled()', '->openAssetFileDescriptor(',
              '->inJustDecodeBounds:Z', '->inSampleSize:I', 'LSLPhotoPolicy;->sampleSize('):
    assert value in loader, value
assert loader.count('->openAssetFileDescriptor(') == 2
render = method(new, 'private addContactChip(')
for value in ('->setImageBitmap(', '->setClipToOutline(', 'Landroid/widget/FrameLayout;', '->setContentDescription('):
    assert value in render, value
assert (after / 'smali_classes4/SLPhotoPolicy.smali').exists()
assert 'versionCode: 660293' in (after / 'apktool.yml').read_text()
for path in ('AndroidManifest.xml', 'res/layout', 'res/anim', 'res/animator', 'res/color', 'res/drawable', 'res/values'):
    a, b = before / path, after / path
    if a.is_file():
        assert a.read_bytes() == b.read_bytes(), path
    elif a.is_dir():
        assert {p.relative_to(a): p.read_bytes() for p in a.rglob('*') if p.is_file()} == {p.relative_to(b): p.read_bytes() for p in b.rglob('*') if p.is_file()}, path
for path in ('smali/rx7.smali', 'smali_classes4/SLSearchFallback.smali', 'smali/ginlemon/flower/searchPanel/SearchPanel.smali', 'smali_classes4/SLSearchHook.smali'):
    assert norm((before / path).read_text()) == norm((after / path).read_text()), path
print('PASS: local contact photos, bounded decoding, search behavior and unaffected UI structure')
