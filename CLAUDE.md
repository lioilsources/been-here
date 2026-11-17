# Been Here

<!-- Max 80 řádků. Co se nevejde, jde do docs/ a sem jeden odkaz. Veřejné repo: žádné LAN IP, domovské cesty, ID. -->

## Účel
Flutter app (iOS, Android): when you arrive somewhere you've been before, it shows the photos you took right there, grouped by visit. Everything runs on the device — no backend, no account.

## Build a test
```
make get      # flutter pub get
make gen      # drift + localizations codegen (generated code is committed)
make check    # analyze + test + bench — what CI runs, gate before push
make format   # dart format lib test
make integration DEVICE=<id>   # on-device test against the real photo library
```

## Mapa
- `lib/app/` router, theme, bootstrap, top-level providers
- `lib/core/` geo maths, result types, logger (Dart SDK only)
- `lib/data/` drift DB, photo library, location/geofence (abstractions + fakes)
- `lib/domain/` indexing, places, memories (no Flutter, no plugins)
- `lib/features/` one folder per screen
- `test/architecture_test.dart` enforces the layer rules
- `.github/workflows/` CI and tag-driven releases (TestFlight, Firebase App Distribution)

## Invarianty
- Layer dependency rules in `docs/ARCHITECTURE.md`; the architecture test fails on violations.
- Photos and their GPS never leave the device; network features (geocoder, OSM tiles) stay off by default.
- Re-run `make gen` after touching drift tables or `.arb` files and commit the output.

## Kam dál
`README.md`, `docs/ARCHITECTURE.md`, `docs/RELEASING.md`, `docs/QA.md`, `PHOTOMEMORIES_PLAN.md`
