from pathlib import Path
import sys
from xml.etree import ElementTree as ET
before, after = map(Path, sys.argv[1:])
def text(root, p): return (root/p).read_text()
def clean(s): return [x.strip() for x in s.splitlines() if x.strip() and x.strip() != 'nop']
for p in ('AndroidManifest.xml', 'smali_classes4/SLModBackup.smali', 'smali_classes4/SLSearchHook.smali',
          'smali_classes4/SLDialerButton.smali', 'smali/ginlemon/flower/searchPanel/SearchPanel.smali',
          'smali/zw9.smali', 'smali_classes2/h0.smali', 'smali_classes2/yx0.smali',
          'smali/ginlemon/flower/panels/drawer/DrawerPanel.smali'):
    assert clean(text(before,p)) == clean(text(after,p)), p
oldfiles = {p.relative_to(before) for p in (before/'res').rglob('*') if p.is_file()}
newfiles = {p.relative_to(after) for p in (after/'res').rglob('*') if p.is_file()}
assert oldfiles == newfiles
for p in oldfiles: assert (before/p).read_bytes() == (after/p).read_bytes(), p
view=text(after,'smali/ginlemon/flower/launchable/view/LaunchableView.smali')
n=view[view.index('.method public final n()V'):view.index('.end method',view.index('.method public final n()V'))]
assert n.index('LSLGifIcons;->bind') < n.index('Picasso;->load')
assert 'Picasso;->cancelRequest(Landroid/widget/ImageView;)V' in n and '->r()V' in n
assert 'Picasso;->load' in n and 'RequestCreator;->into' in n
picker=text(after,'smali_classes4/ginlemon/flower/pickers/iconPicker/IconPickerActivity.smali')
assert 'EditLaunchableIconRequest;' in picker and 'EditDrawerIconRequest;' in picker
assert picker.index('instance-of v1, v0, Lginlemon/flower/pickers/iconPicker/EditLaunchableIconRequest;') < picker.index('LSLGifIcons;->prompt')
assert 'LSLGifIcons;->result' in picker and 'Hilt_IconPickerActivity;->onActivityResult' in picker
helper=text(after,'smali_classes5/SLGifIcons.smali'); anim=text(after,'smali_classes5/SLGifIcons$GifDrawable.smali')
for value in ('sl_mod_settings','gif_icon_v1_', 'decodeByteArray', 'setImageDrawable', 'setLayerType'):
    assert value in helper, value
for value in ('Lyb6;->a(I)Z','isShown()Z','hasWindowFocus()Z','getGlobalVisibleRect','scheduleSelf','unscheduleSelf'):
    assert value in anim, value
assert 'versionCode: 660300' in text(after,'apktool.yml')
print('PASS: home-only GIF hooks, native fallback and picker, lifecycle gating, unchanged drawer/search/backup/resources')
