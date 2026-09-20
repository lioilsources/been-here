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

## Indexing

One algorithm covers the first full scan, every later sync, and deletion
detection. `IndexerService` walks the library oldest-first, inserts what the
index doesn't have, records every id it saw, and finally drops indexed rows
the library stopped reporting.

- **Idempotent** because `asset_id` is the primary key and known ids are
  skipped outright — a second pass inserts nothing.
- **Resumable** because the offset is persisted after every batch and the
  seen-ids live in the `scan_seen` table, not in a Dart `Set`. An interrupted
  pass continues; it doesn't start over. A pass only resumes if the library is
  still the same size, otherwise the offsets are meaningless and it restarts.
- **Cheap where it counts.** On Android 10+ the media store returns no
  coordinates at all, so the only source is EXIF — a file read per asset.
  `PhotoLibrary.resolveLocation` is that read, and the indexer calls it only
  for assets it is actually inserting. Re-syncing a 50k library costs zero
  EXIF reads.

Ordering is oldest-first on purpose: new photos then land at the end and leave
earlier offsets untouched. If the library *shrinks* mid-pass the offsets do
shift and a few assets can be skipped — they get dropped and re-added by the
next pass, which is why the next pass is cheap.

Photos edited in the system library are not re-read. Insertion is
`INSERT OR IGNORE`, never `OR REPLACE`, because an existing row may already
carry a `place_id` from clustering and re-indexing must not throw that away.
Out of MVP scope, as the plan has it.

## The "here" query

Two stages, because measurement said so. The shape the plan describes —
bounding box over the indexes, then haversine in Dart — was 122 ms for a
dense neighbourhood on 100k rows, against a 50 ms target. Profiling put
almost none of that in SQLite (a count took 10 ms) and almost all of it in
carrying 21,000 rows across into Dart.

So:

**The circle is cut inside SQLite, exactly.** Every located photo also
stores its position on the unit sphere (`x`, `y`, `z`). Comparing squared
chord length is equivalent to comparing great-circle distance, so
`(x-cx)² + (y-cy)² + (z-cz)² <= chord²` is not an approximation — a test
over random points confirms it accepts exactly what haversine accepts. It
needs no trigonometry, so it does not depend on SQLite being compiled with
the optional math functions. The `(lat, lng)` index still does the coarse
narrowing; the chord test then cuts the exact circle on what survives.

**Only what the screen needs crosses the channel.** The timeline is built
from capture times alone — one integer per photo — and a visit's photos are
fetched when that visit is on screen. Measured on 100k rows with ~16.5k
matches: counting 10 ms, timestamps 19 ms, whole rows with asset ids 60 ms.
That is also why the radius slider can recount on every step.

The hot query is hand-written SQL rather than drift's query builder. Building
typed result objects for tens of thousands of rows cost more than the query
(66 ms against 19 ms), and this is the one place in the app where that
matters.

A box near ±180° wraps, which SQL `BETWEEN` can't express, so
`BoundingBox.split()` returns the one or two boxes to actually query. No
R-tree: the above gets there without one.

## Visits

Grouping is by *local calendar day*, and the timezone rule lives in
`core/time/local_day.dart` rather than in a scattered `toLocal()`. A photo
taken at 00:30 in Prague belongs to that Prague day, not to the UTC day
before it. Day numbers come from a civil-date algorithm rather than dividing
an epoch timestamp by 86400: across a daylight-saving change local midnights
are 23 or 25 hours apart, and the division skips or repeats a day.

## Places

A place is a connected group of occupied geohash-7 cells. Clustering is a
pure function over per-cell summaries — count, first and last time, summed
unit vectors, and which local days have photos — so a hundred thousand photos
become a few thousand rows before any Dart runs.

That is also why there is no incremental recompute, which the plan left room
for: rebuilding every place costs cells, not photos, and a full rebuild can't
drift out of step with the index the way an incremental one can.

The centre is the normalised sum of the photos' unit vectors, which is the
only averaging that survives the antimeridian. The radius is measured to the
cells' corners and clamped to 100–500 m: a single photo would otherwise be a
place of radius zero.

**What a recompute must never lose is the user's decision.** New clusters are
matched to existing places by how many cells they share (`place_cells`), and
a matched place keeps its id, its mute state and when it last notified. That
table also assigns every photo to its place in one SQL statement.

Distinct days are counted inside SQLite with a fixed UTC offset rather than
through the calendar-correct `LocalDay`. A photo within an hour of midnight
in the other half of the year lands in the wrong bucket — which cannot move a
thirty-day threshold, and is what keeps the count out of Dart.

## Place names

The only thing in the app that can put data on the network. Naming a place
means handing its coordinates to the system geocoder, which is Apple's or
Google's, so:

- it is off by default;
- names are asked for lazily, only for places actually on screen;
- an answer is stored on the place, so it is asked once;
- turning the setting off forgets every stored name, rather than merely
  stopping new requests.

`GeocodingService` is an interface with a fake, and the tests assert on *what
was asked*, not just on what came back — the meaningful thing to check is
that no coordinate leaves when the setting is off.

A name the user types lives in a different column (`places.user_label`),
wins over the geocoded one, and survives both a recompute and the geocoding
switch going off. Forgetting a service's answers should not forget something
you wrote yourself.

A place row leads with *when you were last there*, not with its name. Most
places have no name, and a list whose every headline reads "Unnamed place"
puts a placeholder where the information should be. A name, when there is
one, replaces that headline.
