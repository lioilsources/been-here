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

/// One photo, here, years ago — so the visit has exactly one tile and there
/// is no doubt about which photo the detail screen is showing.
List<PhotoAsset> _onePhoto() => [
  PhotoAsset(
    id: 'old-0',
    lat: _prague.lat,
    lng: _prague.lng,
    takenAt: DateTime.utc(2024, 4, 3, 12),
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

  /// Opens the photo full screen.
  Future<void> openPhoto(WidgetTester tester) async {
    await tester.pumpWidget(app());
    await settle(tester);
    // The tap target is the InkWell laid over the thumbnail, so the finder
    // that names the picture is not the one that is hit.
    await tester.tap(find.byType(PhotoThumbnail).first, warnIfMissed: false);
    await settle(tester);
  }

  setUp(() async {
    db = AppDatabase.withExecutor(NativeDatabase.memory());
    await markOnboarded(db);
    library = FakePhotoLibrary(assets: _onePhoto());
    location = FakeLocationService(at: _prague);
  });

  tearDown(() async {
    await library.dispose();
    await db.close();
  });

  testWidgets('offers to rephoto, and the button is live', (tester) async {
    await openPhoto(tester);

    final button = find.widgetWithText(TextButton, 'Rephoto');
    expect(button, findsOneWidget);
    expect(tester.widget<TextButton>(button).onPressed, isNotNull);
  });

  testWidgets('no then & now until the photo has been answered', (
    tester,
  ) async {
    await openPhoto(tester);

    expect(find.text('Rephoto'), findsOneWidget);
    expect(find.text('Then & now'), findsNothing);
  });

  testWidgets('a photo that has been answered offers the pair', (
    tester,
  ) async {
    await db.rephotosDao.record(
      originalAssetId: 'old-0',
      newAssetId: 'new-0',
      at: DateTime.utc(2026, 9),
    );

    await openPhoto(tester);

    expect(find.text('Then & now'), findsOneWidget);
  });
}
