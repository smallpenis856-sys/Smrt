# All Apps native home search bar

Base: `SmartLauncher-BottomSearch.apk` (660274), the newest existing APK by its embedded build timestamps. Output: `SmartLauncher-AllAppsSearch.apk` (660275).

## Scope

Replace only the drawer's custom glass/text bar with the existing home `SearchBarWidget`, using its original Compose renderer, icons, typography and theme. Preserve the drawer's bottom constraints, 56dp height, 44dp side margins, 28dp bottom margin and existing `SLSearchClick` action. No home widget code, app data, permissions, assets or native libraries are changed.

The small FrameLayout initializes the native widget's assisted ViewModel before rendering. Reserved widget ID -275 keeps drawer preferences separate from user-created home widgets. It reuses the native design, not an individual home widget's per-instance custom settings.

## Rebuild

With Java, Apktool 2.9.3 and apksigner available:

1. Decode the base APK with `apktool d SmartLauncher-BottomSearch.apk -o decoded`.
2. Copy `drawer_bottom_search.xml` to `decoded/res/layout/` and `SLDrawerSearchLayout.smali` to `decoded/smali/ginlemon/flower/glass/`.
3. Change `versionCode: 660274` to `versionCode: 660275` in `decoded/apktool.yml`.
4. Build with `apktool b decoded -o unsigned.apk`.
5. Run `python patches/all-apps-search/align_apk.py unsigned.apk aligned.apk`.
6. Sign `aligned.apk` with your own keystore using apksigner, producing `SmartLauncher-AllAppsSearch.apk`.
7. Verify with `apksigner verify --verbose SmartLauncher-AllAppsSearch.apk` and `python patches/all-apps-search/align_apk.py SmartLauncher-AllAppsSearch.apk`.
8. Decode the signed result to `verified`, then run `python patches/all-apps-search/check_build.py decoded verified`.

## Validation and limits

Build and signed-APK decode passed; APK v2/v3 signatures verified. Stored ZIP entries are 4-byte aligned, native libraries 16KiB aligned. Round-trip checks confirm the correct widget, initialization order, version and unchanged home widget, assets and native libraries.

No Android device/emulator was available: visual parity, tapping, keyboard, dark/light mode, rotation, long press and navigation insets still need on-device testing. Existing native theme behavior is reused; individual home widget customizations are not synchronized.

The output uses a new local signing certificate, not the original APK's key. Android may reject an in-place update. Back up launcher layout/settings before considering uninstalling the old app; uninstalling can remove its data. The temporary signing key is not committed.
