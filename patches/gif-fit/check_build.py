from pathlib import Path
import sys
old,new=map(Path,sys.argv[1:])
def read(r,p): return (r/p).read_text()
def norm(t): return [l.strip() for l in t.splitlines() if l.strip() and l.strip()!='nop']
for p in ('AndroidManifest.xml','smali/ginlemon/flower/launchable/view/LaunchableView.smali',
          'smali/ginlemon/flower/HomeScreen.smali','smali_classes4/ginlemon/flower/pickers/iconPicker/IconPickerActivity.smali',
          'smali_classes4/sb0.smali','smali_classes4/rn.smali','smali_classes2/vr5.smali',
          'smali_classes4/SLModBackup.smali','smali_classes4/SLSearchHook.smali',
          'smali_classes4/SLDialerButton.smali','smali/ginlemon/flower/searchPanel/SearchPanel.smali',
          'smali/ginlemon/flower/panels/drawer/DrawerPanel.smali','smali_classes2/h0.smali','smali_classes2/yx0.smali'):
    assert norm(read(old,p)) == norm(read(new,p)),p
before={p.relative_to(old) for p in (old/'res').rglob('*') if p.is_file()}
after={p.relative_to(new) for p in (new/'res').rglob('*') if p.is_file()}
assert before==after
for p in before: assert (old/p).read_bytes()==(new/p).read_bytes(),p
helper=read(new,'smali_classes5/SLGifIcons.smali')
for s in ('gif_icon_v1_', 'gif_size_v1_', 'gif_shape_v1_', 'gif_mode_v1_', 'Adjust GIF icon', 'Landroid/widget/SeekBar;', 'Landroid/widget/RadioGroup;', 'Landroid/widget/ScrollView;', 'Landroid/graphics/Movie;->decodeByteArray'):
    assert s in helper,s
prompt=read(new,'smali_classes5/SLGifIcons$1.smali')
assert 'Adjust GIF size, fit and shape' in prompt and 'Choose animated GIF' in prompt and 'Remove animated GIF' in prompt
for p in ('SLGifIcons$1$3.smali','SLGifIcons$2$1.smali'):
    assert 'access$600(Landroid/app/Activity;I)V' in read(new,'smali_classes5/'+p),p
saved=read(new,'smali_classes5/SLGifIcons$9$1.smali')
assert saved.count('SharedPreferences$Editor;->putInt') == 3 and 'SharedPreferences$Editor;->commit()Z' in saved
anim=read(new,'smali_classes5/SLGifIcons$GifDrawable.smali')
for s in ('LSLGifGeometry;->size','LSLGifGeometry;->scale','LSLGifGeometry;->radius','Canvas;->clipPath','Movie;->draw', 'isAttachedToWindow', 'isShown', 'hasWindowFocus', 'getGlobalVisibleRect','Lyb6;->a(I)Z', 'scheduleSelf'):
    assert s in anim,s
assert 'versionCode: 660302' in read(new,'apktool.yml')
print('PASS: GIF sizing editor, saved per-icon options, clipped playback and unchanged native popovers, drawer, search and backup')
