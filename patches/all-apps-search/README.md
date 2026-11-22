# All Apps: copy the actual home search settings

Base: `SmartLauncher-BottomSearch.apk` (660274). Current output: `SmartLauncher-AllAppsSearch-SettingsCopy.apk` (660277). Earlier outputs 660275 and 660276 remain for history, not for installing this fix.

## Change and scope

The previous build searched the attached view tree for a home search bar; that can fall back to the default bar when the home widget is not in that tree. The user reported no visual change. This build removes that discovery code.

A single hook in the existing `SearchBarWidget.u(float, renderer, appearance)` render entry point publishes the actual home ViewModel (including its per-widget `gu9` settings/state flow), appearance mode, wallpaper renderer, glass strength and enabled flag. The All Apps instance is tagged `all_apps_search` and explicitly excluded from publishing, so its default settings cannot overwrite the captured home settings.

The drawer copies those exact references/settings before drawing and resets its Compose content only when necessary. Existing native state-flow collection handles subsequent per-widget setting changes. Home rendering itself is otherwise unchanged. This no longer requires finding an attached home view. It does not take a screenshot or write preferences.

The native home widget is used inside the existing drawer bottom position (56dp height, 44dp side margins, 28dp bottom margin). `SLSearchClick` preserves the drawer's existing search action. The reserved fallback ID -275 remains only until the first home render publishes its settings.

Limits: the last rendered home search bar supplies settings if several home bars exist. If there is no initialized home search bar, the default native bar is the fallback. The wallpaper renderer is reused; a separate live blur implementation for scrolling app icons is not added.

## Rebuild

With Java, Apktool 2.9.3 and apksigner available:

1. Decode the base APK with `apktool d SmartLauncher-BottomSearch.apk -o decoded`.
2. Copy `drawer_bottom_search.xml` to `decoded/res/layout/` and `SLDrawerSearchLayout.smali` to `decoded/smali/ginlemon/flower/glass/`.
3. In `decoded/smali/ginlemon/flower/widgets/searchbar/SearchBarWidget.smali`, insert the `invoke-static` from `home-render-hook.txt` immediately after `.locals 10` in method `u(FLp7b;Luec;)V`, exactly once. The text file includes the method header for context.
4. Change `versionCode: 660274` to `versionCode: 660277` in `decoded/apktool.yml`.
5. Build with `apktool b decoded -o unsigned.apk`.
6. Run `python patches/all-apps-search/align_apk.py unsigned.apk aligned.apk`.
7. Sign `aligned.apk` using your own keystore, producing `SmartLauncher-AllAppsSearch-SettingsCopy.apk`.
8. Verify with `apksigner verify --verbose SmartLauncher-AllAppsSearch-SettingsCopy.apk` and `python patches/all-apps-search/align_apk.py SmartLauncher-AllAppsSearch-SettingsCopy.apk`.
9. Decode the signed result to `verified`, then run `python patches/all-apps-search/check_build.py decoded verified`.

## Checks and installation

Build, signed-APK decode, v2/v3 signature verification, 4-byte stored-entry alignment and 16KiB native-library alignment passed. Round-trip assertions check the render hook, drawer-tag exclusion, no tree discovery, conditional redraw, listener removal, version, native widget/ViewModel integrity against build inputs and unchanged assets/native libraries.

No Android device/emulator is available here. These are structural/build checks, not proof the reported glass defect is fixed. On a device, first visit home, change the home search appearance/glass settings, then open All Apps. Confirm both bars respond to the same settings; also check reopening, rotation, wallpaper changes and search taps.

This APK uses the same local certificate as 660275/660276, so an update over those builds should be accepted. It is not signed with the original base APK's key. Back up layout/settings before considering any uninstall; uninstalling can remove data. The temporary keystore is not committed.
