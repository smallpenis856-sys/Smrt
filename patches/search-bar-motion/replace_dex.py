from pathlib import Path
from zipfile import ZipFile
import sys
source, output, dex = map(Path, sys.argv[1:])
assert source.resolve() != output.resolve()
with ZipFile(source) as src, ZipFile(output, 'w') as dst:
    assert src.namelist().count('classes6.dex') == 1
    for entry in src.infolist():
        dst.writestr(entry, dex.read_bytes() if entry.filename == 'classes6.dex' else src.read(entry))
