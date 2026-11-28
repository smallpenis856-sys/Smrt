from pathlib import Path
import sys
r=Path(sys.argv[1])
p=r/'smali/f75.smali';s=p.read_text()
needle='''    invoke-virtual {v2, v13, v14}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v13, Lt65;'''
assert s.count(needle)==1
s=s.replace(needle,'''    invoke-virtual {v2, v13, v14}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    # Main home panel only; v3 is the existing page indicator, v4 is the dock pager.
    const/16 v14, 0xa
    if-ne v1, v14, :sl_no_home_pill
    invoke-static {v2, v4, v3, v13}, LSLHomeSearch;->install(Landroid/widget/FrameLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V
    :sl_no_home_pill

    new-instance v13, Lt65;''')
p.write_text(s)
p=r/'smali/w65.smali';s=p.read_text()
needle='''    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    const/4 v6, 0x1

    return-object v2'''
assert s.count(needle)==1
s=s.replace(needle,'''    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-static {p0, v1}, LSLHomeSearch;->editVisibility(Landroid/view/View;I)V

    const/4 v6, 0x1

    return-object v2''')
p.write_text(s)
p=r/'apktool.yml';s=p.read_text();assert s.count('versionCode: 660307')==1;p.write_text(s.replace('versionCode: 660307','versionCode: 660308'))
