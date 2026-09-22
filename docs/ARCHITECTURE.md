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
something to ship. One definition of the tile layer, in
`features/common/osm_tiles.dart`, so the endpoint and the user agent cannot
drift apart between the two maps that use them.

The Here screen carries a small one under the radius slider: the circle on
it *is* the radius the slider just set, with a dot per photo inside it. It
does not pan — a map that scrolls inside a scrolling list fights it for
every drag — and a tap opens one that does.

The dots come from a query that returns two doubles per photo and nothing
else, capped at two thousand. A dense neighbourhood holds far more than a
map can usefully show, and past a few thousand the dots stop being
information and become a stain.

The full-screen map pans, and panning it moves the whole screen: let go and
the circle, the dots and the timeline behind all follow the middle of
wherever the map ended up. Dragging a map is a way of asking "and what about
over there?", so the app answers. It waits for the pan to settle — a flick
and its glide are one move, not forty — and the map remembers the centre it
asked for, so the answer coming back does not shove the camera out from
under the finger that put it there. The radius slider is on that screen too:
the circle drawn there is exactly what it sets.

Where the screen is looking is one object rather than a coordinate and a
pile of flags, because *why* it is looking there decides what the screen
says: a place has a name and a way back, a dragged map has a way back, and a
debug coordinate goes on saying it is a debug coordinate.

With maps switched off the card becomes a single button that hands one
coordinate to the phone's own maps app. That is a different thing from
drawing tiles here: one jump the user asked for, to an app they already
trust with their location, instead of a stream of requests that follows them
around as they pan.

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

## The intro

Three screens, once: what the app does, what it does not do with your
photos, and then the photo permission. The order is deliberate — the system
dialog is the last thing that happens, after the reason for it has been on
screen twice.

Location is not in the intro. It is asked for on the Here screen, in front
of the empty space it is about to fill; a permission makes sense next to the
thing that wants it, not in a row of introductions. Skipping the intro is
allowed and asks for nothing: the Here screen explains itself anyway, and a
second pass through three screens would not change anyone's answer.

The flag lives in `preferences` like every other setting, which is why
"Show the intro again" in Settings is one write and nothing else.

## Wording of an arrival

The plan asked for "Před 6 lety jsi tu byl. 14 fotek." — a sentence with a
past-tense verb. Czech inflects that verb for gender (*byl* / *byla*), and
the app has no idea who is holding the phone, so half of its users would be
addressed wrongly. The sentence is built without the verb instead:

    Naposledy tady před 6 lety. 14 fotek.
    You were last here 6 years ago. 14 photos.

Same information, same shape, no assumption. The title had the same problem
("Tady jsi už byl") and became "Tohle místo znáš".

## Accessibility

The grid tiles carry the label, not the pictures inside them. A screen
reader should find one thing per photo and it should be the thing that can
be opened — so `PhotoThumbnail` excludes itself from semantics unless it is
given a label, and the tap target says "Photo 3 of 12, 4 July 2019".

The radius slider holds a logarithm between zero and one. Left alone, that
is what VoiceOver reads out. `semanticFormatterCallback` turns it back into
metres, and `MergeSemantics` puts the name and the value on one node — two
nodes and a screen reader announces only one of them.

## The icon

Drawn by `tool/make_icon.py` rather than committed as an opaque PNG, so the
shapes stay arguable: a cream place marker whose head is a clock face. A pin
says *here*, a clock says *then*, and the app is those two words. The script
writes three files — the launcher icon, the splash mark, and a smaller
foreground for Android's adaptive-icon safe zone, which crops a circle
through anything drawn edge to edge.

## Naming places, one at a time

Every name costs one coordinate sent to Apple's or Google's geocoder, so
names are asked for lazily — only for a place actually on screen — and
stored, so each place costs exactly one lookup ever.

The requests go through a queue: one in flight, a quarter of a second
between them. Both platform geocoders ration an app that asks in bursts, and
a list of forty places scrolled quickly *is* a burst. The requests that lose
come back empty, which used to leave those places unnamed for the rest of
the session — the queue turns "some of them, unpredictably" into "all of
them, shortly".

For that to work the geocoder has to distinguish two answers that both used
to be null: `GeocodeNothing` (there is genuinely nothing there to name — a
field, the sea) and `GeocodeUnavailable` (offline or rationed). Nothing is
final and is not asked again. Unavailable gets one retry, and if that fails
too, nothing is stored — so the next time the place scrolls past, it is
asked about again.

## Why the screens stopped flickering

Two habits, both of which look fine in a test and terrible on a phone with a
real library.

The indexer reports progress once per page of the photo library — a hundred
times over for a big one — and everything derived from the index followed
every one of those: the timeline, the map dots, the places, the counts. Four
real queries per page. They follow `indexGeneration` now, which changes once
per few hundred indexed photos and once more when a pass ends. The progress
bar still follows the raw stream, so it stays live while the queries behind
it settle.

And `AsyncValue.when` shows its loading branch when a *dependency* changed,
not just on a first load — so every one of those reloads blanked the places
list to a spinner and put the Here screen back to a progress indicator.
`skipLoadingOnReload: true` keeps what is already on screen until the new
answer arrives, which is both calmer and more honest: the photos shown are
still the right photos.
