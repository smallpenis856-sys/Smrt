# All Apps: copy the actual home search settings

Base: `SmartLauncher-BottomSearch.apk` (660274). Current output: `SmartLauncher-AllAppsSearch-NoFlash.apk` (660287; replaces the previous NoFlash download). Earlier outputs 660275–660286 remain for history, not for installing this change. The user confirmed the glass effect was correct after changing wallpaper.

## Keyboard-docked search and smoother panel motion (660287)

The active native search editor is constrained to the bottom of its search container; the original results list is now constrained above it. Existing glass backdrop, ghost text, clear/menu/mic controls and keyboard-first Back behavior remain bound to the same editor. `SLKeyboardDock` enables resize only while the SearchPanel is active, restores the previous soft-input mode on exit/detach, and uses visible bounds plus API 30 IME/navigation insets to add only any remaining occluded area as bottom padding. Already-resized containers are not inset twice. When the IME is hidden, the editor remains at the bottom of the panel. The existing top system inset remains intact. All entry points to the shared search panel use this placement.

The shared `f58` panel animator now uses monotonic deceleration rather than its old bounce interpolators, and gesture settle directions use the same base duration while retaining the user's existing animation-speed scale. This affects other workspace panel transitions too; it does not alter the Android/app-launch activity animation, which was left unchanged to avoid overriding system behavior.

Host arithmetic tests cover overlay and resized keyboard, navigation inset, panning, landscape, zero size and overflow. Structural signed-APK checks verify constraints, event lifecycle, restoration, IME inset calls, motion hooks and prior features. Device testing is still required for actual keyboard animation/insets across Android versions, gesture navigation, rotation and Back; no visual/latency guarantee is claimed.

## Skip the entire default-home startup step (660286)

