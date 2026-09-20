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

  @override
  String hereRadiusLabel(String radius) {
    return 'Within $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos',
      one: '1 photo',
      zero: 'No photos',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count visits',
      one: '1 visit',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters m';
  }

  @override
  String distanceKilometers(String km) {
    return '$km km';
  }

  @override
  String get ageToday => 'Today';

  @override
  String get ageYesterday => 'Yesterday';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days ago',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months months ago',
      one: 'A month ago',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years years ago',
      one: 'A year ago',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Where are you?';

  @override
  String get locationPermissionBody =>
      'Been Here compares your position with the places your photos were taken. The comparison happens on this phone.';

  @override
  String get locationPermissionAction => 'Use my location';

  @override
  String get locationDeniedTitle => 'Location is off';

  @override
  String get locationDeniedBody =>
      'Without it the app can\'t tell what you have here. You can turn it on in the system settings.';

  @override
  String get locationUnavailableTitle => 'No fix yet';

  @override
  String get locationUnavailableBody =>
      'Your phone hasn\'t worked out where it is. Indoors this can take a moment.';

  @override
  String get locationServicesDisabledTitle => 'Location services are off';

  @override
  String get locationServicesDisabledBody =>
      'Turn them on in the system settings and come back.';

  @override
  String get hereNothingTitle => 'You haven\'t taken photos here';

  @override
  String get hereNothingBody =>
      'Try a wider radius, or come back somewhere you\'ve been before.';

  @override
  String hereNearestHint(String distance) {
    return 'Your closest memory is $distance away.';
  }

  @override
  String get photoDetailRephoto => 'Rephoto';

  @override
  String get photoDetailRephotoSoon => 'Rephoto arrives in a later version.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index of $total';
  }

  @override
  String get debugLocationTitle => 'Debug location';

  @override
  String get debugLocationBody =>
      'Pretend to be somewhere else, so the Here screen can be tested from the sofa.';

  @override
  String get debugLocationLatitude => 'Latitude';

  @override
  String get debugLocationLongitude => 'Longitude';

  @override
  String get debugLocationApply => 'Go there';

  @override
  String get debugLocationClear => 'Use the real location';

  @override
  String get debugLocationActive => 'Debug location active';

  @override
  String get commonClose => 'Close';
}
