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

## What was patched (v7)

Constants + three `setAlpha(0)` calls. No new classes, method signatures unchanged.

| Purpose | Method | Change |
|---|---|---|
| Ghost / doubled digits | `rebuildGeometryAndShaders` | `sheenPaint`, `rimLightPaint`, `rimDarkPaint` -> `setAlpha(0)`. These paints are re-configured on every rebuild, so a constructor-only fix had no effect. |
| Inner cut / concentric glyph look | `<init>` | `shadowPaint` colour `0x1a000000` -> `0` |
| Doubled date line | `<init>` | date `setShadowLayer` radius -> 0 |
| Colon dots too large | `rebuildGeometryAndShaders` | radius `0.44f` -> `0.30f` of digit height |
| Colon dots off-centre | `rebuildGeometryAndShaders` | offsets `0.30f/0.69f` -> `0.46f/0.92f` |
| `1` clipped at screen edge | `rebuildGeometryAndShaders` | side margin `0.032f` -> `0.06f`, digit height `4.74f`/`4.55f` -> `4.35f` |

### Register note (caused a launch crash in v6)

`setAlpha(int)` needs an **int** register and `invoke-virtual` only accepts `v0`-`v15`.
v6 passed `v11`, which in `rebuildGeometryAndShaders` holds a *float* at that point, so ART
rejected the class and the app died at cold start. v7 uses `v14` / `v9` (both dead after the
call) with an explicit `const/4 ... 0x0`. Verified: no later use of those registers, and
assembly fails loudly if a register is ever out of range.

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
