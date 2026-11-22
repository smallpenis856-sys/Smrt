"""Align stored ZIP entries before APK signing (stdlib only)."""
import copy
import struct
import sys
import zipfile


def check(path):
    with zipfile.ZipFile(path) as archive, open(path, "rb") as raw:
        assert archive.testzip() is None
        for entry in archive.infolist():
            if entry.compress_type != zipfile.ZIP_STORED:
                continue
            raw.seek(entry.header_offset + 26)
            name_len, extra_len = struct.unpack("<HH", raw.read(4))
            offset = entry.header_offset + 30 + name_len + extra_len
            alignment = 16384 if entry.filename.endswith(".so") else 4
            assert offset % alignment == 0, entry.filename


def align(source, destination):
    assert source != destination, "Do not overwrite the input APK"
    with zipfile.ZipFile(source) as src, zipfile.ZipFile(destination, "w") as dst:
        for original in src.infolist():
            entry = copy.copy(original)
            entry.extra = b""
            if entry.compress_type == zipfile.ZIP_STORED:
                alignment = 16384 if entry.filename.endswith(".so") else 4
                offset = dst.fp.tell() + 30 + len(entry.filename.encode("utf-8"))
                padding = (-offset) % alignment
                if padding:
                    if padding < 4:
                        padding += alignment
                    entry.extra = struct.pack("<HH", 0xFFFF, padding - 4) + bytes(padding - 4)
            dst.writestr(entry, src.read(original))
    check(destination)


if __name__ == "__main__":
    if len(sys.argv) == 3:
        align(sys.argv[1], sys.argv[2])
    elif len(sys.argv) == 2:
        check(sys.argv[1])
    else:
        raise SystemExit("Usage: align_apk.py INPUT [OUTPUT]; run before signing")
