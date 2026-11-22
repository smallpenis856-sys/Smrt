"""JAR v1 + APK Signature Scheme v2 signer (no Java needed)."""
import base64, hashlib, struct, zipfile, io, os
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.asymmetric import padding
from cryptography.x509 import load_pem_x509_certificate
from cryptography.hazmat.primitives.serialization import pkcs7

V2_ID = 0x7109871a
CHUNKED_SHA256 = 0x0101
RSA_PKCS1_SHA256 = 0x0103

def u32(v): return struct.pack('<I', v)
def u64(v): return struct.pack('<Q', v)
def lp(b): return u32(len(b)) + b

def wrap72(text):
    """JAR manifest lines must not exceed 72 bytes; continuation lines start with a space."""
    out = []
    for line in text.split('\r\n'):
        b = line.encode()
        if len(b) <= 72:
            out.append(line)
            continue
        out.append(b[:72].decode('utf-8', 'ignore'))
        rest = b[72:]
        while rest:
            chunk, rest = rest[:71], rest[71:]
            out.append(' ' + chunk.decode('utf-8', 'ignore'))
    return '\r\n'.join(out)

def build_v1(entries, cert, key):
    """entries: list of (name, data) to be listed in the manifest (all except META-INF sig files)."""
    man = 'Manifest-Version: 1.0\r\nCreated-By: sl-mod\r\n\r\n'
    sf_entries = []
    for name, data in entries:
        block = f'Name: {name}\r\nSHA-256-Digest: {base64.b64encode(hashlib.sha256(data).digest()).decode()}\r\n'
        man += wrap72(block) + '\r\n'
        sf_entries.append((block,))
    man_bytes = man.encode()
    sf = 'Signature-Version: 1.0\r\nCreated-By: sl-mod\r\n'
    sf += f'SHA-256-Digest-Manifest: {base64.b64encode(hashlib.sha256(man_bytes).digest()).decode()}\r\n\r\n'
    for (block,) in sf_entries:
        d = hashlib.sha256(block.encode()).digest()
        entry_name = block.split('Name: ', 1)[1].split('\r\n')[0]
        digest_b64 = base64.b64encode(d).decode()
        sf += wrap72('Name: ' + entry_name + '\r\nSHA-256-Digest: ' + digest_b64 + '\r\n') + '\r\n'
    sf_bytes = sf.encode()
    der = cert.public_bytes(serialization.Encoding.DER)
    p7 = (pkcs7.PKCS7SignatureBuilder()
          .set_data(sf_bytes)
          .add_signer(cert, key, hashes.SHA256())
          .sign(serialization.Encoding.DER, [pkcs7.PKCS7Options.DetachedSignature, pkcs7.PKCS7Options.Binary]))
    return man_bytes, sf_bytes, p7

def zip_extra(offset, namelen, align):
    base = offset + 30 + namelen
    pad = (align - (base + 4) % align) % align
    return struct.pack('<HH', 0xD935, pad) + b'\x00' * pad

def compute_content_digest(apk, block_start, cd_offset, eocd_offset):
    sec_a = apk[:block_start]
    sec_b = apk[cd_offset:eocd_offset]
    sec_c = bytearray(apk[eocd_offset:])
    struct.pack_into('<I', sec_c, 16, block_start)
    section_hashes = []
    for sec in (sec_a, sec_b, bytes(sec_c)):
        for i in range(0, len(sec), 1 << 20):
            chunk = sec[i:i + (1 << 20)]
            section_hashes.append(hashlib.sha256(b'\xa5' + u32(len(chunk)) + chunk).digest())
    top = b'\x5a' + u32(len(section_hashes)) + b''.join(section_hashes)
    return hashlib.sha256(top).digest()

def build_v2_block(apk, block_start, cd_offset, eocd_offset, cert, key):
    digest = compute_content_digest(apk, block_start, cd_offset, eocd_offset)
    signed_data = lp(u32(CHUNKED_SHA256) + lp(digest))                      # digests
    signed_data += lp(lp(cert.public_bytes(serialization.Encoding.DER)))     # certificates
    signed_data += lp(b'')                                                   # additional attrs
    sig = key.sign(signed_data, padding.PKCS1v15(), hashes.SHA256())
    signatures = lp(u32(RSA_PKCS1_SHA256) + lp(sig))
    pubkey = cert.public_key().public_bytes(serialization.Encoding.DER,
                                            serialization.PublicFormat.SubjectPublicKeyInfo)
    signer = lp(signed_data) + u32(24) + u32(0x7fffffff) + lp(signatures) + lp(pubkey)
    pairs = u64(len(u32(V2_ID) + lp(lp(signer)))) + u32(V2_ID) + lp(lp(signer))
    size_a = len(pairs) + 24
    return u64(size_a) + pairs + u64(size_a) + b'APK Sig Block 42'

def sign_apk(src, dst, key_pem, cert_pem):
    key = serialization.load_pem_private_key(open(key_pem, 'rb').read(), None)
    cert = load_pem_x509_certificate(open(cert_pem, 'rb').read())
    zin = zipfile.ZipFile(src)
    items = [(i.filename, zin.read(i.filename)) for i in zin.infolist()]
    # v1 signature files must be written first so they are not part of their own manifest
    man, sf, p7 = build_v1(items, cert, key)
    payload = items + [('META-INF/MANIFEST.MF', man), ('META-INF/CERT.SF', sf), ('META-INF/CERT.RSA', p7)]
    buf = io.BytesIO()
    with zipfile.ZipFile(buf, 'w') as zout:
        for name, data in payload:
            zi = zipfile.ZipInfo(name, date_time=(2026, 11, 16, 10, 4, 0))
            zi.external_attr = 0o644 << 16
            zi.compress_type = zipfile.ZIP_DEFLATED
            if name in ('resources.arsc',) or name.endswith('.so'):
                zi.compress_type = zipfile.ZIP_STORED
                zi.extra = zip_extra(zout.fp.tell(), len(name.encode()), 4096 if name.endswith('.so') else 4)
            zout.writestr(zi, data)
    apk = buf.getvalue()
    # locate EOCD
    eocd = apk.rfind(b'PK\x05\x06')
    cd_off = struct.unpack_from('<I', apk, eocd + 16)[0]
    block = build_v2_block(apk, cd_off, cd_off, eocd, cert, key)
    out = bytearray(apk[:cd_off]) + block + bytearray(apk[cd_off:])
    new_eocd = eocd + len(block)
    struct.pack_into('<I', out, new_eocd + 16, cd_off + len(block))
    open(dst, 'wb').write(bytes(out))
    return len(block)

if __name__ == '__main__':
    import sys
    n = sign_apk(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])
    print(f'signed {sys.argv[2]} (v2 block {n} bytes)')
