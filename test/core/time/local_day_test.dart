import 'package:been_here/core/time/local_day.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('daysFromCivil', () {
    test('the epoch is day zero', () {
      expect(daysFromCivil(1970, 1, 1), 0);
    });

    test('matches known dates', () {
      expect(daysFromCivil(1969, 12, 31), -1);
      expect(daysFromCivil(1970, 1, 2), 1);
      expect(daysFromCivil(2000, 1, 1), 10957);
      expect(daysFromCivil(2026, 9, 20), 20716);
    });

    test('consecutive days always differ by one', () {
      var previous = daysFromCivil(2023, 12, 30);
      for (final date in [
        [2023, 12, 31],
        [2024, 1, 1],
        [2024, 2, 28],
        [2024, 2, 29], // leap day
        [2024, 3, 1],
      ]) {
        final day = daysFromCivil(date[0], date[1], date[2]);
        if (date[1] == 2 && date[2] == 28) {
          previous = day;
          continue;
        }
        expect(day - previous, lessThanOrEqualTo(1), reason: '$date');
        previous = day;
      }
    });

    test('handles leap years', () {
      expect(daysFromCivil(2024, 3, 1) - daysFromCivil(2024, 2, 28), 2);
      expect(daysFromCivil(2023, 3, 1) - daysFromCivil(2023, 2, 28), 1);
      // 1900 was not a leap year, 2000 was.
      expect(daysFromCivil(1900, 3, 1) - daysFromCivil(1900, 2, 28), 1);
      expect(daysFromCivil(2000, 3, 1) - daysFromCivil(2000, 2, 28), 2);
    });
  });

  group('FixedOffsetLocalDay', () {
    test('puts a late-evening UTC instant on the next local day', () {
      const prague = FixedOffsetLocalDay(Duration(hours: 2));
      final instant = DateTime.utc(2024, 6, 10, 23, 30);

      expect(prague.dayNumberOf(instant), daysFromCivil(2024, 6, 11));
      expect(prague.dateOf(instant), DateTime(2024, 6, 11));
    });

    test('puts an early-morning UTC instant on the previous local day', () {
      const honolulu = FixedOffsetLocalDay(Duration(hours: -10));
      final instant = DateTime.utc(2024, 6, 11, 5);

      expect(honolulu.dayNumberOf(instant), daysFromCivil(2024, 6, 10));
    });

    test('UTC is its own timezone', () {
      const utc = FixedOffsetLocalDay(Duration.zero);
      expect(
        utc.dayNumberOf(DateTime.utc(2024, 6, 10, 23, 59, 59)),
        daysFromCivil(2024, 6, 10),
      );
      expect(
        utc.dayNumberOf(DateTime.utc(2024, 6, 11)),
        daysFromCivil(2024, 6, 11),
      );
    });

    test('two instants an hour apart can be two days apart', () {
      const auckland = FixedOffsetLocalDay(Duration(hours: 13));
      const azores = FixedOffsetLocalDay(Duration(hours: -1));
      final instant = DateTime.utc(2024, 6, 10, 23, 30);

      expect(
        auckland.dayNumberOf(instant) - azores.dayNumberOf(instant),
        1,
      );
    });
  });

  group('SystemLocalDay', () {
    test('consecutive local days differ by exactly one, DST included', () {
      const local = SystemLocalDay();
      // A full year of local noons: whatever the machine's timezone, each
      // day must be exactly one more than the last.
      var previous = local.dayNumberOf(DateTime(2024, 1, 1, 12));
      for (var i = 1; i < 366; i++) {
        final day = local.dayNumberOf(DateTime(2024, 1, 1 + i, 12));
        expect(day - previous, 1, reason: 'day $i');
        previous = day;
      }
    });

    test('dateOf strips the time', () {
      const local = SystemLocalDay();
      final date = local.dateOf(DateTime(2024, 6, 10, 17, 45));
      expect(date, DateTime(2024, 6, 10));
    });
  });
}
