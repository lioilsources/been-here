import 'package:been_here/app/app.dart';
import 'package:been_here/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

/// Runs on a real device or simulator against the real photo library.
///
/// This is the one test that exercises PhotoKit / MediaStore itself: whether
/// the app can enumerate assets, read their capture dates and get GPS out of
/// them. Everything below that is covered by the fake in `test/`.
///
/// Seed a simulator first, e.g.
/// `xcrun simctl addmedia <device> photo.jpg`, then
/// `flutter test integration_test -d <device>`.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  /// Pumps without waiting for the progress indicator, which never settles,
  /// until [condition] holds or the budget runs out.
  Future<void> pumpUntil(
    WidgetTester tester,
    bool Function() condition, {
    Duration timeout = const Duration(seconds: 90),
  }) async {
    final deadline = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(deadline)) {
      if (condition()) return;
      await tester.pump(const Duration(milliseconds: 100));
    }
    final visible = find
        .byType(Text)
        .evaluate()
        .map((e) => (e.widget as Text).data)
        .where((t) => t != null)
        .join(' | ');
    fail('condition not met within $timeout. On screen: $visible');
  }

  testWidgets('indexes the real photo library', (tester) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final photos = container.read(photoLibraryProvider);
    debugPrint('PERMISSION BEFORE: ${await photos.currentPermission()}');

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const BeenHereApp(),
      ),
    );
    await tester.pump(const Duration(seconds: 1));

    // Grant access if the app is asking. On a device already granted, the
    // button is not there and this is a no-op.
    final allow = find.text('Allow access');
    if (allow.evaluate().isNotEmpty) {
      await tester.tap(allow);
      await tester.pump(const Duration(seconds: 3));
      debugPrint('PERMISSION AFTER: ${await photos.currentPermission()}');
      debugPrint('ASSET COUNT: ${await photos.assetCount()}');
    }

    await pumpUntil(
      tester,
      () => find.textContaining('photos indexed').evaluate().isNotEmpty,
    );

    final summary = tester.widget<Text>(
      find.textContaining('photos indexed').first,
    );
    debugPrint('INDEXED: ${summary.data}');

    final coverage = find.textContaining('have a location');
    expect(coverage, findsOneWidget);
    debugPrint(
      'COVERAGE: ${tester.widget<Text>(coverage).data}',
    );

    // Something was read out of the library, and at least one photo kept its
    // coordinates through the EXIF/PhotoKit round trip.
    expect(summary.data, isNot(contains('No photos')));
    expect(
      tester.widget<Text>(coverage).data,
      isNot(startsWith('0%')),
      reason: 'no indexed photo carried a location',
    );
  });
}
