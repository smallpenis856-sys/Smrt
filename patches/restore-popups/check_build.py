"""Check restored native popovers, other launcher code, and 660302 GIF helper."""
from pathlib import Path
import sys
base, fit, result = map(Path, sys.argv[1:])
def norm(p):
    return [line.strip() for line in p.read_text().splitlines() if line.strip() and line.strip() != 'nop']
for directory in ('smali','smali_classes2','smali_classes3','smali_classes4'):
    paths = {p.relative_to(base) for p in (base / directory).rglob('*.smali')}
    assert paths == {p.relative_to(result) for p in (result / directory).rglob('*.smali')}, directory
    for p in paths:
        assert norm(base / p) == norm(result / p), str(p)
for directory in ('smali_classes5','res'):
    paths = {p.relative_to(fit) for p in (fit / directory).rglob('*') if p.is_file()}
    assert paths == {p.relative_to(result) for p in (result / directory).rglob('*') if p.is_file()}, directory
    for p in paths:
        assert (norm(fit / p) == norm(result / p) if p.suffix == '.smali' else (fit / p).read_bytes() == (result / p).read_bytes()), str(p)
assert norm(fit / 'AndroidManifest.xml') == norm(result / 'AndroidManifest.xml')
assert 'versionCode: 660303' in (result / 'apktool.yml').read_text()
print('PASS: restored all native 660300 launcher code including menus; 660302 GIF helper and resources retained')
