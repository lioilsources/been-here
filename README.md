# Been Here

You arrive somewhere you've been before. Been Here shows you the photos you
took right there, grouped by visit — last year, five years ago, that one
weekend in 2019.

The moment that matters is the arrival, not the gallery. So the app can speak
up on its own: a geofence around the places you care about, and a notification
when you come back.

## Privacy

Everything happens on the device.

- No backend, no account, no third-party analytics.
- Photos and their GPS coordinates never leave the phone.
- The app doesn't copy your photos. It keeps an index (asset id + metadata);
  the system photo library stays the source of truth.
- Two things *can* leave the device, both off by default and both switchable
  in settings: a coordinate sent to the system geocoder to name a place, and
  map tiles fetched from OpenStreetMap while a map is open.

## Status

Early but usable: it indexes your library, shows what you photographed where
you're standing, and works out which places are everyday ones. See
`PHOTOMEMORIES_PLAN.md` for the plan and `docs/ARCHITECTURE.md` for how the
code is laid out. The device-only checks are tracked in `docs/QA.md`.

| Phase | What | State |
|---|---|---|
| 0 | Scaffold, schema, fakes, geo utils | done |
| 1 | Library indexing | done |
| 2 | The "Here" screen | done |
| 3 | Places, clustering, auto-mute | done |
| 4 | Geofence notifications | code done, needs a drive |
| 5 | Rephoto (then & now) | code done, needs a camera |
| 6 | Onboarding, settings, polish | done, TestFlight pending |

## Build

Requires Flutter stable (3.44+) and Xcode 26 for iOS.

```sh
make get      # resolve dependencies
make gen      # drift + localizations codegen
make check    # analyze + test + bench, what CI runs
make run-ios
```

Generated code (`*.g.dart`, `lib/l10n/generated/`) is committed so a fresh
clone builds without a codegen round. Re-run `make gen` after touching the
drift tables or the `.arb` files.

Targets iOS 15+ and Android 8+ (API 26). Bundle id `com.lioilsources.beenhere`.

## Releasing

Push a tag and both platforms build themselves:

```sh
git tag v0.1.0-alpha && git push origin v0.1.0-alpha
```

iOS goes to TestFlight, Android to Firebase App Distribution, and both attach
their artifacts to a GitHub release. The signing material lives in the private
`Distribution` repo; `docs/RELEASING.md` has the one-time setup and the local
build story.

## Licence

MIT — see [LICENSE](LICENSE). Take it, change it, ship it; keep the copyright
notice, and don't expect a warranty.

The dependencies carry their own permissive licences (MIT, BSD-3, Apache-2.0)
and a binary built from this repo has to keep their notices too. OpenStreetMap
map data is ODbL and its tile servers have a
[usage policy](https://operations.osmfoundation.org/policies/tiles/); neither
is affected by the licence on this code.
