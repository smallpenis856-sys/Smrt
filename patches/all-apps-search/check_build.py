"""Run after decoding the new APK: python check_build.py ORIGINAL_DECODED NEW_DECODED."""
from pathlib import Path
import sys
import os
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
assert "versionCode: " + os.environ.get("CHECK_VERSION", "660288") in (after / "apktool.yml").read_text()
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
    "smali/ginlemon/flower/HomeScreen.smali",
):
    assert (before / relative).read_bytes() == (after / relative).read_bytes(), relative
print("PASS: synchronous drawer-only search navigation, focus after navigation, animation guard, missing-search path, unchanged global Home navigation")

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

producer = (after / "smali/jj3.smali").read_text()
assert "sget-object v1, Lge3;->i:Lge3;" not in producer
assert "sget-object v1, Lge3;->D:Lge3;" in producer  # Confirmation remains available.
# Compare against the patched build input so no other flow is accidentally removed.
normalize = lambda text: [line.strip() for line in text.splitlines() if line.strip() and line.strip() != "nop"]
assert normalize((before / "smali/jj3.smali").read_text()) == normalize(producer)
assert (before / "smali/go8.smali").read_bytes() == (after / "smali/go8.smali").read_bytes()
assert not (after / "smali/ginlemon/flower/glass/SLLiveBackdrop.smali").exists()
print("PASS: category suggestion emission suppressed, confirmation/preferences intact, reverted live-backdrop feature remains absent")

# Check the signed APK's automatic-prompt branch, including both existing preferences.
startup = (after / "smali/n90.smali").read_text().split("Lgo8;->F:Lbo8;", 1)[1].split(":pswitch_4", 1)[0]
start = startup.index("move-result v1") + len("move-result v1")
program = [line.strip() for line in startup[start:].splitlines() if line.strip()]
labels = {line: i for i, line in enumerate(program) if line.startswith(":")}
for already_default in (0, 1):
    for stored_popup_enabled in (0, 1):
        registers = {"v0": already_default, "v1": stored_popup_enabled}
        pc = 0
        for _ in range(30):
            instruction = program[pc]
            if instruction.startswith("invoke-static {v5}"):
                assert registers["v5"] == 0
                break
            if instruction.startswith("if-nez "):
                register, label = instruction[len("if-nez "):].split(", ")
                if registers[register]:
                    pc = labels[label]
                    continue
            elif instruction.startswith("goto "):
                pc = labels[instruction.split()[1]]
                continue
            elif instruction.startswith("const/4 "):
                register, value = instruction[len("const/4 "):].split(", ")
                registers[register] = int(value, 16)
            elif not instruction.startswith(":"):
                raise AssertionError("Unexpected startup predicate instruction: " + instruction)
            pc += 1
        else:
            raise AssertionError("Startup predicate did not terminate")
for relative in ("smali_classes2/wq5.smali", "smali_classes2/vk.smali", "smali/go8.smali"):
    assert normalize((before / relative).read_text()) == normalize((after / relative).read_text()), relative
print("PASS: startup default prompt disabled for all four default/pref combinations; manual default UI and saved preferences unchanged")

queue = (after / "smali/lg7.smali").read_text()
assert "Lmqa;->e:Lmqa;" not in queue
start = queue.index("sget-object v0, Lmqa;->E:Lmqa;")
queue_branch = queue[start:queue.index("return-void", start)]
assert queue_branch.count("Lnqa;-><init>(Lmqa;I)V") == 4
assert "filled-new-array {p1, v2, v3, v4}, [Lnqa;" in queue_branch
for other_type in ("E", "F", "i", "D"):
    assert f"Lmqa;->{other_type}:Lmqa;" in queue_branch
print("PASS: default-home step absent from startup queue; four unrelated startup entries preserved")

# Confirm bottom docking and complete search-only lifecycle management.
app = "{http://schemas.android.com/apk/res-auto}"
assert edit.get(app + "layout_constraintBottom_toBottomOf") == "parent"
assert edit.get(app + "layout_constraintTop_toTopOf") is None
results = by_id["@id/resultsArea"]
assert results.get(app + "layout_constraintTop_toTopOf") == "parent"
assert results.get(app + "layout_constraintBottom_toTopOf") == "@id/searchEditText"
for method, action in (("w()V", "start"), ("y()V", "stop"), ("onDetachedFromWindow()V", "stop")):
    body = search_panel.split(".method public final " + method, 1)[1].split(".end method", 1)[0]
    assert "SLKeyboardDock;->" + action + "()V" in body
