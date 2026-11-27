"""Check decoded 660295 against 660294 without claiming device validation."""
from pathlib import Path
import sys

before, after = map(Path, sys.argv[1:])
def norm(s):
    return [x.strip() for x in s.splitlines() if x.strip() and x.strip() != 'nop'
            and not x.strip().startswith(('.line ', '.local ', '.end local', '.restart local'))]
def method(s, name):
    start = s.index(name)
    return s[start:s.index('.end method', start) + len('.end method')]
old = (before / 'smali_classes4/SLWaContactSearch.smali').read_text()
new = (after / 'smali_classes4/SLWaContactSearch.smali').read_text()
for name in ('private schedule()V', 'private cancel()V', 'private findContacts(', 'private queryContacts(',
             'private loadPhoto(', 'private openWhatsApp(', 'private askContacts()', 'onAttachedToWindow()',
             'onDetachedFromWindow()', 'onWindowFocusChanged(', 'public static attach(', 'private addChip(', 'private show('):
    assert norm(method(old, name)) == norm(method(new, name)), name
for p in (before / 'smali_classes4').glob('SLWaContactSearch$*.smali'):
    assert norm(p.read_text()) == norm((after / 'smali_classes4' / p.name).read_text()), p.name
card = method(new, 'private addContactChip(')
for value in ('wa_contact_glass', 'LSLGlassCard;-><init>', 'LSLGlassCard;->setGlass(', '->setImageBitmap(', '->setContentDescription(', '->setOnClickListener('):
    assert value in card, value
size = (after / 'smali_classes4/SLGlassCard.smali').read_text()
setglass = method(size, 'public setGlass(')
assert 'const/4 v1, 0x0' in setglass and 'LayoutParams;-><init>(II)V' in setglass
measure = method(size, 'protected onMeasure(')
for value in ('Landroid/widget/FrameLayout;->onMeasure(', '->getMeasuredWidth()', '->getMeasuredHeight()',
              'Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I', 'Landroid/view/View;->measure(II)V'):
    assert value in measure, value
assert measure.count('->makeMeasureSpec(II)I') == 2
for p in ('AndroidManifest.xml', 'smali/ginlemon/flower/glass/SLDrawerSearchLayout.smali',
          'smali/ginlemon/flower/widgets/searchbar/SearchBarWidget.smali', 'smali/ginlemon/flower/searchPanel/SearchPanel.smali',
          'smali/rx7.smali', 'smali_classes4/SLPhotoPolicy.smali', 'smali_classes4/SLWaPhone.smali',
          'smali_classes4/SLSearchFallback.smali', 'smali_classes4/SLSearchHook.smali'):
    assert norm((before / p).read_text()) == norm((after / p).read_text()), p
for p in (before / 'res/layout').glob('*.xml'):
    assert p.read_bytes() == (after / 'res/layout' / p.name).read_bytes(), p.name
assert 'versionCode: 660295' in (after / 'apktool.yml').read_text()
print('PASS: foreground-driven native glass measurement; contact actions and other search UI preserved')
