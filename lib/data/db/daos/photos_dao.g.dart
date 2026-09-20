// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_dao.dart';

// ignore_for_file: type=lint
mixin _$PhotosDaoMixin on DatabaseAccessor<AppDatabase> {
  $PlacesTable get places => attachedDatabase.places;
  $PhotosTable get photos => attachedDatabase.photos;
  $ScanSeenTable get scanSeen => attachedDatabase.scanSeen;
  PhotosDaoManager get managers => PhotosDaoManager(this);
}

class PhotosDaoManager {
  final _$PhotosDaoMixin _db;
  PhotosDaoManager(this._db);
  $$PlacesTableTableManager get places =>
      $$PlacesTableTableManager(_db.attachedDatabase, _db.places);
  $$PhotosTableTableManager get photos =>
      $$PhotosTableTableManager(_db.attachedDatabase, _db.photos);
  $$ScanSeenTableTableManager get scanSeen =>
      $$ScanSeenTableTableManager(_db.attachedDatabase, _db.scanSeen);
}
