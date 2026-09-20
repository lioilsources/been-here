import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/geocoding/geocoding_service.dart';
import 'package:been_here/domain/places/place_labels.dart';
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late FakeGeocodingService geocoder;
  late PlaceLabeller labeller;

  setUp(() {
    db = AppDatabase.withExecutor(NativeDatabase.memory());
    geocoder = FakeGeocodingService(fallback: 'Old Town Square, Prague');
    labeller = PlaceLabeller(dao: db.placesDao, geocoder: geocoder);
  });

  tearDown(() => db.close());

  Future<PlaceRow> insertPlace({String? label}) async {
    final id = await db.placesDao.insertPlace(
      PlacesCompanion.insert(
        centerLat: 50.0755,
        centerLng: 14.4378,
        radiusM: 150,
        firstAt: 0,
        lastAt: 0,
        label: Value(label),
      ),
    );
    return (await db.placesDao.byId(id))!;
  }

  test('asks for nothing when place names are off', () async {
    final place = await insertPlace();

    expect(await labeller.labelFor(place, enabled: false), isNull);
    expect(
      geocoder.asked,
      isEmpty,
      reason: 'a coordinate left the device with the setting off',
    );
  });

  test('names a place when they are on', () async {
    final place = await insertPlace();

    final label = await labeller.labelFor(place, enabled: true);

    expect(label, 'Old Town Square, Prague');
    expect(geocoder.asked, hasLength(1));
  });

  test('stores the name, so it is asked for once', () async {
    final place = await insertPlace();
    await labeller.labelFor(place, enabled: true);

    final stored = await db.placesDao.byId(place.id);
    expect(stored!.label, 'Old Town Square, Prague');

    await labeller.labelFor(stored, enabled: true);
    expect(geocoder.asked, hasLength(1));
  });

  test('a stored name is returned even with naming switched off', () async {
    // The user already agreed to this one; nothing new leaves the device.
    final place = await insertPlace(label: 'Somewhere');

    expect(await labeller.labelFor(place, enabled: false), 'Somewhere');
    expect(geocoder.asked, isEmpty);
  });

  test('two lookups of the same place share one request', () async {
    final place = await insertPlace();

    final both = await Future.wait([
      labeller.labelFor(place, enabled: true),
      labeller.labelFor(place, enabled: true),
    ]);

    expect(both, ['Old Town Square, Prague', 'Old Town Square, Prague']);
    expect(geocoder.asked, hasLength(1));
  });

  test('a place the geocoder cannot name stays unnamed', () async {
    labeller = PlaceLabeller(
      dao: db.placesDao,
      geocoder: FakeGeocodingService(),
    );
    final place = await insertPlace();

    expect(await labeller.labelFor(place, enabled: true), isNull);
    expect((await db.placesDao.byId(place.id))!.label, isNull);
  });

  test('switching naming off forgets every name', () async {
    final place = await insertPlace();
    await labeller.labelFor(place, enabled: true);
    expect((await db.placesDao.byId(place.id))!.label, isNotNull);

    await labeller.forgetAll();

    expect((await db.placesDao.byId(place.id))!.label, isNull);
  });
}
