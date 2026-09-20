import 'package:meta/meta.dart';

/// Which calendar day an instant falls on.
///
/// "Which day was this photo taken" is a question about the viewer's
/// timezone, not about the row: the database stores unix seconds UTC, and a
/// photo taken at 00:30 in Prague belongs to that Prague day, not to the UTC
/// one before it. Grouping goes through this so the rule is explicit and
/// testable rather than an implicit `toLocal()` scattered around.
abstract interface class LocalDay {
  /// Days since 1970-01-01 in this calendar. Consecutive days always differ
  /// by exactly one, daylight saving included.
  int dayNumberOf(DateTime instant);

  /// The local calendar date of [instant], as a date-only [DateTime].
  DateTime dateOf(DateTime instant);
}

/// The device's own timezone, daylight saving and all.
@immutable
class SystemLocalDay implements LocalDay {
  const SystemLocalDay();

  @override
  int dayNumberOf(DateTime instant) {
    final local = instant.toLocal();
    return daysFromCivil(local.year, local.month, local.day);
  }

  @override
  DateTime dateOf(DateTime instant) {
    final local = instant.toLocal();
    return DateTime(local.year, local.month, local.day);
  }
}

/// A fixed offset from UTC. For tests, where the machine's timezone is not
/// something to build assertions on.
@immutable
class FixedOffsetLocalDay implements LocalDay {
  const FixedOffsetLocalDay(this.offset);

  final Duration offset;

  @override
  int dayNumberOf(DateTime instant) {
    final shifted = instant.toUtc().add(offset);
    return daysFromCivil(shifted.year, shifted.month, shifted.day);
  }

  @override
  DateTime dateOf(DateTime instant) {
    final shifted = instant.toUtc().add(offset);
    return DateTime(shifted.year, shifted.month, shifted.day);
  }
}

/// Days since the epoch for a proleptic Gregorian date.
///
/// Howard Hinnant's `days_from_civil`. Used instead of dividing an epoch
/// timestamp by 86400: across a daylight-saving change local midnights are 23
/// or 25 hours apart, which makes that division skip or repeat a day.
int daysFromCivil(int year, int month, int day) {
  final y = year - (month <= 2 ? 1 : 0);
  final era = (y >= 0 ? y : y - 399) ~/ 400;
  final yearOfEra = y - era * 400;
  final dayOfYear = (153 * (month + (month > 2 ? -3 : 9)) + 2) ~/ 5 + day - 1;
  final dayOfEra =
      yearOfEra * 365 + yearOfEra ~/ 4 - yearOfEra ~/ 100 + dayOfYear;
  return era * 146097 + dayOfEra - 719468;
}
