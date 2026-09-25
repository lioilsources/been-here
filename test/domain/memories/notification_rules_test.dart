import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:been_here/domain/memories/notification_rules.dart';
import 'package:been_here/domain/places/mute_state.dart';
import 'package:flutter_test/flutter_test.dart';

final _now = DateTime.utc(2026, 9, 20, 14);

const _prague = GeoPoint(50.0755, 14.4378);

/// [km] north of Prague.
GeoPoint _north(double km) =>
    GeoPoint(_prague.lat + km * 1000 / metersPerDegreeLatitude, _prague.lng);

NotifiablePlace _place({
  int id = 1,
  int photos = 14,
  Duration lastPhoto = const Duration(days: 2191), // six years
  MuteState mute = MuteState.none,
  Duration? lastNotified,
  GeoPoint center = _prague,
}) => NotifiablePlace(
  placeId: id,
  center: center,
  radiusMeters: 150,
  photoCount: photos,
  lastPhotoAt: _now.subtract(lastPhoto),
  mute: mute,
  lastNotifiedAt: lastNotified == null ? null : _now.subtract(lastNotified),
);

void main() {
  group('the place is worth watching', () {
    test('an old place with plenty of photos is', () {
      expect(monitoringVeto(place: _place(), now: _now), isNull);
    });

    test('a muted place is not', () {
      expect(
        monitoringVeto(
          place: _place(mute: MuteState.auto),
          now: _now,
        ),
        NotificationVeto.muted,
      );
      expect(
        monitoringVeto(
          place: _place(mute: MuteState.userMuted),
          now: _now,
        ),
        NotificationVeto.muted,
      );
    });

    test('a place the user unmuted is, whatever the rule thinks', () {
      expect(
        monitoringVeto(
          place: _place(mute: MuteState.userUnmuted),
          now: _now,
        ),
        isNull,
      );
    });

    test('too few photos is not a memory', () {
      expect(
        monitoringVeto(place: _place(photos: 2), now: _now),
        NotificationVeto.tooFewPhotos,
      );
      expect(monitoringVeto(place: _place(photos: 3), now: _now), isNull);
    });

    test('somewhere you were last month is not a memory', () {
      expect(
        monitoringVeto(
          place: _place(lastPhoto: const Duration(days: 30)),
          now: _now,
        ),
        NotificationVeto.tooRecent,
      );
    });

    test('six months is the line', () {
      expect(
        monitoringVeto(
          place: _place(lastPhoto: const Duration(days: 181)),
          now: _now,
        ),
        NotificationVeto.tooRecent,
      );
      expect(
        monitoringVeto(
          place: _place(lastPhoto: const Duration(days: 182)),
          now: _now,
        ),
        isNull,
      );
    });

    test('a place that spoke recently keeps quiet', () {
      expect(
        monitoringVeto(
          place: _place(lastNotified: const Duration(days: 29)),
          now: _now,
        ),
        NotificationVeto.placeCooldown,
      );
      expect(
        monitoringVeto(
          place: _place(lastNotified: const Duration(days: 31)),
          now: _now,
        ),
        isNull,
      );
    });

    test('thresholds are configurable', () {
      const strict = NotificationRules(
        minimumPhotos: 20,
        minimumAge: Duration(days: 3650),
      );
      expect(
        monitoringVeto(place: _place(), now: _now, rules: strict),
        NotificationVeto.tooFewPhotos,
      );
    });

    test('the daily limit is not a property of the place', () {
      // Watching a place must not depend on whether something else happened
      // to notify today; otherwise one notification unregisters everything.
      expect(monitoringVeto(place: _place(), now: _now), isNull);
    });
  });

  group('arriving somewhere', () {
    test('notifies when nothing objects', () {
      final decision = decideNotification(place: _place(), now: _now);
      expect(decision.shouldNotify, isTrue);
      expect(decision.veto, isNull);
    });

    test('inherits every reason the place was not worth watching', () {
      expect(
        decideNotification(
          place: _place(mute: MuteState.auto),
          now: _now,
        ).veto,
        NotificationVeto.muted,
      );
      expect(
        decideNotification(place: _place(photos: 1), now: _now).veto,
        NotificationVeto.tooFewPhotos,
      );
    });

    test('one notification a day, across all places', () {
      final decision = decideNotification(
        place: _place(),
        now: _now,
        lastNotificationAnywhere: _now.subtract(const Duration(hours: 3)),
      );
      expect(decision.veto, NotificationVeto.dailyLimit);
    });

    test('a day later it may speak again', () {
      final decision = decideNotification(
        place: _place(),
        now: _now,
        lastNotificationAnywhere: _now.subtract(const Duration(hours: 25)),
      );
      expect(decision.shouldNotify, isTrue);
    });

    test('the daily window is rolling, not a calendar day', () {
      // 23:50 yesterday and 00:10 today are twenty minutes apart. Two
      // interruptions, whatever the date says.
      final justBeforeMidnight = DateTime.utc(2026, 9, 19, 23, 50);
      final justAfter = DateTime.utc(2026, 9, 20, 0, 10);

      expect(
        decideNotification(
          place: _place(),
          now: justAfter,
          lastNotificationAnywhere: justBeforeMidnight,
        ).veto,
        NotificationVeto.dailyLimit,
      );
    });

    test('the place cooldown outranks the daily limit in the reason', () {
      // Both apply; the more specific one is the more useful answer.
      final decision = decideNotification(
        place: _place(lastNotified: const Duration(days: 2)),
        now: _now,
        lastNotificationAnywhere: _now.subtract(const Duration(hours: 1)),
      );
      expect(decision.veto, NotificationVeto.placeCooldown);
    });

    test('having never notified is not a cooldown', () {
      expect(
        decideNotification(
          place: _place(),
          now: _now,
        ).shouldNotify,
        isTrue,
      );
    });
  });

  group('home is not news', () {
    test('a place inside the home radius is not worth watching', () {
      // The corner shop you photographed four years ago and have walked past
      // twice a week since.
      expect(
        monitoringVeto(place: _place(), now: _now, home: _prague),
        NotificationVeto.nearHome,
      );
    });

    test('a place beyond it is', () {
      expect(
        monitoringVeto(
          place: _place(center: _north(40)),
          now: _now,
          home: _prague,
        ),
        isNull,
      );
    });

    test('the radius is a setting, and zero turns it off', () {
      const off = NotificationRules(homeRadiusMeters: 0);
      expect(
        monitoringVeto(place: _place(), now: _now, home: _prague, rules: off),
        isNull,
      );

      const wide = NotificationRules(homeRadiusMeters: 50000);
      expect(
        monitoringVeto(
          place: _place(center: _north(40)),
          now: _now,
          home: _prague,
          rules: wide,
        ),
        NotificationVeto.nearHome,
      );
    });

    test('an index with no home at all still notifies', () {
      // A library with no places yet, or one place: nothing to measure from.
      expect(monitoringVeto(place: _place(), now: _now), isNull);
    });

    test('being muted is reported before being near home', () {
      // Both are true of a home; the more specific decision is the one the
      // user made.
      expect(
        monitoringVeto(
          place: _place(mute: MuteState.userMuted),
          now: _now,
          home: _prague,
        ),
        NotificationVeto.muted,
      );
    });

    test('an arrival close to home stays quiet', () {
      expect(
        decideNotification(place: _place(), now: _now, home: _prague),
        const NotificationDecision.vetoed(NotificationVeto.nearHome),
      );
    });
  });
}
