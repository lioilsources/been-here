// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rephotos_dao.dart';

// ignore_for_file: type=lint
mixin _$RephotosDaoMixin on DatabaseAccessor<AppDatabase> {
  $PlacesTable get places => attachedDatabase.places;
  $RephotosTable get rephotos => attachedDatabase.rephotos;
  RephotosDaoManager get managers => RephotosDaoManager(this);
}

class RephotosDaoManager {
  final _$RephotosDaoMixin _db;
  RephotosDaoManager(this._db);
  $$PlacesTableTableManager get places =>
      $$PlacesTableTableManager(_db.attachedDatabase, _db.places);
  $$RephotosTableTableManager get rephotos =>
      $$RephotosTableTableManager(_db.attachedDatabase, _db.rephotos);
}
