// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Here';

  @override
  String get placesTabLabel => 'Places';

  @override
  String get settingsTabLabel => 'Settings';

  @override
  String get hereEmptyTitle => 'You haven\'t taken photos here';

  @override
  String get hereEmptyBody =>
      'Widen the search radius, or come back somewhere you\'ve been before.';

  @override
  String get hereNotIndexedTitle => 'Nothing indexed yet';

  @override
  String get hereNotIndexedBody =>
      'Been Here needs to read your photo library once to know where you\'ve been. Nothing leaves your phone.';

  @override
  String get commonLoading => 'Loading…';

  @override
  String get commonRetry => 'Try again';

  @override
  String get commonCancel => 'Cancel';
}
