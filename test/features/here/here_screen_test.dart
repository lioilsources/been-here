import 'package:been_here/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('starts on the Here screen with the not-indexed state', (
    tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: BeenHereApp()));
    await tester.pumpAndSettle();

    expect(find.text('Here'), findsOneWidget);
    expect(find.text('Nothing indexed yet'), findsOneWidget);
    expect(find.textContaining('Nothing leaves your phone'), findsOneWidget);
  });

  testWidgets('renders in Czech when the locale asks for it', (tester) async {
    tester.platformDispatcher.localesTestValue = const [Locale('cs')];
    addTearDown(tester.platformDispatcher.clearLocalesTestValue);

    await tester.pumpWidget(const ProviderScope(child: BeenHereApp()));
    await tester.pumpAndSettle();

    expect(find.text('Tady'), findsOneWidget);
    expect(find.text('Zatím nic nezaindexováno'), findsOneWidget);
  });

  testWidgets('adapts to the dark theme', (tester) async {
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
    addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);

    await tester.pumpWidget(const ProviderScope(child: BeenHereApp()));
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(Scaffold));
    expect(Theme.of(context).brightness, Brightness.dark);
  });
}
