from pathlib import Path
from zipfile import ZipFile
import sys
if len(sys.argv) == 2:
    yml = Path(sys.argv[1])/'apktool.yml'
    text = yml.read_text()
    assert text.count('versionCode: 660301') == 1
    yml.write_text(text.replace('versionCode: 660301','versionCode: 660302'))
elif len(sys.argv) == 4:
    source, target, dex = map(Path, sys.argv[1:])
    assert source.resolve() != target.resolve()
    with ZipFile(source) as src, ZipFile(target,'w') as dst:
        assert src.namelist().count('classes5.dex') == 1
        for entry in src.infolist(): dst.writestr(entry, dex.read_bytes() if entry.filename == 'classes5.dex' else src.read(entry))
else:
    raise SystemExit('Usage: build_inputs.py <decoded-660301> OR build_inputs.py <built-apk> <output-apk> <classes5.dex>')
