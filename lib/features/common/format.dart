import 'package:been_here/domain/memories/relative_age.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';

/// A distance a person would say out loud: metres up close, kilometres once
/// the metres stop meaning anything.
String formatDistance(AppLocalizations l10n, double meters) {
  if (meters < 1000) {
    // Round to 10 m — a GPS fix is not accurate enough to justify more.
    final rounded = (meters / 10).round() * 10;
    return l10n.distanceMeters(rounded);
  }
  final km = meters / 1000;
  final text = km < 10 ? km.toStringAsFixed(1) : km.round().toString();
  return l10n.distanceKilometers(text);
}

/// A radius for the slider label. Same rules, but never "0 m".
String formatRadius(AppLocalizations l10n, double meters) =>
    formatDistance(l10n, meters < 10 ? 10 : meters);

String formatRelativeAge(AppLocalizations l10n, RelativeAge age) =>
    switch (age.unit) {
      AgeUnit.today => l10n.ageToday,
      AgeUnit.yesterday => l10n.ageYesterday,
      AgeUnit.days => l10n.ageDaysAgo(age.amount),
      AgeUnit.months => l10n.ageMonthsAgo(age.amount),
      AgeUnit.years => l10n.ageYearsAgo(age.amount),
    };
