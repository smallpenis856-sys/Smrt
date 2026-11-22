# SmartLauncher-iOSGlassSearch.apk

iOS-style (liquid glass) search bar on the All-apps / app-drawer screen, for
**Smart Launcher 6.6 build 026** (`ginlemon.flowerfree`).

Built from `SmartLauncher-BottomSearch.apk`, so it keeps that build's tweaks
(Lens removed, floating glass bottom bar) and adds the iOS restyle.

## What changed

Exactly one file inside the APK: `res/layout/drawer_bottom_search.xml`.

The container is still `ginlemon.flower.glass.SLGlassLayout`, so the app's own
`SLLiquidGlassDrawable` keeps drawing the glass (adaptive dark/light fill
gradient, 0.5 dp hairline rim, pill radius = height/2, inner sheen + shade,
`setBackgroundBlurRadius(50)` on Android 12+, shadow colours) and
`SLSearchClick` still opens search. Only the contents changed:

| Before | After |
| --- | --- |
| one centered `TextView` ("Smart search") | leading 22 dp search glyph, dim 17 sp `Search` placeholder, trailing 20 dp voice glyph |

Colors come from the app's existing `white50` / `white32`, icons from
`ic_search` and `abc_ic_voice_search_api_material`. No resource-table edits.

## Signing

The source APK carried a **v2 block whose content digest did not match its own
bytes**, and no v1 signature at all — it could not install. This build is
re-signed with a fresh APK Signature Scheme v2 signature
(`RSA PKCS#1 v1.5 / SHA-256`, APK Signing Block ID `0x7109871a`), self-signed
cert `CN=SmartLauncher iOS Glass`. minSdk is 24, where v2 is enough.

Verification (this build): the APK is accepted by an **independent**
third-party Python v2 verifier (`shuxin/apk-signature-verify`) that also accepts
the upstream `apksigner` fixture used as ground truth — `v2=True, errors=[]` for
both. Additionally checked locally: v2 content digest, RSA PKCS#1 v1.5 / SHA-256
signature over the signed-data blob, certificate/key match, self-signed chain,
ZIP integrity, and all 1455 entries intact except the one layout.

Two real bugs were found and fixed in the build tooling:

1. **Cumulative chunk hashing.** The content digest computes one SHA-256 per
   1 MiB chunk (`0xa5 || u32le(len) || data`). The builder reused a single hash
   object across chunks, so every digest after the first was computed over all
   preceding data too — a wrong digest that the builder's own verifier shared,
   so it self-reported success. Both the signer and the verifier now allocate a
   fresh hash object per chunk.
2. **Digest range when padding before the block.** The digest covers
   `[0 : block_start]` (padding included) and the EOCD is digested with the
   central-directory offset rewritten to `block_start`.

zipalign was also reproduced: the 8 `lib/**/*.so` entries keep their 4096-byte
data alignment (padding in the 0xd935 extra field) and the APK Signing Block
starts on a 4096-byte boundary, which Android 12+ / 16 KB page devices require.

Note: because the certificate is new, install it as a fresh install (uninstall
the old Smart Launcher first) — Android rejects a signature change otherwise.
