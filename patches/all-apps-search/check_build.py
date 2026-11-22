"""Run after decoding the new APK: python check_build.py ORIGINAL_DECODED NEW_DECODED."""
from pathlib import Path
import sys
import xml.etree.ElementTree as ET

before, after = map(Path, sys.argv[1:])
layout = ET.parse(after / "res/layout/drawer_bottom_search.xml").getroot()
assert layout.tag == "ginlemon.flower.glass.SLDrawerSearchLayout"
assert len(layout) == 1
assert layout[0].tag == "ginlemon.flower.widgets.searchbar.SearchBarWidget"
for name in ("SearchBarWidget", "SearchBarWidgetViewModel"):
    relative = f"smali/ginlemon/flower/widgets/searchbar/{name}.smali"
    assert (before / relative).read_bytes() == (after / relative).read_bytes(), name
wrapper = (after / "smali/ginlemon/flower/glass/SLDrawerSearchLayout.smali").read_text()
assert wrapper.index("->v(I)V") < wrapper.index("->t()V")
assert "SLSearchClick;" in wrapper
assert "versionCode: 660277" in (after / "apktool.yml").read_text()
for folder in ("assets", "lib"):
    for original in (before / folder).rglob("*"):
        if original.is_file():
            relative = original.relative_to(before)
            assert original.read_bytes() == (after / relative).read_bytes(), relative
print("PASS: rebuilt layout, initialization order, native widget render hook, version, assets and libraries")

# The drawer must observe live home settings, not just render a default snapshot.
assert "OnPreDrawListener;" in wrapper
assert "->addOnPreDrawListener(" in wrapper
assert "->removeOnPreDrawListener(" in wrapper
assert "findHomeSearch" not in wrapper
assert "getRootView" not in wrapper
assert layout[0].get("{http://schemas.android.com/apk/res/android}tag") == "all_apps_search"
assert wrapper.index('const-string v1, "all_apps_search"') < wrapper.index("->homeState:Landroidx/lifecycle/ViewModel;", wrapper.index(".method public static captureHome"))
assert "if-nez v0," in wrapper  # Drawer render cannot overwrite captured home state.
widget = (after / "smali/ginlemon/flower/widgets/searchbar/SearchBarWidget.smali").read_text()
assert widget.count("->captureHome(") == 1
assert widget.index(".method public final u(") < widget.index("->captureHome(") < widget.index(".method public final v(")
for field, type_ in (("D", "Landroidx/lifecycle/ViewModel;"), ("H", "Luec;"), ("J", "Lp7b;")):
    assert f"->{field}:{type_}" in wrapper
for field in ("a:F", "b:Z"):
    assert f"Lui9;->{field}" in wrapper
assert "if-eqz v4," in wrapper  # Do not rebuild every frame when unchanged.
print("PASS: live home state/appearance sharing, drawer-tag exclusion, attach/detach listener pairing")
