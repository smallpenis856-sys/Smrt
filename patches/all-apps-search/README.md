# All Apps: copy the actual home search settings

Base: `SmartLauncher-BottomSearch.apk` (660274). Current output: `SmartLauncher-AllAppsSearch-NoFlash.apk` (660283; replaces the previous NoFlash download). Earlier outputs 660275–660282 remain for history, not for installing this change. The user confirmed the glass effect was correct after changing wallpaper.

## Live drawer backdrop (660283)

`SLLiveBackdrop` is inserted between the native glass capsule and the search/mic foreground. It renders only the tagged sibling `drawerCard`, not the drawer root or glass itself, into a reusable quarter-resolution crop with a padded blur margin. Window coordinates align scrolling icons to the search bar. A two-pass separable box blur (run twice) processes premultiplied-alpha pixels, then the softened icon image is composited inside the pill with a subtle rim. This adds real blur of app icons beneath the bar; it does not merely render wallpaper or blur the search text itself. Existing native wallpaper reflection/settings remain behind this layer. No screenshots are saved or transmitted and no permissions are added.

Pre-draw captures follow actual view-tree updates during scrolling; unchanged raw pixels do not invalidate the backdrop again. Capture/output bitmaps, pixel buffers and coordinate arrays are reused, resized on layout changes and released on detach. No unconditional timer or animation loop runs. CPU blur avoids a dependency on Android 12 RenderEffect and supports the existing API 24 minimum. It adds rendering work during scrolling; actual frame rate/battery behavior has not been measured on a device.

Limits: this is a live frosted-icon overlay plus the existing native wallpaper glass, not a replacement native per-icon liquid-refraction shader. Live blur strength is currently fixed (roughly a 6dp box radius), independent of the native home reflection slider. It is only added to the bottom All Apps bar; the active top search field retains its previous native background. Some OEM/hardware-only icon drawables cannot be drawn on a software Canvas. Illegal-state/argument capture failures log once, stop sampling for that attachment and leave the native glass visible rather than crash. Hardware-only effects inside drawer children may not be reproduced in software capture.

Java source and its generated smali are both included. APK rebuilding only needs copying `SLLiveBackdrop.smali`; do not edit that generated file by hand. To rebuild that class from Java: compile with Java 8 bytecode against an Android SDK jar, dex with dx/D8 (min API 24), then disassemble into the existing smali directory. No new runtime library is required.

Blur self-check used here (JDK and Android SDK jar paths adjusted to your installation):

```sh
javac -source 8 -target 8 -cp "$ANDROID_JAR" -d .cache/live-classes patches/all-apps-search/SLLiveBackdrop.java
javac -cp ".cache/live-classes:$ANDROID_JAR" -d .cache/live-tests patches/all-apps-search/BackdropBlurTest.java
java -cp ".cache/live-classes:.cache/live-tests:$ANDROID_JAR" ginlemon.flower.glass.BackdropBlurTest
```

Tests cover solid/transparent pixels, a softened icon impulse, premultiplied edge colors, tiny buffers and input rejection. Signed-APK round-trip checks cover sibling-only capture/layering, coordinate alignment calls, actual blur code, unchanged-frame comparison and lifecycle cleanup. A physical-device test is still needed: scroll a colorful icon behind the bottom pill and confirm it is visibly softened inside but sharp outside, then test rotation, repeated open/close, taps and Back.

## Wallpaper/theme foreground for icons (660282)

Both outlined search/mic pairs previously used `?colorHighEmphasis`, which resolves to the user's launcher accent (green in the reported screenshots). XML now supplies neutral `?android:textColorPrimary` as a fallback, and the existing glass wrapper refreshes the tagged icons from its native wallpaper/theme foreground (`renderer.j().b.b.a`, also used by the launcher's menu icon), not the accent. In the active editor its foreground icons are siblings of the decorative backdrop, so the wrapper looks up tags in that container. Native glass, edit behavior, voice actions and navigation are unchanged.

Tint refresh runs on pre-draw so wallpaper/theme palette changes need no APK reinstall or cached Activity theme reload. It only sets a tint when the color differs, preventing a self-invalidating draw loop. This follows the launcher's native readability palette; it is not a new per-pixel wallpaper sampler or a contrast guarantee for manually overridden native theme colors. Light/dark/custom wallpaper behavior still requires device verification.

## Active search bar matches All Apps (660281)

