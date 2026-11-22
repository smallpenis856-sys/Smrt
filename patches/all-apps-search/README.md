# All Apps: copy the actual home search settings

Base: `SmartLauncher-BottomSearch.apk` (660274). Current output: `SmartLauncher-AllAppsSearch-NoFlash.apk` (660280; replaces the previous NoFlash download). Earlier outputs 660275–660279 remain for history, not for installing this change. The user confirmed the glass effect was correct after changing wallpaper.

## Back returns to All Apps (660280)

The drawer click now records the actual originating workspace panel (`f58.l(U)`) before navigation, then stores it on the SearchPanel instance after the synchronous transition. No static navigation flag or Activity reference is introduced.

In `SearchPanel.c()` the original keyboard-visible path is retained: Back first hides the keyboard. On the subsequent close-search Back, if a drawer origin was recorded, `SLDrawerSearchReturn.restore()` validates that panel still exists, consumes the one-shot origin, hides the keyboard and restores that same panel synchronously. Returning `true` prevents the launcher's outer Back handler from subsequently navigating home. Reusing the existing drawer instance is intended to preserve its scroll state. `SearchPanel.y()` clears the origin on any exit so Home presses or later home-originated searches cannot inherit it. With no origin or a stale/removed target, native Back handling continues unchanged.

This is native search with an origin-aware return path, not inline app filtering. The search-panel Back callback and exit hook are the only new global-class changes; home search has no return marker and uses its original path. Device testing is still required for keyboard-first Back, back gesture, Home then reopen, result launch then return, scroll retention and rotation.

## Drawer search transition (660279)

The drawer's old listener called `HomeScreen.H()`, then `G(40)` and `f58.z(40)`. That helper normalizes to home immediately and animates the search panel in, exposing home in between. A drawer-only `SLDrawerSearchClick` now normalizes the workspace and selects the existing search panel synchronously with animation disabled for both operations, then focuses its native search input. No frame is intentionally scheduled between normalization and showing search. This retains the native cross-axis normalization without changing the global panel manager or home search behavior.

As in the original panel-navigation helper, taps during an active workspace animation are ignored. Missing search panels still use `HomeScreen.o(40)` to preserve the launcher's original disabled/missing-panel handling. Search still opens the launcher's dedicated search panel; this is not a new inline drawer filter. The glass, icons, mic action and search engine behavior are unchanged. Device testing is needed for flash removal, keyboard timing and Back behavior.

## Reference-style icons (660278)

Only All Apps gets the reference arrangement: thin outlined magnifier on the left, regular left-aligned localized “Search” placeholder, outlined microphone button on the right. Retains the working native glass background and home appearance sharing; the home bar is not restyled. The reference artwork is recreated with Android vector strokes, not extracted Apple SF Symbols, so pixel-identical rendering on every Android density/font is not claimed.

The native centered label is cleared only when `qv9` renders the widget tagged `all_apps_search`. A transparent foreground row supplies the new icons/text without replacing or recoloring the glass. The row opens the existing launcher search; the separate 48dp mic target launches Android's `android.speech.action.WEB_SEARCH` handler. This is external device voice search, not dictation into the launcher app-filter field. Missing/blocked handlers show a message rather than crash; no microphone permission is added. The decorative native content and icons are excluded from accessibility, while the search row and mic have localized descriptions.

## Glass change and scope

The previous build searched the attached view tree for a home search bar; that can fall back to the default bar when the home widget is not in that tree. The user reported no visual change. This build removes that discovery code.

A single hook in the existing `SearchBarWidget.u(float, renderer, appearance)` render entry point publishes the actual home ViewModel (including its per-widget `gu9` settings/state flow), appearance mode, wallpaper renderer, glass strength and enabled flag. The All Apps instance is tagged `all_apps_search` and explicitly excluded from publishing, so its default settings cannot overwrite the captured home settings.

The drawer copies those exact references/settings before drawing and resets its Compose content only when necessary. Existing native state-flow collection handles subsequent per-widget setting changes. Home rendering itself is otherwise unchanged. This no longer requires finding an attached home view. It does not take a screenshot or write preferences.

The native home widget is used inside the existing drawer bottom position (56dp height, 44dp side margins, 28dp bottom margin). `SLDrawerSearchClick` opens the native search panel without the intermediate animated home transition. The reserved fallback ID -275 remains only until the first home render publishes its settings.

Limits: the last rendered home search bar supplies settings if several home bars exist. If there is no initialized home search bar, the default native bar is the fallback. The wallpaper renderer is reused; a separate live blur implementation for scrolling app icons is not added.

## Rebuild

With Java, Apktool 2.9.3 and apksigner available:

1. Decode the base APK with `apktool d SmartLauncher-BottomSearch.apk -o decoded`.
2. Copy `drawer_bottom_search.xml` to `decoded/res/layout/` and `SLDrawerSearchLayout.smali` to `decoded/smali/ginlemon/flower/glass/`.
3. Copy both `ic_drawer_*_outline.xml` files to `decoded/res/drawable/` and `SLDrawerVoiceClick.smali`, `SLDrawerSearchClick.smali` and `SLDrawerSearchReturn.smali` to `decoded/smali/ginlemon/flower/glass/`. In `decoded/smali/qv9.smali`, insert the block in `drawer-label-hook.txt` after its matching `iget-object v10` line (the first line of that text file is context, not a duplicate instruction).
4. In `decoded/smali/ginlemon/flower/widgets/searchbar/SearchBarWidget.smali`, insert the `invoke-static` from `home-render-hook.txt` immediately after `.locals 10` in method `u(FLp7b;Luec;)V`, exactly once. The text file includes the method header for context.
5. Apply the three insertions in `search-return-hooks.txt` to `decoded/smali/ginlemon/flower/searchPanel/SearchPanel.smali` (instance field, close-search Back branch and panel-exit cleanup). Change `versionCode: 660274` to `versionCode: 660280` in `decoded/apktool.yml`.
6. Build with `apktool b decoded -o unsigned.apk`.
7. Run `python patches/all-apps-search/align_apk.py unsigned.apk aligned.apk`.
8. Sign `aligned.apk` using your own keystore, producing `SmartLauncher-AllAppsSearch-NoFlash.apk`.
9. Verify with `apksigner verify --verbose SmartLauncher-AllAppsSearch-NoFlash.apk` and `python patches/all-apps-search/align_apk.py SmartLauncher-AllAppsSearch-NoFlash.apk`.
10. Decode the signed result to `verified`, then run `python patches/all-apps-search/check_build.py decoded verified`.

## Checks and installation

Build, signed-APK decode, v2/v3 signature verification, 4-byte stored-entry alignment and 16KiB native-library alignment passed. Round-trip assertions check the render hook, drawer-tag exclusion, no tree discovery, conditional redraw, listener removal, version, outline icon layout, localized accessibility descriptions, voice handler error paths, drawer-only centered-label override, native widget/ViewModel integrity against build inputs and unchanged assets/native libraries.

No Android device/emulator is available here. These are structural/build checks, not proof the reported glass defect is fixed. On a device, first visit home, change the home search appearance/glass settings, then open All Apps. Confirm both bars respond to the same settings; also check reopening, rotation, wallpaper changes, search-row taps and mic launching/missing-handler feedback. Reference-style layout and touch behavior have not been visually tested on a device.

This APK uses the same local certificate as 660275–660279, so an update over those builds should be accepted. It is not signed with the original base APK's key. Back up layout/settings before considering any uninstall; uninstalling can remove data. The temporary keystore is not committed.
