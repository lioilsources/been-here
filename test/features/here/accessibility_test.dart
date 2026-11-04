import 'package:been_here/app/app.dart';
import 'package:been_here/app/providers.dart';
import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/location/fake_location_service.dart';
import 'package:been_here/data/photos/fake_photo_library.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:been_here/domain/memories/age_window.dart';
import 'package:been_here/domain/settings/app_settings.dart';
import 'package:been_here/features/here/widgets/here_map.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/onboarded.dart';

const _prague = GeoPoint(50.0755, 14.4378);

List<PhotoAsset> _photos({int count = 3}) => [
  for (var i = 0; i < count; i++)
    PhotoAsset(
      id: 'old-$i',
      lat: _prague.lat,
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

  testWidgets('every photo is a named button, not a bare image', (
    tester,
  ) async {
    final handle = tester.ensureSemantics();
    await tester.pumpWidget(app());
    await settle(tester);

    // "Photo 1 of 3, July 4, 2019" — which picture, and when it was taken.
    expect(
      find.bySemanticsLabel(RegExp(r'^Photo 1 of 3, July 4, 2019$')),
      findsOneWidget,
    );
    expect(find.bySemanticsLabel(RegExp('^Photo 3 of 3, ')), findsOneWidget);

    handle.dispose();
  });

  testWidgets('the radius slider says what it is and where it is', (
    tester,
  ) async {
    final handle = tester.ensureSemantics();
    await tester.pumpWidget(app());
    await settle(tester);

    // The merged data: the name and the value sit on one node, which is
    // what a screen reader lands on.
    final slider = tester.getSemantics(find.byType(Slider)).getSemanticsData();
    expect(slider.label, contains('Search radius'));
    // Metres, not the 0..1 position the slider actually holds.
    expect(slider.value, contains('500'));

    handle.dispose();
  });

  testWidgets('the whole timeline survives the largest text size', (
    tester,
  ) async {
    tester.platformDispatcher.textScaleFactorTestValue = 2;
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

    await tester.pumpWidget(app());
    await settle(tester);

    // Nothing overflowed: an overflowing box throws during layout, and
    // tester.takeException() would hand it back here.
    expect(tester.takeException(), isNull);
    expect(find.byType(Slider), findsOneWidget);
  });

  group('the full map', () {
    Future<void> openMap(WidgetTester tester) async {
      await SettingsStore(db.preferencesDao).setMapEnabled(enabled: true);
      await tester.pumpWidget(app());
      await settle(tester);
      await tester.tap(find.byType(HereMapCard));
      await settle(tester);
    }

    testWidgets('the age slider says what it is, in words', (tester) async {
      final handle = tester.ensureSemantics();
      await openMap(tester);

      final semantics = tester
          .getSemantics(find.byType(RangeSlider))
          .getSemanticsData();
      expect(semantics.label, contains('Photo age'));

      // The thumbs read as spans of time, not as the stop's index.
      final spoken = <String>[];
      bool collect(SemanticsNode node) {
        spoken.add(node.getSemanticsData().value);
        node.visitChildren(collect);
        return true;
      }

      tester.getSemantics(find.byType(RangeSlider)).visitChildren(collect);

      final all = [semantics.value, ...spoken].join(' | ');
      expect(all, contains('2 years'));
      expect(all, isNot(contains('9')));

      handle.dispose();
    });

    testWidgets('a screen reader can move a thumb, and it is kept', (
      tester,
    ) async {
      final handle = tester.ensureSemantics();
      await openMap(tester);

      final container = ProviderScope.containerOf(
        tester.element(find.byType(HereMapScreen)),
      );

      // The old thumb, the one reading "2 years".
      SemanticsNode? oldThumb;
      bool find2Years(SemanticsNode node) {
        if (node.getSemanticsData().value == '2 years') oldThumb = node;
        node.visitChildren(find2Years);
        return true;
      }

      tester.getSemantics(find.byType(RangeSlider)).visitChildren(find2Years);
      expect(oldThumb, isNotNull);

      oldThumb!.owner!.performAction(oldThumb!.id, SemanticsAction.increase);
      await settle(tester);

      // One step further back: two years becomes five. Swipes have no
      // "let go", so this must not wait for one.
      expect(
        container.read(mapAgeWindowProvider).value,
        const AgeWindow(newest: 0, oldest: 10),
      );

      handle.dispose();
    });

    testWidgets('both sliders fit at the largest text size', (tester) async {
      tester.platformDispatcher.textScaleFactorTestValue = 2;
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

      await openMap(tester);

      expect(tester.takeException(), isNull);
      expect(find.byType(Slider), findsWidgets);
      expect(find.byType(RangeSlider), findsOneWidget);

      // The controls must leave most of the map to look at.
      final screen = tester.getSize(find.byType(HereMapScreen));
      final controls = tester.getRect(
        find
            .ancestor(
              of: find.byType(RangeSlider),
              matching: find.byType(DecoratedBox),
            )
            .first,
      );
      expect(controls.height / screen.height, lessThan(0.5));
    });
  });
}
