import 'package:been_here/core/time/local_day.dart';
import 'package:been_here/domain/memories/visit.dart';
import 'package:flutter_test/flutter_test.dart';

const _utc = FixedOffsetLocalDay(Duration.zero);
const _prague = FixedOffsetLocalDay(Duration(hours: 2));

void main() {
  group('groupIntoVisits', () {
    test('an empty list has no visits', () {
      expect(groupIntoVisits(const [], localDay: _utc), isEmpty);
    });

    test('one photo is one visit', () {
      final visits = groupIntoVisits([
        DateTime.utc(2024, 6, 10, 12),
      ], localDay: _utc);
      expect(visits, hasLength(1));
      expect(visits.single.photoCount, 1);
      expect(visits.single.date, DateTime(2024, 6, 10));
    });

    test('photos on the same day are one visit', () {
      final visits = groupIntoVisits([
        DateTime.utc(2024, 6, 10, 8),
        DateTime.utc(2024, 6, 10, 13),
        DateTime.utc(2024, 6, 10, 21),
      ], localDay: _utc);

      expect(visits, hasLength(1));
      expect(visits.single.photoCount, 3);
      expect(visits.single.startedAt, DateTime.utc(2024, 6, 10, 8));
      expect(visits.single.endedAt, DateTime.utc(2024, 6, 10, 21));
    });

    test('consecutive days are one visit', () {
      final visits = groupIntoVisits([
        DateTime.utc(2024, 6, 10, 18),
        DateTime.utc(2024, 6, 11, 9),
        DateTime.utc(2024, 6, 12, 15),
      ], localDay: _utc);

      expect(visits, hasLength(1));
      expect(visits.single.photoCount, 3);
      expect(visits.single.date, DateTime(2024, 6, 10));
      expect(visits.single.spansMultipleDays(localDay: _utc), isTrue);
    });

    test('a gap of a full day splits the visit', () {
      final visits = groupIntoVisits([
        DateTime.utc(2024, 6, 10, 18),
        DateTime.utc(2024, 6, 12, 9),
      ], localDay: _utc);

      expect(visits, hasLength(2));
      expect(visits.map((v) => v.photoCount), [1, 1]);
    });

    test('a long gap splits too', () {
      final visits = groupIntoVisits([
        DateTime.utc(2019, 7, 4),
        DateTime.utc(2024, 3),
      ], localDay: _utc);
      expect(visits, hasLength(2));
    });

    test('visits come back newest first', () {
      final visits = groupIntoVisits([
        DateTime.utc(2019, 7, 4),
        DateTime.utc(2024, 3),
        DateTime.utc(2021, 5, 12),
      ], localDay: _utc);

      expect(visits.map((v) => v.date.year), [2024, 2021, 2019]);
    });

    test('counts add up to the input', () {
      final times = [
        for (var day = 0; day < 20; day++)
          for (var shot = 0; shot < 3; shot++)
            DateTime.utc(2024, 6, 1 + day * 2, 10 + shot),
      ];
      final visits = groupIntoVisits(times, localDay: _utc);

      expect(
        visits.fold<int>(0, (sum, v) => sum + v.photoCount),
        times.length,
      );
      // Every other day, so each day is its own visit.
      expect(visits, hasLength(20));
    });

    test('input order does not matter', () {
      final times = [
        DateTime.utc(2024, 6, 12, 9),
        DateTime.utc(2019, 7, 4, 18),
        DateTime.utc(2024, 6, 10, 18),
      ];
      expect(
        groupIntoVisits(times, localDay: _utc),
        groupIntoVisits(times.reversed.toList(), localDay: _utc),
      );
    });

    test('does not mutate the list it was given', () {
      final times = [DateTime.utc(2024, 6, 12), DateTime.utc(2024, 6, 10)];
      groupIntoVisits(times, localDay: _utc);
      expect(times, [DateTime.utc(2024, 6, 12), DateTime.utc(2024, 6, 10)]);
    });

    test('a single-day visit does not claim to span days', () {
      final visit = groupIntoVisits([
        DateTime.utc(2024, 6, 10, 8),
        DateTime.utc(2024, 6, 10, 22),
      ], localDay: _utc).single;
      expect(visit.spansMultipleDays(localDay: _utc), isFalse);
    });
  });

  group('timezones', () {
    test('a photo just after local midnight belongs to the new day', () {
      // 22:30 UTC is 00:30 the next day in Prague.
      final visits = groupIntoVisits([
        DateTime.utc(2024, 6, 10, 22, 30),
      ], localDay: _prague);
      expect(visits.single.date, DateTime(2024, 6, 11));
    });

    test('the same photos land on different dates in different zones', () {
      final times = [
        DateTime.utc(2024, 6, 10, 22, 30),
        DateTime.utc(2024, 6, 11, 3),
      ];

      // UTC: the 10th and the 11th — consecutive, one visit dated the 10th.
      final utc = groupIntoVisits(times, localDay: _utc);
      expect(utc, hasLength(1));
      expect(utc.single.date, DateTime(2024, 6, 10));

      // Prague: both fall on the 11th.
      final prague = groupIntoVisits(times, localDay: _prague);
      expect(prague, hasLength(1));
      expect(prague.single.date, DateTime(2024, 6, 11));
    });

    test('a split in one timezone can be a single visit in another', () {
      // The 10th and the 12th in UTC, the 11th and the 12th in Prague.
      final times = [
        DateTime.utc(2024, 6, 10, 22, 30),
        DateTime.utc(2024, 6, 12, 3),
      ];
      expect(groupIntoVisits(times, localDay: _utc), hasLength(2));
      expect(groupIntoVisits(times, localDay: _prague), hasLength(1));
    });
  });
}
