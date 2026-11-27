from pathlib import Path
import sys
root = Path(sys.argv[1])
def replace(path, before, after):
    f = root / path
    s = f.read_text()
    assert s.count(before) == 1, (path, s.count(before))
    f.write_text(s.replace(before, after))
p = 'smali/ginlemon/flower/launchable/view/LaunchableView.smali'
replace(p, '''.method public final n()V
    .locals 4
''', '''.method public final n()V
    .locals 4

    invoke-virtual {p0}, Lginlemon/flower/launchable/view/LaunchableView;->m()Lqa6;
    move-result-object v0
    invoke-virtual {v0}, Lqa6;->l()I
    move-result v0
    iget-object v1, p0, Lginlemon/flower/launchable/view/LaunchableView;->N:Landroid/widget/ImageView;
    invoke-static {p0, v0, v1}, LSLGifIcons;->bind(Landroid/view/View;ILandroid/widget/ImageView;)Z
    move-result v0
    if-eqz v0, :sl_gif_native
    iget-object v0, p0, Lginlemon/flower/launchable/view/LaunchableView;->G:Lpk5;
    if-eqz v0, :sl_gif_done
    invoke-virtual {v0}, Lpk5;->f()Lcom/squareup/picasso/Picasso;
    move-result-object v0
    invoke-virtual {v0, v1}, Lcom/squareup/picasso/Picasso;->cancelRequest(Landroid/widget/ImageView;)V
    :sl_gif_done
    invoke-virtual {p0}, Lginlemon/flower/launchable/view/LaunchableView;->r()V
    return-void
    :sl_gif_native
''')
p = 'smali_classes2/ginlemon/flower/pickers/iconPicker/IconPickerActivity.smali'
replace(p, '''    invoke-static {p0, p1}, La12;->a(Landroidx/activity/ComponentActivity;Lw12;)V

    return-void''', '''    invoke-static {p0, p1}, La12;->a(Landroidx/activity/ComponentActivity;Lw12;)V

    iget-object v0, p0, Lginlemon/flower/pickers/iconPicker/IconPickerActivity;->H:Lginlemon/flower/pickers/iconPicker/IconPickerRequest;
    instance-of v1, v0, Lginlemon/flower/pickers/iconPicker/EditLaunchableIconRequest;
    if-eqz v1, :sl_gif_no_prompt
    check-cast v0, Lginlemon/flower/pickers/iconPicker/EditLaunchableIconRequest;
    iget v0, v0, Lginlemon/flower/pickers/iconPicker/EditLaunchableIconRequest;->e:I
    invoke-static {p0, v0}, LSLGifIcons;->prompt(Landroid/app/Activity;I)V
    :sl_gif_no_prompt
    return-void''')
f = root / p
s = f.read_text()
s += '''\n.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    invoke-super {p0, p1, p2, p3}, Lginlemon/flower/pickers/iconPicker/Hilt_IconPickerActivity;->onActivityResult(IILandroid/content/Intent;)V
    iget-object v0, p0, Lginlemon/flower/pickers/iconPicker/IconPickerActivity;->H:Lginlemon/flower/pickers/iconPicker/IconPickerRequest;
    instance-of v1, v0, Lginlemon/flower/pickers/iconPicker/EditLaunchableIconRequest;
    if-eqz v1, :sl_gif_other_result
    check-cast v0, Lginlemon/flower/pickers/iconPicker/EditLaunchableIconRequest;
    iget v0, v0, Lginlemon/flower/pickers/iconPicker/EditLaunchableIconRequest;->e:I
    invoke-static {p0, v0, p1, p2, p3}, LSLGifIcons;->result(Landroid/app/Activity;IIILandroid/content/Intent;)Z
    move-result v1
    if-eqz v1, :sl_gif_other_result
    return-void
    :sl_gif_other_result
    return-void
.end method
'''
f.write_text(s)
p='smali/ginlemon/flower/HomeScreen.smali'
replace(p, '''    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V
''', '''    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V
    invoke-static {p0}, LSLGifIcons;->refresh(Landroid/app/Activity;)V
''')
replace(p, '''    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V
''', '''    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V
    if-eqz p1, :sl_gif_no_focus
    invoke-static {p0}, LSLGifIcons;->refresh(Landroid/app/Activity;)V
    :sl_gif_no_focus
''')
f=root/'apktool.yml'; s=f.read_text(); assert 'versionCode: 660299' in s; f.write_text(s.replace('versionCode: 660299','versionCode: 660300'))

# classes2 is at its DEX field-reference limit; move the edited activity to classes4.
src=root/'smali_classes2/ginlemon/flower/pickers/iconPicker/IconPickerActivity.smali'
dst=root/'smali_classes4/ginlemon/flower/pickers/iconPicker/IconPickerActivity.smali'
dst.parent.mkdir(parents=True, exist_ok=True)
assert not dst.exists()
src.rename(dst)
