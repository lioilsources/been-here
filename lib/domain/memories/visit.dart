import 'package:been_here/core/time/local_day.dart';
import 'package:meta/meta.dart';

/// Local calendar days this far apart still belong to the same visit.
///
/// One means strictly consecutive days: a weekend trip is one visit, two
/// separate weekends are two.
const int maxVisitGapDays = 1;

/// One stay in a place — a single trip, day out or evening.
///
/// Holds when and how many, not which: the timeline is built from timestamps
/// alone, and a visit's photos are fetched only when it is on screen. On a
/// dense neighbourhood that is the difference between a query that takes 20
/// milliseconds and one that takes 60.
@immutable
class Visit {
  const Visit({
    required this.date,
    required this.startedAt,
    required this.endedAt,
    required this.photoCount,
  });

  /// Local calendar date the visit started on. Date-only.
  final DateTime date;

  /// First and last capture time, UTC.
  final DateTime startedAt;
  final DateTime endedAt;

  final int photoCount;

  /// True for a visit that ran over more than one calendar day.
  bool spansMultipleDays({LocalDay localDay = const SystemLocalDay()}) =>
      localDay.dayNumberOf(endedAt) != localDay.dayNumberOf(startedAt);

  @override
  bool operator ==(Object other) =>
      other is Visit &&
      other.date == date &&
      other.startedAt == startedAt &&
      other.endedAt == endedAt &&
      other.photoCount == photoCount;

  @override
  int get hashCode => Object.hash(date, startedAt, endedAt, photoCount);

  @override
  String toString() => 'Visit($date, $photoCount photos)';
}

bool _isAscending(List<DateTime> values) {
  for (var i = 1; i < values.length; i++) {
    if (values[i].isBefore(values[i - 1])) return false;
  }
  return true;
}

/// Groups capture times into visits: local calendar days, with runs of
/// consecutive days folded into one.
///
/// Returns visits newest first — the user is standing here now, so "last
/// time" is the interesting one.
List<Visit> groupIntoVisits(
  List<DateTime> takenAt, {
  LocalDay localDay = const SystemLocalDay(),
}) {
  if (takenAt.isEmpty) return const [];

  // The query hands these over already ordered; re-sorting tens of thousands
  // of them for nothing is measurable, and checking costs one pass.
  final sorted = _isAscending(takenAt) ? takenAt : ([...takenAt]..sort());

  final visits = <Visit>[];
  var start = sorted.first;
  var end = sorted.first;
  var count = 0;
  var previousDay = localDay.dayNumberOf(sorted.first);

  void close() {
    visits.add(
      Visit(
        date: localDay.dateOf(start),
        startedAt: start,
        endedAt: end,
        photoCount: count,
      ),
    );
  }

  for (final instant in sorted) {
    final day = localDay.dayNumberOf(instant);
    if (count > 0 && day - previousDay > maxVisitGapDays) {
      close();
      start = instant;
      count = 0;
    }
    end = instant;
    previousDay = day;
    count++;
  }
  close();

  return visits.reversed.toList();
}
