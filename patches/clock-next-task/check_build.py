"""Structural regression for the clock-only readout, against decoded 660296."""
from pathlib import Path
import sys
before, after = map(Path, sys.argv[1:])
def method(text, name):
    start = text.index('.method ' + name)
    return text[start:text.index('.end method', start)]
def clean(text):
    return [s.strip() for s in text.splitlines() if s.strip() and s.strip() != 'nop']
old = (before/'smali_classes4/SLGlassClockView.smali').read_text()
new = (after/'smali_classes4/SLGlassClockView.smali').read_text()
draw = method(new, 'private drawWeatherBlock(')
assert 'LSLClockTask;->draw(' in draw and 'drawPath' not in draw
on_draw = method(new, 'protected onDraw(')
assert '->drawWeatherBlock(' in on_draw and '->hasRealWeather:Z' not in on_draw
assert '->drawCard(' in on_draw and '->sShowWeather:Z' in on_draw
assert 'LSLClockTask;-><init>' in method(new, 'protected onAttachedToWindow()')
assert 'LSLClockTask;->stop()V' in method(new, 'protected onDetachedFromWindow()')
assert 'LSLClockTask;->tick()V' in method(new, 'public refreshNow()')
assert 'Show Next Task' in (after/'smali_classes4/SLGlassClockSettings.smali').read_text()
helper = (after/'smali_classes4/SLClockTask.smali').read_text()
for text in ('sl_agenda_panel_v1', 'items_json', 'registerOnSharedPreferenceChangeListener', 'unregisterOnSharedPreferenceChangeListener', 'shutdownNow'):
    assert text in helper, text
assert 'LSLTaskChoice;->select' in (after/'smali_classes4/SLClockTask$1.smali').read_text()
for p in ('AndroidManifest.xml', 'smali/qv9.smali', 'smali/ginlemon/flower/widgets/searchbar/SearchBarWidget.smali',
          'smali_classes4/SLGlassClockHook.smali', 'smali_classes4/ClockThemes.smali',
          'smali_classes4/SLAgendaStore.smali', 'smali_classes4/SLAgendaPanel.smali',
          'smali_classes4/SLWaContactSearch.smali', 'smali_classes4/SLGlassEmpty.smali'):
    assert clean((before/p).read_text()) == clean((after/p).read_text()), p
for p in (before/'res').rglob('*'):
    if p.is_file(): assert p.read_bytes() == (after/p.relative_to(before)).read_bytes(), p
assert 'versionCode: 660297' in (after/'apktool.yml').read_text()
print('PASS: task draw hook, lifecycle and read-only store, other core components and resources unchanged')
