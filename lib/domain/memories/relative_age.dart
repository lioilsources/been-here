import 'package:been_here/core/time/local_day.dart';
import 'package:meta/meta.dart';

enum AgeUnit { today, yesterday, days, months, years }

/// How long ago something was, at the granularity a person would use.
///
/// "Six years ago" is the line that makes the app work; "2191 days ago" is
/// not. The unit is chosen here and the wording happens in the UI, because
/// only the UI knows the language.
@immutable
class RelativeAge {
  const RelativeAge(this.unit, [this.amount = 0]);

  final AgeUnit unit;

  /// How many of [unit]. Zero for today and yesterday.
  final int amount;

  @override
  bool operator ==(Object other) =>
      other is RelativeAge && other.unit == unit && other.amount == amount;

  @override
  int get hashCode => Object.hash(unit, amount);

  @override
  String toString() => 'RelativeAge(${unit.name}, $amount)';
}

/// Age of [instant] as of [now], in local calendar terms.
///
/// Calendar-aware rather than arithmetic on elapsed seconds: a photo from
/// 23:50 yesterday is "yesterday" even though it is nine hours old, and
/// "a year ago" means the date, not 365.25 × 86400 seconds.
RelativeAge relativeAge({
  required DateTime instant,
  required DateTime now,
  LocalDay localDay = const SystemLocalDay(),
}) {
  final days = localDay.dayNumberOf(now) - localDay.dayNumberOf(instant);
  if (days <= 0) return const RelativeAge(AgeUnit.today);
  if (days == 1) return const RelativeAge(AgeUnit.yesterday);
  if (days < 30) return RelativeAge(AgeUnit.days, days);

  final then = localDay.dateOf(instant);
  final today = localDay.dateOf(now);

  var months = (today.year - then.year) * 12 + (today.month - then.month);
  // Not a full month yet if the day of the month hasn't come round.
  if (today.day < then.day) months -= 1;

  if (months < 12) return RelativeAge(AgeUnit.months, months < 1 ? 1 : months);
  return RelativeAge(AgeUnit.years, months ~/ 12);
}
