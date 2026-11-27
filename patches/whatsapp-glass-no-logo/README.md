# WhatsApp glass foreground cleanup — build 660296

Based on build 660295 and the user's screenshot showing an unwanted small logo behind contact text. The card background reuses the native search-bar renderer: its native foreground lambda can still draw a search-provider icon even when the label is empty. The patch selects an empty foreground composable only when the `SearchBarWidget` is inside `SLGlassCard`, while leaving `sk8`'s actual glass/background renderer intact. The separately rendered WhatsApp icon or contact photo, contact name/number, tap action and card measurement are unchanged. Normal Home, All Apps and active search bars do not have `SLGlassCard` as their widget's grandparent, so they retain the original foreground.

`SLGlassEmpty.smali` implements the existing two-argument Kotlin function interface and returns Unit; its untracked, static `Lw12` has no state or drawn content. `qv9.patch` locates the shortcut-only view ancestry and substitutes that content immediately before the existing `sk8` render call.

## Rebuild and check

Decode `SmartLauncher-WhatsAppGlassFix-660295.apk`, apply `qv9.patch`, copy `SLGlassEmpty.smali` to `smali_classes4/`, change the versionCode to 660296, build, align and sign with the 660295 signing key. Decode the signed APK and run `python3 patches/whatsapp-glass-no-logo/check_build.py <decoded-660295> <decoded-660296>` and the adjusted prior search/phone/glass checks.

Signature, alignment, decoded branch scoping, search regressions and host tests passed. The certificate matches build 660295. No Android device or emulator was available, so removal of the unwanted mark, appearance, interactions and Compose lifecycle remain to be confirmed on the user's phone. The screenshot suggests a native foreground icon, but that source is not proven until device verification.
