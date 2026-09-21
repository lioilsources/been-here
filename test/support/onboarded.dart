import 'package:been_here/data/db/database.dart';
import 'package:been_here/domain/settings/app_settings.dart';

/// Marks the intro as already seen.
///
/// The app shows three introduction screens until they have been through
/// once, so every test that expects to land on Here has to have been
/// through them — the same as any phone that has opened the app before.
Future<void> markOnboarded(AppDatabase db) =>
    SettingsStore(db.preferencesDao).setOnboardingSeen(seen: true);
