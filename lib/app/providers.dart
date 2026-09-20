import 'package:been_here/data/db/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The on-device index. Single instance for the lifetime of the app.
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});
