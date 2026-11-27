from pathlib import Path
import sys
from xml.etree import ElementTree as ET
before, after = map(Path, sys.argv[1:])
def clean(s): return [x.strip() for x in s.splitlines() if x.strip() and x.strip() != 'nop']
def method(s, name):
    i=s.index('.method '+name); return s[i:s.index('.end method',i)]
a='{http://schemas.android.com/apk/res/android}'; app='{http://schemas.android.com/apk/res-auto}'
root=ET.parse(after/'res/layout/search_panel.xml').getroot()
button=next(v for v in root.iter() if v.get(a+'id')=='@id/clear_button')
assert button.get(app+'srcCompat') == '@drawable/ic_search_dialpad'
assert button.get(app+'layout_constraintEnd_toStartOf') == '@id/active_search_mic'
assert (after/'res/drawable/ic_search_dialpad.xml').exists()
panel=(after/'smali/ginlemon/flower/searchPanel/SearchPanel.smali').read_text()
assert 'LSLDialerButton;-><init>(Landroid/view/View;Landroid/widget/EditText;Landroid/view/View$OnClickListener;)V' in panel
assert 'Lpw9;-><init>(Lginlemon/flower/searchPanel/SearchPanel;I)V' in panel
for name in ('public final y()V','public final onDetachedFromWindow()V'):
    assert 'LSLDialerButton;->reset()V' in method(panel,name)
watcher=(after/'smali/zw9.smali').read_text(); text=method(watcher,'public final onTextChanged(')
position=text.index('->P:Landroid/widget/ImageView;')
assert 'invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setVisibility(I)V' in text[position:]
helper=(after/'smali_classes4/SLDialerButton.smali').read_text()
for s in ('setRawInputType','restartInput','showSoftInput','selectAll','View$OnClickListener;->onClick','setOnLongClickListener'):
    assert s in helper, s
for p in ('AndroidManifest.xml','smali/pw9.smali','smali_classes4/SLSearchHook.smali','smali_classes4/SLSearchHook$3.smali',
          'smali_classes4/SLWaContactSearch.smali','smali_classes4/SLModBackup.smali','smali_classes4/SLGlassClockView.smali',
          'smali_classes2/h0.smali','smali_classes2/yx0.smali','smali/ginlemon/flower/glass/SLKeyboardDock.smali'):
    assert clean((before/p).read_text())==clean((after/p).read_text()),p
assert 'versionCode: 660299' in (after/'apktool.yml').read_text()
print('PASS: dialer placement, visibility, input reset, native clear callback and unchanged WhatsApp/backup logic')
