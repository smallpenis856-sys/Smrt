# WhatsApp glass card alignment — build 660295

Based on build 660294 and the user's screenshot of glass circles appearing below the WhatsApp contact text. The previous `FrameLayout` placed a `MATCH_PARENT` native glass child inside a `WRAP_CONTENT` card; in an unconstrained scrolling container that child can affect the parent measurement, so this is a plausible cause of the misplaced background. `SLGlassCard` initially adds that decorative child at zero size, lets the foreground determine the card size, then measures the glass exactly to the measured card width and height. The clickable contact row stays above the native glass. No search-bar, global glass, contact query, contact photo, navigation, WhatsApp intent or permissions are changed.

## Rebuild

1. Decode `SmartLauncher-WhatsAppGlass-660294.apk`. Compile `stubs/` against Android 31 as a compile-only classpath, not into the APK.
2. Compile `SLGlassCard.java`, `SLWaContactSearch.java`, `../whatsapp-contact-photos/SLPhotoPolicy.java` and `../whatsapp-contacts/SLWaPhone.java` for Java 8; convert with dx and disassemble, or use `smali/`.
3. Copy the smali into `smali_classes4/`, set versionCode to 660295, build, align and sign with the 660294 key.
4. Decode the signed APK and run `python3 patches/whatsapp-glass-alignment/check_build.py <decoded-660294> <decoded-660295>`. Run the prior host tests and the adjusted all-apps search assertions.

`SLGlassCardTest` uses lightweight fake Android views; it checks the zero-sized placeholder and background remeasurement, not the actual platform's layout behavior. Signature, alignment, decoded structure, host tests and previous regression assertions passed. No Android device/emulator is available: the screenshot's reported behavior, actual native Compose glass position, touch handling, large text, accessibility, wallpaper changes and performance remain unverified on hardware. If the renderer itself draws outside its measured bounds, this fix may not fully resolve the symptom.
