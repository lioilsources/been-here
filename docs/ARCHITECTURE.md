# Architecture

## Layers

```
lib/
  app/        router, theme, bootstrap, top-level providers
  core/       geo maths, result types, logger — no Flutter, no plugins
  data/
    db/       drift tables, DAOs, migrations
    photos/   PhotoLibrary abstraction + FakePhotoLibrary + fixtures
    location/ LocationService, GeofenceService (abstraction + fake)
  domain/
    indexing/ IndexerService: full scan, incremental sync
    places/   clustering, mute rules, visits
    memories/ "what do I have here", notification rules
  features/   one folder per screen
```

### Dependency rules

- `core/` depends on nothing but the Dart SDK and `package:meta`.
- `domain/` depends on `core/` and on the *abstractions* in `data/`. It never
  imports Flutter, and never imports a plugin.
- `data/` may use plugins, but never widgets and never `features/`.
- `features/` may use everything.

`test/architecture_test.dart` enforces all of this by reading the import lines.
It exists because the project can't depend on `package:test` directly —
`flutter_test` pins an incompatible `matcher` — so "runs under plain
`dart test`" is checked structurally instead of by the runner.

One deliberate inversion: `data/db/tables.dart` imports `MuteState` from
`domain/places/`. The enum is a domain concept that happens to be persisted;
keeping it in `domain/` is what lets the mute rules be tested without drift.

## Decisions that differ from the plan

**`MuteState` has four values, not three.** The plan lists
`'none' | 'auto' | 'user'`, but also requires that the auto rule never
overrides the user "not even an un-mute". One column with three values can't
tell "nobody decided" from "the user decided to keep this visible", so `user`
splits into `userMuted` and `userUnmuted`.

**Videos are not indexed.** Product decision. The `photos.is_video` column
still exists and is always false, so turning videos on later is a query
change rather than a migration plus a full reindex.

**Localization from phase 0.** The plan puts it in phase 6. Retrofitting
`.arb` extraction across six phases of finished UI is strictly more work than
starting with it, and a mixed-language UI is a known App Review rejection
reason.

**No map in the MVP.** Places is a list. `flutter_map` stays the intended
choice if a map is added later.

## Data model

See `lib/data/db/tables.dart`. Notes that aren't obvious from the schema:

- `photos.asset_id` is the primary key, so reindexing is idempotent by
  construction — a re-scan is an `INSERT OR REPLACE`, never a duplicate.
- Photos without GPS are indexed with null `lat`/`lng`. MVP queries skip them,
  but placing them by hand later needs no reindex.
- `photos.place_id` is `ON DELETE SET NULL`: recomputing clusters must never
  destroy the index of what was photographed.
- Timestamps are unix **seconds UTC** everywhere in the database. Local
  calendar days are computed at query time, because "which day was this" is a
  question about the viewer's timezone, not the row's.

## The "here" query

Bounding box over the `lat`/`lng` indexes, then an exact haversine pass in
Dart. A box near ±180° wraps, which SQL `BETWEEN` can't express, so
`BoundingBox.split()` returns the one or two boxes to actually query.

No R-tree: the plan's target is under 50 ms for 100k rows, and a two-index
range scan gets there.
