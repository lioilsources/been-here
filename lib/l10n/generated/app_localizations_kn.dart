// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'ಇಲ್ಲಿ';

  @override
  String get placesTabLabel => 'ಸ್ಥಳಗಳು';

  @override
  String get settingsTabLabel => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get hereEmptyTitle => 'ನೀವು ಇಲ್ಲಿ ಫೋಟೋ ತೆಗೆದಿಲ್ಲ';

  @override
  String get hereEmptyBody =>
      'ಹುಡುಕಾಟದ ತ್ರಿಜ್ಯವನ್ನು ವಿಸ್ತರಿಸಿ, ಅಥವಾ ಹಿಂದೆ ಹೋಗಿದ್ದ ಸ್ಥಳಕ್ಕೆ ಮತ್ತೆ ಬನ್ನಿ.';

  @override
  String get hereNotIndexedTitle => 'ಇನ್ನೂ ಏನನ್ನೂ ಇಂಡೆಕ್ಸ್ ಮಾಡಿಲ್ಲ';

  @override
  String get hereNotIndexedBody =>
      'ನೀವು ಎಲ್ಲಿಗೆ ಹೋಗಿದ್ದೀರಿ ಎಂದು ತಿಳಿಯಲು Been Here ನಿಮ್ಮ ಫೋಟೋ ಲೈಬ್ರರಿಯನ್ನು ಒಮ್ಮೆ ಓದಬೇಕು. ಯಾವುದೂ ನಿಮ್ಮ ಫೋನ್ ಬಿಟ್ಟು ಹೋಗುವುದಿಲ್ಲ.';

  @override
  String get indexStartAction => 'ನನ್ನ ಫೋಟೋಗಳನ್ನು ಇಂಡೆಕ್ಸ್ ಮಾಡಿ';

  @override
  String get indexPermissionTitle => 'Been Here ಗೆ ನಿಮ್ಮ ಫೋಟೋಗಳು ಬೇಕು';

  @override
  String get indexPermissionBody =>
      'ಪ್ರತಿ ಫೋಟೋ ಎಲ್ಲಿ ಮತ್ತು ಯಾವಾಗ ತೆಗೆದದ್ದು ಎಂಬುದನ್ನು ಮಾತ್ರ ಅದು ಓದುತ್ತದೆ, ಮತ್ತು ಅದನ್ನು ಈ ಫೋನ್‌ನಲ್ಲೇ ಇಟ್ಟುಕೊಳ್ಳುತ್ತದೆ.';

  @override
  String get indexPermissionAction => 'ಪ್ರವೇಶ ಅನುಮತಿಸಿ';

  @override
  String get indexPermissionDeniedTitle => 'ಫೋಟೋ ಪ್ರವೇಶ ಆಫ್ ಆಗಿದೆ';

  @override
  String get indexPermissionDeniedBody =>
      'ಅದಿಲ್ಲದೆ Been Here ನಿಮಗೆ ಏನನ್ನೂ ತೋರಿಸಲಾರದು. ಸಿಸ್ಟಂ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಅದನ್ನು ಆನ್ ಮಾಡಬಹುದು.';

  @override
  String get indexLimitedAccessNotice =>
      'ನೀವು ಆಯ್ದ ಫೋಟೋಗಳನ್ನು ಮಾತ್ರ ಹಂಚಿಕೊಂಡಿದ್ದೀರಿ, ಆದ್ದರಿಂದ Been Here ಅವನ್ನು ಮಾತ್ರ ನೋಡಬಲ್ಲದು. ಪೂರ್ಣ ಪ್ರವೇಶ ನೀಡಿದರೆ ನೀವು ಹೋದ ಪ್ರತಿ ಸ್ಥಳವನ್ನೂ ಅದು ಹುಡುಕಬಲ್ಲದು.';

  @override
  String get indexRunningTitle => 'ನಿಮ್ಮ ಫೋಟೋ ಲೈಬ್ರರಿಯನ್ನು ಓದಲಾಗುತ್ತಿದೆ';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$total ರಲ್ಲಿ $processed';
  }

  @override
  String get indexFailedTitle => 'ಇಂಡೆಕ್ಸಿಂಗ್ ನಿಂತಿದೆ';

  @override
  String get indexFailedBody =>
      'ಮಧ್ಯದಲ್ಲಿ ಏನೋ ತಪ್ಪಾಗಿದೆ. ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿದರೆ ನಿಂತ ಜಾಗದಿಂದಲೇ ಮುಂದುವರಿಯುತ್ತದೆ.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಫೋಟೋಗಳು ಇಂಡೆಕ್ಸ್ ಆಗಿವೆ',
      one: '1 ಫೋಟೋ ಇಂಡೆಕ್ಸ್ ಆಗಿದೆ',
      zero: 'ಯಾವುದೇ ಫೋಟೋ ಇಂಡೆಕ್ಸ್ ಆಗಿಲ್ಲ',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return 'ಅವುಗಳಲ್ಲಿ $percent% ಕ್ಕೆ ಸ್ಥಳವಿದೆ';
  }

  @override
  String get commonLoading => 'ಲೋಡ್ ಆಗುತ್ತಿದೆ…';

  @override
  String get commonRetry => 'ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get commonCancel => 'ರದ್ದುಮಾಡಿ';

  @override
  String hereRadiusLabel(String radius) {
    return '$radius ಒಳಗೆ';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಫೋಟೋಗಳು',
      one: '1 ಫೋಟೋ',
      zero: 'ಫೋಟೋಗಳಿಲ್ಲ',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಭೇಟಿಗಳು',
      one: '1 ಭೇಟಿ',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters ಮೀ';
  }

  @override
  String distanceKilometers(String km) {
    return '$km ಕಿಮೀ';
  }

  @override
  String get ageToday => 'ಇಂದು';

  @override
  String get ageYesterday => 'ನಿನ್ನೆ';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ದಿನಗಳ ಹಿಂದೆ',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months ತಿಂಗಳ ಹಿಂದೆ',
      one: 'ಒಂದು ತಿಂಗಳ ಹಿಂದೆ',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years ವರ್ಷಗಳ ಹಿಂದೆ',
      one: 'ಒಂದು ವರ್ಷದ ಹಿಂದೆ',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'ನೀವು ಎಲ್ಲಿದ್ದೀರಿ?';

  @override
  String get locationPermissionBody =>
      'Been Here ನಿಮ್ಮ ಸ್ಥಾನವನ್ನು ನಿಮ್ಮ ಫೋಟೋಗಳನ್ನು ತೆಗೆದ ಸ್ಥಳಗಳೊಂದಿಗೆ ಹೋಲಿಸುತ್ತದೆ. ಹೋಲಿಕೆ ಈ ಫೋನ್‌ನಲ್ಲೇ ನಡೆಯುತ್ತದೆ.';

  @override
  String get locationPermissionAction => 'ನನ್ನ ಸ್ಥಳ ಬಳಸಿ';

  @override
  String get locationDeniedTitle => 'ಸ್ಥಳ ಆಫ್ ಆಗಿದೆ';

  @override
  String get locationDeniedBody =>
      'ಅದಿಲ್ಲದೆ ನಿಮ್ಮಲ್ಲಿ ಇಲ್ಲಿ ಏನಿದೆ ಎಂದು ಆ್ಯಪ್‌ಗೆ ಹೇಳಲಾಗದು. ಸಿಸ್ಟಂ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಅದನ್ನು ಆನ್ ಮಾಡಬಹುದು.';

  @override
  String get locationUnavailableTitle => 'ಇನ್ನೂ ಸ್ಥಾನ ಸಿಕ್ಕಿಲ್ಲ';

  @override
  String get locationUnavailableBody =>
      'ನಿಮ್ಮ ಫೋನ್‌ಗೆ ತಾನು ಎಲ್ಲಿದೆ ಎಂದು ಇನ್ನೂ ತಿಳಿದಿಲ್ಲ. ಒಳಾಂಗಣದಲ್ಲಿ ಇದಕ್ಕೆ ಸ್ವಲ್ಪ ಸಮಯ ಹಿಡಿಯಬಹುದು.';

  @override
  String get locationServicesDisabledTitle => 'ಸ್ಥಳ ಸೇವೆಗಳು ಆಫ್ ಆಗಿವೆ';

  @override
  String get locationServicesDisabledBody =>
      'ಸಿಸ್ಟಂ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಅವನ್ನು ಆನ್ ಮಾಡಿ ಮತ್ತೆ ಬನ್ನಿ.';

  @override
  String get hereNothingTitle => 'ನೀವು ಇಲ್ಲಿ ಫೋಟೋ ತೆಗೆದಿಲ್ಲ';

  @override
  String get hereNothingBody =>
      'ದೊಡ್ಡ ತ್ರಿಜ್ಯ ಪ್ರಯತ್ನಿಸಿ, ಅಥವಾ ಹಿಂದೆ ಹೋಗಿದ್ದ ಸ್ಥಳಕ್ಕೆ ಮತ್ತೆ ಬನ್ನಿ.';

  @override
  String hereNearestHint(String distance) {
    return 'ನಿಮ್ಮ ಅತ್ಯಂತ ಹತ್ತಿರದ ನೆನಪು $distance ದೂರದಲ್ಲಿದೆ.';
  }

  @override
  String get photoDetailRephoto => 'ಮರುಫೋಟೋ';

  @override
  String get photoDetailRephotoSoon => 'ಮರುಫೋಟೋ ಮುಂದಿನ ಆವೃತ್ತಿಯಲ್ಲಿ ಬರುತ್ತದೆ.';

  @override
  String photoDetailOf(int index, int total) {
    return '$total ರಲ್ಲಿ $index';
  }

  @override
  String get debugLocationTitle => 'ಡೀಬಗ್ ಸ್ಥಳ';

  @override
  String get debugLocationBody =>
      'ಬೇರೆಲ್ಲೋ ಇರುವಂತೆ ನಟಿಸಿ, ಇದರಿಂದ ಸೋಫಾದಿಂದಲೇ ಇಲ್ಲಿ ಪರದೆಯನ್ನು ಪರೀಕ್ಷಿಸಬಹುದು.';

  @override
  String get debugLocationLatitude => 'ಅಕ್ಷಾಂಶ';

  @override
  String get debugLocationLongitude => 'ರೇಖಾಂಶ';

  @override
  String get debugLocationApply => 'ಅಲ್ಲಿಗೆ ಹೋಗಿ';

  @override
  String get debugLocationClear => 'ನಿಜವಾದ ಸ್ಥಳ ಬಳಸಿ';

  @override
  String get debugLocationActive => 'ಡೀಬಗ್ ಸ್ಥಳ ಸಕ್ರಿಯವಾಗಿದೆ';

  @override
  String get commonClose => 'ಮುಚ್ಚಿ';

  @override
  String get placesEmptyTitle => 'ಇನ್ನೂ ಸ್ಥಳಗಳಿಲ್ಲ';

  @override
  String get placesEmptyBody =>
      'ನಿಮ್ಮ ಫೋಟೋಗಳು ಇಂಡೆಕ್ಸ್ ಆದ ಮೇಲೆ ಸ್ಥಳಗಳು ಕಾಣಿಸುತ್ತವೆ.';

  @override
  String get placesSortLabel => 'ಹೀಗೆ ವಿಂಗಡಿಸಿ';

  @override
  String get placesSortLongestAgo => 'ಹೆಚ್ಚು ಕಾಲದ ಹಿಂದೆ';

  @override
  String get placesSortMostPhotos => 'ಹೆಚ್ಚು ಫೋಟೋಗಳು';

  @override
  String get placesSortNearest => 'ಹತ್ತಿರದ್ದು';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಮ್ಯೂಟ್ ಮಾಡಿದ ಸ್ಥಳಗಳು',
      one: '1 ಮ್ಯೂಟ್ ಮಾಡಿದ ಸ್ಥಳ',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'ಮ್ಯೂಟ್';

  @override
  String get placesUnmute => 'ಅನ್‌ಮ್ಯೂಟ್';

  @override
  String get placesUseAutoRule => 'ತಾನಾಗಿ ನಿರ್ಧರಿಸಿ';

  @override
  String get placesAutoMutedNote =>
      'ತಾನಾಗಿ ಮ್ಯೂಟ್ ಆಗಿದೆ — ನೀವು ಬಹುತೇಕ ಪ್ರತಿದಿನ ಇಲ್ಲಿರುತ್ತೀರಿ';

  @override
  String get placesUserMutedNote => 'ನೀವು ಮ್ಯೂಟ್ ಮಾಡಿದ್ದೀರಿ';

  @override
  String get placesUserUnmutedNote => 'ನೀವು ಕಾಣುವಂತೆ ಇರಿಸಿದ್ದೀರಿ';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ದಿನಗಳು',
      one: '1 ದಿನ',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'ಸ್ಥಳಗಳಿಗೆ ಹೆಸರಿಡಿ';

  @override
  String get settingsPlaceNamesBody =>
      'ಸ್ಥಳದ ನಿರ್ದೇಶಾಂಕಗಳನ್ನು ಹೆಸರಾಗಿ ಬದಲಿಸಲು ಸಿಸ್ಟಂಗೆ ಕೇಳುತ್ತದೆ. ಆ ನಿರ್ದೇಶಾಂಕ Apple ಅಥವಾ Google ಗೆ ಹೋಗುತ್ತದೆ — ಈ ಆ್ಯಪ್‌ನಲ್ಲಿ ನಿಮ್ಮ ಫೋನ್ ಬಿಟ್ಟು ಹೋಗುವ ಏಕೈಕ ವಿಷಯ ಅದು. ಡಿಫಾಲ್ಟ್ ಆಗಿ ಆಫ್; ಮತ್ತೆ ಆಫ್ ಮಾಡಿದರೆ ಎಲ್ಲಾ ಹೆಸರುಗಳನ್ನು ಮರೆತುಬಿಡುತ್ತದೆ.';

  @override
  String get settingsAutoMuteTitle => 'ಇದರ ನಂತರ ದೈನಂದಿನ ಸ್ಥಳಗಳನ್ನು ಮ್ಯೂಟ್ ಮಾಡಿ';

  @override
  String get settingsAutoMuteBody =>
      'ಇಷ್ಟೊಂದು ಬೇರೆ ಬೇರೆ ದಿನಗಳಲ್ಲಿ ಫೋಟೋಗಳಿರುವ ಸ್ಥಳ ನೀವು ಭೇಟಿ ನೀಡುವ ಸ್ಥಳವಲ್ಲ, ನೀವು ವಾಸಿಸುವ ಸ್ಥಳ.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ದಿನಗಳು',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'ಫೋಟೋ ಇಂಡೆಕ್ಸ್';

  @override
  String get settingsReindex => 'ಮೊದಲಿನಿಂದ ಮತ್ತೆ ಇಂಡೆಕ್ಸ್ ಮಾಡಿ';

  @override
  String get settingsPrivacyTitle => 'ಈ ಫೋನ್‌ನಲ್ಲಿ ಉಳಿಯುವುದು ಏನು';

  @override
  String get settingsPrivacyBody =>
      'ನಿಮ್ಮ ಫೋಟೋಗಳು, ಅವು ತೆಗೆದ ಸ್ಥಳಗಳು, ಮತ್ತು ಈ ಆ್ಯಪ್ ಅವುಗಳಿಂದ ಲೆಕ್ಕಿಸುವ ಎಲ್ಲವೂ. ಖಾತೆ ಇಲ್ಲ, ಸರ್ವರ್ ಇಲ್ಲ, ಅನಾಲಿಟಿಕ್ಸ್ ಇಲ್ಲ.';

  @override
  String get placesName => 'ಈ ಸ್ಥಳಕ್ಕೆ ಹೆಸರಿಡಿ';

  @override
  String get placesRename => 'ಮರುಹೆಸರಿಸಿ';

  @override
  String get placesNameDialogTitle => 'ಸ್ಥಳದ ಹೆಸರು';

  @override
  String get placesNameHint => 'ಅಜ್ಜಿಯ ಮನೆ, ಕೆರೆ, ಕಚೇರಿ…';

  @override
  String get placesNameSave => 'ಉಳಿಸಿ';

  @override
  String get placesNameClear => 'ಹೆಸರು ತೆಗೆಯಿರಿ';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'ನೀವು ಮೊದಲು ಇಲ್ಲಿದ್ದಿರಿ';

  @override
  String notificationBody(String age, String photos) {
    return 'ನೀವು ಕೊನೆಯ ಬಾರಿ ಇಲ್ಲಿದ್ದದ್ದು $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'ನಿಮಗಾಗಿ Been Here ಗಮನಿಸಲು ಬಿಡಿ';

  @override
  String get alwaysLocationBody =>
      'ಹಿನ್ನೆಲೆ ಸ್ಥಳದೊಂದಿಗೆ, ನೀವು ಹಿಂದೆ ಫೋಟೋ ತೆಗೆದ ಸ್ಥಳಕ್ಕೆ ಬಂದಾಗ ನಿಮ್ಮ ಫೋನ್ Been Here ಗೆ ತಿಳಿಸಬಲ್ಲದು — ಮತ್ತು ನೀವು ಏನನ್ನೂ ತೆರೆಯದೆ ಅದು ಒಮ್ಮೆ ಹೇಳಬಲ್ಲದು.\n\nಆ್ಯಪ್ ನಿಮ್ಮನ್ನು ಎಂದಿಗೂ ಹಿಂಬಾಲಿಸುವುದಿಲ್ಲ. ನಿಮ್ಮ ಫೋನ್ ಕೆಲವು ವೃತ್ತಗಳನ್ನು ಗಮನಿಸುತ್ತದೆ ಮತ್ತು ನೀವು ಒಂದರೊಳಗೆ ಪ್ರವೇಶಿಸಿದಾಗ ಮಾತ್ರ ಆ್ಯಪ್ ಅನ್ನು ಎಬ್ಬಿಸುತ್ತದೆ. ನೀವು ಎಲ್ಲಿದ್ದೀರಿ ಎಂಬುದರ ಬಗ್ಗೆ ಏನೂ ಈ ಸಾಧನದಿಂದ ಹೊರಹೋಗುವುದಿಲ್ಲ.';

  @override
  String get alwaysLocationAction => 'ಆಗಮನಗಳನ್ನು ಆನ್ ಮಾಡಿ';

  @override
  String get alwaysLocationLater => 'ಈಗ ಬೇಡ';

  @override
  String get alwaysLocationDeniedBody =>
      'ಹಿನ್ನೆಲೆ ಸ್ಥಳ ಆಫ್ ಆಗಿದೆ, ಆದ್ದರಿಂದ ಆಗಮನಗಳು ಮೌನವಾಗಿರುತ್ತವೆ. ಉಳಿದೆಲ್ಲವೂ ಮೊದಲಿನಂತೆಯೇ ಕೆಲಸ ಮಾಡುತ್ತದೆ; ಬೇಕಾದಾಗ ಸಿಸ್ಟಂ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಆನ್ ಮಾಡಬಹುದು.';

  @override
  String get settingsArrivalsTitle => 'ಆಗಮನಗಳು';

  @override
  String get settingsArrivalsOn =>
      'ನೀವು ಸ್ವಲ್ಪ ಕಾಲದಿಂದ ಫೋಟೋ ತೆಗೆಯದ ಸ್ಥಳಕ್ಕೆ ಬಂದಾಗ Been Here ನಿಮಗೆ ಹೇಳುತ್ತದೆ.';

  @override
  String get settingsArrivalsOff =>
      'Been Here ಮೌನವಾಗಿರುತ್ತದೆ. ಇದನ್ನು ಆನ್ ಮಾಡಿದರೆ ಹಿನ್ನೆಲೆ ಸ್ಥಳದ ಅನುಮತಿ ಕೇಳುತ್ತದೆ.';

  @override
  String get settingsMemoryAgeTitle =>
      'ಇದಕ್ಕಿಂತ ಹಳೆಯ ಸ್ಥಳಗಳನ್ನು ಮಾತ್ರ ಉಲ್ಲೇಖಿಸಿ';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ದಿನಗಳು',
      one: '1 ದಿನ',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle =>
      'ನಂತರ ಆ ಸ್ಥಳವನ್ನು ಇಷ್ಟು ಕಾಲ ಮೌನವಾಗಿಡಿ';

  @override
  String get settingsDailyLimitTitle => 'ಮತ್ತು ಇಷ್ಟು ಕಾಲ ಏನನ್ನೂ ಹೇಳಬೇಡಿ';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ಗಂಟೆಗಳು',
      one: '1 ಗಂಟೆ',
      zero: 'ಸಮಯವಿಲ್ಲ',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'ಅರ್ಧ ವರ್ಷ ಕಾಯದೆ ಆಗಮನಗಳನ್ನು ಪರೀಕ್ಷಿಸಲು ಇವನ್ನು ಕಡಿಮೆ ಮಾಡಿ.';

  @override
  String get placesTestArrival => 'ಇಲ್ಲಿ ಆಗಮನ ಪರೀಕ್ಷಿಸಿ';

  @override
  String get arrivalTestNotified => 'ಅಧಿಸೂಚನೆ ಕಳುಹಿಸಲಾಗಿದೆ';

  @override
  String get arrivalTestMuted => 'ಏನೂ ಇಲ್ಲ: ಸ್ಥಳ ಮ್ಯೂಟ್ ಆಗಿದೆ';

  @override
  String get arrivalTestTooFewPhotos => 'ಏನೂ ಇಲ್ಲ: ಇಲ್ಲಿ ಫೋಟೋಗಳು ತುಂಬಾ ಕಡಿಮೆ';

  @override
  String get arrivalTestTooRecent =>
      'ಏನೂ ಇಲ್ಲ: ನೀವು ಇಲ್ಲಿ ತೀರಾ ಇತ್ತೀಚೆಗೆ ಫೋಟೋ ತೆಗೆದಿದ್ದೀರಿ';

  @override
  String get arrivalTestPlaceCooldown => 'ಏನೂ ಇಲ್ಲ: ಈ ಸ್ಥಳ ಇತ್ತೀಚೆಗೆ ಮಾತನಾಡಿದೆ';

  @override
  String get arrivalTestDailyLimit => 'ಏನೂ ಇಲ್ಲ: ಇಂದು ಬೇರೆ ಏನೋ ಮಾತನಾಡಿದೆ';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'ನಿಮ್ಮ ಫೋನ್ ಸ್ಥಳವನ್ನು \"ಬಳಸುವಾಗ\" ಎಂದೇ ಇರಿಸಿದೆ. ಆ್ಯಪ್ ಒಳಗಿನಿಂದ iOS ಆಯ್ಕೆಯನ್ನು ಮತ್ತೆ ನೀಡುವುದಿಲ್ಲ, ಆದ್ದರಿಂದ ಹಿನ್ನೆಲೆ ಸ್ಥಳವನ್ನು ಸಿಸ್ಟಂ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ \"ಯಾವಾಗಲೂ\" ಎಂದು ಬದಲಿಸಬೇಕು — ಆಗ ಆಗಮನಗಳು ಕೆಲಸ ಮಾಡಲು ಶುರುವಾಗುತ್ತವೆ.';

  @override
  String get commonOpenSettings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ತೆರೆಯಿರಿ';

  @override
  String get settingsArrivalsPending =>
      'ಬಹುತೇಕ ಆಯ್ತು: ಸ್ಥಳ ಇನ್ನೂ \"ಬಳಸುವಾಗ\" ಇದೆ. ಸಿಸ್ಟಂ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ \"ಯಾವಾಗಲೂ\" ಎಂದು ಹೊಂದಿಸಿ.';

  @override
  String get placesSortVisits => 'ಹೆಚ್ಚು ಭೇಟಿಗಳು';

  @override
  String get placesSortAscending => 'ಉಲ್ಟಾ ಕ್ರಮ';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಭೇಟಿಗಳು',
      one: '1 ಭೇಟಿ',
      zero: 'ಎಂದಿಗೂ ಇಲ್ಲ',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'ಸ್ಥಳಗಳನ್ನು ನಕ್ಷೆಯಲ್ಲಿ ತೋರಿಸಿ';

  @override
  String get settingsMapBody =>
      'ನೀವು ಪ್ಯಾನ್ ಮತ್ತು ಜೂಮ್ ಮಾಡುವಾಗ ನಕ್ಷೆ ಟೈಲ್‌ಗಳನ್ನು OpenStreetMap ನಿಂದ ಡೌನ್‌ಲೋಡ್ ಮಾಡಲಾಗುತ್ತದೆ, ಆದ್ದರಿಂದ ಆ ಸರ್ವರ್ ನೀವು ಎಲ್ಲಿ ನೋಡುತ್ತಿದ್ದೀರಿ ಎಂಬ ನಿರಂತರ ಲೆಕ್ಕವನ್ನು ನೋಡುತ್ತದೆ. ಒಮ್ಮೆ ಕೇಳುವ ಸ್ಥಳದ ಹೆಸರಿಗಿಂತ ಭಿನ್ನವಾಗಿ, ನಕ್ಷೆ ತೆರೆದಿರುವವರೆಗೂ ಇದು ಮುಂದುವರಿಯುತ್ತದೆ. ಡಿಫಾಲ್ಟ್ ಆಗಿ ಆಫ್.';

  @override
  String get placesShowMap => 'ನಕ್ಷೆ';

  @override
  String get placesShowList => 'ಪಟ್ಟಿ';

  @override
  String get placesMapAttribution => '© OpenStreetMap ಕೊಡುಗೆದಾರರು';

  @override
  String get rephotoOverlay => 'ಮಸುಕು';

  @override
  String get rephotoEdges => 'ರೂಪರೇಖೆ';

  @override
  String get rephotoCapture => 'ತೆಗೆಯಿರಿ';

  @override
  String get rephotoSaved => 'ನಿಮ್ಮ ಫೋಟೋಗಳಲ್ಲಿ ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get rephotoNotSaved => 'ಉಳಿಸಲಾಗಲಿಲ್ಲ. ಫೋಟೋ ಸೇರಿಸುವುದು ಆಫ್ ಆಗಿರಬಹುದು.';

  @override
  String get rephotoNoCamera =>
      'ಕ್ಯಾಮೆರಾ ಲಭ್ಯವಿಲ್ಲ. ಹಳೆಯ ಫೋಟೋಗೆ ಉತ್ತರವಾಗುವ ಫೋಟೋ ತೆಗೆಯಲು Been Here ಗೆ ಕ್ಯಾಮೆರಾ ಬೇಕು.';

  @override
  String get rephotoThenAndNow => 'ಅಂದು ಮತ್ತು ಇಂದು';

  @override
  String get rephotoShare => 'ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get rephotoThen => 'ಅಂದು';

  @override
  String get rephotoNow => 'ಇಂದು';

  @override
  String get rephotoShareFailed => 'ಹಂಚಿಕೊಳ್ಳಲು ಚಿತ್ರ ಸಿದ್ಧಪಡಿಸಲಾಗಲಿಲ್ಲ.';

  @override
  String get onboardingSkip => 'ಬಿಡಿ';

  @override
  String get onboardingNext => 'ಮುಂದೆ';

  @override
  String get onboardingWhatTitle => 'ನೀವು ನಿಂತಿರುವ ಸ್ಥಳದ ಫೋಟೋಗಳು';

  @override
  String get onboardingWhatBody =>
      'ನೀವು ಹಿಂದೆ ಫೋಟೋ ತೆಗೆದ ಸ್ಥಳಕ್ಕೆ ಬಂದರೆ ಸಾಕು, Been Here ಅಲ್ಲಿ ನೀವು ತೆಗೆದದ್ದನ್ನು ತೋರಿಸುತ್ತದೆ — ಭೇಟಿಯಿಂದ ಭೇಟಿಗೆ, ಅತ್ಯಂತ ಹಳೆಯದು ಮೊದಲು.';

  @override
  String get onboardingPrivacyTitle => 'ಯಾವುದೂ ನಿಮ್ಮ ಫೋನ್ ಬಿಟ್ಟು ಹೋಗುವುದಿಲ್ಲ';

  @override
  String get onboardingPrivacyBody =>
      'ಖಾತೆ ಇಲ್ಲ, ಸರ್ವರ್ ಇಲ್ಲ, ಅನಾಲಿಟಿಕ್ಸ್ ಇಲ್ಲ. Been Here ನಿಮ್ಮ ಫೋಟೋ ಲೈಬ್ರರಿಯನ್ನು ಸಾಧನದಲ್ಲೇ ಓದುತ್ತದೆ ಮತ್ತು ಅದರ ಪಕ್ಕ ಒಂದು ಸಣ್ಣ ಇಂಡೆಕ್ಸ್ ಇಟ್ಟುಕೊಳ್ಳುತ್ತದೆ. ನಿಮ್ಮ ಫೋಟೋಗಳು ಮತ್ತು ಅವು ತೆಗೆದ ಸ್ಥಳಗಳು ಇರುವಲ್ಲೇ ಇರುತ್ತವೆ.';

  @override
  String get onboardingPrivacyFootnote =>
      'ಎರಡು ವಿಷಯಗಳು ನೆಟ್‌ವರ್ಕ್ ತಲುಪಬಹುದು, ಮತ್ತು ನೀವು ಆನ್ ಮಾಡುವವರೆಗೆ ಎರಡೂ ಆಫ್: ಸ್ಥಳದ ಹೆಸರುಗಳು ಮತ್ತು ನಕ್ಷೆ.';

  @override
  String get onboardingPhotosTitle => 'ಅದಕ್ಕೆ ನಿಮ್ಮ ಫೋಟೋಗಳು ಬೇಕು';

  @override
  String get onboardingPhotosBody =>
      'ಯಾವ ಫೋಟೋ ಎಲ್ಲಿ ತೆಗೆದದ್ದು ಎಂದು Been Here ಗಮನಿಸುತ್ತದೆ. ಅದು ಏನನ್ನೂ ನಕಲಿಸುವುದಿಲ್ಲ ಅಥವಾ ಸರಿಸುವುದಿಲ್ಲ — ಐಡಿ ಮತ್ತು ನಿರ್ದೇಶಾಂಕಗಳನ್ನು ನೆನಪಿಡುತ್ತದೆ, ಚಿತ್ರಗಳನ್ನು ನಿಮಗೆ ತೋರಿಸುವಾಗ ಮಾತ್ರ ಓದುತ್ತದೆ.';

  @override
  String get onboardingPhotosAction => 'ಫೋಟೋಗಳನ್ನು ಅನುಮತಿಸಿ';

  @override
  String get onboardingDone => 'ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get settingsAboutTitle => 'ಬಗ್ಗೆ';

  @override
  String settingsVersion(String version, String build) {
    return 'ಆವೃತ್ತಿ $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'ಮೂಲ ಕೋಡ್';

  @override
  String get settingsShowIntro => 'ಪರಿಚಯವನ್ನು ಮತ್ತೆ ತೋರಿಸಿ';

  @override
  String photoSemanticLabel(String date) {
    return '$date ರ ಫೋಟೋ';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return '$total ರಲ್ಲಿ $index ನೇ ಫೋಟೋ, $date';
  }

  @override
  String get placesActionsLabel => 'ಈ ಸ್ಥಳದೊಂದಿಗೆ ಏನು ಮಾಡಬೇಕು';

  @override
  String get radiusSemanticLabel => 'ಹುಡುಕಾಟದ ತ್ರಿಜ್ಯ';

  @override
  String get hereMapTitle => 'ಇಲ್ಲಿಯ ಸುತ್ತಮುತ್ತ';

  @override
  String get hereOpenInMaps => 'ನಕ್ಷೆಗಳಲ್ಲಿ ತೆರೆಯಿರಿ';

  @override
  String get hereBackToMe => 'ನಾನಿರುವ ಸ್ಥಳಕ್ಕೆ ಮರಳಿ';

  @override
  String get herePlaceFallbackTitle => 'ನಿಮಗೆ ಗೊತ್ತಿರುವ ಸ್ಥಳ';

  @override
  String get arrivalTestNearHome => 'ಸುದ್ದಿಯಾಗಲು ಮನೆಗೆ ತುಂಬಾ ಹತ್ತಿರ.';

  @override
  String get settingsHomeRadiusTitle => 'ಇದರೊಳಗೆ ಮೌನವಾಗಿರಿ';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: 'ಮನೆಯಿಂದ $km ಕಿಮೀ',
      one: 'ಮನೆಯಿಂದ 1 ಕಿಮೀ',
      zero: 'ದೂರವಿಲ್ಲ — ಎಂದಿಗೂ ಮೌನವಲ್ಲ',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'ದೈನಂದಿನ ಜೀವನ ಮನೆಯ ಹತ್ತಿರ ನಡೆಯುತ್ತದೆ, ಮತ್ತು ಅಲ್ಲೇ ಫೋನ್ ಅದರ ಬಗ್ಗೆ ಮಾತನಾಡುವುದು ಅತ್ಯಂತ ಅಪ್ರಿಯ. ಇದಕ್ಕಿಂತ ಹತ್ತಿರದ ಸ್ಥಳಗಳನ್ನು ಎಂದಿಗೂ ಗಮನಿಸುವುದಿಲ್ಲ.';

  @override
  String get settingsQuietTitle => 'ಏಕೆ ಮೌನವಾಗಿದೆ';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಸ್ಥಳಗಳನ್ನು ಗಮನಿಸುತ್ತಿದೆ',
      one: '1 ಸ್ಥಳವನ್ನು ಗಮನಿಸುತ್ತಿದೆ',
      zero: 'ಯಾವ ಸ್ಥಳವನ್ನೂ ಗಮನಿಸುತ್ತಿಲ್ಲ',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'ಹತ್ತಿರದ ಗಮನಿಸುತ್ತಿರುವ ಸ್ಥಳ: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'ಏನನ್ನೂ ಗಮನಿಸುತ್ತಿಲ್ಲ, ಆದ್ದರಿಂದ ಏನೂ ಬರಲಾರದು.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'ಕೊನೆಯ ಅಧಿಸೂಚನೆ: $when';
  }

  @override
  String get settingsQuietNever => 'ಎಂದಿಗೂ ಇಲ್ಲ';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return '$total ಸ್ಥಳಗಳಲ್ಲಿ: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count ಮ್ಯೂಟ್';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count ಮನೆಯ ಹತ್ತಿರ';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count ರಲ್ಲಿ ಫೋಟೋಗಳು ತುಂಬಾ ಕಡಿಮೆ';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count ಇತ್ತೀಚೆಗೆ ಫೋಟೋ ತೆಗೆದದ್ದು';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count ಇನ್ನೂ ತಣಿಯುತ್ತಿದೆ';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count ಗಮನಿಸಲು ಯೋಗ್ಯ';
  }

  @override
  String get ageSemanticLabel => 'ಫೋಟೋದ ವಯಸ್ಸು';

  @override
  String get ageStopNow => 'ಈಗ';

  @override
  String get ageStopDay => '1 ದಿನ';

  @override
  String get ageStop3Days => '3 ದಿನ';

  @override
  String get ageStopWeek => '1 ವಾರ';

  @override
  String get ageStop2Weeks => '2 ವಾರ';

  @override
  String get ageStopMonth => '1 ತಿಂಗಳು';

  @override
  String get ageStop3Months => '3 ತಿಂಗಳು';

  @override
  String get ageStop6Months => '6 ತಿಂಗಳು';

  @override
  String get ageStopYear => '1 ವರ್ಷ';

  @override
  String get ageStop2Years => '2 ವರ್ಷ';

  @override
  String get ageStop5Years => '5 ವರ್ಷ';

  @override
  String get ageStop10Years => '10 ವರ್ಷ';

  @override
  String get ageStopAll => 'ಎಲ್ಲಾ';

  @override
  String get ageWindowAll => 'ಎಲ್ಲಾ ಫೋಟೋಗಳು';

  @override
  String ageWindowNewerThan(String stop) {
    return '$stop ವರೆಗಿನ ಹಳೆಯದು';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return '$stop ಗಿಂತ ಹಳೆಯದು';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest ರಿಂದ $oldest ಹಳೆಯದು';
  }

  @override
  String get ageWindowReset => 'ಮರುಹೊಂದಿಸಿ';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ ಫೋಟೋಗಳು';
  }
}
