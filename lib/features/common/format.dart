import 'package:been_here/domain/memories/age_window.dart';
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

/// One stop on the photo age slider, by its index into [AgeWindow.stops].
String formatAgeStop(AppLocalizations l10n, int index) => switch (index) {
  0 => l10n.ageStopNow,
  1 => l10n.ageStopDay,
  2 => l10n.ageStop3Days,
  3 => l10n.ageStopWeek,
  4 => l10n.ageStop2Weeks,
  5 => l10n.ageStopMonth,
  6 => l10n.ageStop3Months,
  7 => l10n.ageStop6Months,
  8 => l10n.ageStopYear,
  9 => l10n.ageStop2Years,
  10 => l10n.ageStop5Years,
  11 => l10n.ageStop10Years,
  _ => l10n.ageStopAll,
};

/// The age window as a sentence: "Up to 2 years old", "2 weeks to 2 years
/// old", "Older than 1 year", "All photos".
String formatAgeWindow(AppLocalizations l10n, AgeWindow window) {
  if (window.isAll) return l10n.ageWindowAll;
  if (window.newest == 0) {
    return l10n.ageWindowNewerThan(formatAgeStop(l10n, window.oldest));
  }
  if (window.oldest == AgeWindow.unbounded) {
    return l10n.ageWindowOlderThan(formatAgeStop(l10n, window.newest));
  }
  return l10n.ageWindowBetween(
    formatAgeStop(l10n, window.newest),
    formatAgeStop(l10n, window.oldest),
  );
}
