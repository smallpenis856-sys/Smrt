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
assert "versionCode: 660276" in (after / "apktool.yml").read_text()
for folder in ("assets", "lib"):
    for original in (before / folder).rglob("*"):
        if original.is_file():
            relative = original.relative_to(before)
            assert original.read_bytes() == (after / relative).read_bytes(), relative
print("PASS: rebuilt layout, initialization order, unchanged native widget, version, assets and libraries")

# The drawer must observe live home settings, not just render a default snapshot.
assert "OnPreDrawListener;" in wrapper
assert "->addOnPreDrawListener(" in wrapper
assert "->removeOnPreDrawListener(" in wrapper
assert "->isAttachedToWindow()Z" in wrapper
assert "if-eq p1, p0," in wrapper  # Exclude the drawer subtree from discovery.
for field, type_ in (("D", "Landroidx/lifecycle/ViewModel;"), ("H", "Luec;"), ("J", "Lp7b;")):
    assert f"->{field}:{type_}" in wrapper
for field in ("a:F", "b:Z"):
    assert f"Lui9;->{field}" in wrapper
assert "if-eqz v4," in wrapper  # Do not rebuild every frame when unchanged.
print("PASS: live home state/appearance sharing, own-subtree exclusion, attach/detach listener pairing")
