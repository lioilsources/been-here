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
  String get indexStartAction => 'Index my photos';

  @override
  String get indexPermissionTitle => 'Been Here needs your photos';

  @override
  String get indexPermissionBody =>
      'It reads only where and when each photo was taken, and keeps that on this phone.';

  @override
  String get indexPermissionAction => 'Allow access';

  @override
  String get indexPermissionDeniedTitle => 'Photo access is off';

  @override
  String get indexPermissionDeniedBody =>
      'Been Here can\'t show you anything without it. You can turn it on in the system settings.';

  @override
  String get indexLimitedAccessNotice =>
      'You\'ve shared only selected photos, so Been Here can only see those. Allowing full access lets it find every place you\'ve been.';

  @override
  String get indexRunningTitle => 'Reading your photo library';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed of $total';
  }

  @override
  String get indexFailedTitle => 'Indexing stopped';

  @override
  String get indexFailedBody =>
      'Something went wrong part way through. Trying again carries on from where it stopped.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos indexed',
      one: '1 photo indexed',
      zero: 'No photos indexed',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent% of them have a location';
  }

  @override
  String get commonLoading => 'Loading…';

  @override
  String get commonRetry => 'Try again';

  @override
  String get commonCancel => 'Cancel';
}
