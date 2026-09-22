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
const _berlin = GeoPoint(52.5251, 13.3694);

/// Where the map is actually looking, as opposed to where it was told to
/// look when it was built.
MapCamera _cameraOf(WidgetTester tester) =>
    MapCamera.of(tester.element(find.byType(CircleLayer).first));

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

  testWidgets('follows the screen when it is pointed somewhere else', (
    tester,
  ) async {
    // Photos in both places, so the map card is on screen either way.
    library = FakePhotoLibrary(
      assets: [
        ..._photos(),
        for (var i = 0; i < 3; i++)
          PhotoAsset(
            id: 'berlin-$i',
            lat: _berlin.lat,
            lng: _berlin.lng,
            takenAt: DateTime.utc(2022, 9, 19 + i),
            width: 4032,
            height: 3024,
          ),
      ],
    );
    await SettingsStore(db.preferencesDao).setMapEnabled(enabled: true);

    await tester.pumpWidget(app());
    await settle(tester);

    expect(_cameraOf(tester).center.latitude, closeTo(_prague.lat, 0.01));

    // Now look at a place two thousand kilometres away, the way tapping a
    // place on the Places screen does.
    final container = ProviderScope.containerOf(
      tester.element(find.byType(Scaffold).first),
    );
    container.read(viewpointProvider.notifier).toPlace(_berlin, 1);
    await settle(tester);

    // The photos change; so must the map. `initialCenter` is only initial,
    // and the widget outlives the screen being pointed somewhere else.
    expect(_cameraOf(tester).center.latitude, closeTo(_berlin.lat, 0.01));
    expect(_cameraOf(tester).center.longitude, closeTo(_berlin.lng, 0.01));
  });

  testWidgets('dragging the map looks somewhere else', (tester) async {
    await SettingsStore(db.preferencesDao).setMapEnabled(enabled: true);

    await tester.pumpWidget(app());
    await settle(tester);

    // Into the full screen map, which is the one that pans.
    await tester.tap(find.byType(HereMapCard));
    await settle(tester);
    expect(find.byType(HereMapScreen), findsOneWidget);

    final container = ProviderScope.containerOf(
      tester.element(find.byType(HereMapScreen)),
    );
    expect(container.read(viewpointProvider).point, isNull);

    final before = _cameraOf(tester).center;
    await tester.drag(find.byType(FlutterMap), const Offset(-120, -80));
    await settle(tester);

    // The screen follows where the map ended up — after the pan settles,
    // not once per frame of it.
    final viewpoint = container.read(viewpointProvider);
    expect(viewpoint.source, ViewpointSource.map);
    expect(viewpoint.point, isNotNull);
    expect(viewpoint.point!.lat, isNot(closeTo(_prague.lat, 1e-9)));

    // And the camera stays where the finger left it: the screen moving to
    // the new centre must not shove the map back.
    final after = _cameraOf(tester).center;
    expect(after.latitude, isNot(closeTo(before.latitude, 1e-9)));
    expect(after.latitude, closeTo(viewpoint.point!.lat, 1e-6));
    expect(after.longitude, closeTo(viewpoint.point!.lng, 1e-6));
  });

  testWidgets('after dragging, the way back is on the Here screen', (
    tester,
  ) async {
    await SettingsStore(db.preferencesDao).setMapEnabled(enabled: true);

    await tester.pumpWidget(app());
    await settle(tester);
    await tester.tap(find.byType(HereMapCard));
    await settle(tester);
    await tester.drag(find.byType(FlutterMap), const Offset(-120, -80));
    await settle(tester);

    await tester.pageBack();
    await settle(tester);

    // Looking elsewhere is a state you must be able to leave.
    expect(find.byTooltip('Back to where I am'), findsOneWidget);
    await tester.tap(find.byTooltip('Back to where I am'));
    await settle(tester);

    final container = ProviderScope.containerOf(
      tester.element(find.byType(Scaffold).first),
    );
    expect(container.read(viewpointProvider).point, isNull);
  });

  testWidgets('the range can be changed from the map itself', (tester) async {
    await SettingsStore(db.preferencesDao).setMapEnabled(enabled: true);

    await tester.pumpWidget(app());
    await settle(tester);
    await tester.tap(find.byType(HereMapCard));
    await settle(tester);

    final container = ProviderScope.containerOf(
      tester.element(find.byType(HereMapScreen)),
    );
    final before = container.read(searchRadiusProvider);

    // You are looking at the circle, so the handle that sizes it is here.
    await tester.drag(find.byType(Slider), const Offset(60, 0));
    await settle(tester);

    expect(container.read(searchRadiusProvider), greaterThan(before));
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
