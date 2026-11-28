from pathlib import Path
import sys
p = Path(sys.argv[1])/'apktool.yml'
s = p.read_text()
assert s.count('versionCode: 660304') == 1
p.write_text(s.replace('versionCode: 660304', 'versionCode: 660305'))
