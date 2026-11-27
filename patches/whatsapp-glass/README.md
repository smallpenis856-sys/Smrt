# WhatsApp shortcut glass — build 660294

Based on `SmartLauncher-ContactPhotos-660293.apk`. Each WhatsApp contact card now places the launcher's existing `SLDrawerSearchLayout` and `SearchBarWidget` behind its existing clickable contact content. The same native home-search state, appearance and wallpaper renderer used by the active Smart Search bar are reused; the `all_apps_search` tag suppresses native labels and prevents the decorative cards from publishing themselves as the home widget. The contact name, number, photo, WhatsApp action and contact lookup are unchanged. If native glass inflation fails, the prior solid theme-aware card is used instead. No new screenshot, per-pixel sampling, live scrolling-icon backdrop, network access or permission is added.

Each visible result creates a separate native Compose-backed glass widget (at most five under the existing search limit); this preserves distinct tappable cards but has not been benchmarked on hardware. Native glass availability and appearance depend on launcher theme, wallpaper, initialization and device behavior. If no home search state has been captured, the existing native fallback applies. Reusing the renderer does not guarantee pixel-identical results across different card sizes.

## Rebuild and checks

1. Decode build 660293. Compile `stubs/` only as a separate Android 31 compile classpath; do not package the stubs.
2. Compile `SLWaContactSearch.java`, `../whatsapp-contact-photos/SLPhotoPolicy.java` and `../whatsapp-contacts/SLWaPhone.java` using Java 8. Use dx and baksmali, or use the generated files in `smali/`.
3. Copy the generated smali to `smali_classes4/`, copy `res/layout/wa_contact_glass.xml` to the decoded resource tree, and change versionCode to 660294. Build, align, and sign with the 660293 key.
4. Decode the signed APK and run `python3 patches/whatsapp-glass/check_build.py <decoded-660293> <decoded-660294>`, along with the previous all-apps-search, phone and search tests (updated for the version).

The APK uses the same certificate as build 660293. Signature, alignment, decoded structure, contact photo and search host tests passed. No Android device/emulator was available: glass rendering, touch handling, battery, large text, accessibility, lifecycle, theme/wallpaper changes and opening WhatsApp are unverified in use. Do not assume a specific performance or visual improvement without a device check.
