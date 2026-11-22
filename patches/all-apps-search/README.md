# All Apps native home search bar

Base: `SmartLauncher-BottomSearch.apk` (660274), the newest existing APK by its embedded build timestamps. Previous output: `SmartLauncher-AllAppsSearch.apk` (660275). Current output: `SmartLauncher-AllAppsSearch-GlassFix.apk` (660276).

## Scope

Replace only the drawer's custom glass/text bar with the existing home `SearchBarWidget`, using its original Compose renderer, icons, typography and theme. Preserve the drawer's bottom constraints, 56dp height, 44dp side margins, 28dp bottom margin and existing `SLSearchClick` action. No home widget code, app data, permissions, assets or native libraries are changed.

The FrameLayout initializes a fallback native widget (reserved ID -275), then finds the first initialized home search widget, excluding its own subtree. While attached and visible it observes pre-draw, sharing the home ViewModel/state flow, appearance mode, wallpaper renderer and glass strength/enabled values. Compose is reset only when these references/settings change; state-flow changes otherwise recompose normally. Rendering remains in the drawer child, not a screenshot of the home bar. The listener is removed on detach and detached cached source widgets are rediscovered. No preferences are written. With no initialized home search widget, the default native bar remains available.

## Rebuild

With Java, Apktool 2.9.3 and apksigner available:

1. Decode the base APK with `apktool d SmartLauncher-BottomSearch.apk -o decoded`.
2. Copy `drawer_bottom_search.xml` to `decoded/res/layout/` and `SLDrawerSearchLayout.smali` to `decoded/smali/ginlemon/flower/glass/`.
3. Change `versionCode: 660274` to `versionCode: 660276` in `decoded/apktool.yml`.
4. Build with `apktool b decoded -o unsigned.apk`.
5. Run `python patches/all-apps-search/align_apk.py unsigned.apk aligned.apk`.
6. Sign `aligned.apk` with your own keystore using apksigner, producing `SmartLauncher-AllAppsSearch-GlassFix.apk`.
7. Verify with `apksigner verify --verbose SmartLauncher-AllAppsSearch-GlassFix.apk` and `python patches/all-apps-search/align_apk.py SmartLauncher-AllAppsSearch-GlassFix.apk`.
8. Decode the signed result to `verified`, then run `python patches/all-apps-search/check_build.py decoded verified`.

## Validation and limits

Build and signed-APK decode passed; APK v2/v3 signatures verified. Stored ZIP entries are 4-byte aligned, native libraries 16KiB aligned. Round-trip checks confirm the correct widget, initialization order, version and unchanged home widget, assets and native libraries.

No Android device/emulator was available: visual parity, tapping, keyboard, dark/light mode, rotation, long press and navigation insets still need on-device testing. The first initialized home search widget supplies live customizations; multiple home bars with different styles are not individually selectable. No physical-device verification of the reported glass issue has been possible.

The output uses the same local signing certificate as 660275 (verified), but not the original base APK's key. It should update the previous AllAppsSearch build; Android may reject updates over differently signed builds. Back up launcher layout/settings before considering uninstalling the old app; uninstalling can remove its data. The temporary signing key is not committed.
