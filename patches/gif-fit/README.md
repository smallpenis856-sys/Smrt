# GIF icon size, fit/crop and shape — build 660302

Based on 660301. Existing GIF icons now default to a centered square icon slot at 90% size, preserving source aspect ratio and clipping the image to rounded corners; this applies without having to reselect the GIF. The actual visual size relative to the launcher's other adaptive/transparent icons still depends on their inherent padding.

Long-press a home/dock icon → **Edit icon** → **Adjust GIF size, fit and shape**. The adjustment dialog also opens immediately after a successful GIF selection. It offers an animated preview, size from 50–100%, centered **Fit** (whole GIF) or **Crop** (fill square), and **Rounded**, **Circle**, or **Square**. Reset restores the defaults; Save applies them, Cancel discards option changes. Selecting a new GIF saves that GIF before this dialog opens, so canceling the dialog retains the new GIF and the prior/default options. Crop is centered; there is no separate drag-to-position control. Existing regular-icon selection and GIF removal remain accessible. Each launchable ID has separate options. All Apps icons are unchanged.

GIF data and the three new per-icon integer options use the existing `sl_mod_settings` preference store covered by `SLModBackup`. The added host test verifies the values survive its binary ZIP round trip. Old backups without option keys use defaults; actual phone backup/restore and native launchable-ID mapping remain unverified. Removing a GIF also removes its adjustment preferences. Storage limits remain those of 660300.

## Rebuild

Decode 660301, run `python3 patches/gif-fit/build_inputs.py <decoded>`, and build with apktool. Replace only `classes5.dex` in the built APK with the included helper using `python3 patches/gif-fit/build_inputs.py <built-apk> <unsigned-output> patches/gif-fit/classes5.dex`; then align and sign. The helper dex comes from `SLGifIcons.java` and `SLGifGeometry.java` with Android 31, Java 8, dx min SDK 24. `../gif-icons/stubs/yb6.java` is compile-only, never package it. Disassembled helper smali is included for inspection.

Host checks: `SLGifGeometryTest` (bounds/defaults/fit/crop/radius), the original `GifValidationTest`, `SLModBackupTest`, search-dialer and task-selection tests, and `python3 patches/gif-fit/check_build.py <decoded-660301> <decoded-output>`. APK alignment and v2/v3 signatures were verified; the signing certificate matches 660300 and 660301. Structural checks confirm unchanged popup, drawer, search, native launchable hooks and backup code.

No Android device/emulator was available. Actual GIF clipping, animation/preview, dimensions, dialog layout and accessibility at large font sizes, interaction, battery use, backup/restore and update behavior still need phone testing. There is no guarantee that the size exactly matches every icon pack or device. Preserve the local signing key for future updates.
