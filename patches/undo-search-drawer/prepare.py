"""Copy 660303 unchanged except its unique binary manifest version and old signatures."""
from pathlib import Path
from zipfile import ZipFile
import struct, sys
source, target=map(Path,sys.argv[1:])
assert source.resolve()!=target.resolve()
with ZipFile(source) as src, ZipFile(target,'w') as dst:
    for entry in src.infolist():
        name=entry.filename
        if name in ('META-INF/LAUNCHER.SF','META-INF/LAUNCHER.RSA','META-INF/MANIFEST.MF'): continue
        data=src.read(entry)
        if name=='AndroidManifest.xml':
            old=struct.pack('<I',660303); new=struct.pack('<I',660307)
            assert data.count(old)==1
            i=data.index(old)
            # Res_value: size 8, reserved 0, TYPE_INT_DEC 0x10.
            assert data[i-4:i] == b'\x08\x00\x00\x10'
            data=data[:i]+new+data[i+4:]
        dst.writestr(entry,data)
