import 'package:been_here/app/app.dart';
import 'package:been_here/app/providers.dart';
import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/location/fake_location_service.dart';
import 'package:been_here/data/photos/fake_photo_library.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:been_here/features/here/widgets/photo_thumbnail.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/onboarded.dart';

const _prague = GeoPoint(50.0755, 14.4378);

List<PhotoAsset> _photos(int count) => [
  for (var i = 0; i < count; i++)
    PhotoAsset(
      id: 'p-$i',
      lat: _prague.lat,
      lng: _prague.lng,
      takenAt: DateTime.utc(2019, 7, 4, 10).add(Duration(hours: i)),
      width: 4032,
      height: 3024,
    ),
];

void main() {
  late AppDatabase db;
  late FakePhotoLibrary library;
  late FakeLocationService location;

  Widget app() => ProviderScope(
    overrides: [
      databaseProvider.overrideWithValue(db),
      photoLibraryProvider.overrideWithValue(library),
      locationServiceProvider.overrideWithValue(location),
    ],
    child: const BeenHereApp(),
  );

  Future<void> settle(WidgetTester tester, {int frames = 40}) async {
    for (var i = 0; i < frames; i++) {
      await tester.pump(const Duration(milliseconds: 20));
    }
  }

  setUp(() async {
    db = AppDatabase.withExecutor(NativeDatabase.memory());
    await markOnboarded(db);
    library = FakePhotoLibrary(assets: _photos(6));
    location = FakeLocationService(at: _prague);
  });

  tearDown(() async {
    await library.dispose();
    await db.close();
  });

  testWidgets('the places list stays on screen while it reloads', (
    tester,
  ) async {
    await tester.pumpWidget(app());
    await settle(tester);
    await tester.tap(find.text('Places'));
    await settle(tester);

    final before = find.byType(ListTile).evaluate().length;
    expect(before, greaterThan(0));

    // Anything the list is derived from changing — the sort here, an
    // indexing pass in real life — reloads it.
    final container = ProviderScope.containerOf(
      tester.element(find.byType(Scaffold).first),
    );
    container.read(placesSortAscendingProvider.notifier).value = true;
    await tester.pump();

    // One frame later it is still a list, not a spinner.
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(ListTile).evaluate().length, before);
  });

  testWidgets('the timeline keeps its photos while it reloads', (
    tester,
  ) async {
    await tester.pumpWidget(app());
    await settle(tester);

    final before = find.byType(PhotoThumbnail).evaluate().length;
    expect(before, greaterThan(0));

    // Opening a place points the screen somewhere else, which re-resolves
    // the location every screen below it is built from.
    final container = ProviderScope.containerOf(
      tester.element(find.byType(Scaffold).first),
    );
    container.read(viewpointProvider.notifier).point = const GeoPoint(
      50.0756,
      14.4379,
    );
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(PhotoThumbnail).evaluate().length, before);
  });
}
