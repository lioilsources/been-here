// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'ਇੱਥੇ';

  @override
  String get placesTabLabel => 'ਥਾਵਾਂ';

  @override
  String get settingsTabLabel => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get hereEmptyTitle => 'ਤੁਸੀਂ ਇੱਥੇ ਕੋਈ ਫ਼ੋਟੋ ਨਹੀਂ ਖਿੱਚੀ';

  @override
  String get hereEmptyBody =>
      'ਖੋਜ ਦਾ ਘੇਰਾ ਵਧਾਓ, ਜਾਂ ਕਿਸੇ ਅਜਿਹੀ ਥਾਂ ਵਾਪਸ ਜਾਓ ਜਿੱਥੇ ਤੁਸੀਂ ਪਹਿਲਾਂ ਜਾ ਚੁੱਕੇ ਹੋ।';

  @override
  String get hereNotIndexedTitle => 'ਹਾਲੇ ਕੁਝ ਵੀ ਇੰਡੈਕਸ ਨਹੀਂ ਹੋਇਆ';

  @override
  String get hereNotIndexedBody =>
      'ਤੁਸੀਂ ਕਿੱਥੇ-ਕਿੱਥੇ ਗਏ ਹੋ ਇਹ ਜਾਣਨ ਲਈ Been Here ਨੂੰ ਤੁਹਾਡੀ ਫ਼ੋਟੋ ਲਾਇਬ੍ਰੇਰੀ ਇੱਕ ਵਾਰ ਪੜ੍ਹਨੀ ਪਵੇਗੀ। ਕੁਝ ਵੀ ਤੁਹਾਡੇ ਫ਼ੋਨ ਤੋਂ ਬਾਹਰ ਨਹੀਂ ਜਾਂਦਾ।';

  @override
  String get indexStartAction => 'ਮੇਰੀਆਂ ਫ਼ੋਟੋਆਂ ਇੰਡੈਕਸ ਕਰੋ';

  @override
  String get indexPermissionTitle =>
      'Been Here ਨੂੰ ਤੁਹਾਡੀਆਂ ਫ਼ੋਟੋਆਂ ਚਾਹੀਦੀਆਂ ਹਨ';

  @override
  String get indexPermissionBody =>
      'ਇਹ ਸਿਰਫ਼ ਇਹ ਪੜ੍ਹਦਾ ਹੈ ਕਿ ਹਰ ਫ਼ੋਟੋ ਕਿੱਥੇ ਅਤੇ ਕਦੋਂ ਖਿੱਚੀ ਗਈ, ਅਤੇ ਇਸਨੂੰ ਇਸੇ ਫ਼ੋਨ ਉੱਤੇ ਰੱਖਦਾ ਹੈ।';

  @override
  String get indexPermissionAction => 'ਪਹੁੰਚ ਦਿਓ';

  @override
  String get indexPermissionDeniedTitle => 'ਫ਼ੋਟੋ ਪਹੁੰਚ ਬੰਦ ਹੈ';

  @override
  String get indexPermissionDeniedBody =>
      'ਇਸ ਤੋਂ ਬਿਨਾਂ Been Here ਤੁਹਾਨੂੰ ਕੁਝ ਨਹੀਂ ਦਿਖਾ ਸਕਦਾ। ਤੁਸੀਂ ਇਸਨੂੰ ਸਿਸਟਮ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਚਾਲੂ ਕਰ ਸਕਦੇ ਹੋ।';

  @override
  String get indexLimitedAccessNotice =>
      'ਤੁਸੀਂ ਸਿਰਫ਼ ਚੁਣੀਆਂ ਫ਼ੋਟੋਆਂ ਸਾਂਝੀਆਂ ਕੀਤੀਆਂ ਹਨ, ਇਸ ਲਈ Been Here ਸਿਰਫ਼ ਉਹੀ ਦੇਖ ਸਕਦਾ ਹੈ। ਪੂਰੀ ਪਹੁੰਚ ਨਾਲ ਇਹ ਹਰ ਉਹ ਥਾਂ ਲੱਭ ਸਕਦਾ ਹੈ ਜਿੱਥੇ ਤੁਸੀਂ ਗਏ ਹੋ।';

  @override
  String get indexRunningTitle => 'ਤੁਹਾਡੀ ਫ਼ੋਟੋ ਲਾਇਬ੍ਰੇਰੀ ਪੜ੍ਹੀ ਜਾ ਰਹੀ ਹੈ';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$total ਵਿੱਚੋਂ $processed';
  }

  @override
  String get indexFailedTitle => 'ਇੰਡੈਕਸਿੰਗ ਰੁਕ ਗਈ';

  @override
  String get indexFailedBody =>
      'ਵਿਚਕਾਰ ਕੁਝ ਗੜਬੜ ਹੋ ਗਈ। ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰਨ ਤੇ ਇਹ ਉੱਥੋਂ ਹੀ ਜਾਰੀ ਰਹੇਗਾ ਜਿੱਥੇ ਰੁਕਿਆ ਸੀ।';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਫ਼ੋਟੋਆਂ ਇੰਡੈਕਸ ਹੋਈਆਂ',
      one: '$count ਫ਼ੋਟੋ ਇੰਡੈਕਸ ਹੋਈ',
      zero: 'ਕੋਈ ਫ਼ੋਟੋ ਇੰਡੈਕਸ ਨਹੀਂ ਹੋਈ',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return 'ਇਹਨਾਂ ਵਿੱਚੋਂ $percent% ਵਿੱਚ ਟਿਕਾਣਾ ਹੈ';
  }

  @override
  String get commonLoading => 'ਲੋਡ ਹੋ ਰਿਹਾ ਹੈ…';

  @override
  String get commonRetry => 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get commonCancel => 'ਰੱਦ ਕਰੋ';

  @override
  String hereRadiusLabel(String radius) {
    return '$radius ਦੇ ਅੰਦਰ';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਫ਼ੋਟੋਆਂ',
      one: '$count ਫ਼ੋਟੋ',
      zero: 'ਕੋਈ ਫ਼ੋਟੋ ਨਹੀਂ',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਫੇਰੀਆਂ',
      one: '$count ਫੇਰੀ',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters ਮੀ';
  }

  @override
  String distanceKilometers(String km) {
    return '$km ਕਿ.ਮੀ.';
  }

  @override
  String get ageToday => 'ਅੱਜ';

  @override
  String get ageYesterday => 'ਕੱਲ੍ਹ';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ਦਿਨ ਪਹਿਲਾਂ',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months ਮਹੀਨੇ ਪਹਿਲਾਂ',
      one: 'ਇੱਕ ਮਹੀਨਾ ਪਹਿਲਾਂ',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years ਸਾਲ ਪਹਿਲਾਂ',
      one: 'ਇੱਕ ਸਾਲ ਪਹਿਲਾਂ',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'ਤੁਸੀਂ ਕਿੱਥੇ ਹੋ?';

  @override
  String get locationPermissionBody =>
      'Been Here ਤੁਹਾਡੇ ਟਿਕਾਣੇ ਦੀ ਤੁਲਨਾ ਉਹਨਾਂ ਥਾਵਾਂ ਨਾਲ ਕਰਦਾ ਹੈ ਜਿੱਥੇ ਤੁਹਾਡੀਆਂ ਫ਼ੋਟੋਆਂ ਖਿੱਚੀਆਂ ਗਈਆਂ। ਇਹ ਤੁਲਨਾ ਇਸੇ ਫ਼ੋਨ ਉੱਤੇ ਹੁੰਦੀ ਹੈ।';

  @override
  String get locationPermissionAction => 'ਮੇਰਾ ਟਿਕਾਣਾ ਵਰਤੋ';

  @override
  String get locationDeniedTitle => 'ਟਿਕਾਣਾ ਬੰਦ ਹੈ';

  @override
  String get locationDeniedBody =>
      'ਇਸ ਤੋਂ ਬਿਨਾਂ ਐਪ ਨਹੀਂ ਜਾਣ ਸਕਦੀ ਕਿ ਇੱਥੇ ਤੁਹਾਡੇ ਕੋਲ ਕੀ ਹੈ। ਤੁਸੀਂ ਇਸਨੂੰ ਸਿਸਟਮ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਚਾਲੂ ਕਰ ਸਕਦੇ ਹੋ।';

  @override
  String get locationUnavailableTitle => 'ਹਾਲੇ ਟਿਕਾਣਾ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String get locationUnavailableBody =>
      'ਤੁਹਾਡੇ ਫ਼ੋਨ ਨੂੰ ਹਾਲੇ ਪਤਾ ਨਹੀਂ ਲੱਗਾ ਕਿ ਉਹ ਕਿੱਥੇ ਹੈ। ਇਮਾਰਤ ਦੇ ਅੰਦਰ ਇਸ ਵਿੱਚ ਥੋੜ੍ਹਾ ਸਮਾਂ ਲੱਗ ਸਕਦਾ ਹੈ।';

  @override
  String get locationServicesDisabledTitle => 'ਟਿਕਾਣਾ ਸੇਵਾਵਾਂ ਬੰਦ ਹਨ';

  @override
  String get locationServicesDisabledBody =>
      'ਇਹਨਾਂ ਨੂੰ ਸਿਸਟਮ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਚਾਲੂ ਕਰੋ ਅਤੇ ਵਾਪਸ ਆਓ।';

  @override
  String get hereNothingTitle => 'ਤੁਸੀਂ ਇੱਥੇ ਕੋਈ ਫ਼ੋਟੋ ਨਹੀਂ ਖਿੱਚੀ';

  @override
  String get hereNothingBody =>
      'ਵੱਡਾ ਘੇਰਾ ਅਜ਼ਮਾਓ, ਜਾਂ ਕਿਸੇ ਅਜਿਹੀ ਥਾਂ ਵਾਪਸ ਜਾਓ ਜਿੱਥੇ ਤੁਸੀਂ ਪਹਿਲਾਂ ਜਾ ਚੁੱਕੇ ਹੋ।';

  @override
  String hereNearestHint(String distance) {
    return 'ਤੁਹਾਡੀ ਸਭ ਤੋਂ ਨੇੜਲੀ ਯਾਦ $distance ਦੂਰ ਹੈ।';
  }

  @override
  String get photoDetailRephoto => 'ਮੁੜ ਫ਼ੋਟੋ ਖਿੱਚੋ';

  @override
  String get photoDetailRephotoSoon =>
      'ਮੁੜ ਫ਼ੋਟੋ ਖਿੱਚਣ ਦੀ ਸਹੂਲਤ ਅਗਲੇ ਵਰਜ਼ਨ ਵਿੱਚ ਆਵੇਗੀ।';

  @override
  String photoDetailOf(int index, int total) {
    return '$total ਵਿੱਚੋਂ $index';
  }

  @override
  String get debugLocationTitle => 'ਡੀਬੱਗ ਟਿਕਾਣਾ';

  @override
  String get debugLocationBody =>
      'ਮੰਨ ਲਓ ਕਿ ਤੁਸੀਂ ਕਿਤੇ ਹੋਰ ਹੋ, ਤਾਂ ਜੋ ਇੱਥੇ ਵਾਲੀ ਸਕ੍ਰੀਨ ਸੋਫ਼ੇ ਉੱਤੇ ਬੈਠੇ-ਬੈਠੇ ਜਾਂਚੀ ਜਾ ਸਕੇ।';

  @override
  String get debugLocationLatitude => 'ਵਿਥਕਾਰ';

  @override
  String get debugLocationLongitude => 'ਲੰਬਕਾਰ';

  @override
  String get debugLocationApply => 'ਉੱਥੇ ਜਾਓ';

  @override
  String get debugLocationClear => 'ਅਸਲ ਟਿਕਾਣਾ ਵਰਤੋ';

  @override
  String get debugLocationActive => 'ਡੀਬੱਗ ਟਿਕਾਣਾ ਚਾਲੂ ਹੈ';

  @override
  String get commonClose => 'ਬੰਦ ਕਰੋ';

  @override
  String get placesEmptyTitle => 'ਹਾਲੇ ਕੋਈ ਥਾਂ ਨਹੀਂ';

  @override
  String get placesEmptyBody =>
      'ਫ਼ੋਟੋਆਂ ਇੰਡੈਕਸ ਹੋਣ ਤੋਂ ਬਾਅਦ ਥਾਵਾਂ ਦਿਖਾਈ ਦੇਣਗੀਆਂ।';

  @override
  String get placesSortLabel => 'ਇਸ ਮੁਤਾਬਕ ਤਰਤੀਬ';

  @override
  String get placesSortLongestAgo => 'ਸਭ ਤੋਂ ਪਹਿਲਾਂ';

  @override
  String get placesSortMostPhotos => 'ਸਭ ਤੋਂ ਵੱਧ ਫ਼ੋਟੋਆਂ';

  @override
  String get placesSortNearest => 'ਸਭ ਤੋਂ ਨੇੜੇ';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਮਿਊਟ ਕੀਤੀਆਂ ਥਾਵਾਂ',
      one: '$count ਮਿਊਟ ਕੀਤੀ ਥਾਂ',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'ਮਿਊਟ ਕਰੋ';

  @override
  String get placesUnmute => 'ਅਨਮਿਊਟ ਕਰੋ';

  @override
  String get placesUseAutoRule => 'ਆਪਣੇ-ਆਪ ਫ਼ੈਸਲਾ ਕਰੋ';

  @override
  String get placesAutoMutedNote =>
      'ਆਪਣੇ-ਆਪ ਮਿਊਟ — ਤੁਸੀਂ ਇੱਥੇ ਲਗਭਗ ਰੋਜ਼ ਹੁੰਦੇ ਹੋ';

  @override
  String get placesUserMutedNote => 'ਤੁਸੀਂ ਮਿਊਟ ਕੀਤਾ';

  @override
  String get placesUserUnmutedNote => 'ਤੁਸੀਂ ਦਿਖਦਾ ਰੱਖਿਆ';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ਦਿਨ',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'ਥਾਵਾਂ ਦੇ ਨਾਂ';

  @override
  String get settingsPlaceNamesBody =>
      'ਸਿਸਟਮ ਨੂੰ ਕਿਸੇ ਥਾਂ ਦੇ ਨਿਰਦੇਸ਼ਾਂਕਾਂ ਨੂੰ ਨਾਂ ਵਿੱਚ ਬਦਲਣ ਲਈ ਕਹਿੰਦਾ ਹੈ। ਉਹ ਨਿਰਦੇਸ਼ਾਂਕ Apple ਜਾਂ Google ਨੂੰ ਜਾਂਦਾ ਹੈ — ਇਸ ਐਪ ਵਿੱਚੋਂ ਤੁਹਾਡੇ ਫ਼ੋਨ ਤੋਂ ਬਾਹਰ ਜਾਣ ਵਾਲੀ ਇਹੀ ਇੱਕੋ ਚੀਜ਼ ਹੈ। ਮੂਲ ਰੂਪ ਵਿੱਚ ਬੰਦ; ਮੁੜ ਬੰਦ ਕਰਨ ਤੇ ਸਾਰੇ ਨਾਂ ਭੁੱਲ ਜਾਂਦੇ ਹਨ।';

  @override
  String get settingsAutoMuteTitle =>
      'ਰੋਜ਼ਾਨਾ ਦੀਆਂ ਥਾਵਾਂ ਨੂੰ ਇੰਨੇ ਦਿਨਾਂ ਬਾਅਦ ਮਿਊਟ ਕਰੋ';

  @override
  String get settingsAutoMuteBody =>
      'ਜਿਸ ਥਾਂ ਇੰਨੇ ਵੱਖ-ਵੱਖ ਦਿਨਾਂ ਦੀਆਂ ਫ਼ੋਟੋਆਂ ਹੋਣ, ਉਹ ਤੁਹਾਡੇ ਰਹਿਣ ਦੀ ਥਾਂ ਹੈ, ਘੁੰਮਣ ਦੀ ਨਹੀਂ।';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ਦਿਨ',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'ਫ਼ੋਟੋ ਇੰਡੈਕਸ';

  @override
  String get settingsReindex => 'ਸ਼ੁਰੂ ਤੋਂ ਮੁੜ ਇੰਡੈਕਸ ਕਰੋ';

  @override
  String get settingsPrivacyTitle => 'ਇਸ ਫ਼ੋਨ ਉੱਤੇ ਕੀ ਰਹਿੰਦਾ ਹੈ';

  @override
  String get settingsPrivacyBody =>
      'ਤੁਹਾਡੀਆਂ ਫ਼ੋਟੋਆਂ, ਉਹ ਕਿੱਥੇ ਖਿੱਚੀਆਂ ਗਈਆਂ, ਅਤੇ ਉਹਨਾਂ ਤੋਂ ਇਹ ਐਪ ਜੋ ਕੁਝ ਸਮਝਦੀ ਹੈ। ਨਾ ਕੋਈ ਖਾਤਾ, ਨਾ ਸਰਵਰ, ਨਾ ਵਿਸ਼ਲੇਸ਼ਣ।';

  @override
  String get placesName => 'ਇਸ ਥਾਂ ਦਾ ਨਾਂ ਰੱਖੋ';

  @override
  String get placesRename => 'ਨਾਂ ਬਦਲੋ';

  @override
  String get placesNameDialogTitle => 'ਥਾਂ ਦਾ ਨਾਂ';

  @override
  String get placesNameHint => 'ਨਾਨੀ ਦਾ ਘਰ, ਝੀਲ, ਦਫ਼ਤਰ…';

  @override
  String get placesNameSave => 'ਰੱਖਿਅਤ ਕਰੋ';

  @override
  String get placesNameClear => 'ਨਾਂ ਹਟਾਓ';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'ਤੁਸੀਂ ਇੱਥੇ ਪਹਿਲਾਂ ਆ ਚੁੱਕੇ ਹੋ';

  @override
  String notificationBody(String age, String photos) {
    return 'ਪਿਛਲੀ ਵਾਰ ਇੱਥੇ: $age। $photos।';
  }

  @override
  String get alwaysLocationTitle => 'Been Here ਨੂੰ ਤੁਹਾਡੇ ਲਈ ਧਿਆਨ ਰੱਖਣ ਦਿਓ';

  @override
  String get alwaysLocationBody =>
      'ਬੈਕਗ੍ਰਾਊਂਡ ਟਿਕਾਣੇ ਨਾਲ, ਜਦੋਂ ਤੁਸੀਂ ਕਿਸੇ ਅਜਿਹੀ ਥਾਂ ਪਹੁੰਚਦੇ ਹੋ ਜਿਸ ਦੀ ਤੁਸੀਂ ਪਹਿਲਾਂ ਫ਼ੋਟੋ ਖਿੱਚੀ ਹੈ, ਤਾਂ ਤੁਹਾਡਾ ਫ਼ੋਨ Been Here ਨੂੰ ਦੱਸ ਸਕਦਾ ਹੈ — ਅਤੇ ਐਪ ਤੁਹਾਨੂੰ ਕੁਝ ਖੋਲ੍ਹੇ ਬਿਨਾਂ ਇੱਕ ਵਾਰ ਦੱਸ ਸਕਦੀ ਹੈ।\n\nਐਪ ਕਦੇ ਤੁਹਾਡਾ ਪਿੱਛਾ ਨਹੀਂ ਕਰਦੀ। ਤੁਹਾਡਾ ਫ਼ੋਨ ਕੁਝ ਗਿਣੇ-ਚੁਣੇ ਘੇਰਿਆਂ ਉੱਤੇ ਨਜ਼ਰ ਰੱਖਦਾ ਹੈ ਅਤੇ ਐਪ ਨੂੰ ਸਿਰਫ਼ ਉਦੋਂ ਜਗਾਉਂਦਾ ਹੈ ਜਦੋਂ ਤੁਸੀਂ ਉਹਨਾਂ ਵਿੱਚੋਂ ਕਿਸੇ ਵਿੱਚ ਦਾਖ਼ਲ ਹੁੰਦੇ ਹੋ। ਤੁਸੀਂ ਕਿੱਥੇ ਹੋ, ਇਸ ਬਾਰੇ ਕੁਝ ਵੀ ਇਸ ਡਿਵਾਈਸ ਤੋਂ ਬਾਹਰ ਨਹੀਂ ਜਾਂਦਾ।';

  @override
  String get alwaysLocationAction => 'ਪਹੁੰਚਣ ਦੀ ਸੂਚਨਾ ਚਾਲੂ ਕਰੋ';

  @override
  String get alwaysLocationLater => 'ਹਾਲੇ ਨਹੀਂ';

  @override
  String get alwaysLocationDeniedBody =>
      'ਬੈਕਗ੍ਰਾਊਂਡ ਟਿਕਾਣਾ ਬੰਦ ਹੈ, ਇਸ ਲਈ ਪਹੁੰਚਣ ਦੀਆਂ ਸੂਚਨਾਵਾਂ ਚੁੱਪ ਰਹਿਣਗੀਆਂ। ਬਾਕੀ ਸਭ ਪਹਿਲਾਂ ਵਾਂਗ ਚੱਲਦਾ ਹੈ; ਤੁਸੀਂ ਜਦੋਂ ਚਾਹੋ ਸਿਸਟਮ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਇਸਨੂੰ ਚਾਲੂ ਕਰ ਸਕਦੇ ਹੋ।';

  @override
  String get settingsArrivalsTitle => 'ਪਹੁੰਚਣਾ';

  @override
  String get settingsArrivalsOn =>
      'ਜਦੋਂ ਤੁਸੀਂ ਕਿਸੇ ਅਜਿਹੀ ਥਾਂ ਪਹੁੰਚੋਗੇ ਜਿਸ ਦੀ ਕਾਫ਼ੀ ਸਮੇਂ ਤੋਂ ਫ਼ੋਟੋ ਨਹੀਂ ਖਿੱਚੀ, ਤਾਂ Been Here ਤੁਹਾਨੂੰ ਦੱਸੇਗਾ।';

  @override
  String get settingsArrivalsOff =>
      'Been Here ਚੁੱਪ ਰਹਿੰਦਾ ਹੈ। ਇਸਨੂੰ ਚਾਲੂ ਕਰਨ ਤੇ ਬੈਕਗ੍ਰਾਊਂਡ ਟਿਕਾਣਾ ਮੰਗਿਆ ਜਾਵੇਗਾ।';

  @override
  String get settingsMemoryAgeTitle =>
      'ਸਿਰਫ਼ ਇਸ ਤੋਂ ਪੁਰਾਣੀਆਂ ਥਾਵਾਂ ਦਾ ਜ਼ਿਕਰ ਕਰੋ';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ਦਿਨ',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle =>
      'ਫਿਰ ਉਸ ਥਾਂ ਨੂੰ ਇੰਨਾ ਸਮਾਂ ਸ਼ਾਂਤ ਰੱਖੋ';

  @override
  String get settingsDailyLimitTitle => 'ਅਤੇ ਇੰਨਾ ਸਮਾਂ ਕੁਝ ਵੀ ਨਾ ਕਹੋ';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ਘੰਟੇ',
      one: '$hours ਘੰਟਾ',
      zero: 'ਬਿਲਕੁਲ ਨਹੀਂ',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'ਅੱਧਾ ਸਾਲ ਉਡੀਕ ਕੀਤੇ ਬਿਨਾਂ ਪਹੁੰਚਣ ਦੀਆਂ ਸੂਚਨਾਵਾਂ ਅਜ਼ਮਾਉਣ ਲਈ ਇਹਨਾਂ ਨੂੰ ਘਟਾਓ।';

  @override
  String get placesTestArrival => 'ਇੱਥੇ ਪਹੁੰਚਣ ਦੀ ਜਾਂਚ ਕਰੋ';

  @override
  String get arrivalTestNotified => 'ਸੂਚਨਾ ਭੇਜੀ ਗਈ';

  @override
  String get arrivalTestMuted => 'ਕੁਝ ਨਹੀਂ: ਥਾਂ ਮਿਊਟ ਹੈ';

  @override
  String get arrivalTestTooFewPhotos => 'ਕੁਝ ਨਹੀਂ: ਇੱਥੇ ਬਹੁਤ ਘੱਟ ਫ਼ੋਟੋਆਂ ਹਨ';

  @override
  String get arrivalTestTooRecent =>
      'ਕੁਝ ਨਹੀਂ: ਤੁਸੀਂ ਹਾਲ ਹੀ ਵਿੱਚ ਇੱਥੇ ਫ਼ੋਟੋ ਖਿੱਚੀ ਸੀ';

  @override
  String get arrivalTestPlaceCooldown =>
      'ਕੁਝ ਨਹੀਂ: ਇਹ ਥਾਂ ਹਾਲ ਹੀ ਵਿੱਚ ਬੋਲ ਚੁੱਕੀ ਹੈ';

  @override
  String get arrivalTestDailyLimit => 'ਕੁਝ ਨਹੀਂ: ਅੱਜ ਕੁਝ ਹੋਰ ਬੋਲ ਚੁੱਕਾ ਹੈ';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'ਤੁਹਾਡੇ ਫ਼ੋਨ ਨੇ ਟਿਕਾਣਾ \"ਐਪ ਵਰਤਦੇ ਸਮੇਂ\" ਉੱਤੇ ਰੱਖਿਆ ਹੈ। iOS ਐਪ ਦੇ ਅੰਦਰੋਂ ਇਹ ਚੋਣ ਦੁਬਾਰਾ ਨਹੀਂ ਦਿੰਦਾ, ਇਸ ਲਈ ਬੈਕਗ੍ਰਾਊਂਡ ਟਿਕਾਣੇ ਨੂੰ ਸਿਸਟਮ ਸੈਟਿੰਗਾਂ ਵਿੱਚ \"ਹਮੇਸ਼ਾ\" ਉੱਤੇ ਕਰਨਾ ਪਵੇਗਾ — ਫਿਰ ਪਹੁੰਚਣ ਦੀਆਂ ਸੂਚਨਾਵਾਂ ਕੰਮ ਕਰਨ ਲੱਗਣਗੀਆਂ।';

  @override
  String get commonOpenSettings => 'ਸੈਟਿੰਗਾਂ ਖੋਲ੍ਹੋ';

  @override
  String get settingsArrivalsPending =>
      'ਲਗਭਗ: ਟਿਕਾਣਾ ਹਾਲੇ ਵੀ \"ਐਪ ਵਰਤਦੇ ਸਮੇਂ\" ਉੱਤੇ ਹੈ। ਇਸਨੂੰ ਸਿਸਟਮ ਸੈਟਿੰਗਾਂ ਵਿੱਚ \"ਹਮੇਸ਼ਾ\" ਕਰੋ।';

  @override
  String get placesSortVisits => 'ਸਭ ਤੋਂ ਵੱਧ ਫੇਰੀਆਂ';

  @override
  String get placesSortAscending => 'ਉਲਟੀ ਤਰਤੀਬ';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਫੇਰੀਆਂ',
      one: '$count ਫੇਰੀ',
      zero: 'ਕਦੇ ਨਹੀਂ',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'ਥਾਵਾਂ ਨਕਸ਼ੇ ਉੱਤੇ ਦਿਖਾਓ';

  @override
  String get settingsMapBody =>
      'ਜਦੋਂ ਤੁਸੀਂ ਨਕਸ਼ਾ ਖਿਸਕਾਉਂਦੇ ਅਤੇ ਜ਼ੂਮ ਕਰਦੇ ਹੋ, ਤਾਂ OpenStreetMap ਤੋਂ ਟਾਈਲਾਂ ਡਾਊਨਲੋਡ ਹੁੰਦੀਆਂ ਹਨ, ਇਸ ਲਈ ਉਹ ਸਰਵਰ ਲਗਾਤਾਰ ਦੇਖਦਾ ਹੈ ਕਿ ਤੁਸੀਂ ਕਿੱਥੇ ਦੇਖ ਰਹੇ ਹੋ। ਇੱਕ ਵਾਰ ਪੁੱਛੇ ਜਾਣ ਵਾਲੇ ਥਾਂ ਦੇ ਨਾਂ ਦੇ ਉਲਟ, ਇਹ ਉਦੋਂ ਤੱਕ ਚੱਲਦਾ ਹੈ ਜਦੋਂ ਤੱਕ ਨਕਸ਼ਾ ਖੁੱਲ੍ਹਾ ਹੈ। ਮੂਲ ਰੂਪ ਵਿੱਚ ਬੰਦ।';

  @override
  String get placesShowMap => 'ਨਕਸ਼ਾ';

  @override
  String get placesShowList => 'ਸੂਚੀ';

  @override
  String get placesMapAttribution => '© OpenStreetMap ਯੋਗਦਾਨੀ';

  @override
  String get rephotoOverlay => 'ਫਿੱਕਾ';

  @override
  String get rephotoEdges => 'ਰੂਪਰੇਖਾ';

  @override
  String get rephotoCapture => 'ਫ਼ੋਟੋ ਖਿੱਚੋ';

  @override
  String get rephotoSaved => 'ਤੁਹਾਡੀਆਂ ਫ਼ੋਟੋਆਂ ਵਿੱਚ ਰੱਖਿਅਤ ਹੋਈ';

  @override
  String get rephotoNotSaved =>
      'ਰੱਖਿਅਤ ਨਹੀਂ ਹੋ ਸਕੀ। ਹੋ ਸਕਦਾ ਹੈ ਫ਼ੋਟੋਆਂ ਜੋੜਨਾ ਬੰਦ ਹੋਵੇ।';

  @override
  String get rephotoNoCamera =>
      'ਕੋਈ ਕੈਮਰਾ ਉਪਲਬਧ ਨਹੀਂ। ਕਿਸੇ ਪੁਰਾਣੀ ਫ਼ੋਟੋ ਦਾ ਜਵਾਬ ਦੇਣ ਵਾਲੀ ਫ਼ੋਟੋ ਖਿੱਚਣ ਲਈ Been Here ਨੂੰ ਕੈਮਰਾ ਚਾਹੀਦਾ ਹੈ।';

  @override
  String get rephotoThenAndNow => 'ਉਦੋਂ ਅਤੇ ਹੁਣ';

  @override
  String get rephotoShare => 'ਸਾਂਝਾ ਕਰੋ';

  @override
  String get rephotoThen => 'ਉਦੋਂ';

  @override
  String get rephotoNow => 'ਹੁਣ';

  @override
  String get rephotoShareFailed => 'ਸਾਂਝੀ ਕਰਨ ਲਈ ਤਸਵੀਰ ਨਹੀਂ ਬਣ ਸਕੀ।';

  @override
  String get onboardingSkip => 'ਛੱਡੋ';

  @override
  String get onboardingNext => 'ਅੱਗੇ';

  @override
  String get onboardingWhatTitle => 'ਉਸੇ ਥਾਂ ਦੀਆਂ ਫ਼ੋਟੋਆਂ ਜਿੱਥੇ ਤੁਸੀਂ ਖੜ੍ਹੇ ਹੋ';

  @override
  String get onboardingWhatBody =>
      'ਕਿਸੇ ਅਜਿਹੀ ਥਾਂ ਪਹੁੰਚੋ ਜਿਸ ਦੀ ਤੁਸੀਂ ਪਹਿਲਾਂ ਫ਼ੋਟੋ ਖਿੱਚੀ ਹੈ ਅਤੇ Been Here ਤੁਹਾਨੂੰ ਦਿਖਾਏਗਾ ਕਿ ਤੁਸੀਂ ਉੱਥੇ ਕੀ ਖਿੱਚਿਆ — ਫੇਰੀ-ਦਰ-ਫੇਰੀ, ਸਭ ਤੋਂ ਪੁਰਾਣੀ ਪਹਿਲਾਂ।';

  @override
  String get onboardingPrivacyTitle => 'ਕੁਝ ਵੀ ਤੁਹਾਡੇ ਫ਼ੋਨ ਤੋਂ ਬਾਹਰ ਨਹੀਂ ਜਾਂਦਾ';

  @override
  String get onboardingPrivacyBody =>
      'ਨਾ ਖਾਤਾ, ਨਾ ਸਰਵਰ, ਨਾ ਵਿਸ਼ਲੇਸ਼ਣ। Been Here ਡਿਵਾਈਸ ਉੱਤੇ ਹੀ ਤੁਹਾਡੀ ਫ਼ੋਟੋ ਲਾਇਬ੍ਰੇਰੀ ਪੜ੍ਹਦਾ ਹੈ ਅਤੇ ਉਸਦੇ ਨਾਲ ਇੱਕ ਛੋਟਾ ਜਿਹਾ ਇੰਡੈਕਸ ਰੱਖਦਾ ਹੈ। ਤੁਹਾਡੀਆਂ ਫ਼ੋਟੋਆਂ, ਅਤੇ ਉਹ ਕਿੱਥੇ ਖਿੱਚੀਆਂ ਗਈਆਂ, ਆਪਣੀ ਥਾਂ ਉੱਤੇ ਰਹਿੰਦੀਆਂ ਹਨ।';

  @override
  String get onboardingPrivacyFootnote =>
      'ਦੋ ਚੀਜ਼ਾਂ ਨੈੱਟਵਰਕ ਤੱਕ ਪਹੁੰਚ ਸਕਦੀਆਂ ਹਨ, ਅਤੇ ਦੋਵੇਂ ਉਦੋਂ ਤੱਕ ਬੰਦ ਹਨ ਜਦੋਂ ਤੱਕ ਤੁਸੀਂ ਉਹਨਾਂ ਨੂੰ ਚਾਲੂ ਨਾ ਕਰੋ: ਥਾਵਾਂ ਦੇ ਨਾਂ ਅਤੇ ਨਕਸ਼ਾ।';

  @override
  String get onboardingPhotosTitle => 'ਇਸਨੂੰ ਤੁਹਾਡੀਆਂ ਫ਼ੋਟੋਆਂ ਚਾਹੀਦੀਆਂ ਹਨ';

  @override
  String get onboardingPhotosBody =>
      'Been Here ਨੋਟ ਕਰਦਾ ਹੈ ਕਿ ਕਿਹੜੀ ਫ਼ੋਟੋ ਕਿੱਥੇ ਖਿੱਚੀ ਗਈ। ਇਹ ਕਦੇ ਕੁਝ ਕਾਪੀ ਜਾਂ ਮੂਵ ਨਹੀਂ ਕਰਦਾ — ਇਹ ਆਈਡੀ ਅਤੇ ਨਿਰਦੇਸ਼ਾਂਕ ਯਾਦ ਰੱਖਦਾ ਹੈ, ਅਤੇ ਫ਼ੋਟੋਆਂ ਸਿਰਫ਼ ਉਦੋਂ ਪੜ੍ਹਦਾ ਹੈ ਜਦੋਂ ਤੁਹਾਨੂੰ ਦਿਖਾਉਂਦਾ ਹੈ।';

  @override
  String get onboardingPhotosAction => 'ਫ਼ੋਟੋਆਂ ਦੀ ਇਜਾਜ਼ਤ ਦਿਓ';

  @override
  String get onboardingDone => 'ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get settingsAboutTitle => 'ਬਾਰੇ';

  @override
  String settingsVersion(String version, String build) {
    return 'ਵਰਜ਼ਨ $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'ਸਰੋਤ ਕੋਡ';

  @override
  String get settingsShowIntro => 'ਜਾਣ-ਪਛਾਣ ਦੁਬਾਰਾ ਦਿਖਾਓ';

  @override
  String photoSemanticLabel(String date) {
    return '$date ਦੀ ਫ਼ੋਟੋ';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return '$total ਵਿੱਚੋਂ ਫ਼ੋਟੋ $index, $date';
  }

  @override
  String get placesActionsLabel => 'ਇਸ ਥਾਂ ਦਾ ਕੀ ਕਰਨਾ ਹੈ';

  @override
  String get radiusSemanticLabel => 'ਖੋਜ ਦਾ ਘੇਰਾ';

  @override
  String get hereMapTitle => 'ਆਲੇ-ਦੁਆਲੇ';

  @override
  String get hereOpenInMaps => 'ਨਕਸ਼ੇ ਵਿੱਚ ਖੋਲ੍ਹੋ';

  @override
  String get hereBackToMe => 'ਮੇਰੀ ਥਾਂ ਉੱਤੇ ਵਾਪਸ ਜਾਓ';

  @override
  String get herePlaceFallbackTitle => 'ਇੱਕ ਜਾਣੀ-ਪਛਾਣੀ ਥਾਂ';

  @override
  String get arrivalTestNearHome => 'ਘਰ ਦੇ ਇੰਨੇ ਨੇੜੇ ਹੈ ਕਿ ਖ਼ਬਰ ਨਹੀਂ ਬਣਦੀ।';

  @override
  String get settingsHomeRadiusTitle => 'ਇੰਨੀ ਦੂਰੀ ਦੇ ਅੰਦਰ ਚੁੱਪ ਰਹੋ';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: 'ਘਰ ਤੋਂ $km ਕਿ.ਮੀ.',
      zero: 'ਕੋਈ ਦੂਰੀ ਨਹੀਂ — ਕਦੇ ਚੁੱਪ ਨਹੀਂ',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'ਰੋਜ਼ਾਨਾ ਜ਼ਿੰਦਗੀ ਘਰ ਦੇ ਨੇੜੇ ਬੀਤਦੀ ਹੈ, ਅਤੇ ਉੱਥੇ ਹੀ ਉਸ ਉੱਤੇ ਟਿੱਪਣੀ ਕਰਨ ਵਾਲਾ ਫ਼ੋਨ ਸਭ ਤੋਂ ਘੱਟ ਪਸੰਦ ਆਉਂਦਾ ਹੈ। ਇਸ ਤੋਂ ਨੇੜਲੀਆਂ ਥਾਵਾਂ ਉੱਤੇ ਕਦੇ ਨਜ਼ਰ ਨਹੀਂ ਰੱਖੀ ਜਾਂਦੀ।';

  @override
  String get settingsQuietTitle => 'ਇਹ ਚੁੱਪ ਕਿਉਂ ਹੈ';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਥਾਵਾਂ ਉੱਤੇ ਨਜ਼ਰ',
      one: '$count ਥਾਂ ਉੱਤੇ ਨਜ਼ਰ',
      zero: 'ਕਿਸੇ ਥਾਂ ਉੱਤੇ ਨਜ਼ਰ ਨਹੀਂ',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'ਨਜ਼ਰ ਹੇਠ ਸਭ ਤੋਂ ਨੇੜਲੀ ਥਾਂ: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'ਕਿਸੇ ਚੀਜ਼ ਉੱਤੇ ਨਜ਼ਰ ਨਹੀਂ ਰੱਖੀ ਜਾ ਰਹੀ, ਇਸ ਲਈ ਕੋਈ ਪਹੁੰਚਣਾ ਨਹੀਂ ਹੋ ਸਕਦਾ।';

  @override
  String settingsQuietLastNotified(String when) {
    return 'ਪਿਛਲੀ ਸੂਚਨਾ: $when';
  }

  @override
  String get settingsQuietNever => 'ਕਦੇ ਨਹੀਂ';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return '$total ਥਾਵਾਂ ਵਿੱਚੋਂ: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count ਮਿਊਟ';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count ਘਰ ਦੇ ਨੇੜੇ';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count ਵਿੱਚ ਬਹੁਤ ਘੱਟ ਫ਼ੋਟੋਆਂ';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count ਦੀਆਂ ਹਾਲ ਹੀ ਵਿੱਚ ਫ਼ੋਟੋਆਂ';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count ਹਾਲੇ ਵਿਰਾਮ ਵਿੱਚ';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count ਨਜ਼ਰ ਰੱਖਣ ਯੋਗ';
  }

  @override
  String get ageSemanticLabel => 'ਫ਼ੋਟੋਆਂ ਦੀ ਉਮਰ';

  @override
  String get ageStopNow => 'ਹੁਣ';

  @override
  String get ageStopDay => '1 ਦਿਨ';

  @override
  String get ageStop3Days => '3 ਦਿਨ';

  @override
  String get ageStopWeek => '1 ਹਫ਼ਤਾ';

  @override
  String get ageStop2Weeks => '2 ਹਫ਼ਤੇ';

  @override
  String get ageStopMonth => '1 ਮਹੀਨਾ';

  @override
  String get ageStop3Months => '3 ਮਹੀਨੇ';

  @override
  String get ageStop6Months => '6 ਮਹੀਨੇ';

  @override
  String get ageStopYear => '1 ਸਾਲ';

  @override
  String get ageStop2Years => '2 ਸਾਲ';

  @override
  String get ageStop5Years => '5 ਸਾਲ';

  @override
  String get ageStop10Years => '10 ਸਾਲ';

  @override
  String get ageStopAll => 'ਸਾਰੀਆਂ';

  @override
  String get ageWindowAll => 'ਸਾਰੀਆਂ ਫ਼ੋਟੋਆਂ';

  @override
  String ageWindowNewerThan(String stop) {
    return '$stop ਤੱਕ';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return '$stop ਤੋਂ ਪੁਰਾਣੀਆਂ';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest ਤੋਂ $oldest ਤੱਕ';
  }

  @override
  String get ageWindowReset => 'ਰੀਸੈੱਟ ਕਰੋ';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ ਫ਼ੋਟੋਆਂ';
  }
}
