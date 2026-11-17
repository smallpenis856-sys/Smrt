# Smart Launcher 6.6 — glass clock fix build

`SmartLauncher-6.6-clockfix.apk` — same base as the uploaded mod build, with the glass
clock widget patched. Only `classes4.dex` differs; every resource, the manifest and the
native libs are byte-identical to the original APK.

| | |
|---|---|
| Package | `ginlemon.flowerfree` |
| Version | 6.6 build 026 (660260) |
| Signature | v1 + v2 + v3, CN=Smart Launcher Clock Fix |
| Size | 24.0 MB |
| SHA-256 | (see `sha256sum` output in repo) |

## What was patched

All changes are in `ginlemon/flower/widgets/...` `SLGlassClockView` (plus a tiny new
helper class `SLFix`).

1. **Ghost / doubled digits** — the view drew the digit path five times (fill, sheen,
   rim light, rim dark, offset shadow) with each layer nudged by 1.8–2.6 dp. That is the
   duplicated, cut-through-glass look. The four extra layers are now set to alpha 0 on the
   first frame; only the solid fill is drawn.
2. **Colon dots** — were placed at 30 % / 69 % of the digit height. Now 46 % / 92 %, so the
   two dots sit centred on the digits like the reference.
3. **Date overlap** — the clock started right at the date baseline. It now always keeps
   ≥ 4 dp between the date and the top of the digits, and the date's shadow layer is off.
4. **Edge clipping** — side margin 3.2 % → 4 %, digit scale 4.74×/4.55× tall → 4.35×, so no
   digit is cut off at the screen edges.

`frida`/anti-tamper note: the base app contains no runtime integrity checks that were
touched by this patch.

## Build

```bash
apktool d -f -o dec app.apk            # apktool 2.4.1 + JDK25
# ... edit dec/smali_classes4/... ...
apktool b dec -o rebuilt.apk           # ok after dropping 3 API-36 manifest attrs
# then: swap only classes4.dex back into the ORIGINAL zip (keeps original
# resources.arsc + 16 KB .so alignment), and sign
```

Signing key fingerprint (this build only, not upstream):

```
CN=Smart Launcher Clock Fix, O=SL Fix, C=PK
```

## Verification of this build

Checked before publishing (Python `zipfile` + androguard):

- 1456 ZIP entries — identical list to the source APK, only the signature files differ.
- Every entry except `classes4.dex` is byte-identical (SHA-256) to the source APK.
- All 1453 v1 JAR digests verify.
- `lib/**/*.so` are 16384-byte aligned (Android 15+ requirement); `resources.arsc` 4-byte.
- `META-INF/services/*` retained (10 files) — needed by Kotlin coroutines' `ServiceLoader`
  (`MainDispatcherFactory`) at startup.
- v1 + v2 + v3 signatures present.

### Crashing first build — what went wrong

The first upload of this APK crashed at launch. The signing library (`apk_sign_ts`) dropped
**every** `META-INF/` entry when repacking, which silently removed `META-INF/services/*`.
Kotlin coroutines resolve their main dispatcher through that `ServiceLoader` file, so the app
died during startup. The library also aligned `.so` files to 4096 instead of 16384. Both were
fixed (patched copy of the library is not committed; `.so` alignment + `META-INF/services`
retention are now verified per build).
