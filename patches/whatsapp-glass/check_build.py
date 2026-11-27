"""Check a decoded glass build against decoded build 660293."""
from pathlib import Path
import sys
import xml.etree.ElementTree as ET

before, after = map(Path, sys.argv[1:])
def norm(text):
    return [line.strip() for line in text.splitlines() if line.strip() and line.strip() != 'nop'
            and not line.strip().startswith(('.line ', '.local ', '.end local', '.restart local'))]
def method(text, name):
    start = text.index(name)
    return text[start:text.index('.end method', start) + len('.end method')]
old = (before / 'smali_classes4/SLWaContactSearch.smali').read_text()
new = (after / 'smali_classes4/SLWaContactSearch.smali').read_text()
for name in ('private schedule()V', 'private cancel()V', 'private findContacts(', 'private queryContacts(',
             'private loadPhoto(', 'private openWhatsApp(', 'private askContacts()', 'onAttachedToWindow()',
             'onDetachedFromWindow()', 'onWindowFocusChanged(', 'public static attach(', 'private addChip(', 'private show('):
    assert norm(method(old, name)) == norm(method(new, name)), name
for p in (before / 'smali_classes4').glob('SLWaContactSearch$*.smali'):
    assert norm(p.read_text()) == norm((after / 'smali_classes4' / p.name).read_text()), p.name
card = method(new, 'private addContactChip(')
for value in ('wa_contact_glass', '->getIdentifier(', '->inflate(', 'Landroid/widget/FrameLayout;',
              '->setImageBitmap(', '->setContentDescription(', '->setOnClickListener('):
    assert value in card, value
layout = ET.parse(after / 'res/layout/wa_contact_glass.xml').getroot()
a = '{http://schemas.android.com/apk/res/android}'
assert layout.tag == 'ginlemon.flower.glass.SLDrawerSearchLayout'
assert layout.get(a+'importantForAccessibility') == 'noHideDescendants'
assert len(layout) == 1 and layout[0].tag == 'ginlemon.flower.widgets.searchbar.SearchBarWidget'
assert layout[0].get(a+'tag') == 'all_apps_search'
assert layout[0].get(a+'importantForAccessibility') == 'noHideDescendants'
assert 'name="wa_contact_glass"' in (after / 'res/values/public.xml').read_text()
for path in ('AndroidManifest.xml', 'smali/ginlemon/flower/glass/SLDrawerSearchLayout.smali',
             'smali/ginlemon/flower/widgets/searchbar/SearchBarWidget.smali',
             'smali/ginlemon/flower/searchPanel/SearchPanel.smali', 'smali/rx7.smali',
             'smali_classes4/SLPhotoPolicy.smali', 'smali_classes4/SLWaPhone.smali',
             'smali_classes4/SLSearchFallback.smali', 'smali_classes4/SLSearchHook.smali'):
    a_path, b_path = before / path, after / path
    assert norm(a_path.read_text()) == norm(b_path.read_text()), path
for p in (before / 'res/layout').glob('*.xml'):
    assert p.read_bytes() == (after / 'res/layout' / p.name).read_bytes(), p.name
assert 'versionCode: 660294' in (after / 'apktool.yml').read_text()
print('PASS: native search-bar glass reused, contact photos/actions preserved, no shared glass or navigation modifications')
