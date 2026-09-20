import 'package:been_here/app/app.dart';
import 'package:been_here/app/providers.dart';
import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/geocoding/geocoding_service.dart';
import 'package:been_here/data/location/fake_location_service.dart';
import 'package:been_here/data/photos/fake_photo_library.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:been_here/domain/places/mute_state.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

const _home = GeoPoint(50.0755, 14.4378);
const _trip = GeoPoint(48.2082, 16.3738);

/// A library with an everyday place and a place visited twice.
List<PhotoAsset> _library() {
  final photos = <PhotoAsset>[];
  for (var day = 0; day < 60; day++) {
    photos.add(
      PhotoAsset(
        id: 'home-$day',
        lat: _home.lat,
        lng: _home.lng,
        takenAt: DateTime.utc(2024).add(Duration(days: day, hours: 12)),
        width: 100,
        height: 100,
      ),
    );
  }
  for (var i = 0; i < 4; i++) {
    photos.add(
      PhotoAsset(
        id: 'trip-$i',
        lat: _trip.lat,
        lng: _trip.lng,
        takenAt: DateTime.utc(2022, 9, 18, 10 + i),
        width: 100,
        height: 100,
      ),
    );
  }
  return photos;
}

void main() {
  late AppDatabase db;
  late FakePhotoLibrary library;
  late FakeLocationService location;
  late FakeGeocodingService geocoder;

  Widget app() => ProviderScope(
    overrides: [
      databaseProvider.overrideWithValue(db),
      photoLibraryProvider.overrideWithValue(library),
      locationServiceProvider.overrideWithValue(location),
      geocodingServiceProvider.overrideWithValue(geocoder),
    ],
    child: const BeenHereApp(),
  );

  Future<void> settle(WidgetTester tester, {int frames = 40}) async {
    for (var i = 0; i < frames; i++) {
      await tester.pump(const Duration(milliseconds: 20));
    }
  }

  Future<void> openPlaces(WidgetTester tester) async {
    await tester.pumpWidget(app());
    await settle(tester);
    await tester.tap(find.byIcon(Icons.place_outlined));
    await settle(tester);
  }

  setUp(() {
    db = AppDatabase.withExecutor(NativeDatabase.memory());
    library = FakePhotoLibrary(assets: _library());
    location = FakeLocationService(at: _home);
    geocoder = FakeGeocodingService(fallback: 'Somewhere nice');
  });

  tearDown(() async {
    await library.dispose();
    await db.close();
  });

  testWidgets('separates the muted everyday place from the trip', (
    tester,
  ) async {
    await openPlaces(tester);

    final places = await db.placesDao.all();
    expect(places, hasLength(2));
    expect(
      places.where((p) => p.mute == MuteState.auto),
      hasLength(1),
      reason: 'the everyday place should have been muted automatically',
    );

    expect(find.text('1 muted place'), findsOneWidget);
    expect(find.textContaining("you're here most days"), findsOneWidget);
  });

  testWidgets('muting a place moves it into the muted section', (tester) async {
    await openPlaces(tester);
    expect(find.text('1 muted place'), findsOneWidget);

    // The trip place is the unmuted one; its menu is the first in the list.
    await tester.tap(find.byIcon(Icons.more_vert).first);
    await settle(tester);
    await tester.tap(find.text('Mute'));
    await settle(tester);

    expect(find.text('2 muted places'), findsOneWidget);
    expect(find.text('Muted by you'), findsOneWidget);
  });

  testWidgets('unmuting the everyday place keeps it visible', (tester) async {
    await openPlaces(tester);

    await tester.tap(find.byIcon(Icons.more_vert).last);
    await settle(tester);
    await tester.tap(find.text('Unmute'));
    await settle(tester);

    expect(find.textContaining('muted place'), findsNothing);
    expect(find.text('Kept visible by you'), findsOneWidget);
  });

  testWidgets('a nameless place leads with when you were there', (
    tester,
  ) async {
    await openPlaces(tester);

    // The trip: four photos on one day in September 2022.
    expect(find.textContaining('4 photos'), findsOneWidget);
    expect(find.textContaining('years ago · 4 photos'), findsOneWidget);
    expect(
      geocoder.asked,
      isEmpty,
      reason: 'coordinates were sent to the geocoder without being asked',
    );
  });

  testWidgets('a place the user names leads with that name', (tester) async {
    await openPlaces(tester);

    await tester.tap(find.byIcon(Icons.more_vert).first);
    await settle(tester);
    await tester.tap(find.text('Name this place'));
    await settle(tester);

    await tester.enterText(find.byType(TextField), 'U babicky');
    await tester.tap(find.text('Save'));
    await settle(tester);

    expect(find.text('U babicky'), findsOneWidget);
    expect(
      geocoder.asked,
      isEmpty,
      reason: 'a name typed by the user must not involve the geocoder',
    );
  });

  testWidgets('a name the user typed survives geocoding being switched off', (
    tester,
  ) async {
    await openPlaces(tester);

    await tester.tap(find.byIcon(Icons.more_vert).first);
    await settle(tester);
    await tester.tap(find.text('Name this place'));
    await settle(tester);
    await tester.enterText(find.byType(TextField), 'U babicky');
    await tester.tap(find.text('Save'));
    await settle(tester);

    // Turn naming on, then off again: the geocoder's answers go, this stays.
    await tester.tap(find.byIcon(Icons.settings_outlined));
    await settle(tester);
    await tester.tap(find.byType(SwitchListTile));
    await settle(tester);
    await tester.tap(find.byType(SwitchListTile));
    await settle(tester);

    await tester.tap(find.byIcon(Icons.place_outlined));
    await settle(tester);

    expect(find.text('U babicky'), findsOneWidget);
    expect(find.text('Somewhere nice'), findsNothing);
  });

  testWidgets('turning place names on names them, and off forgets them', (
    tester,
  ) async {
    await openPlaces(tester);

    await tester.tap(find.byIcon(Icons.settings_outlined));
    await settle(tester);
    await tester.tap(find.byType(SwitchListTile));
    await settle(tester);

    await tester.tap(find.byIcon(Icons.place_outlined));
    await settle(tester);
    expect(find.text('Somewhere nice'), findsWidgets);
    expect(geocoder.asked, isNotEmpty);

    await tester.tap(find.byIcon(Icons.settings_outlined));
    await settle(tester);
    await tester.tap(find.byType(SwitchListTile));
    await settle(tester);

    expect(
      (await db.placesDao.all()).every((p) => p.label == null),
      isTrue,
      reason:
          'turning naming off should forget the names, not just stop '
          'asking for new ones',
    );
  });

  testWidgets('sorting by most photos puts the busy place first', (
    tester,
  ) async {
    await openPlaces(tester);

    await tester.tap(find.byIcon(Icons.sort));
    await settle(tester);
    await tester.tap(find.text('Most photos'));
    await settle(tester);

    final container = ProviderScope.containerOf(
      tester.element(find.byType(Scaffold).first),
    );
    final sorted = await container.read(placesProvider.future);
    expect(sorted.first.photoCount, 60);
  });

  testWidgets('tapping a place shows what you photographed there', (
    tester,
  ) async {
    await openPlaces(tester);

    await tester.tap(find.byType(ListTile).first);
    await settle(tester);

    // Back on Here, looking at that place rather than at the phone.
    expect(find.text('Here'), findsWidgets);

    final container = ProviderScope.containerOf(
      tester.element(find.byType(Scaffold).first),
    );
    expect(container.read(selectedTabProvider), 0);
    expect(container.read(viewpointProvider), isNotNull);
  });

  testWidgets('an empty library has no places', (tester) async {
    library = FakePhotoLibrary();

    await openPlaces(tester);

    expect(find.text('No places yet'), findsOneWidget);
  });
}
