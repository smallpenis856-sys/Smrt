"""Compare decoded 660296 to 660295 and check the shortcut-only Compose branch."""
from pathlib import Path
import sys

before, after = map(Path, sys.argv[1:])
def lines(s):
    return [line.strip() for line in s.splitlines() if line.strip() and line.strip() != 'nop']
old = (before / 'smali/qv9.smali').read_text()
new = (after / 'smali/qv9.smali').read_text()
start = new.index('    iget-object v1, p0, Lqv9;->e:Lginlemon/flower/widgets/searchbar/SearchBarWidget;', new.index('    move-result-object v6'))
end = new.index('    :cond_3\n', start) + len('    :cond_3\n')
branch = new[start:end]
assert branch.count('->getParent()Landroid/view/ViewParent;') == 2
assert 'instance-of v2, v1, LSLGlassCard;' in branch
assert branch.count('if-eqz v2, :cond_3') == 2
assert 'sget-object v6, LSLGlassEmpty;->content:Lw12;' in branch
assert lines(old) == lines((new[:start] + new[end:]).replace(':cond_4', ':cond_3'))
empty = (after / 'smali_classes4/SLGlassEmpty.smali').read_text()
assert '.implements Lss4;' in empty
invoke = empty.split('.method public final invoke(', 1)[1].split('.end method', 1)[0]
assert 'sget-object v0, Lilb;->a:Lilb;' in invoke and 'return-object v0' in invoke
assert '->content:Lw12;' in empty
for p in ('AndroidManifest.xml', 'smali/ol3.smali', 'smali/sk8.smali', 'smali/pm9.smali',
          'smali/ginlemon/flower/glass/SLDrawerSearchLayout.smali',
          'smali/ginlemon/flower/widgets/searchbar/SearchBarWidget.smali',
          'smali/ginlemon/flower/searchPanel/SearchPanel.smali', 'smali/rx7.smali',
          'smali_classes4/SLWaContactSearch.smali', 'smali_classes4/SLGlassCard.smali',
          'smali_classes4/SLPhotoPolicy.smali', 'smali_classes4/SLWaPhone.smali',
          'smali_classes4/SLSearchHook.smali', 'smali_classes4/SLSearchFallback.smali'):
    assert lines((before / p).read_text()) == lines((after / p).read_text()), p
for p in (before / 'res').rglob('*'):
    if p.is_file(): assert p.read_bytes() == (after / p.relative_to(before)).read_bytes(), p
assert 'versionCode: 660296' in (after / 'apktool.yml').read_text()
print('PASS: empty native foreground only for WhatsApp glass; search and other UI preserved')
