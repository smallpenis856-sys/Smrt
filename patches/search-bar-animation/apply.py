from pathlib import Path
import sys
r = Path(sys.argv[1]); p = r/'smali/ginlemon/flower/searchPanel/SearchPanel.smali'
s = p.read_text()
field = '.field public slKeyboardDock:Lginlemon/flower/glass/SLKeyboardDock;'
assert s.count(field)==1
s = s.replace(field,field+'\n\n.field private slSearchAnimation:LSLSearchAnimation;')
needle = '    new-instance v13, Lpw9;'
assert s.count(needle)==1
s = s.replace(needle, '''    iget-object v14, p0, Lginlemon/flower/searchPanel/SearchPanel;->S:Landroid/view/ViewGroup;
    new-instance v13, LSLSearchAnimation;
    invoke-direct {v13, v14, v10, v9, v12}, LSLSearchAnimation;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    iput-object v13, p0, Lginlemon/flower/searchPanel/SearchPanel;->slSearchAnimation:LSLSearchAnimation;

'''+needle)
# v12 is the menu button, v10 is the editor at this point.
for method,action in [('w','start'),('y','stop'),('onDetachedFromWindow','stop')]:
    needle = f'.method public final {method}()V\n    .locals '
    assert s.count(needle)==1
    i = s.index('\n',s.index(needle)+len(needle))
    code = f'''\n\n    iget-object v0, p0, Lginlemon/flower/searchPanel/SearchPanel;->slSearchAnimation:LSLSearchAnimation;
    if-eqz v0, :sl_search_animation_{action}_done
    invoke-virtual {{v0}}, LSLSearchAnimation;->{action}()V
    :sl_search_animation_{action}_done'''
    s=s[:i]+code+s[i:]
p.write_text(s)
p=r/'apktool.yml';s=p.read_text();assert s.count('versionCode: 660303')==1;p.write_text(s.replace('versionCode: 660303','versionCode: 660304'))
