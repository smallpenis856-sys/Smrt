"""Run after decoding the new APK: python check_build.py ORIGINAL_DECODED NEW_DECODED."""
from pathlib import Path
import sys
import xml.etree.ElementTree as ET

before, after = map(Path, sys.argv[1:])
layout = ET.parse(after / "res/layout/drawer_bottom_search.xml").getroot()
assert layout.tag == "ginlemon.flower.glass.SLDrawerSearchLayout"
assert len(layout) == 2
assert layout[0].tag == "ginlemon.flower.widgets.searchbar.SearchBarWidget"
for name in ("SearchBarWidget", "SearchBarWidgetViewModel"):
    relative = f"smali/ginlemon/flower/widgets/searchbar/{name}.smali"
    assert (before / relative).read_bytes() == (after / relative).read_bytes(), name
wrapper = (after / "smali/ginlemon/flower/glass/SLDrawerSearchLayout.smali").read_text()
assert wrapper.index("->v(I)V") < wrapper.index("->t()V")
assert "SLDrawerSearchClick;" in wrapper
assert "versionCode: 660282" in (after / "apktool.yml").read_text()
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

android = "{http://schemas.android.com/apk/res/android}"
overlay = layout[1]
assert overlay.tag == "LinearLayout" and len(overlay) == 3
assert overlay[0].get(android + "src") == "@drawable/ic_drawer_search_outline"
assert overlay[1].get(android + "text") == "@string/search"
assert overlay[1].get(android + "layout_weight") in ("1", "1.0")
assert overlay[2].tag == "ImageButton"
assert overlay[2].get(android + "src") == "@drawable/ic_drawer_mic_outline"
assert overlay[2].get(android + "contentDescription") == "@string/abc_searchview_description_voice"
assert layout[0].get(android + "importantForAccessibility") == "noHideDescendants"
for icon in ("search", "mic"):
    vector = ET.parse(after / f"res/drawable/ic_drawer_{icon}_outline.xml").getroot()
    assert vector.tag == "vector" and vector[0].get(android + "strokeWidth")
label_renderer = (after / "smali/qv9.smali").read_text()
assert '"all_apps_search"' in label_renderer
assert 'const-string v9, ""' in label_renderer
assert 'const-string v10, ""' in label_renderer
assert "->equals(Ljava/lang/Object;)Z" in label_renderer
voice = (after / "smali/ginlemon/flower/glass/SLDrawerVoiceClick.smali").read_text()
assert '"android.speech.action.WEB_SEARCH"' in voice
assert "->startActivity(" in voice
assert ".catch Landroid/content/ActivityNotFoundException;" in voice
assert ".catch Ljava/lang/SecurityException;" in voice
assert "->show()V" in voice
assert "SLDrawerVoiceClick;" in wrapper
print("PASS: drawer-only label override, search/mic order, outline vectors, accessible voice target and missing-provider handling")

click = (after / "smali/ginlemon/flower/glass/SLDrawerSearchClick.smali").read_text()
assert "HomeScreen;->H()V" not in click
assert "HomeScreen;->G(I)" not in click
assert "Lf58;->z(" not in click
assert "->post(" not in click and "->postDelayed(" not in click
assert "->isRunning()Z" in click
assert "->o(I)V" in click  # Preserve missing-search handling.
assert click.index("->r(Lw48;ZFLcs4;)Z") < click.index("->q(Lj48;ZFLcs4;)V") < click.index("SearchPanel;->H()V")
assert "const/4 v4, 0x0" in click
assert "{v1, v3, v4, v5, v0}" in click
assert "{v1, v2, v4, v5, v0}" in click  # Same false animation flag for both transitions.
for relative in (
    "smali/f58.smali",
    "smali/ginlemon/flower/HomeScreen.smali",
):
    assert (before / relative).read_bytes() == (after / relative).read_bytes(), relative
print("PASS: synchronous drawer-only search navigation, focus after navigation, animation guard, missing-search path, unchanged global navigation")

