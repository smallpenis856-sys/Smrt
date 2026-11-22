"""Structural checks on the signed, round-trip decoded APK."""
from pathlib import Path
import sys
import xml.etree.ElementTree as ET

before, after = map(Path, sys.argv[1:])
android = "{http://schemas.android.com/apk/res/android}"
old_root = ET.parse(before / "res/layout/home_panel.xml").getroot()
new_root = ET.parse(after / "res/layout/home_panel.xml").getroot()
old_home, new_home = old_root[0], new_root[0]
assert [x.tag for x in new_home[:-1]] == [x.tag for x in old_home if x.tag != "ginlemon.flower.glance.SLGlanceIsland"]
island = new_home[-1]
assert island.tag == "ginlemon.flower.glance.SLGlanceIsland"
assert island.get(android + "tag") == "sl_glance_island"
assert island.get(android + "layout_gravity") in ("top|center_horizontal", "center_horizontal|top", "center|top")
assert [x.tag for x in new_root[1:]] == [x.tag for x in old_root[1:]]

smali = after / "smali_classes4/ginlemon/flower/glance"
assert len(list(smali.glob("SLGlance*.smali"))) == 19
island_smali = (smali / "SLGlanceIsland.smali").read_text()
def body(name):
    return island_smali.split(name, 1)[1].split(".end method", 1)[0]
assert "->addOnPreDrawListener(" in body("onAttachedToWindow()V")
assert "->removeOnPreDrawListener(" in body("onDetachedFromWindow()V")
assert "->stop()V" in body("onDetachedFromWindow()V")
assert "->stop()V" in body("onWindowVisibilityChanged(I)V")
assert "->getGlobalVisibleRect(" in body("onPreDraw()Z")
start = body("private start()V")
stop = body("private stop()V")
for needle in ("->registerReceiver(", "->registerOnSharedPreferenceChangeListener(", "->registerContentObserver(", "->reconnectMedia()V"):
    assert needle in start, needle
for needle in ("->unregisterReceiver(", "->unregisterOnSharedPreferenceChangeListener(", "->unregisterContentObserver(", "->unbindMedia()V"):
    assert needle in stop, needle
assert "->removeOnActiveSessionsChangedListener(" in body("private unbindMedia()V")
assert "->unregisterCallback(" in body("private unbindMedia()V")
assert '"sl_agenda_panel_v1"' in island_smali and '"items_json"' in island_smali
assert '"android.permission.READ_CALENDAR"' in island_smali
assert "CalendarContract$Instances;->CONTENT_URI" in island_smali
all_smali = "\n".join(p.read_text() for p in smali.glob("SLGlance*.smali"))
assert "->requestPermissions(" in island_smali and "android.settings.ACTION_NOTIFICATION_LISTENER_SETTINGS" in all_smali
assert "->postDelayed(" not in island_smali and "Landroid/location/" not in island_smali
assert "SLGlancePolicy;->choose(IZZZZ)I" in island_smali
before_manifest = ET.parse(before / "AndroidManifest.xml").getroot()
after_manifest = ET.parse(after / "AndroidManifest.xml").getroot()
def permissions(root): return {p.get(android + "name") for p in root.findall("uses-permission")}
assert permissions(before_manifest) == permissions(after_manifest)
print("PASS: home-only island, balanced visibility/lifecycle subscriptions, optional permissions, agenda/calendar sources, no new permissions or timers")
