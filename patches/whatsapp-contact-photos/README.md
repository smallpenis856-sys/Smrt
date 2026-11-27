# Contact photos in WhatsApp search — build 660293

Based on build 660292. Matching results display the photo already available from Android Contacts, with a small WhatsApp app icon. When there is no accessible contact photo, the existing WhatsApp icon remains. The launcher reads contact thumbnails locally after the user has granted the already-declared contacts permission. It does not read WhatsApp chats or obtain WhatsApp profile photos directly; Android contact photos can be different or absent, and a change made in WhatsApp will not necessarily sync to Contacts. No new permission, network request or persistent photo cache is added.

The worker requests `PHOTO_THUMBNAIL_URI`, retries the original contact projection if the optional photo column fails, restricts photo URIs to Android's contacts authority, bounds bitmap decoding and avoids decoding the same thumbnail twice in one query. Missing or inaccessible photos fall back to the prior icon. Existing cancellation and generation guards still suppress stale results. Phone resolution, click behavior, source ranking and the unrelated launcher UI remain unchanged.

## Rebuild

1. Decode `SmartLauncher-WhatsAppUI-660292.apk`. Compile the theme stubs under `stubs/` against Android 31 **only as a separate classpath**; do not package the stubs.
2. Compile `SLWaContactSearch.java`, `SLPhotoPolicy.java` and `../whatsapp-contacts/SLWaPhone.java` with the Android platform and the stub classpath, targeting Java 8. Convert the classes to dex via dx and disassemble to smali. Generated files are in `smali/`.
3. Copy `SLWa*.smali` and `SLPhotoPolicy.smali` to the decoded `smali_classes4/`, set versionCode 660293, build, align, and sign.
4. Decode the signed APK and run `python3 patches/whatsapp-contact-photos/check_build.py <decoded-660292> <decoded-660293>`. Run `SLPhotoPolicyTest` and the previous phone and search tests on a Java 8+ host. Repeat Android device tests before deployment.

The 660292 signing key was unavailable after the workspace reset, so a newly signed build was made with the user's approval. Its signer differs from 660292; backup and uninstall are required and launcher data can be lost. The new signing key and password were kept private locally; future availability across environment resets is not guaranteed. No emulator or Android device was available to verify photo-provider variations, rendering, WhatsApp behavior, accessibility or responsiveness. Host and decoded-APK structural checks passed; they do not prove device runtime behavior.