search_panel = (after / "smali/ginlemon/flower/searchPanel/SearchPanel.smali").read_text()
back = search_panel.split(".method public final c()Z", 1)[1].split(".end method", 1)[0]
exit_ = search_panel.split(".method public final y()V", 1)[1].split(".end method", 1)[0]
assert back.index("SearchPanel;->v()V") < back.index("SLDrawerSearchReturn;->restore(")
assert back.index("SLDrawerSearchReturn;->restore(") < back.index("HomeScreen;->q(Z)V")
assert "->slReturnPanel:Lj48;" in exit_  # Clear origin on ANY exit, including Home.
assert click.index("Lf58;->l(Lw48;)") < click.index("Lf58;->r(")
assert click.index("Lf58;->q(") < click.index("->slReturnPanel:Lj48;") < click.index("SearchPanel;->H()V")
restore = (after / "smali/ginlemon/flower/glass/SLDrawerSearchReturn.smali").read_text()
assert "->k(I)Lj48;" in restore and "if-ne v2, v3," in restore
assert restore.index("iput-object") < restore.index("Lf58;->q(")
assert "->v()V" in restore  # Hide keyboard before restoring drawer.
assert "const/4 v4, 0x0" in restore
assert "{v1, v2, v4, v5, v0}" in restore
print("PASS: origin recorded after navigation, keyboard-first Back, one-shot drawer restore, stale target guard and exit cleanup")

active = ET.parse(after / "res/layout/search_panel.xml").getroot()[0]
by_id = {node.get(android + "id"): node for node in active if node.get(android + "id")}
edit = by_id["@id/searchEditText"]
assert edit.tag == "ginlemon.library.widgets.EditTextBackEvent"
assert edit.get(android + "layout_height") == "56.0dip"
assert edit.get(android + "background") == "@android:color/transparent"
assert edit.get(android + "hint") == "@string/search"
assert by_id["@id/ghostText"].get(android + "paddingStart") == edit.get(android + "paddingStart")
assert by_id["@id/ghostText"].get(android + "paddingEnd") == edit.get(android + "paddingEnd")
assert "@id/resultsArea" in by_id and "@id/menu_button" in by_id and "@id/clear_button" in by_id
mic = next(node for node in active if node.get(android + "tag") == "active_search_mic")
assert mic.get(android + "src") == "@drawable/ic_drawer_mic_outline"
assert mic.get(android + "contentDescription") == "@string/abc_searchview_description_voice"
backdrop = active[0]
assert backdrop.tag == "ginlemon.flower.glass.SLDrawerSearchLayout" and len(backdrop) == 1
assert backdrop[0].get(android + "tag") == "all_apps_search"
assert "->getChildCount()I" in wrapper  # Single-child decorative use must not access overlay.
assert '"active_search_mic"' in search_panel and "SLDrawerVoiceClick;" in search_panel
async_theme = (after / "smali/n90.smali").read_text()
block = async_theme.split("SearchPanel;->R:Lginlemon/library/widgets/EditTextBackEvent;", 1)[1].split("return-object", 1)[0]
assert block.index("const/4 v9, 0x0") < block.index("->setBackground(")
print("PASS: active editor uses same native glass/icons, editable ID and search controls preserved, ghost alignment, voice binding, async opaque-fill suppression")

for file in ("drawer_bottom_search.xml", "search_panel.xml"):
    document = ET.parse(after / "res/layout" / file).getroot()
    icons = [node for node in document.iter() if node.get(android + "src") in (
        "@drawable/ic_drawer_search_outline", "@drawable/ic_drawer_mic_outline")]
    assert len(icons) == 2
    for node in icons:
        assert node.get(android + "tint") == "?android:textColorPrimary"
        assert node.get(android + "tag") in ("contrast_search_icon", "contrast_mic_icon", "active_search_mic")
assert "->updateIconTints()V" in wrapper.split(".method public onPreDraw()Z", 1)[1].split(".end method", 1)[0]
color_update = wrapper.split(".method private updateIconTints()V", 1)[1].split(".end method", 1)[0]
assert "Lp7b;->j()Lskb;" in color_update and "Lgkb;->a:I" in color_update
for tag in ("contrast_search_icon", "contrast_mic_icon", "active_search_mic"):
    assert f'"{tag}"' in color_update
apply_tint = wrapper.split(".method private static tintIcon", 1)[1]
assert "->getDefaultColor()I" in apply_tint and "if-eq p0, p2," in apply_tint
assert "->setImageTintList(" in apply_tint
print("PASS: both search/mic pairs use native wallpaper foreground, neutral XML fallback, per-frame theme refresh and unchanged-color invalidation guard")
