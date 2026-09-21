import 'package:been_here/app/app.dart';
import 'package:been_here/app/providers.dart';
import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/location/fake_location_service.dart';
import 'package:been_here/data/photos/fake_photo_library.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/onboarded.dart';

const _prague = GeoPoint(50.0755, 14.4378);

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

  Future<void> settle(WidgetTester tester, {int frames = 30}) async {
    for (var i = 0; i < frames; i++) {
      await tester.pump(const Duration(milliseconds: 20));
    }
  }

  setUp(() {
    db = AppDatabase.withExecutor(NativeDatabase.memory());
    library = FakePhotoLibrary(
      permission: PhotoPermission.notDetermined,
      permissionAfterRequest: PhotoPermission.authorized,
    );
    location = FakeLocationService(at: _prague);
  });

  tearDown(() async {
    await library.dispose();
    await db.close();
  });

  testWidgets('opens on the intro and walks to the photo permission', (
    tester,
  ) async {
    await tester.pumpWidget(app());
    await settle(tester);

    expect(
      find.text('Photos from the spot you are standing on'),
      findsOneWidget,
    );
    // Nothing has been asked for yet — the first screen is a sentence, not a
    // permission dialog.
    expect(library.permission, PhotoPermission.notDetermined);

    await tester.tap(find.text('Next'));
    await settle(tester);
    expect(find.text('Nothing leaves your phone'), findsOneWidget);

    await tester.tap(find.text('Next'));
    await settle(tester);
    expect(find.text('It needs your photos'), findsOneWidget);

    await tester.tap(find.text('Allow photos'));
    await settle(tester, frames: 60);

    expect(library.permission, PhotoPermission.authorized);
    // And the intro is gone for good.
    expect(find.text('It needs your photos'), findsNothing);
    expect(find.text('Here'), findsWidgets);
  });

  testWidgets('skipping still finishes the intro', (tester) async {
    await tester.pumpWidget(app());
    await settle(tester);

    await tester.tap(find.text('Skip'));
    await settle(tester, frames: 60);

    expect(find.text('Photos from the spot you are standing on'), findsNothing);
    // Skipped, so nothing was asked; the Here screen takes over the asking.
    expect(library.permission, PhotoPermission.notDetermined);
    expect(find.text('Been Here needs your photos'), findsOneWidget);
  });

  testWidgets('a phone that has seen it once goes straight in', (tester) async {
    await markOnboarded(db);

    await tester.pumpWidget(app());
    await settle(tester);

    expect(find.text('Photos from the spot you are standing on'), findsNothing);
    expect(find.text('Been Here needs your photos'), findsOneWidget);
  });

  testWidgets('a refusal still lets the app start', (tester) async {
    library = FakePhotoLibrary(
      permission: PhotoPermission.notDetermined,
      permissionAfterRequest: PhotoPermission.denied,
    );

    await tester.pumpWidget(app());
    await settle(tester);
    await tester.tap(find.text('Next'));
    await settle(tester);
    await tester.tap(find.text('Next'));
    await settle(tester);
    await tester.tap(find.text('Allow photos'));
    await settle(tester, frames: 60);

    // The intro does not trap anyone: refusing ends it, and the Here screen
    // explains what is missing.
    expect(find.text('It needs your photos'), findsNothing);
    expect(find.text('Photo access is off'), findsOneWidget);
  });

  testWidgets('reads in Czech', (tester) async {
    tester.platformDispatcher.localesTestValue = const [Locale('cs')];
    addTearDown(tester.platformDispatcher.clearLocalesTestValue);

    await tester.pumpWidget(app());
    await settle(tester);

    expect(find.text('Fotky z místa, kde právě stojíš'), findsOneWidget);
    await tester.tap(find.text('Dál'));
    await settle(tester);
    expect(find.text('Nic neopouští telefon'), findsOneWidget);
  });
}
