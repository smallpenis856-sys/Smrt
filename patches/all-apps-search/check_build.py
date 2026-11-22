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
assert "versionCode: 660275" in (after / "apktool.yml").read_text()
for folder in ("assets", "lib"):
    for original in (before / folder).rglob("*"):
        if original.is_file():
            relative = original.relative_to(before)
            assert original.read_bytes() == (after / relative).read_bytes(), relative
print("PASS: rebuilt layout, initialization order, unchanged native widget, version, assets and libraries")
