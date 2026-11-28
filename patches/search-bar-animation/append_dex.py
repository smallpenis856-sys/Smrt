from pathlib import Path
from zipfile import ZipFile
import sys
source, output, dex = map(Path, sys.argv[1:])
assert source.resolve() != output.resolve()
with ZipFile(source) as src, ZipFile(output, 'w') as dst:
    assert 'classes5.dex' in src.namelist() and 'classes6.dex' not in src.namelist()
    for entry in src.infolist(): dst.writestr(entry, src.read(entry))
    dst.writestr('classes6.dex', dex.read_bytes())
