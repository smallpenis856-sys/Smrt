# Restore previous launcher menus — 660303

Reverts only the 660301 white, rounded screenshot-style launcher action-popover changes. The native app/shortcut and secondary action popovers, including their theme, pointer, padding and existing actions, are restored to the 660300 implementation. GIF size, fit/crop and shape settings from 660302 are retained, as are prior launcher features.

Rebuild: decode `SmartLauncher-GifIcons-660300.apk`, run `python3 patches/restore-popups/prepare.py <decoded>`, build with apktool, replace `classes5.dex` with `patches/gif-fit/classes5.dex` using `patches/gif-fit/build_inputs.py <built-apk> <unsigned-output> patches/gif-fit/classes5.dex`, align with `patches/all-apps-search/align_apk.py`, and sign. Run `python3 patches/restore-popups/check_build.py <decoded-660300> <decoded-660302> <decoded-output>` to check all launcher smali except the helper is identical to 660300, and the GIF helper and resources are identical to 660302. Signature matches 660300–660302. Version code is 660303 so it can update 660302.

Host tests and structural checks pass; no Android device or emulator was available. Menu appearance, app actions, GIF settings/animation and the in-place update have not been tested on a phone.
