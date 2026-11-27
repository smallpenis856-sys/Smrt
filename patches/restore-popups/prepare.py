"""Build 660303 from decoded 660300, keeping the later GIF helper."""
from pathlib import Path
import sys
p = Path(sys.argv[1]) / 'apktool.yml'
s = p.read_text()
assert s.count('versionCode: 660300') == 1
p.write_text(s.replace('versionCode: 660300', 'versionCode: 660303'))
