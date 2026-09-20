import 'package:been_here/app/app.dart';
import 'package:been_here/app/providers.dart';
import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/location/fake_location_service.dart';
import 'package:been_here/data/location/location_service.dart';
import 'package:been_here/data/photos/fake_photo_library.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:been_here/features/here/widgets/photo_thumbnail.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

const _prague = GeoPoint(50.0755, 14.4378);

GeoPoint _north(GeoPoint from, double meters) =>
    GeoPoint(from.lat + meters / metersPerDegreeLatitude, from.lng);

/// Photos at [at], one per day counting back from [daysAgo].
List<PhotoAsset> _photosAt(
  GeoPoint at, {
  required int count,
  required int daysAgo,
  String prefix = 'p',
}) {
  final now = DateTime.utc(2026, 9, 20, 12);
  return [
    for (var i = 0; i < count; i++)
      PhotoAsset(
        id: '$prefix-$i',
        lat: at.lat,
        lng: at.lng,
        takenAt: now.subtract(Duration(days: daysAgo, hours: i)),
        width: 4032,
        height: 3024,
      ),
  ];
}

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

  /// Pumps frames without waiting for the progress indicator, which never
  /// settles.
  Future<void> settle(WidgetTester tester, {int frames = 30}) async {
    for (var i = 0; i < frames; i++) {
      await tester.pump(const Duration(milliseconds: 20));
    }
  }

  setUp(() {
    db = AppDatabase.withExecutor(NativeDatabase.memory());
    location = FakeLocationService(at: _prague);
  });

  tearDown(() async {
    await library.dispose();
    await db.close();
  });

  group('permissions', () {
    testWidgets('asks for photos before anything else', (tester) async {
      library = FakePhotoLibrary(
        permission: PhotoPermission.notDetermined,
        permissionAfterRequest: PhotoPermission.authorized,
      );

      await tester.pumpWidget(app());
      await settle(tester);

      expect(find.text('Been Here needs your photos'), findsOneWidget);
      expect(find.text('Use my location'), findsNothing);
    });

    testWidgets('asks for location once photos are granted', (tester) async {
      library = FakePhotoLibrary(
        assets: _photosAt(_prague, count: 2, daysAgo: 400),
      );
      location = FakeLocationService(
        at: _prague,
        permission: LocationPermissionState.notDetermined,
        permissionAfterRequest: LocationPermissionState.whileInUse,
      );

      await tester.pumpWidget(app());
      await settle(tester);

      expect(find.text('Where are you?'), findsOneWidget);

      await tester.tap(find.text('Use my location'));
      await settle(tester);

      expect(find.text('Where are you?'), findsNothing);
    });

    testWidgets('explains a location denial without a dead button', (
      tester,
    ) async {
      library = FakePhotoLibrary(
        assets: _photosAt(_prague, count: 1, daysAgo: 10),
      );
      location = FakeLocationService(
        at: _prague,
        permission: LocationPermissionState.deniedForever,
      );

      await tester.pumpWidget(app());
      await settle(tester);

      expect(find.text('Location is off'), findsOneWidget);
      expect(find.text('Use my location'), findsNothing);
    });

    testWidgets('says when location services are off device-wide', (
      tester,
    ) async {
      library = FakePhotoLibrary(
        assets: _photosAt(_prague, count: 1, daysAgo: 10),
      );
      location = FakeLocationService(
        at: _prague,
        permission: LocationPermissionState.servicesDisabled,
      );

      await tester.pumpWidget(app());
      await settle(tester);

      expect(find.text('Location services are off'), findsOneWidget);
    });

    testWidgets('handles permission granted but no fix', (tester) async {
      library = FakePhotoLibrary(
        assets: _photosAt(_prague, count: 1, daysAgo: 10),
      );
      location = FakeLocationService(at: _prague, failsToFix: true);

      await tester.pumpWidget(app());
      await settle(tester);

      expect(find.text('No fix yet'), findsOneWidget);
    });
  });

  group('timeline', () {
    testWidgets('shows a visit with its age, date and photos', (tester) async {
      library = FakePhotoLibrary(
        assets: [
          ..._photosAt(_prague, count: 3, daysAgo: 2191, prefix: 'old'),
        ],
      );

      await tester.pumpWidget(app());
      await settle(tester, frames: 40);

      expect(find.text('6 years ago'), findsOneWidget);
      expect(find.text('Within 500 m'), findsOneWidget);
      expect(find.textContaining('3 photos'), findsWidgets);
      expect(find.byType(PhotoThumbnail), findsNWidgets(3));
    });

    testWidgets('separates visits and puts the newest first', (tester) async {
      library = FakePhotoLibrary(
        assets: [
          ..._photosAt(_prague, count: 2, daysAgo: 2191, prefix: 'old'),
          ..._photosAt(_prague, count: 1, daysAgo: 30, prefix: 'recent'),
        ],
      );

      await tester.pumpWidget(app());
      await settle(tester, frames: 40);

      final ageTexts = tester
          .widgetList<Text>(find.byType(Text))
          .map((t) => t.data)
          .whereType<String>()
          .where((t) => t.contains('ago'))
          .toList();

      expect(ageTexts.first, 'A month ago');
      expect(ageTexts, contains('6 years ago'));
    });

    testWidgets('excludes photos outside the radius', (tester) async {
      library = FakePhotoLibrary(
        assets: [
          ..._photosAt(_prague, count: 1, daysAgo: 100, prefix: 'near'),
          ..._photosAt(
            _north(_prague, 3000),
            count: 5,
            daysAgo: 100,
            prefix: 'far',
          ),
        ],
      );

      await tester.pumpWidget(app());
      await settle(tester, frames: 40);

      expect(find.byType(PhotoThumbnail), findsNWidgets(1));
    });

    testWidgets('widening the radius brings the rest in', (tester) async {
      library = FakePhotoLibrary(
        assets: [
          ..._photosAt(_prague, count: 1, daysAgo: 100, prefix: 'near'),
          ..._photosAt(
            _north(_prague, 3000),
            count: 2,
            daysAgo: 100,
            prefix: 'far',
          ),
        ],
      );

      await tester.pumpWidget(app());
      await settle(tester, frames: 40);
      expect(find.byType(PhotoThumbnail), findsNWidgets(1));

      final context = tester.element(find.byType(Scaffold));
      final container = ProviderScope.containerOf(context);
      container.read(searchRadiusProvider.notifier).meters = 10000;
      await settle(tester, frames: 40);

      expect(find.byType(PhotoThumbnail), findsNWidgets(3));
    });
  });

  group('nothing here', () {
    testWidgets('offers the distance to the closest memory', (tester) async {
      library = FakePhotoLibrary(
        assets: _photosAt(
          _north(_prague, 12000),
          count: 1,
          daysAgo: 500,
          prefix: 'far',
        ),
      );

      await tester.pumpWidget(app());
      await settle(tester, frames: 40);

      expect(find.text("You haven't taken photos here"), findsOneWidget);
      expect(find.textContaining('12 km away'), findsOneWidget);
    });

    testWidgets('the suggested radius actually reveals it', (tester) async {
      library = FakePhotoLibrary(
        assets: _photosAt(
          _north(_prague, 12000),
          count: 1,
          daysAgo: 500,
          prefix: 'far',
        ),
      );

      await tester.pumpWidget(app());
      await settle(tester, frames: 40);

      await tester.tap(find.textContaining('Within 13'));
      await settle(tester, frames: 40);

      expect(find.byType(PhotoThumbnail), findsNWidgets(1));
    });

    testWidgets('an empty index just says there is nothing here', (
      tester,
    ) async {
      library = FakePhotoLibrary();

      await tester.pumpWidget(app());
      await settle(tester, frames: 40);

      expect(find.text("You haven't taken photos here"), findsOneWidget);
      expect(find.textContaining('away'), findsNothing);
    });
  });

  group('debug location', () {
    testWidgets('moves the screen somewhere else', (tester) async {
      const brno = GeoPoint(49.1951, 16.6068);
      library = FakePhotoLibrary(
        assets: _photosAt(brno, count: 2, daysAgo: 300, prefix: 'brno'),
      );

      await tester.pumpWidget(app());
      await settle(tester, frames: 40);
      expect(find.byType(PhotoThumbnail), findsNothing);

      await tester.longPress(find.text('Here'));
      await settle(tester);

      expect(find.text('Debug location'), findsOneWidget);
      await tester.enterText(find.byType(TextField).first, '49.1951');
      await tester.enterText(find.byType(TextField).last, '16.6068');
      await tester.tap(find.text('Go there'));
      await settle(tester, frames: 40);

      expect(find.byType(PhotoThumbnail), findsNWidgets(2));
    });
  });

  group('presentation', () {
    testWidgets('renders in Czech', (tester) async {
      library = FakePhotoLibrary(
        assets: _photosAt(_prague, count: 1, daysAgo: 800, prefix: 'cs'),
      );
      tester.platformDispatcher.localesTestValue = const [Locale('cs')];
      addTearDown(tester.platformDispatcher.clearLocalesTestValue);

      await tester.pumpWidget(app());
      await settle(tester, frames: 40);

      expect(find.text('Tady'), findsOneWidget);
      expect(find.text('před 2 lety'), findsOneWidget);
      expect(find.text('V okruhu 500 m'), findsOneWidget);
    });

    testWidgets('adapts to the dark theme', (tester) async {
      library = FakePhotoLibrary(
        assets: _photosAt(_prague, count: 1, daysAgo: 5),
      );
      tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
      addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);

      await tester.pumpWidget(app());
      await settle(tester);

      final context = tester.element(find.byType(Scaffold));
      expect(Theme.of(context).brightness, Brightness.dark);
    });
  });
}
