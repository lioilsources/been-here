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

**The map is opt-in, not absent.** The plan left it out of the MVP; it is in,
behind a setting that is off by default. See "The map" below for why it isn't
simply on.

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

## Arrivals

The app never watches location itself. It hands the system a handful of
circles and the system wakes it when one is entered — that is the whole
mechanism, and it is why the feature costs no battery.

**iOS monitors twenty regions per app.** A library holds hundreds of places,
so the app keeps choosing which twenty are worth a slot and swaps them as the
user moves. `selectRegions` is a pure function for that reason: it decides
what the app is able to notice at all, has to behave identically on both
platforms, and cannot reasonably be tested by walking around.

Two predicates, deliberately different:

- `monitoringVeto` — is this place worth a slot? Muted, too few photos, too
  recent, still in its cooldown.
- `decideNotification` — should arriving here interrupt someone *now*? All of
  the above, plus the one-a-day cap.

The daily cap is missing from the first on purpose. It is a fact about this
moment, not about the place, and applying it to the selection would
unregister every region for a day after a single notification.

An arrival re-checks every rule rather than trusting the registration: a
place can be muted, or photographed again, between being registered and being
entered.

### The background isolate

The arrival callback runs in an isolate the system starts, with none of the
running app around it — no providers, no open database, no widget tree and so
no localisations. `lib/app/geofence_callback.dart` opens what it needs and
closes it again, and `ArrivalService` was split from `RegionSyncService` so
that the arrival path does not drag the geofence plugin in with it.

The callback must be top-level and marked `@pragma('vm:entry-point')`, and
iOS needs `setPluginRegistrantCallback` in the AppDelegate. Without either,
arrivals fail silently in release builds.

### Permissions

Background location is asked for only after memories have actually been shown
(`seen_memories`, written the first time the timeline renders a visit), and
always behind our own explanation. Declining is a first-class outcome: the
app keeps working and stops asking.

`permission_handler` appears here alongside geolocator because geolocator
cannot escalate to Always on iOS — its `requestPermission` returns
immediately once the status is anything but not-determined, so it can never
turn a while-in-use grant into an always grant. `native_geofence` points at
the same package for the same reason.

## The map

Places can be shown on an OpenStreetMap map, and the setting for it is off
until the user turns it on — for the same reason place names are, only more
so.

Every tile is a request to a tile server, and the sequence of requests is a
running account of where the user is looking, street by street. A place name
is one question asked once and then stored; a map keeps asking for as long as
it is open. In an app whose whole claim is that nothing leaves the device,
that deserves a switch and a sentence rather than a silent default.

`tile.openstreetmap.org` is used while this is a personal build. The [OSM
tile usage policy](https://operations.osmfoundation.org/policies/tiles/)
rules it out for a released app, so shipping the map means either a paid
tile provider or self-hosting — a decision that can wait until there is
something to ship.

## Rephoto

The new photo goes into the system photo library, not into a folder only this
app can read. It is a photo the user took; it belongs next to their other
photos, and it should survive the app being deleted. All the app keeps is a
row saying which old photo it answers.

It is saved with the *old* photo's coordinates rather than a fresh fix. The
phone is standing in the same place, so the two agree to within metres — but
going through the library means a fix, a permission and a wait, and getting
it slightly wrong would scatter the pair across two places at the next
clustering pass. The old photo's own coordinates are the ones that put the
rephoto exactly where its ancestor is.

`rephotos.place_id` is `ON DELETE SET NULL`. Clustering rebuilds places from
scratch, so the place a rephoto was taken at can disappear; the pair itself
must not go with it.

### Outlines

Two ways to see the old photo over the viewfinder: faded, or reduced to its
outlines. Outlines exist because a faded photo of a building that is no
longer there is worse than nothing — you end up matching a ghost instead of
what is in front of you. Sobel over a downscaled copy is enough to line up
edges of roofs and horizons, which is what the eye actually uses.

The pass is pure Dart on RGBA bytes (`core/image/edge_detect.dart`, no
Flutter) and runs through `compute()`. A megapixel of Sobel is not
frame-sized work, and doing it on the UI thread stalls the camera preview.

### The shared image

`composeThenAndNow` draws both photos onto a canvas rather than
screenshotting the comparison widget. A screenshot carries the phone's pixel
density, the theme, and whatever else was on screen, and is capped at the
screen's resolution. What people share is the pair of photographs, so the
pair of photographs is what gets drawn — both at the same height, whatever
shape they were framed in, so they read as a pair.

The share sheet is handed a file in the temporary directory rather than raw
bytes: that is what other apps expect, and the system clears it up.
