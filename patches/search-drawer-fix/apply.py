from pathlib import Path
import sys
r=Path(sys.argv[1])
p=r/'smali/ginlemon/flower/panels/drawer/view/GridRecyclerView.smali';s=p.read_text()
assert '.method protected getTopFadingEdgeStrength()F' not in s
s += """
# Keep the native bottom fade, but do not fade icons at the top edge.
.method protected getTopFadingEdgeStrength()F
    .locals 1
    const/4 v0, 0x0
    return v0
.end method
"""
p.write_text(s)
p=r/'smali/ginlemon/flower/glass/SLDrawerSearchClick.smali';s=p.read_text()
old='.method public onClick(Landroid/view/View;)V'
assert s.count(old)==1
s=s.replace(old,'''.method public onClick(Landroid/view/View;)V
    .locals 0
    invoke-static {p1, p0}, Lginlemon/flower/glass/SLDrawerAnimation;->start(Landroid/view/View;Lginlemon/flower/glass/SLDrawerSearchClick;)V
    return-void
.end method

.method public open(Landroid/view/View;)V''')
p.write_text(s)
p=r/'apktool.yml';s=p.read_text();assert s.count('versionCode: 660305')==1;p.write_text(s.replace('versionCode: 660305','versionCode: 660306'))
