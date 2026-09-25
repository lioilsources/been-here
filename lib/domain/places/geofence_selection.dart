import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:been_here/domain/memories/notification_rules.dart';

/// How many regions each platform will monitor for one app.
///
/// iOS's twenty is the constraint the whole design bends around: a library
/// can easily hold hundreds of places, so the app has to keep choosing which
/// twenty are worth watching and swap them as the user moves.
const int iosRegionLimit = 20;
const int androidRegionLimit = 100;

/// The regions to ask the system to monitor, nearest first.
///
/// A pure function on purpose. It is the piece that decides what the app can
/// notice at all, it has to behave the same on both platforms, and it is not
/// something anyone can reasonably test by walking around.
List<NotifiablePlace> selectRegions({
  required List<NotifiablePlace> places,
  required GeoPoint from,
  required DateTime now,
  required int limit,
  NotificationRules rules = const NotificationRules(),
  GeoPoint? home,
}) {
  if (limit <= 0) return const [];

  final eligible = [
    for (final place in places)
      if (monitoringVeto(place: place, now: now, rules: rules, home: home) ==
          null)
        place,
  ];

  // Nearest first, because the ones you could plausibly reach next are the
  // ones worth a slot. Ties break on place id so the selection is stable and
  // doesn't churn registrations for no reason.
  return eligible
    ..sort((a, b) {
      final byDistance = distanceMeters(
        from,
        a.center,
      ).compareTo(distanceMeters(from, b.center));
      return byDistance != 0 ? byDistance : a.placeId.compareTo(b.placeId);
    })
    ..length = eligible.length < limit ? eligible.length : limit;
}

/// Whether a new selection is different enough to be worth re-registering.
///
/// Re-registering costs a round trip to the system and resets the regions'
/// state, so it is worth skipping when the answer hasn't changed — which is
/// most of the time, since the selection only moves when the user does.
bool selectionChanged(
  List<NotifiablePlace> current,
  List<NotifiablePlace> next,
) {
  if (current.length != next.length) return true;
  for (var i = 0; i < current.length; i++) {
    if (current[i].placeId != next[i].placeId) return true;
  }
  return false;
}
