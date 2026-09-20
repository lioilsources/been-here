// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_state_dao.dart';

// ignore_for_file: type=lint
mixin _$IndexStateDaoMixin on DatabaseAccessor<AppDatabase> {
  $IndexStateTable get indexState => attachedDatabase.indexState;
  IndexStateDaoManager get managers => IndexStateDaoManager(this);
}

class IndexStateDaoManager {
  final _$IndexStateDaoMixin _db;
  IndexStateDaoManager(this._db);
  $$IndexStateTableTableManager get indexState =>
      $$IndexStateTableTableManager(_db.attachedDatabase, _db.indexState);
}
