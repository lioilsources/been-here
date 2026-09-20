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
/// Seed a simulator first and grant access, otherwise the system dialogs
/// block the test harness:
///
/// ```sh
/// xcrun simctl addmedia <device> photo.jpg
/// xcrun simctl privacy <device> grant photos com.lioilsources.beenhere
/// xcrun simctl privacy <device> grant location com.lioilsources.beenhere
/// xcrun simctl location <device> set 50.0755,14.4378
/// flutter test integration_test -d <device>
/// ```
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

  /// Taps [label] if it is on screen. Returns whether it was.
  Future<bool> tapIfPresent(WidgetTester tester, String label) async {
    final finder = find.text(label);
    if (finder.evaluate().isEmpty) return false;
    await tester.tap(finder);
    await tester.pump(const Duration(seconds: 3));
    return true;
  }

  testWidgets('indexes the real photo library', (tester) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final photos = container.read(photoLibraryProvider);
    debugPrint('PHOTO PERMISSION: ${await photos.currentPermission()}');

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const BeenHereApp(),
      ),
    );
    await tester.pump(const Duration(seconds: 1));

    if (await tapIfPresent(tester, 'Allow access')) {
      debugPrint('PHOTO PERMISSION AFTER: ${await photos.currentPermission()}');
      debugPrint('ASSET COUNT: ${await photos.assetCount()}');
    }

    await pumpUntil(
      tester,
      () =>
          find.textContaining('Within').evaluate().isNotEmpty ||
          find.text('Where are you?').evaluate().isNotEmpty ||
          find.text('Location is off').evaluate().isNotEmpty,
    );

    final stats = await container.read(indexStatsProvider.future);
    debugPrint(
      'INDEXED: ${stats.total} photos, '
      '${stats.locationPercent}% with a location',
    );

    expect(stats.total, greaterThan(0));
    expect(
      stats.locationPercent,
      greaterThan(0),
      reason: 'no indexed photo carried a location',
    );
  });

  testWidgets('shows what is at the current location', (tester) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const BeenHereApp(),
      ),
    );
    await tester.pump(const Duration(seconds: 1));

    await tapIfPresent(tester, 'Allow access');
    await tapIfPresent(tester, 'Use my location');

    await pumpUntil(
      tester,
      () => find.textContaining('Within').evaluate().isNotEmpty,
    );

    // The radius slider is the screen doing its job: a location, an index,
    // and a count of what is around.
    final radius = find.textContaining('Within');
    expect(radius, findsOneWidget);
    debugPrint('RADIUS: ${tester.widget<Text>(radius).data}');

    final here = await container.read(memoriesHereProvider.future);
    debugPrint(
      'HERE: ${here?.photoCount} photos in '
      '${here?.visits.length} visits at ${here?.center}',
    );

    // Either the timeline or the "nothing here" state — both are correct
    // answers, and which one depends on where the device thinks it is.
    final hasVisits = (here?.visits.length ?? 0) > 0;
    final saysNothing = find
        .text("You haven't taken photos here")
        .evaluate()
        .isNotEmpty;
    expect(
      hasVisits || saysNothing,
      isTrue,
      reason: 'the screen showed neither visits nor an empty state',
    );
  });
}
