# Manual QA checklist

Automated tests cover the logic. This file covers what only a real device can
tell us. Run the section for a phase before calling that phase done, and note
the device and OS version you used.

## Phase 0 — scaffold

- [x] `make check` passes from a clean clone (`flutter pub get` only, no
      codegen step needed).
- [x] App launches on the iOS simulator and shows the Here screen's
      not-indexed empty state.
- [x] Czech locale shows Czech strings, not English fallbacks.
- [x] Dark mode renders with readable contrast.

_Tested 2026-09-20 on: iPhone 17 Pro simulator, iOS 26, Flutter 3.44.4._

## Phase 1 — indexing

There is an on-device test for the part only a real library can prove:

```sh
make integration DEVICE=<device id>
```

It taps through the permission prompt, waits for the pass to finish and
asserts that photos were indexed and that at least some kept their
coordinates. Grant photo access before running it, otherwise the system
dialog blocks the test harness:

```sh
xcrun simctl privacy <device> grant photos com.lioilsources.beenhere
```

Verified on the iPhone 17 Pro simulator (iOS 26), seeded with six generated
JPEGs (five with GPS EXIF, one without) plus the stock sample photos:

- [x] The app shows its own explanation first; the system dialog appears only
      after the user asks for it. (Regression: `currentPermission()` must use
      PhotoKit's non-prompting status call.)
- [x] The permission prompt carries the Info.plist text, and it reads like a
      reason rather than a demand.
- [x] A pass over the real library indexes it — 12 photos, 83 % of them with
      a location, matching the seeded files.
- [x] Photos without GPS are indexed too, with no coordinates.

Confirmed 2026-09-20 on an iPhone 12 mini (iOS 26.6.2) against a real
library, release build:

- [x] Full scan of a large library shows visible progress and doesn't freeze
      the UI while it runs.
- [x] The "X % of photos have a location" statistic is plausible.

Still unchecked — these need deliberate steps, not just using the app:
- [ ] Scan survives backgrounding the app and resumes where it stopped.
- [ ] Running the scan twice does not duplicate anything. (Covered by unit
      tests against the fake; unverified on PhotoKit.)
- [ ] Deleting a photo in Photos.app removes it from the index after the next
      sync.
- [ ] iOS "Selected Photos": the app works with the limited set and explains
      what it can't see.
- [ ] Android: photos keep their GPS (`ACCESS_MEDIA_LOCATION` granted). Verify
      against a photo you know has coordinates. Nothing Android has been run
      on hardware yet.


## Phase 2 — Here

Covered by widget tests against the fake library and location service:
permission states, the visit timeline and its ages, the radius excluding and
including photos, the empty state with the distance to the nearest memory,
the debug location override, Czech, and dark mode. The near query is
benchmarked on 100k photos (timeline under 50 ms, slider count under 25 ms).

The simulator cannot finish this one: `simctl privacy grant photos` does not
satisfy PhotoKit's `authorizationStatusForAccessLevel:` on iOS 26, and the
system dialog cannot be tapped from a script.

Confirmed 2026-09-20 on an iPhone 12 mini (iOS 26.6.2), release build:

- [x] Real photos from the current location appear, grouped into the right
      visits.
- [x] The radius slider stays smooth on a large index.
- [x] Visit labels ("6 years ago") match the actual dates.

Still unchecked:
- [ ] Empty state offers a wider radius and names the distance to the nearest
      memory, and tapping the suggestion actually reveals it.
- [ ] Photo detail loads full resolution, including for an iCloud-offloaded
      photo (watch the loading state, then check it appears).
- [ ] Swiping inside a visit reaches the photos the grid folded into "+N".
- [ ] Debug location override (long-press the "Here" title) reaches a place
      you know has photos.
- [ ] Pull to refresh picks up a new photo taken a minute ago.

## Phase 3 — Places and mute

Covered by tests: clustering (adjacency, centroids across the antimeridian,
radius clamps), the auto-mute rule, and the whole pipeline against the 50k
fixture — home and work come out auto-muted, the forty trip places do not,
and exactly two places are muted. Plus the screen itself: the muted section,
mute/unmute, sorting, and that no coordinate reaches the geocoder until the
user turns naming on.

Confirmed 2026-09-20 on an iPhone 12 mini (iOS 26.6.2), release build:

- [x] Home and workplace end up auto-muted without being told.
- [x] Trip destinations are not muted.
- [x] The places list looks like places you recognise, not like noise.

Still unchecked:
- [ ] Manual mute and unmute stick across a reindex.
- [ ] Moving the auto-mute threshold in settings changes which places are
      muted, without undoing anything you decided by hand.
- [ ] Place names appear only after the setting is on, read correctly, and
      turning the setting off removes them again.
- [ ] A name you type sticks, survives a reindex, and is not removed when
      geocoding is switched off.
- [ ] Tapping a place opens the Here screen at it, with its photos in view.
- [ ] Visit counts look right: a week away reads as one visit, not seven.
- [ ] Sorting, in both directions, puts the places where you expect them.
- [ ] With the map setting on, pins land where the places are and tapping one
      opens it. With it off, no tile request is made at all.

## Phase 4 — Geofence notifications

Covered by tests: the notification rules and the region selection as pure
functions, the arrival path against fakes (muted places, cooldowns, the daily
cap, a place muted after it was registered), and the screen — the offer only
appearing once memories have been shown, the explanation coming before the
system dialog, a refusal leaving the app working, and a notification tap
pointing the Here screen at the right place.

None of that exercises CoreLocation. These need a phone, and the last one
needs a simulated drive:

- [ ] The always-location prompt appears only after memories have been shown
      once, behind our own explanation screen.
- [ ] Declining always-location leaves the app fully usable and doesn't nag.
- [ ] A simulated GPX arrival at an unmuted place fires a notification.
- [ ] A simulated arrival at a muted place fires nothing.
- [ ] Second arrival the same day fires nothing (daily cap).
- [ ] Returning to the same place inside 30 days fires nothing (cooldown).
- [ ] Tapping the notification opens Here for that place, from cold start and
      from background.
- [ ] With more than 20 candidate places, the nearest ones are the registered
      ones, and re-registration happens after a significant location change.

## Phase 5 — Rephoto

- [ ] Overlay aligns with the old photo; opacity slider and edge mode both
      work.
- [ ] Aspect ratio is locked to the original.
- [ ] The new photo lands in the system library.
- [ ] Then & now export shares a correct side-by-side image.

## Phase 6 — Polish

- [ ] Onboarding reads correctly in both languages.
- [ ] Every settings threshold takes effect without a restart.
- [ ] VoiceOver reaches every interactive element on Here and Places.
- [ ] Icon and splash look right on device.
- [ ] TestFlight build installs and launches on a clean device.
