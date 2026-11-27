"""Check a decoded signed build against the previously released decoded APK."""
from pathlib import Path
import sys
import xml.etree.ElementTree as ET

before, after = map(Path, sys.argv[1:])
hook = (after / 'smali_classes4/SLSearchHook.smali').read_text()
old = (before / 'smali_classes4/SLSearchHook.smali').read_text()
needle = '    invoke-static {v2, v9}, LSLWaContactSearch;->attach(Landroid/widget/EditText;Landroid/widget/LinearLayout;)V\n'
def instructions(text):
    return [line.strip() for line in text.splitlines() if line.strip() and line.strip() != 'nop']
assert hook.count(needle) == 1
assert instructions(hook.replace(needle, '')) == instructions(old)
assert hook.index('->addTextChangedListener(') < hook.index(needle)
main = (after / 'smali_classes4/SLWaContactSearch.smali').read_text()
def method(name):
    return main.split(name, 1)[1].split('.end method', 1)[0]
assert '->checkSelfPermission(' in method('private schedule()V')
assert 'android.permission.READ_CONTACTS' in method('private schedule()V')
query = method('private findContacts(')
for value in ('CONTENT_FILTER_URI', 'Landroid/os/CancellationSignal;', 'SLWaPhone;->plainNumber(', 'SLWaPhone;->digits(', 'formatNumberToE164'):
    assert value in query, value
assert '->addTextChangedListener(' in method('onAttachedToWindow()V')
detach = method('onDetachedFromWindow()V')
assert '->removeTextChangedListener(' in detach and '->cancel()V' in detach
assert '->cancel()V' in method('private cancel()V')
click = method('private openWhatsApp(')
for value in ('whatsapp://send?phone=', 'com.whatsapp', 'com.whatsapp.w4b', '->setPackage(', '->resolveActivity(', '->startActivity('):
    assert value in click, value
assert 'https://' not in click and 'http://' not in click
all_code = '\n'.join(f.read_text() for f in (after / 'smali_classes4').glob('SLWaContactSearch*.smali'))
assert '->isCanceled()Z' in all_code and '->generation:I' in all_code
assert '->requestPermissions(' in all_code
android = '{http://schemas.android.com/apk/res/android}'
def permissions(path):
    root = ET.parse(path / 'AndroidManifest.xml').getroot()
    return {p.get(android + 'name') for p in root.findall('uses-permission')}
assert permissions(before) == permissions(after)
assert 'versionCode: 660290' in (after / 'apktool.yml').read_text()
print('PASS: unchanged native search hook plus one attachment; permissions, contact-only query, async cancellation, explicit WhatsApp and no new permissions')
