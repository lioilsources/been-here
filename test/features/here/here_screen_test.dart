import 'package:been_here/app/app.dart';
import 'package:been_here/app/providers.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/photos/fake_photo_library.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

List<PhotoAsset> _photos(int count) => [
  for (var i = 0; i < count; i++)
    PhotoAsset(
      id: 'asset-$i',
      lat: i.isEven ? 50.0755 + i * 0.0001 : null,
      lng: i.isEven ? 14.4378 : null,
      takenAt: DateTime.utc(2024, 1, 1 + i),
      width: 100,
      height: 100,
    ),
];

void main() {
  late AppDatabase db;
  late FakePhotoLibrary library;

  Widget app() => ProviderScope(
    overrides: [
      databaseProvider.overrideWithValue(db),
      photoLibraryProvider.overrideWithValue(library),
    ],
    child: const BeenHereApp(),
  );

  /// Lets the permission future, the post-frame sync kick-off and a few
  /// indexing batches land, without waiting for the progress indicator's
  /// animation (which never settles).
  Future<void> settle(WidgetTester tester, {int frames = 12}) async {
    for (var i = 0; i < frames; i++) {
      await tester.pump(const Duration(milliseconds: 20));
    }
  }

  setUp(() {
    db = AppDatabase.withExecutor(NativeDatabase.memory());
  });

  tearDown(() async {
    await library.dispose();
    await db.close();
  });

  group('photo permission', () {
    testWidgets('asks for access when it has none', (tester) async {
      library = FakePhotoLibrary(
        assets: _photos(3),
        permission: PhotoPermission.notDetermined,
        permissionAfterRequest: PhotoPermission.authorized,
      );

      await tester.pumpWidget(app());
      await settle(tester);

      expect(find.text('Been Here needs your photos'), findsOneWidget);
      expect(find.text('Allow access'), findsOneWidget);
    });

    testWidgets('moves on once access is granted', (tester) async {
      library = FakePhotoLibrary(
        assets: _photos(3),
        permission: PhotoPermission.notDetermined,
        permissionAfterRequest: PhotoPermission.authorized,
      );

      await tester.pumpWidget(app());
      await settle(tester);

      await tester.tap(find.text('Allow access'));
      await settle(tester, frames: 25);

      expect(find.text('Allow access'), findsNothing);
      expect(find.text('3 photos indexed'), findsOneWidget);
    });

    testWidgets('explains a denial without offering a dead button', (
      tester,
    ) async {
      library = FakePhotoLibrary(
        assets: _photos(3),
        permission: PhotoPermission.denied,
      );

      await tester.pumpWidget(app());
      await settle(tester);

      expect(find.text('Photo access is off'), findsOneWidget);
      expect(find.text('Allow access'), findsNothing);
      expect(find.byType(FilledButton), findsNothing);
    });

    testWidgets('shows the limited-access notice but still works', (
      tester,
    ) async {
      library = FakePhotoLibrary(
        assets: _photos(3),
        permission: PhotoPermission.limited,
      );

      await tester.pumpWidget(app());
      await settle(tester, frames: 25);

      expect(
        find.textContaining('only selected photos'),
        findsOneWidget,
      );
      expect(find.text('3 photos indexed'), findsOneWidget);
    });
  });

  group('indexing', () {
    testWidgets('shows progress while a pass is running', (tester) async {
      library = FakePhotoLibrary(
        assets: _photos(900),
        pageDelay: const Duration(milliseconds: 60),
      );

      await tester.pumpWidget(app());
      await settle(tester, frames: 6);

      expect(find.text('Reading your photo library'), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsOneWidget);

      await settle(tester, frames: 40);
      expect(find.text('900 photos indexed'), findsOneWidget);
    });

    testWidgets('reports how many indexed photos have a location', (
      tester,
    ) async {
      library = FakePhotoLibrary(assets: _photos(4));

      await tester.pumpWidget(app());
      await settle(tester, frames: 25);

      expect(find.text('4 photos indexed'), findsOneWidget);
      expect(find.text('50% of them have a location'), findsOneWidget);
    });

    testWidgets('offers to index when the library is empty', (tester) async {
      library = FakePhotoLibrary();

      await tester.pumpWidget(app());
      await settle(tester, frames: 25);

      expect(find.text('Nothing indexed yet'), findsOneWidget);
      expect(find.text('Index my photos'), findsOneWidget);
    });
  });

  group('presentation', () {
    testWidgets('starts on the Here screen', (tester) async {
      library = FakePhotoLibrary(assets: _photos(1));

      await tester.pumpWidget(app());
      await settle(tester);

      expect(find.text('Here'), findsOneWidget);
    });

    testWidgets('renders in Czech when the locale asks for it', (tester) async {
      library = FakePhotoLibrary(assets: _photos(2));
      tester.platformDispatcher.localesTestValue = const [Locale('cs')];
      addTearDown(tester.platformDispatcher.clearLocalesTestValue);

      await tester.pumpWidget(app());
      await settle(tester, frames: 25);

      expect(find.text('Tady'), findsOneWidget);
      expect(find.text('2 zaindexované fotky'), findsOneWidget);
    });

    testWidgets('adapts to the dark theme', (tester) async {
      library = FakePhotoLibrary(assets: _photos(1));
      tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
      addTearDown(
        tester.platformDispatcher.clearPlatformBrightnessTestValue,
      );

      await tester.pumpWidget(app());
      await settle(tester);

      final context = tester.element(find.byType(Scaffold));
      expect(Theme.of(context).brightness, Brightness.dark);
    });
  });
}