The typing/results screen now uses the same native glass widget as a decorative backdrop, the same 56dp capsule height, 22dp outlined magnifier, 18sp input text and 48dp outlined mic target as the All Apps bar. Its existing editable `searchEditText` stays on top and remains the same class/ID, with aligned ghost/autocomplete text and a transparent fill. The asynchronous search-theme callback is patched only for `SearchPanel.R` so it cannot repaint the original opaque background over the glass. Shared wrapper initialization now explicitly accepts its one-child decorative use without wiring drawer navigation or indexing nonexistent foreground children.

The mic uses the existing external voice-search listener; the localized hint is “Search”. Existing clear, loading, menu, results and keyboard/Back handlers are preserved. Clear is placed just before the mic. The menu remains outside the capsule, and the active field keeps its original top position/available width instead of moving while the keyboard is open. This is a shared-style match, not pixel-identical placement. Home's idle bar and the bottom All Apps bar are not restyled.

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

Limits: the last rendered home search bar supplies settings if several home bars exist. If there is no initialized home search bar, the default native bar is the fallback. The wallpaper renderer is reused; build 660283 adds a separate live app-icon blur overlay to the bottom drawer bar.

## Rebuild

With Java, Apktool 2.9.3 and apksigner available:

1. Decode the base APK with `apktool d SmartLauncher-BottomSearch.apk -o decoded`.
2. Copy `drawer.xml` and `drawer_bottom_search.xml` to `decoded/res/layout/` and both `SLDrawerSearchLayout.smali` and `SLLiveBackdrop.smali` to `decoded/smali/ginlemon/flower/glass/`.
3. Copy both `ic_drawer_*_outline.xml` files to `decoded/res/drawable/` and `SLDrawerVoiceClick.smali`, `SLDrawerSearchClick.smali` and `SLDrawerSearchReturn.smali` to `decoded/smali/ginlemon/flower/glass/`. In `decoded/smali/qv9.smali`, insert the block in `drawer-label-hook.txt` after its matching `iget-object v10` line (the first line of that text file is context, not a duplicate instruction).
4. In `decoded/smali/ginlemon/flower/widgets/searchbar/SearchBarWidget.smali`, insert the `invoke-static` from `home-render-hook.txt` immediately after `.locals 10` in method `u(FLp7b;Luec;)V`, exactly once. The text file includes the method header for context.
5. Copy `search_panel.xml` to `decoded/res/layout/` and apply `active-search-hooks.txt` (mic binding, transparent async fill, localized hint). Apply the three insertions in `search-return-hooks.txt` to `decoded/smali/ginlemon/flower/searchPanel/SearchPanel.smali` (instance field, close-search Back branch and panel-exit cleanup). Change `versionCode: 660274` to `versionCode: 660283` in `decoded/apktool.yml`.
6. Build with `apktool b decoded -o unsigned.apk`.
7. Run `python patches/all-apps-search/align_apk.py unsigned.apk aligned.apk`.
8. Sign `aligned.apk` using your own keystore, producing `SmartLauncher-AllAppsSearch-NoFlash.apk`.
9. Verify with `apksigner verify --verbose SmartLauncher-AllAppsSearch-NoFlash.apk` and `python patches/all-apps-search/align_apk.py SmartLauncher-AllAppsSearch-NoFlash.apk`.
10. Decode the signed result to `verified`, then run `python patches/all-apps-search/check_build.py decoded verified`.

## Checks and installation

Build, signed-APK decode, v2/v3 signature verification, 4-byte stored-entry alignment and 16KiB native-library alignment passed. Round-trip assertions check the render hook, drawer-tag exclusion, no tree discovery, conditional redraw, listener removal, version, outline icon layout, localized accessibility descriptions, voice handler error paths, drawer-only centered-label override, native widget/ViewModel integrity against build inputs and unchanged assets/native libraries.

No Android device/emulator is available here. These are structural/build checks, not proof the reported glass defect is fixed. On a device, first visit home, change the home search appearance/glass settings, then open All Apps. Confirm both bars respond to the same settings; also check reopening, rotation, wallpaper changes, search-row taps and mic launching/missing-handler feedback. Reference-style layout and touch behavior have not been visually tested on a device.

This APK uses the same local certificate as 660275–660282, so an update over those builds should be accepted. It is not signed with the original base APK's key. Back up layout/settings before considering any uninstall; uninstalling can remove data. The temporary keystore is not committed.
