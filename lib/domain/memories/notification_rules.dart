import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:been_here/domain/places/mute_state.dart';
import 'package:meta/meta.dart';

/// A place, reduced to what deciding whether to interrupt someone needs.
@immutable
class NotifiablePlace {
  const NotifiablePlace({
    required this.placeId,
    required this.center,
    required this.radiusMeters,
    required this.photoCount,
    required this.lastPhotoAt,
    required this.mute,
    this.lastNotifiedAt,
    this.name,
  });

  final int placeId;
  final GeoPoint center;
  final double radiusMeters;
  final int photoCount;

  /// The most recent photo taken here.
  final DateTime lastPhotoAt;

  final MuteState mute;

  /// When this place last produced a notification, if ever.
  final DateTime? lastNotifiedAt;

  /// What to call it, if it has a name.
  final String? name;

  @override
  String toString() =>
      'NotifiablePlace($placeId, $photoCount photos, '
      'last ${lastPhotoAt.toIso8601String()})';
}

/// The thresholds. All of them are settings, because the right values depend
/// on how much someone photographs.
@immutable
class NotificationRules {
  const NotificationRules({
    this.minimumAge = const Duration(days: 182),
    this.placeCooldown = const Duration(days: 30),
    this.globalCooldown = const Duration(days: 1),
    this.minimumPhotos = 3,
    this.homeRadiusMeters = 25000,
  });

  /// How old the newest photo at a place must be.
  ///
  /// Six months by default: somewhere you were last month is not a memory,
  /// it is a Tuesday.
  final Duration minimumAge;

  /// How long a place stays quiet after it has spoken.
  final Duration placeCooldown;

  /// How long the whole app stays quiet after any notification.
  ///
  /// A rolling window rather than a calendar day: two notifications twenty
  /// minutes apart either side of midnight are still two interruptions.
  final Duration globalCooldown;

  /// Fewer photos than this is not a visit worth remembering.
  final int minimumPhotos;

  /// How far from home a place has to be before arriving there is news.
  ///
  /// Everyday life happens close to home, and the places in it are the ones
  /// you least want a phone to comment on — the shop, the school, the park
  /// you cross twice a day. Auto-mute already catches the ones you have
  /// photographed often; this catches the rest of the neighbourhood, the
  /// places you happened to photograph three times four years ago and walk
  /// past every week since.
  ///
  /// Zero turns it off.
  final double homeRadiusMeters;
}

/// Why a place was passed over. Named rather than boolean so the reason can
/// be logged, tested and shown in a debug screen.
enum NotificationVeto {
  muted,
  tooFewPhotos,

  /// You were here recently enough that it isn't a memory yet.
  tooRecent,

  /// This place notified not long ago.
  placeCooldown,

  /// Close enough to home to be part of the everyday.
  nearHome,

  /// Something else notified not long ago.
  dailyLimit,
}

/// Whether arriving at a place should interrupt someone, and if not, why.
@immutable
class NotificationDecision {
  const NotificationDecision.notify() : veto = null;

  const NotificationDecision.vetoed(this.veto);

  final NotificationVeto? veto;

  bool get shouldNotify => veto == null;

  @override
  bool operator ==(Object other) =>
      other is NotificationDecision && other.veto == veto;

  @override
  int get hashCode => veto.hashCode;

  @override
  String toString() => shouldNotify ? 'notify' : 'vetoed(${veto!.name})';
}

/// Whether a place is worth *watching* — spending one of the handful of
/// regions the system will monitor on.
///
/// Deliberately does not consider the daily limit: that is a fact about this
/// moment, not about the place, and applying it here would unregister every
/// region for a day after a single notification.
NotificationVeto? monitoringVeto({
  required NotifiablePlace place,
  required DateTime now,
  NotificationRules rules = const NotificationRules(),
  GeoPoint? home,
}) {
  if (place.mute.isMuted) return NotificationVeto.muted;
  if (home != null &&
      rules.homeRadiusMeters > 0 &&
      distanceMeters(home, place.center) < rules.homeRadiusMeters) {
    return NotificationVeto.nearHome;
  }
  if (place.photoCount < rules.minimumPhotos) {
    return NotificationVeto.tooFewPhotos;
  }
  if (now.difference(place.lastPhotoAt) < rules.minimumAge) {
    return NotificationVeto.tooRecent;
  }

  final lastNotified = place.lastNotifiedAt;
  if (lastNotified != null &&
      now.difference(lastNotified) < rules.placeCooldown) {
    return NotificationVeto.placeCooldown;
  }
  return null;
}

/// The decision at the moment of arrival.
NotificationDecision decideNotification({
  required NotifiablePlace place,
  required DateTime now,
  DateTime? lastNotificationAnywhere,
  NotificationRules rules = const NotificationRules(),
  GeoPoint? home,
}) {
  final veto = monitoringVeto(
    place: place,
    now: now,
    rules: rules,
    home: home,
  );
  if (veto != null) return NotificationDecision.vetoed(veto);

  if (lastNotificationAnywhere != null &&
      now.difference(lastNotificationAnywhere) < rules.globalCooldown) {
    return const NotificationDecision.vetoed(NotificationVeto.dailyLimit);
  }
  return const NotificationDecision.notify();
}
