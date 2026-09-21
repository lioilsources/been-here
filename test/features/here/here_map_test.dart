import 'package:been_here/app/app.dart';
import 'package:been_here/app/providers.dart';
import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/location/fake_location_service.dart';
import 'package:been_here/data/photos/fake_photo_library.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:been_here/domain/settings/app_settings.dart';
import 'package:been_here/features/here/widgets/here_map.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/onboarded.dart';

const _prague = GeoPoint(50.0755, 14.4378);

List<PhotoAsset> _photos() => [
  for (var i = 0; i < 4; i++)
    PhotoAsset(
      id: 'near-$i',
      lat: _prague.lat + i * 0.0002,
      lng: _prague.lng,
      takenAt: DateTime.utc(2019, 7, 4, 10 + i),
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
    library = FakePhotoLibrary(assets: _photos());
    location = FakeLocationService(at: _prague);
  });

  tearDown(() async {
    await library.dispose();
    await db.close();
  });

  testWidgets('no map until the user asks for one', (tester) async {
    await tester.pumpWidget(app());
    await settle(tester);

    // Nothing has been fetched from a tile server.
    expect(find.byType(FlutterMap), findsNothing);
    // But there is still a way to see where this is.
    expect(find.text('Open in Maps'), findsOneWidget);
  });

  testWidgets('turning maps on puts one under the slider', (tester) async {
    await SettingsStore(db.preferencesDao).setMapEnabled(enabled: true);

    await tester.pumpWidget(app());
    await settle(tester);

    expect(find.byType(HereMapCard), findsOneWidget);
    expect(find.byType(FlutterMap), findsOneWidget);
  });

  testWidgets('an empty place has no map at all', (tester) async {
    await SettingsStore(db.preferencesDao).setMapEnabled(enabled: true);
    library = FakePhotoLibrary(assets: []);

    await tester.pumpWidget(app());
    await settle(tester);

    // Nothing here to draw; the empty state says so instead.
    expect(find.byType(HereMapCard), findsNothing);
  });
}
