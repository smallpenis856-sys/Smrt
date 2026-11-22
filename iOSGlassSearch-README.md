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

Verified: content digest, RSA signature over signed data, certificate/key match,
ZIP integrity, all 1455 entries intact except the one layout.

zipalign was also reproduced: the 8 `lib/**/*.so` entries keep their 4096-byte
data alignment (padding in the 0xd935 extra field) and the APK Signing Block
starts on a 4096-byte boundary, which Android 12+ / 16 KB page devices require.

Note: because the certificate is new, install it as a fresh install (uninstall
the old Smart Launcher first) — Android rejects a signature change otherwise.
