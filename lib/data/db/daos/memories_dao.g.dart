// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memories_dao.dart';

// ignore_for_file: type=lint
mixin _$MemoriesDaoMixin on DatabaseAccessor<AppDatabase> {
  $PlacesTable get places => attachedDatabase.places;
  $PhotosTable get photos => attachedDatabase.photos;
  MemoriesDaoManager get managers => MemoriesDaoManager(this);
}

class MemoriesDaoManager {
  final _$MemoriesDaoMixin _db;
  MemoriesDaoManager(this._db);
  $$PlacesTableTableManager get places =>
      $$PlacesTableTableManager(_db.attachedDatabase, _db.places);
  $$PhotosTableTableManager get photos =>
      $$PhotosTableTableManager(_db.attachedDatabase, _db.photos);
}
