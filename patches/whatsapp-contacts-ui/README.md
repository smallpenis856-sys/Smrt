# WhatsApp contact card refresh — build 660292

Based on `SmartLauncher-SmartSearch-660291.apk`. Changes only the appearance of the separate WhatsApp contact chips: contact name first, phone number below, the installed WhatsApp/Business app icon (or a simple WA fallback), a subtle rounded surface matching the existing WhatsApp dialer card, light/dark theme text colors, and a touch ripple. Tapping still opens the same number in WhatsApp; contact lookup, permissions, debounce, cancellation, ordering, five-number limit and all other launcher UI remain unchanged. The phone number remains visible so contacts with similar names can be distinguished. A content description includes the action, contact and number.

## Rebuild

1. Decode build 660291. Compile the two files in `stubs/` against the Android 31 platform to a **separate compile-only classpath**; those stub classes must never be included in the APK. They describe the launcher’s existing theme API.
2. Compile `SLWaContactSearch.java` and `../whatsapp-contacts/SLWaPhone.java` against the platform and the stub classpath, using Java 8. Convert those compiled classes with dx and disassemble them to smali. The generated files are also provided in `smali/`.
3. Copy the generated `SLWa*.smali` into `smali_classes4/`, set versionCode 660292 in `apktool.yml`, then build, align, and sign with the 660291 signing key.
4. Decode the signed APK and run `python3 patches/whatsapp-contacts-ui/check_build.py <decoded-660291> <decoded-660292>`. Also run the prior all-apps-search, WhatsApp and search matching checks with the expected version adjusted for 660292.

Signature, alignment, decoded structural regressions, phone number tests and search matcher tests passed. The 660292 certificate is the same as 660291. No Android device or emulator was available: actual appearance, light/dark themes, screen reader behavior, large text, right-to-left layout, and opening WhatsApp still need device testing.
