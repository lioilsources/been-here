# Releasing

Two workflows, one trigger. Pushing a tag that starts with `v` builds and
publishes both platforms:

```sh
git tag v0.1.0-alpha && git push origin v0.1.0-alpha
```

| Workflow | Runner | Goes to |
|---|---|---|
| `.github/workflows/release-ios.yml` | `macos-26` | GitHub release (IPA + dSYMs), then TestFlight |
| `.github/workflows/release-android.yml` | `ubuntu-latest` | GitHub release (AAB + APK), then Firebase App Distribution, group `Alfa` |

Both come from the shared templates in the `Distribution` repo, which is the
source of truth for this flow. The deviations from the template are noted at
the bottom of this file.

The version number comes from the tag: `v1.2.3` becomes `1.2.3+<run number>`,
and pubspec's version is only a fallback for tags that aren't three numbers
(`v0.1.0-alpha` falls back, which is why the build in TestFlight will say
0.1.0). Nothing needs committing for a release — the workflow rewrites
pubspec in its own checkout.

The GitHub release is published **before** the upload to Apple. An altool
outage must not cost us a build that was already made, and TestFlight upload
is `continue-on-error` for the same reason: check the run, not the release.

## What has to exist first

Per app, once. None of it lives in this repo.

### 1. Apple Developer portal

- App ID for `com.lioilsources.beenhere` (already there — a local
  `flutter build ipa` signs against it).
- **App Store distribution provisioning profile** for that App ID.
  Download it and put it in the Distribution repo:
  `Distribution/Apple/BeenHere/<anything>.mobileprovision`

### 2. App Store Connect

- An app record for the bundle id, or the TestFlight upload has nothing to
  land in. My Apps → `+` → New App, platform iOS, SKU e.g. `beenhere`.
- The 1024×1024 icon is `assets/icon/icon.png` in this repo.

### 3. Firebase App Distribution (the Android testers' side)

- Add an **Android app** to a Firebase project with package name
  `com.lioilsources.beenhere`.
- No `google-services.json` is needed: the app itself uses no Firebase SDK,
  and App Distribution uploads are authenticated by the service account.
- Create the tester group **`Alfa`** — the workflow distributes to that group
  by name and fails if it doesn't exist.

```sh
gh secret set FIREBASE_ANDROID_APP_ID --repo lioilsources/been-here --body "1:…:android:…"
gh secret set FIREBASE_SERVICE_ACCOUNT_KEY --repo lioilsources/been-here < service-account.json
```

### 4. The rest of the secrets

```sh
export BW_SESSION=$(bw unlock --raw)
/Volumes/YOTTA/Dev/Distribution/scripts/setup-gh-secrets.sh \
  --repo lioilsources/been-here --app BeenHere
```

That reads the shared developer-account material from Bitwarden and the two
per-app files from the Distribution repo, generates an Android upload
keystore if there isn't one, and sets both naming variants of the App Store
Connect secrets.

**Commit the generated keystore** (`Distribution/Android/BeenHere/`) and
never delete it: Google Play ties the app to it forever.

## Local builds

The Release configuration is committed with manual signing and a
`CI_PROFILE_NAME` placeholder, because that is what the release workflow
replaces with the UUID of the profile it just installed. A plain
`flutter build ios --release` therefore looks for a profile by that literal
name and fails. Use:

```sh
make install-ios     # or: tool/install_ios.sh [device-udid]
```

It swaps the Release block to automatic development signing for the length of
the build, installs onto a connected iPhone, and restores the file — including
`ios/Podfile.lock` and the shared scheme, which a machine with
`enable-swift-package-manager` turned on rewrites on its way past.

## Deviations from the Distribution template

Both are documented in `Distribution/CLAUDE.md` as fixes that had not yet made
it back into the golden templates.

1. **The profile is injected by UUID, not by name.** Xcode 26 on `macos-26`
   does not find an installed profile by name. Two `sed` expressions, because
   the placeholder may or may not still carry its quotes by then — quoting an
   already-quoted value produces a pbxproj Xcode refuses to open.

2. **The team id is read out of the provisioning profile**, with the
   `IOS_TEAM_ID` secret only as a fallback. That secret has a history of being
   empty or stale, and the profile always knows which team it was issued to.

## Things that bit us on the way here

Both found by building locally before the first tag, which is the point of
doing it that way round.

- **`compileSdk` is pinned to 37.0.** `permission_handler_android` compiles
  against API 37 while Flutter's tooling defaults to 36. Android now ships
  minor SDK versions, so the platform on disk is `android-37.0`, and AGP needs
  `compileSdkMinor = 0` alongside `compileSdk = 37` to find it.
- **Core library desugaring is on.** `flutter_local_notifications` schedules
  with `java.time` and refuses to link without it.
