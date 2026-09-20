// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_dao.dart';

// ignore_for_file: type=lint
mixin _$PlacesDaoMixin on DatabaseAccessor<AppDatabase> {
  $PlacesTable get places => attachedDatabase.places;
  $PlaceCellsTable get placeCells => attachedDatabase.placeCells;
  $PhotosTable get photos => attachedDatabase.photos;
  PlacesDaoManager get managers => PlacesDaoManager(this);
}

class PlacesDaoManager {
  final _$PlacesDaoMixin _db;
  PlacesDaoManager(this._db);
  $$PlacesTableTableManager get places =>
      $$PlacesTableTableManager(_db.attachedDatabase, _db.places);
  $$PlaceCellsTableTableManager get placeCells =>
      $$PlaceCellsTableTableManager(_db.attachedDatabase, _db.placeCells);
  $$PhotosTableTableManager get photos =>
      $$PhotosTableTableManager(_db.attachedDatabase, _db.photos);
}
