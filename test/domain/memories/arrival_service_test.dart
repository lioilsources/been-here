import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/location/geofence_service.dart';
import 'package:been_here/data/notifications/notification_service.dart';
import 'package:been_here/domain/memories/arrival_service.dart';
import 'package:been_here/domain/memories/notification_rules.dart';
import 'package:been_here/domain/places/mute_state.dart';
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

const _prague = GeoPoint(50.0755, 14.4378);
final _now = DateTime.utc(2026, 9, 20, 14);

GeoPoint _north(double meters) =>
    GeoPoint(_prague.lat + meters / metersPerDegreeLatitude, _prague.lng);

MemoryNotification _compose(MemoryArrival arrival) => MemoryNotification(
  placeId: arrival.placeId,
  title: arrival.name ?? 'A place you know',
  body:
      '${arrival.age.unit.name} ${arrival.age.amount} · '
      '${arrival.photoCount} photos',
);

void main() {
  late AppDatabase db;
  late FakeGeofenceService geofence;
  late FakeNotificationService notifications;
  late ArrivalService arrivals;
  late RegionSyncService regions;

  setUp(() {
    db = AppDatabase.withExecutor(NativeDatabase.memory());
    geofence = FakeGeofenceService();
    notifications = FakeNotificationService();
    arrivals = ArrivalService(
      places: db.placesDao,
      notifications: notifications,
      compose: _compose,
      clock: () => _now,
    );
    regions = RegionSyncService(
      places: db.placesDao,
      geofence: geofence,
      clock: () => _now,
    );
  });

  tearDown(() async {
    await notifications.dispose();
    await db.close();
  });

  Future<int> addPlace({
    GeoPoint? at,
    int photos = 14,
    Duration lastPhoto = const Duration(days: 2191),
    MuteState mute = MuteState.none,
    Duration? lastNotified,
    String? name,
  }) {
    final center = at ?? _prague;
    return db.placesDao.insertPlace(
      PlacesCompanion.insert(
        centerLat: center.lat,
        centerLng: center.lng,
        radiusM: 150,
        photoCount: Value(photos),
        distinctDays: const Value(4),
        firstAt: 0,
        lastAt: _now.subtract(lastPhoto).millisecondsSinceEpoch ~/ 1000,
        mute: Value(mute),
        userLabel: Value(name),
        lastNotifiedAt: Value(
          lastNotified == null
              ? null
              : _now.subtract(lastNotified).millisecondsSinceEpoch ~/ 1000,
        ),
      ),
    );
  }

  group('choosing what to watch', () {
    test('watches nothing when there is nothing to watch', () async {
      expect(await regions.syncRegions(_prague), isEmpty);
      expect(geofence.registered, isEmpty);
    });

    test('registers the eligible places nearest to you', () async {
      final near = await addPlace(at: _north(500));
      await addPlace(at: _north(40000));
      await addPlace(at: _north(200), mute: MuteState.auto);

      final chosen = await regions.syncRegions(_prague);

      expect(chosen.first.placeId, near);
      expect(geofence.registered.map((r) => r.placeId), isNot(contains(3)));
      expect(geofence.registered.first.radiusMeters, 150);
    });

    test('never asks for more regions than the platform allows', () async {
      for (var i = 1; i <= 30; i++) {
        await addPlace(at: _north(i * 500.0));
      }

      await regions.syncRegions(_prague);

      expect(geofence.registered, hasLength(geofence.regionLimit));
    });

    test('does not re-register when the answer has not changed', () async {
      await addPlace(at: _north(500));

      await regions.syncRegions(_prague);
      await regions.syncRegions(_prague);
      await regions.syncRegions(_prague);

      expect(
        geofence.registrations,
        hasLength(1),
        reason: 'registering resets region state; do it only when it changes',
      );
    });

    test('re-registers when the user has moved somewhere else', () async {
      for (var i = 1; i <= 25; i++) {
        await addPlace(at: _north(i * 1000.0));
      }

      await regions.syncRegions(_prague);
      await regions.syncRegions(_north(25000));

      expect(geofence.registrations, hasLength(2));
      expect(
        geofence.registrations.first.map((r) => r.placeId),
        isNot(geofence.registrations.last.map((r) => r.placeId)),
      );
    });

    test('watches nothing without background location', () async {
      await addPlace(at: _north(500));
      geofence.available = false;

      expect(await regions.syncRegions(_prague), isEmpty);
      expect(geofence.registered, isEmpty);
    });

    test('lets go of its regions when permission goes away', () async {
      await addPlace(at: _north(500));
      await regions.syncRegions(_prague);
      expect(geofence.registered, isNotEmpty);

      geofence.available = false;
      await regions.syncRegions(_prague);

      expect(geofence.clearCalls, 1);
      expect(geofence.registered, isEmpty);
    });
  });

  group('arriving', () {
    test('notifies, and says what is there', () async {
      final id = await addPlace(name: 'U babicky');

      final decision = await arrivals.onArrival(id);

      expect(decision.shouldNotify, isTrue);
      expect(notifications.shown, hasLength(1));
      expect(notifications.shown.single.title, 'U babicky');
      expect(notifications.shown.single.body, contains('14 photos'));
      expect(notifications.shown.single.placeId, id);
    });

    test('remembers that it spoke', () async {
      final id = await addPlace();
      await arrivals.onArrival(id);

      final place = await db.placesDao.byId(id);
      expect(place!.lastNotifiedAt, _now.millisecondsSinceEpoch ~/ 1000);
    });

    test('stays quiet at a muted place', () async {
      final id = await addPlace(mute: MuteState.auto);

      final decision = await arrivals.onArrival(id);

      expect(decision.veto, NotificationVeto.muted);
      expect(notifications.shown, isEmpty);
    });

    test('stays quiet somewhere you were last month', () async {
      final id = await addPlace(lastPhoto: const Duration(days: 20));

      expect((await arrivals.onArrival(id)).veto, NotificationVeto.tooRecent);
      expect(notifications.shown, isEmpty);
    });

    test('stays quiet at a place still in its cooldown', () async {
      final id = await addPlace(lastNotified: const Duration(days: 5));

      expect(
        (await arrivals.onArrival(id)).veto,
        NotificationVeto.placeCooldown,
      );
      expect(notifications.shown, isEmpty);
    });

    test('speaks once a day, whatever you walk past', () async {
      final first = await addPlace(at: _north(100));
      final second = await addPlace(at: _north(20000));

      await arrivals.onArrival(first);
      final decision = await arrivals.onArrival(second);

      expect(decision.veto, NotificationVeto.dailyLimit);
      expect(notifications.shown, hasLength(1));
    });

    test('re-checks the rules rather than trusting the registration', () async {
      final id = await addPlace();
      await regions.syncRegions(_prague);
      expect(geofence.registered, hasLength(1));

      // Muted after it was registered; the arrival must still respect it.
      await db.placesDao.setMute(id, MuteState.userMuted);

      expect((await arrivals.onArrival(id)).veto, NotificationVeto.muted);
      expect(notifications.shown, isEmpty);
    });

    test('a place that vanished between registration and arrival', () async {
      expect((await arrivals.onArrival(999)).shouldNotify, isFalse);
      expect(notifications.shown, isEmpty);
    });

    test('a nameless place still gets a notification', () async {
      final id = await addPlace();
      await arrivals.onArrival(id);

      expect(notifications.shown.single.title, 'A place you know');
    });

    test('the day after, it may speak again', () async {
      final id = await addPlace(at: _north(100));
      final other = await addPlace(at: _north(30000));
      await arrivals.onArrival(id);

      final tomorrow = ArrivalService(
        places: db.placesDao,
        notifications: notifications,
        compose: _compose,
        clock: () => _now.add(const Duration(days: 2)),
      );

      expect((await tomorrow.onArrival(other)).shouldNotify, isTrue);
      expect(notifications.shown, hasLength(2));
    });
  });
}
