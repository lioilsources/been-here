# Manual QA checklist

Automated tests cover the logic. This file covers what only a real device can
tell us. Run the section for a phase before calling that phase done, and note
the device and OS version you used.

## Phase 0 — scaffold

- [ ] `make check` passes from a clean clone (`flutter pub get` only, no
      codegen step needed).
- [ ] App launches on the iOS simulator and shows the Here screen's
      not-indexed empty state.
- [ ] Switching the simulator to Czech (Settings → General → Language) shows
      Czech strings, not English fallbacks.
- [ ] Dark mode renders with readable contrast.

_Tested on: iPhone 17 Pro simulator, iOS 26._

## Phase 1 — indexing

- [ ] First launch asks for photo access with a text that explains why.
- [ ] Full scan of a real library shows visible progress and doesn't freeze
      the UI while it runs.
- [ ] Scan survives backgrounding the app and resumes where it stopped.
- [ ] Running the scan twice does not duplicate anything (check the count in
      settings).
- [ ] Deleting a photo in Photos.app removes it from the index after the next
      sync.
- [ ] iOS "Selected Photos": the app works with the limited set and explains
      what it can't see.
- [ ] Android: photos keep their GPS (`ACCESS_MEDIA_LOCATION` granted). Verify
      against a photo you know has coordinates.
- [ ] Settings shows the "X % of photos have a location" statistic and it is
      plausible.

## Phase 2 — Here

- [ ] Real photos from the current location appear, grouped into the right
      visits.
- [ ] The radius slider stays smooth on a 50k index.
- [ ] Visit labels ("6 years ago") match the actual dates.
- [ ] Empty state offers a wider radius and names the nearest place with
      memories, with a believable distance.
- [ ] Photo detail loads full resolution, including for an iCloud-offloaded
      photo (watch the loading state, then check it appears).
- [ ] Debug location override reaches a place you know has photos.

## Phase 3 — Places and mute

- [ ] Home and workplace end up auto-muted without being told.
- [ ] Trip destinations are not muted.
- [ ] Manual mute and unmute stick across a reindex.
- [ ] Place names appear only after geocoding is enabled, and the privacy
      note explains where the coordinate goes.

## Phase 4 — Geofence notifications

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