The startup queue constructor in `lg7.smali` no longer constructs or includes the `mqa.SET_AS_DEFAULT` entry at all. Its list contains only the original four other entries in their existing order (crash info, privacy update, update suggestion and what's new). This removes the step rather than only returning false from its eligibility check. Apply `remove-startup-default-step.patch` after the previous patches. The 660285 predicate guard is retained as defense; manual default-home UI and Android's chooser are unchanged.

Signed-APK assertions check the default-home enum is absent from this queue, only four entries are constructed and all unrelated prompt types remain present. No on-device startup test was available.

## No automatic “Welcome home / Set as default” prompt (660285)

The supplied screenshot identifies the launcher's own default-home prompt, not Android's Home-app chooser. The startup prompt queue (`oqa`) filters prompt types through the predicate in `n90`. Enum `mqa.SET_AS_DEFAULT` is ordinal 0. Only that branch now always returns false, irrespective of whether an older installation saved `setSlAsDefaultPopup=true`. Other startup prompt types (updates, what's new, crash info, privacy policy) keep their existing conditions.

Apply `no-startup-default-prompt.patch` to the decoded APK. This does not change the default launcher, impersonate Android's Home role, reset preferences, remove the HOME intent filter or disable the manual default-home settings UI. Users can still select the launcher in Android settings. Automated signed-APK checks evaluate all four default-status/popup-preference combinations and verify the manual default UI and preferences are unchanged. Fresh-start behavior still needs physical-device testing.

## No first-run category suggestion (660284)

The screenshot's “Smart Launcher can neatly organize your apps into categories...” card comes from the `SuggestCategories` enum emitted by the drawer message flow in `jj3.smali`. The single instruction emitting that suggestion now emits `null` (no message). This suppresses the card on fresh installs and upgrades even when an older stored preference still requests it. Other message cases, including category confirmation and recently hidden apps, are unchanged. No app preferences or user data are reset; manual category configuration is untouched.

Apply `no-category-suggestion.patch` inside the decoded APK directory before building. Validation checks the rebuilt flow no longer emits `SuggestCategories`, still contains category confirmation, and matches the intended patched input. No fresh-install emulator/device test was available.

This build starts from the restored 660282 APK, not the reverted 660283 live-backdrop build. The rejected live-backdrop feature remains absent. The version is raised to 660284 to allow updates over either previously installed build.

## Wallpaper/theme foreground for icons (660282)

Both outlined search/mic pairs previously used `?colorHighEmphasis`, which resolves to the user's launcher accent (green in the reported screenshots). XML now supplies neutral `?android:textColorPrimary` as a fallback, and the existing glass wrapper refreshes the tagged icons from its native wallpaper/theme foreground (`renderer.j().b.b.a`, also used by the launcher's menu icon), not the accent. In the active editor its foreground icons are siblings of the decorative backdrop, so the wrapper looks up tags in that container. Native glass, edit behavior, voice actions and navigation are unchanged.

Tint refresh runs on pre-draw so wallpaper/theme palette changes need no APK reinstall or cached Activity theme reload. It only sets a tint when the color differs, preventing a self-invalidating draw loop. This follows the launcher's native readability palette; it is not a new per-pixel wallpaper sampler or a contrast guarantee for manually overridden native theme colors. Light/dark/custom wallpaper behavior still requires device verification.

## Active search bar matches All Apps (660281)

The typing/results screen now uses the same native glass widget as a decorative backdrop, the same 56dp capsule height, 22dp outlined magnifier, 18sp input text and 48dp outlined mic target as the All Apps bar. Its existing editable `searchEditText` stays on top and remains the same class/ID, with aligned ghost/autocomplete text and a transparent fill. The asynchronous search-theme callback is patched only for `SearchPanel.R` so it cannot repaint the original opaque background over the glass. Shared wrapper initialization now explicitly accepts its one-child decorative use without wiring drawer navigation or indexing nonexistent foreground children.

The mic uses the existing external voice-search listener; the localized hint is “Search”. Existing clear, loading, menu, results and keyboard/Back handlers are preserved. Clear is placed just before the mic. The menu remains outside the capsule, and in build 660281 the active field kept its original top position (superseded by 660287). This is a shared-style match, not pixel-identical placement. Home's idle bar and the bottom All Apps bar are not restyled.

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
5. Apply `no-category-suggestion.patch` and `no-startup-default-prompt.patch` inside the decoded directory, then apply `remove-startup-default-step.patch`. Copy `search_panel.xml` to `decoded/res/layout/` and apply `active-search-hooks.txt` (mic binding, transparent async fill, localized hint). Apply the three insertions in `search-return-hooks.txt` to `decoded/smali/ginlemon/flower/searchPanel/SearchPanel.smali` (instance field, close-search Back branch and panel-exit cleanup). Apply `keyboard-dock-hooks.patch` and `smooth-panel-motion.patch`, and copy `SLKeyboardDock.smali` and `SLKeyboardDock$Api30.smali` to `decoded/smali/ginlemon/flower/glass/`. Change `versionCode: 660274` to `versionCode: 660287` in `decoded/apktool.yml`.
6. Build with `apktool b decoded -o unsigned.apk`.
7. Run `python patches/all-apps-search/align_apk.py unsigned.apk aligned.apk`.
8. Sign `aligned.apk` using your own keystore, producing `SmartLauncher-AllAppsSearch-NoFlash.apk`.
9. Verify with `apksigner verify --verbose SmartLauncher-AllAppsSearch-NoFlash.apk` and `python patches/all-apps-search/align_apk.py SmartLauncher-AllAppsSearch-NoFlash.apk`.
10. Decode the signed result to `verified`, then run `python patches/all-apps-search/check_build.py decoded verified`.

## Checks and installation

Build, signed-APK decode, v2/v3 signature verification, 4-byte stored-entry alignment and 16KiB native-library alignment passed. Round-trip assertions check the render hook, drawer-tag exclusion, no tree discovery, conditional redraw, listener removal, version, outline icon layout, localized accessibility descriptions, voice handler error paths, drawer-only centered-label override, native widget/ViewModel integrity against build inputs and unchanged assets/native libraries.

No Android device/emulator is available here. These are structural/build checks, not proof the reported glass defect is fixed. On a device, first visit home, change the home search appearance/glass settings, then open All Apps. Confirm both bars respond to the same settings; also check reopening, rotation, wallpaper changes, search-row taps and mic launching/missing-handler feedback. Reference-style layout and touch behavior have not been visually tested on a device.

This APK uses the same local certificate as 660275–660286, so an update over those builds should be accepted. It is not signed with the original base APK's key. Back up layout/settings before considering any uninstall; uninstalling can remove data. The temporary keystore is not committed.
