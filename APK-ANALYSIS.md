# APK Analysis — Smart Launcher-Pro v6.6 build 026 ("Mod")

File: `Smart Launcher-Pro-v6.6 build 026_build_660260-Mod (1).apk` (23.6 MB, 1456 entries)
Analyzed: 2026-11-17, read-only static analysis (androguard 4.1.4 + manual ZIP/PKCS#7 checks).

## Identity

| Field | Value |
|---|---|
| Package | `ginlemon.flowerfree` |
| Label | Smart Launcher |
| versionName / Code | 6.6 build 026 / 660260 |
| min / target SDK | 24 / 36 |
| Main activity | `ginlemon.flower.HomeScreen` |
| Dex files | 4 (20,490 classes) |

## Signing — the important part

- v1 + v2 + v3 signatures are all present and **internally consistent**: all 1453 non-META-INF
  entries match their `MANIFEST.MF` SHA-256 digests, and `SL.SF` matches `MANIFEST.MF`.
- The signing certificate is **not** the real Smart Launcher one:

```
subject = C=US, ST=NA, L=NA, O=Mod, OU=Mod, CN=Smart Launcher Mod
sha256  = 1C:71:F4:7E:10:D1:2B:77:63:83:D3:D9:C6:A3:56:23:D9:0F:65:76:10:64:35:CA:28:68:CD:80:CC:46:B1:A2
valid   = 2026-11-16 → 2054-04-03
```

Consequences:

1. It is a **resigned rebuild**, not the Play Store build. It will not install as an update over a
   Play Store copy, and Play Store updates will never apply to it.
2. Nobody can verify what was changed versus upstream. The code has been recompiled/packed by a
   third party whose identity is unknown (`CN=Smart Launcher Mod` only).
3. v1/v2/v3 signing means Android will accept it — it says nothing about the code being safe.

## What the modified code does

- All original Smart Launcher app code, Firebase/FCM, Play Billing and the paywall activities are
  still present. The paid features are most likely unlocked client-side (`hasPremiumAccess` /
  `ginlemon.action.hasPremiumAccessChanged` paths), which cannot be verified without running it.
- No `DexClassLoader` / `InMemoryDexClassLoader`, no `Runtime.exec`, no `ProcessBuilder`, no `su`
  lookups, no `smali`/`apktool`/MT-Manager strings. So: **no dropper, no root shell, no obvious
  second-stage payload**.
- `frida` appears once — inside an unrelated string table, not as a Frida check.
- LeakCanary classes ship in the release build (odd, but harmless).

## SDKs and permissions

- Third-party SDKs found: Play Billing, AdMob (`com.google.android.gms.ads`), Firebase
  (Analytics, Crashlytics, FCM), OkHttp, LeakCanary. No Facebook/AppLovin/Unity/IronSource.
- Network hosts in code are all legitimate Smart Launcher + weather + search + Firebase hosts
  (`smartlauncher.net`, `smartlauncher-static.ams3.cdn.digitaloceanspaces.com`, `api.unsplash.com`,
  `pro.openweathermap.org`, `firebase*.googleapis.com`, `pagead2.googlesyndication.com`, ...).
  There are **no unknown/new hosts** indicating an added exfiltration endpoint.
- Permissions are the ones a launcher of this type needs, plus the sensitive ones worth knowing
  about: `READ_CONTACTS`, `READ_CALENDAR`/`WRITE_CALENDAR`, `ACCESS_FINE_LOCATION`,
  `QUERY_ALL_PACKAGES`, `READ_MEDIA_*`, `WRITE_SETTINGS`, `CALL_PHONE`,
  `BIND_NOTIFICATION_LISTENER_SERVICE`, `FOREGROUND_SERVICE_MEDIA_PROJECTION`.

## Verdict

Structurally clean as far as static analysis can tell (no hidden payload, no new C2 hosts,
consistent signatures), but it is an **unauthorized modification of a paid app, signed by an
unknown party**. That is the real risk: the code runs as a home screen (sees every app you open,
your notifications via the listener service, and your contacts/calendar), and you cannot audit or
update it, and there is no one to hold responsible if a future build turns malicious.

Safe alternatives: the free/ad-supported Smart Launcher from Play Store, or an open-source launcher
(Neo Launcher, Kvaesitso, Lawnchair) which you can build and audit yourself.

## Reproducing

```bash
pip install androguard            # in a venv
python - <<'PY'
from androguard.core.apk import APK
a = APK("Smart Launcher-Pro-v6.6 build 026_build_660260-Mod (1).apk")
print(a.get_package(), a.get_androidversion_name(), a.get_permissions())
print([c.subject.rfc4514_string() for c in a.get_certificates()])
PY
openssl pkcs7 -inform DER -in META-INF/SL.RSA -print_certs -noout   # after unzip
```

Note: the sandbox could not download a JDK or apktool (GitHub release assets are outside the
network allowlist), so no decompile/repack was attempted — this is static analysis only.