keyboard = (after / "smali/ginlemon/flower/glass/SLKeyboardDock.smali").read_text()
assert "->setSoftInputMode(I)V" in keyboard
assert "->addOnGlobalLayoutListener(" in keyboard and "->removeOnGlobalLayoutListener(" in keyboard
assert "->getWindowVisibleDisplayFrame(" in keyboard and "->bottomOverlap(III)I" in keyboard
assert "SLKeyboardDock$Api30;->visibleBottom(" in keyboard
api30 = (after / "smali/ginlemon/flower/glass/SLKeyboardDock$Api30.smali").read_text()
assert "WindowInsets$Type;->ime()I" in api30 and "WindowInsets$Type;->navigationBars()I" in api30
print("PASS: search bar below results, IME overlap calculation, search-only listener and window-mode restoration")

# Shared panel animator: monotonic interpolation and equal base settle durations,
# preserving the existing user animation-speed scaling hook.
motion = (after / "smali/f58.smali").read_text()
programmatic = motion.split(".method public final B(ZIFFLcs4;)V", 1)[1].split(".end method", 1)[0]
settle = motion.split(".method public final y(I[F)Z", 1)[1].split(".end method", 1)[0]
assert "Lqjc;->b:Lhn3;" not in programmatic
assert "DecelerateInterpolator;-><init>()V" in programmatic
assert "new-instance v3, Lm48;" not in settle
assert settle.count("0x3ff0000000000000L") == 2
assert "DecelerateInterpolator;-><init>()V" in settle
assert "DecelerateInterpolator;-><init>(F)V" in settle
assert settle.count("LSLAnimSpeed;->setDur(Landroid/animation/ValueAnimator;J)") == 2
print("PASS: non-bouncy shared panel settle interpolation and scaled matching base durations")

# The tint scan runs only while visible, and only on the first frame or a
# foreground/root change. Detach clears the parent reference and cache.
predraw = wrapper.split(".method public onPreDraw()Z", 1)[1].split(".end method", 1)[0]
assert predraw.index("->isShown()Z") < predraw.index("->updateIconTints()V")
assert predraw.index("->tintReady:Z") < predraw.index("->updateIconTints()V")
assert "->tintRoot:Landroid/view/View;" in color_update
assert "->tintColor:I" in color_update and "->tintReady:Z" in color_update
assert color_update.index("if-eq v2, v1, :cond_") < color_update.index('"contrast_search_icon"')
detach = wrapper.split(".method protected onDetachedFromWindow()V", 1)[1].split(".end method", 1)[0]
assert "->tintReady:Z" in detach and "->tintRoot:Landroid/view/View;" in detach
print("PASS: hidden panels skip work; unchanged foreground/root bypasses repeated icon-tree scans; detach clears cache")

# Interpret the rebuilt smali's cache guard for first draw, stable frame,
# theme change and replacement parent. This tests the assembled branch logic.
segment = color_update[color_update.index("    iget-boolean v2, p0,"):]
segment = segment[:segment.index("    iput-object v0, p0,")]
ops = [line.strip() for line in segment.splitlines() if line.strip()]
for ready, same_root, same_color, refresh in (
    (False, True, True, True), (True, True, True, False),
    (True, True, False, True), (True, False, True, True),
):
    fields = {"tintReady": ready, "tintRoot": same_root, "tintColor": same_color}
    registers = {"v0": True, "v1": True}
    outcome = True
    for op in ops:
        if op.startswith(("iget-boolean ", "iget-object ", "iget ")):
            field = op.split("->", 1)[1].split(":", 1)[0]
            registers["v2"] = fields[field]
        elif op.startswith("if-eqz "):
            if not registers["v2"]:
                break
        elif op.startswith("if-ne "):
            if registers["v2"] != registers["v0"]:
                break
        elif op.startswith("if-eq "):
            if registers["v2"] == registers["v1"]:
                outcome = False
                break
        elif not op.startswith(":"):
            raise AssertionError("Unexpected tint cache guard: " + op)
    assert outcome == refresh, (ready, same_root, same_color)
print("PASS: rebuilt cache guard refreshes initially and on theme/root changes, skips unchanged frames")
