import 'package:been_here/app/app.dart';
import 'package:been_here/app/providers.dart';
import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/location/fake_location_service.dart';
import 'package:been_here/data/location/geofence_service.dart';
import 'package:been_here/data/location/location_service.dart';
import 'package:been_here/data/notifications/notification_service.dart';
import 'package:been_here/data/photos/fake_photo_library.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/onboarded.dart';

const _home = GeoPoint(50.0755, 14.4378);

/// A library with one place worth remembering: plenty of photos, years old.
List<PhotoAsset> _library() => [
  for (var i = 0; i < 8; i++)
    PhotoAsset(
      id: 'old-$i',
      lat: _home.lat,
      lng: _home.lng,
      takenAt: DateTime.utc(2019, 7, 4, 10 + i),
      width: 100,
      height: 100,
    ),
];

void main() {
  late AppDatabase db;
  late FakePhotoLibrary library;
  late FakeLocationService location;
  late FakeGeofenceService geofence;
  late FakeNotificationService notifications;

  Widget app() => ProviderScope(
    overrides: [
      databaseProvider.overrideWithValue(db),
      photoLibraryProvider.overrideWithValue(library),
      locationServiceProvider.overrideWithValue(location),
      geofenceServiceProvider.overrideWithValue(geofence),
      notificationServiceProvider.overrideWithValue(notifications),
    ],
    child: const BeenHereApp(),
  );

  Future<void> settle(WidgetTester tester, {int frames = 30}) async {
    for (var i = 0; i < frames; i++) {
      await tester.pump(const Duration(milliseconds: 20));
    }
  }

  setUp(() async {
    db = AppDatabase.withExecutor(NativeDatabase.memory());
    await markOnboarded(db);
    library = FakePhotoLibrary(assets: _library());
    location = FakeLocationService(at: _home);
    geofence = FakeGeofenceService(location: location);
    notifications = FakeNotificationService();
  });

  tearDown(() async {
    await notifications.dispose();
    await library.dispose();
    await db.close();
  });

  group('offering arrivals', () {
    testWidgets('is offered once memories have actually been shown', (
      tester,
    ) async {
      await tester.pumpWidget(app());
      await settle(tester, frames: 60);

      expect(find.textContaining('notice for you'), findsOneWidget);
    });

    testWidgets('is not offered before anything has been shown', (
      tester,
    ) async {
      // An empty library: nothing to show, so nothing has been earned.
      library = FakePhotoLibrary();

      await tester.pumpWidget(app());
      await settle(tester, frames: 60);

      expect(find.textContaining('notice for you'), findsNothing);
    });

    testWidgets('is not offered when background location is already on', (
      tester,
    ) async {
      location = FakeLocationService(
        at: _home,
        permission: LocationPermissionState.always,
      );
      geofence = FakeGeofenceService(location: location);

      await tester.pumpWidget(app());
      await settle(tester, frames: 60);

      expect(find.textContaining('notice for you'), findsNothing);
    });

    testWidgets('"not now" means stop asking', (tester) async {
      await tester.pumpWidget(app());
      await settle(tester, frames: 60);

      await tester.tap(find.textContaining('notice for you'));
      await settle(tester);
      await tester.tap(find.text('Not now'));
      await settle(tester, frames: 40);

      expect(find.textContaining('notice for you'), findsNothing);
    });

    testWidgets('explains before the system is allowed to ask', (tester) async {
      await tester.pumpWidget(app());
      await settle(tester, frames: 60);

      await tester.tap(find.textContaining('notice for you'));
      await settle(tester);

      expect(find.textContaining('never follows you'), findsOneWidget);
      expect(
        location.alwaysRequests,
        0,
        reason: 'the system must not be asked until the user chooses to',
      );
    });
  });

  group('turning arrivals on', () {
    testWidgets('asks, then starts watching places', (tester) async {
      location.permissionAfterAlwaysRequest = LocationPermissionState.always;

      await tester.pumpWidget(app());
      await settle(tester, frames: 60);

      await tester.tap(find.textContaining('notice for you'));
      await settle(tester);
      await tester.tap(find.text('Turn on arrivals'));
      await settle(tester, frames: 60);

      expect(location.alwaysRequests, 1);
      expect(geofence.registered, isNotEmpty);
      expect(geofence.registered.first.placeId, isPositive);
    });

    testWidgets('a flat refusal leaves the app working and says so', (
      tester,
    ) async {
      location.permissionAfterAlwaysRequest = LocationPermissionState.denied;

      await tester.pumpWidget(app());
      await settle(tester, frames: 60);

      await tester.tap(find.textContaining('notice for you'));
      await settle(tester);
      await tester.tap(find.text('Turn on arrivals'));
      await settle(tester, frames: 40);

      expect(find.textContaining('arrivals stay quiet'), findsOneWidget);
      expect(geofence.registered, isEmpty);
    });

    testWidgets('being left on "While Using" points at the system settings', (
      tester,
    ) async {
      // What iOS usually answers: it keeps the lesser grant and will not
      // raise the prompt again, so an in-app button can never fix it.
      location.permissionAfterAlwaysRequest =
          LocationPermissionState.whileInUse;

      await tester.pumpWidget(app());
      await settle(tester, frames: 60);

      await tester.tap(find.textContaining('notice for you'));
      await settle(tester);
      await tester.tap(find.text('Turn on arrivals'));
      await settle(tester, frames: 40);

      expect(
        find.textContaining('will not offer the choice again'),
        findsOneWidget,
      );

      await tester.tap(find.text('Open settings'));
      await settle(tester);
      expect(location.systemSettingsOpened, 1);
    });

    testWidgets('settings says what is still missing rather than just "off"', (
      tester,
    ) async {
      await tester.pumpWidget(app());
      await settle(tester, frames: 60);

      await tester.tap(find.byIcon(Icons.settings_outlined));
      await settle(tester);
      // The arrivals row sits below the fold in a test-sized window, and a
      // ListView does not build what it cannot show.
      await tester.drag(find.byType(ListView), const Offset(0, -400));
      await settle(tester);

      // The device has while-in-use location, so arrivals are one system
      // setting away — saying "off" would send the user in circles.
      expect(find.textContaining('Set it to "Always"'), findsOneWidget);
    });
  });

  group('a notification tap', () {
    testWidgets('points the screen at the place it was about', (tester) async {
      await tester.pumpWidget(app());
      await settle(tester, frames: 60);

      final place = (await db.placesDao.all()).first;
      notifications.tap(place.id);
      await settle(tester, frames: 40);

      final container = ProviderScope.containerOf(
        tester.element(find.byType(Scaffold).first),
      );
      final viewpoint = container.read(viewpointProvider);

      expect(viewpoint, isNotNull);
      expect(viewpoint!.lat, closeTo(place.centerLat, 1e-9));
    });

    testWidgets('a tap for a place that no longer exists changes nothing', (
      tester,
    ) async {
      await tester.pumpWidget(app());
      await settle(tester, frames: 60);

      notifications.tap(999999);
      await settle(tester, frames: 20);

      final container = ProviderScope.containerOf(
        tester.element(find.byType(Scaffold).first),
      );
      expect(container.read(viewpointProvider), isNull);
    });
  });
}
