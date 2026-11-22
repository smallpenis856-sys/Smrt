# Lens icon patch

Smart Launcher draws that Lens button itself — `SLGoogleLens$LensIconDrawable`
paints the monochrome glyph white across the full 24dp box, which is why it
looks bigger than the magnifier next to it. No drawable resource was used.

Two changes per APK:

1. `res/drawable-anydpi/themed_icon_lens.xml` — dead 24dp vector replaced with
   the real coloured Google Lens logo (Google brand colours, content inset to
   ~19.5dp so it matches the neighbouring icons). `<path>` strokes, no tint.
2. `classes4.dex` — `SLGoogleLens.applyLensIcon(ImageView, int)` now does
   `setImageTintList(null)` + `setImageResource(0x7f08042a)` (that drawable's id)
   instead of building `LensIconDrawable`.

`resources.arsc`, the manifest and the other dex files are byte-identical to the
source APK, so no app behaviour changes besides the icon.

## Rebuild for another variant

```bash
java -jar apktool.jar d -f -o work <variant>.apk        # apktool 2.4.1
# paste lens-icon/themed_icon_lens.xml over work/res/drawable-anydpi/themed_icon_lens.xml
# patch work/smali_classes4/SLGoogleLens.smali applyLensIcon as above
java -jar apktool.jar b work -o work/classes-only.apk    # fails on resources, keeps work/build/apk/classes4.dex
# splice that classes4.dex + aapt2-compiled drawable into the original zip,
# drop the old META-INF signature files, then:
python3 lens-icon/signer.py unsigned.apk out.apk key.pem cert.pem
```

`signer.py` writes JAR v1 + APK Signature Scheme v2 itself (no Java, no
apksigner). Signing with a new key means the phone treats it as a different
signer: uninstall the old build first, which drops the launcher layout.
