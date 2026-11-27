# Smart Search fallback matcher — build 660291

This is a narrow, local-only improvement based on 660290, not the entire Smart Search roadmap. It leaves the original native scorer in place and calls this fallback only if that scorer returns a nonpositive result. It adds accent-folded Latin name matching, unordered multiword-prefix matching, and one-edit matching for longer alphabetic names. It never writes search history, makes network requests, reads new sources, adds permissions, or modifies UI components. It does not implement a semantic model, personalization, privacy controls, summaries, new index, predictive engine or automatic filters.

The native matcher is shared by several search providers. Its obfuscated callers have been inspected but not exercised on a device. The fallback scores are deliberately low compared with native literal matches; interactions with all native ranking and highlighting paths remain to be validated. Bounded strings and token counts limit added work, but device latency, battery, accessibility, localization, actual result quality and APK runtime have not been measured. More results can appear for a given query. There is no claim that all bugs or performance problems are fixed.

## Rebuild and verification

1. Decode `SmartLauncher-WhatsAppContacts.apk` build 660290 with Apktool 2.9.3.
2. In the decoded directory, apply `native-matcher.patch`, copy `SLSearchFallback.smali` to `smali_classes4/`, and change `versionCode` in `apktool.yml` from 660290 to 660291.
3. Build and align; sign using the same key as build 660290 to update in place. A different certificate requires uninstalling the previous app and may erase launcher data.
4. Decode the signed build and run `python3 patches/smart-search/check_build.py <decoded-660290> <decoded-new>` plus the existing all-apps and WhatsApp checks, adjusted for version 660291.
5. Run the host tests with `javac -encoding UTF-8 --release 8 -d <tempdir> SLSearchFallback.java SLSearchFallbackTest.java`, followed by `java -cp <tempdir> SLSearchFallbackTest`. The Android smali is generated from the Java class using Android 31, Java 8 bytecode, dx and baksmali, as in the WhatsApp build.

The released 660291 APK was rebuilt, aligned, signed and decoded for structural checks. Its signer differs from 660290: the user approved a new key after the 660290 keystore password could not be recovered. Installing it requires uninstalling the existing launcher; back up and verify launcher data first. The new keystore and its password are stored locally in the ignored `.signing-local` directory and must never be published. The tests do not replace device validation.
