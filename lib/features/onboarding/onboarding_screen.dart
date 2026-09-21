import 'dart:async';

import 'package:been_here/app/providers.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Three screens before the app starts: what it does, what it doesn't do
/// with your photos, and the one permission it cannot work without.
///
/// Location is deliberately not here. It is asked for on the Here screen,
/// where the answer is visibly about to be used — a permission sheet makes
/// far more sense next to an empty screen that wants it than in a row of
/// introductions.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _controller = PageController();
  int _page = 0;
  bool _asking = false;

  static const int _pages = 3;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _finish() async =>
      ref.read(settingsProvider.notifier).setOnboardingSeen(seen: true);

  Future<void> _next() async {
    if (_page < _pages - 1) {
      await _controller.nextPage(
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOut,
      );
      return;
    }

    // Last page: ask for photos, then get out of the way. A refusal still
    // finishes the intro — the Here screen explains itself and offers the
    // way back, and repeating the introduction would not change the answer.
    setState(() => _asking = true);
    try {
      final permission = await ref.read(photoPermissionProvider.future);
      if (permission == PhotoPermission.notDetermined) {
        await ref.read(photoLibraryProvider).requestPermission();
        ref.invalidate(photoPermissionProvider);
      }
    } finally {
      if (mounted) setState(() => _asking = false);
    }
    await _finish();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final canAsk =
        ref.watch(photoPermissionProvider).value ==
        PhotoPermission.notDetermined;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => unawaited(_finish()),
                child: Text(l10n.onboardingSkip),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (i) => setState(() => _page = i),
                children: [
                  _Page(
                    icon: Icons.access_time,
                    title: l10n.onboardingWhatTitle,
                    body: l10n.onboardingWhatBody,
                  ),
                  _Page(
                    icon: Icons.lock_outline,
                    title: l10n.onboardingPrivacyTitle,
                    body: l10n.onboardingPrivacyBody,
                    footnote: l10n.onboardingPrivacyFootnote,
                  ),
                  _Page(
                    icon: Icons.photo_library_outlined,
                    title: l10n.onboardingPhotosTitle,
                    body: l10n.onboardingPhotosBody,
                  ),
                ],
              ),
            ),
            _Dots(count: _pages, current: _page),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 24, 32, 24),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _asking ? null : () => unawaited(_next()),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(52),
                    textStyle: theme.textTheme.titleMedium,
                  ),
                  child: Text(
                    switch ((last: _page == _pages - 1, canAsk: canAsk)) {
                      (last: true, canAsk: true) => l10n.onboardingPhotosAction,
                      (last: true, canAsk: false) => l10n.onboardingDone,
                      _ => l10n.onboardingNext,
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({
    required this.icon,
    required this.title,
    required this.body,
    this.footnote,
  });

  final IconData icon;
  final String title;
  final String body;
  final String? footnote;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Scrollable because the text is long and someone reading it at the
    // largest accessibility text size still has to reach the end of it.
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 56, color: theme.colorScheme.primary),
          const SizedBox(height: 28),
          Text(
            title,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            body,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
          if (footnote != null) ...[
            const SizedBox(height: 20),
            Text(
              footnote!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.outline,
                height: 1.4,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({required this.count, required this.current});

  final int count;
  final int current;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < count; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: i == current ? 22 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: i == current ? scheme.primary : scheme.outlineVariant,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
      ],
    );
  }
}
