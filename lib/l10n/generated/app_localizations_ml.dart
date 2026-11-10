// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'ഇവിടെ';

  @override
  String get placesTabLabel => 'സ്ഥലങ്ങൾ';

  @override
  String get settingsTabLabel => 'ക്രമീകരണങ്ങൾ';

  @override
  String get hereEmptyTitle => 'നിങ്ങൾ ഇവിടെ ഫോട്ടോ എടുത്തിട്ടില്ല';

  @override
  String get hereEmptyBody =>
      'തിരച്ചിൽ ആരം വർധിപ്പിക്കുക, അല്ലെങ്കിൽ മുമ്പ് പോയിട്ടുള്ള ഇടത്തേക്ക് തിരികെ വരൂ.';

  @override
  String get hereNotIndexedTitle => 'ഇതുവരെ ഒന്നും ഇൻഡെക്സ് ചെയ്തിട്ടില്ല';

  @override
  String get hereNotIndexedBody =>
      'നിങ്ങൾ എവിടെയെല്ലാം പോയി എന്നറിയാൻ Been Here ഒരു തവണ നിങ്ങളുടെ ഫോട്ടോ ലൈബ്രറി വായിക്കണം. ഒന്നും നിങ്ങളുടെ ഫോണിന് പുറത്തേക്ക് പോകില്ല.';

  @override
  String get indexStartAction => 'എന്റെ ഫോട്ടോകൾ ഇൻഡെക്സ് ചെയ്യുക';

  @override
  String get indexPermissionTitle => 'Been Here ന് നിങ്ങളുടെ ഫോട്ടോകൾ വേണം';

  @override
  String get indexPermissionBody =>
      'ഓരോ ഫോട്ടോയും എവിടെ, എപ്പോൾ എടുത്തു എന്നത് മാത്രമേ അത് വായിക്കൂ, അത് ഈ ഫോണിൽ തന്നെ സൂക്ഷിക്കും.';

  @override
  String get indexPermissionAction => 'ആക്സസ് അനുവദിക്കുക';

  @override
  String get indexPermissionDeniedTitle => 'ഫോട്ടോ ആക്സസ് ഓഫാണ്';

  @override
  String get indexPermissionDeniedBody =>
      'അതില്ലാതെ Been Here ന് നിങ്ങൾക്ക് ഒന്നും കാണിക്കാനാവില്ല. സിസ്റ്റം ക്രമീകരണങ്ങളിൽ അത് ഓണാക്കാം.';

  @override
  String get indexLimitedAccessNotice =>
      'നിങ്ങൾ തിരഞ്ഞെടുത്ത ഫോട്ടോകൾ മാത്രമേ പങ്കിട്ടിട്ടുള്ളൂ, അതിനാൽ Been Here ന് അവ മാത്രമേ കാണാനാകൂ. പൂർണ്ണ ആക്സസ് അനുവദിച്ചാൽ നിങ്ങൾ പോയ എല്ലാ സ്ഥലങ്ങളും അതിന് കണ്ടെത്താം.';

  @override
  String get indexRunningTitle => 'നിങ്ങളുടെ ഫോട്ടോ ലൈബ്രറി വായിക്കുന്നു';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$total ൽ $processed';
  }

  @override
  String get indexFailedTitle => 'ഇൻഡെക്സിംഗ് നിലച്ചു';

  @override
  String get indexFailedBody =>
      'ഇടയ്ക്ക് എന്തോ പിഴച്ചു. വീണ്ടും ശ്രമിച്ചാൽ നിർത്തിയിടത്തുനിന്ന് തുടരും.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ഫോട്ടോകൾ ഇൻഡെക്സ് ചെയ്തു',
      one: '1 ഫോട്ടോ ഇൻഡെക്സ് ചെയ്തു',
      zero: 'ഫോട്ടോകളൊന്നും ഇൻഡെക്സ് ചെയ്തിട്ടില്ല',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return 'അവയിൽ $percent% ന് സ്ഥാനമുണ്ട്';
  }

  @override
  String get commonLoading => 'ലോഡ് ചെയ്യുന്നു…';

  @override
  String get commonRetry => 'വീണ്ടും ശ്രമിക്കുക';

  @override
  String get commonCancel => 'റദ്ദാക്കുക';

  @override
  String hereRadiusLabel(String radius) {
    return '$radius ഉള്ളിൽ';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ഫോട്ടോകൾ',
      one: '1 ഫോട്ടോ',
      zero: 'ഫോട്ടോകളില്ല',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count സന്ദർശനങ്ങൾ',
      one: '1 സന്ദർശനം',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters മീ';
  }

  @override
  String distanceKilometers(String km) {
    return '$km കി.മീ';
  }

  @override
  String get ageToday => 'ഇന്ന്';

  @override
  String get ageYesterday => 'ഇന്നലെ';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ദിവസം മുമ്പ്',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months മാസം മുമ്പ്',
      one: 'ഒരു മാസം മുമ്പ്',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years വർഷം മുമ്പ്',
      one: 'ഒരു വർഷം മുമ്പ്',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'നിങ്ങൾ എവിടെയാണ്?';

  @override
  String get locationPermissionBody =>
      'Been Here നിങ്ങളുടെ സ്ഥാനത്തെ നിങ്ങളുടെ ഫോട്ടോകൾ എടുത്ത സ്ഥലങ്ങളുമായി താരതമ്യം ചെയ്യുന്നു. താരതമ്യം ഈ ഫോണിൽ തന്നെയാണ് നടക്കുന്നത്.';

  @override
  String get locationPermissionAction => 'എന്റെ ലൊക്കേഷൻ ഉപയോഗിക്കുക';

  @override
  String get locationDeniedTitle => 'ലൊക്കേഷൻ ഓഫാണ്';

  @override
  String get locationDeniedBody =>
      'അതില്ലാതെ നിങ്ങൾക്ക് ഇവിടെ എന്തുണ്ടെന്ന് ആപ്പിന് പറയാനാവില്ല. സിസ്റ്റം ക്രമീകരണങ്ങളിൽ അത് ഓണാക്കാം.';

  @override
  String get locationUnavailableTitle => 'ഇതുവരെ സ്ഥാനം കിട്ടിയിട്ടില്ല';

  @override
  String get locationUnavailableBody =>
      'നിങ്ങളുടെ ഫോണിന് താൻ എവിടെയാണെന്ന് ഇതുവരെ മനസ്സിലായിട്ടില്ല. അകത്താണെങ്കിൽ ഇതിന് അൽപ്പം സമയമെടുത്തേക്കാം.';

  @override
  String get locationServicesDisabledTitle => 'ലൊക്കേഷൻ സേവനങ്ങൾ ഓഫാണ്';

  @override
  String get locationServicesDisabledBody =>
      'സിസ്റ്റം ക്രമീകരണങ്ങളിൽ അവ ഓണാക്കി തിരിച്ചുവരൂ.';

  @override
  String get hereNothingTitle => 'നിങ്ങൾ ഇവിടെ ഫോട്ടോ എടുത്തിട്ടില്ല';

  @override
  String get hereNothingBody =>
      'വലിയ ആരം പരീക്ഷിക്കൂ, അല്ലെങ്കിൽ മുമ്പ് പോയിട്ടുള്ള ഇടത്തേക്ക് തിരികെ വരൂ.';

  @override
  String hereNearestHint(String distance) {
    return 'നിങ്ങളുടെ ഏറ്റവും അടുത്ത ഓർമ്മ $distance അകലെയാണ്.';
  }

  @override
  String get photoDetailRephoto => 'റീഫോട്ടോ';

  @override
  String get photoDetailRephotoSoon =>
      'റീഫോട്ടോ ഒരു പിന്നീടുള്ള പതിപ്പിൽ വരും.';

  @override
  String photoDetailOf(int index, int total) {
    return '$total ൽ $index';
  }

  @override
  String get debugLocationTitle => 'ഡീബഗ് ലൊക്കേഷൻ';

  @override
  String get debugLocationBody =>
      'മറ്റെവിടെയോ ആണെന്ന് ഭാവിക്കൂ, അങ്ങനെ സോഫയിലിരുന്നു തന്നെ ഇവിടെ സ്ക്രീൻ പരീക്ഷിക്കാം.';

  @override
  String get debugLocationLatitude => 'അക്ഷാംശം';

  @override
  String get debugLocationLongitude => 'രേഖാംശം';

  @override
  String get debugLocationApply => 'അവിടെ പോകുക';

  @override
  String get debugLocationClear => 'യഥാർത്ഥ ലൊക്കേഷൻ ഉപയോഗിക്കുക';

  @override
  String get debugLocationActive => 'ഡീബഗ് ലൊക്കേഷൻ സജീവമാണ്';

  @override
  String get commonClose => 'അടയ്ക്കുക';

  @override
  String get placesEmptyTitle => 'ഇതുവരെ സ്ഥലങ്ങളില്ല';

  @override
  String get placesEmptyBody =>
      'നിങ്ങളുടെ ഫോട്ടോകൾ ഇൻഡെക്സ് ചെയ്തു കഴിഞ്ഞാൽ സ്ഥലങ്ങൾ വരും.';

  @override
  String get placesSortLabel => 'ഇങ്ങനെ ക്രമീകരിക്കുക';

  @override
  String get placesSortLongestAgo => 'ഏറ്റവും പഴയത്';

  @override
  String get placesSortMostPhotos => 'ഏറ്റവും കൂടുതൽ ഫോട്ടോകൾ';

  @override
  String get placesSortNearest => 'ഏറ്റവും അടുത്തത്';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count മ്യൂട്ട് ചെയ്ത സ്ഥലങ്ങൾ',
      one: '1 മ്യൂട്ട് ചെയ്ത സ്ഥലം',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'മ്യൂട്ട്';

  @override
  String get placesUnmute => 'അൺമ്യൂട്ട്';

  @override
  String get placesUseAutoRule => 'സ്വയം തീരുമാനിക്കുക';

  @override
  String get placesAutoMutedNote =>
      'സ്വയം മ്യൂട്ട് ചെയ്തു — നിങ്ങൾ മിക്ക ദിവസവും ഇവിടെയാണ്';

  @override
  String get placesUserMutedNote => 'നിങ്ങൾ മ്യൂട്ട് ചെയ്തു';

  @override
  String get placesUserUnmutedNote => 'നിങ്ങൾ കാണാൻ വിട്ടു';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ദിവസം',
      one: '1 ദിവസം',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'സ്ഥലങ്ങൾക്ക് പേരിടുക';

  @override
  String get settingsPlaceNamesBody =>
      'ഒരു സ്ഥലത്തിന്റെ കോർഡിനേറ്റുകളെ പേരാക്കി മാറ്റാൻ സിസ്റ്റത്തോട് ആവശ്യപ്പെടുന്നു. ആ കോർഡിനേറ്റ് Apple അല്ലെങ്കിൽ Google ലേക്ക് പോകും — ഈ ആപ്പിൽ നിങ്ങളുടെ ഫോൺ വിട്ടുപോകുന്ന ഒരേയൊരു കാര്യം അതാണ്. സ്ഥിരമായി ഓഫ്; വീണ്ടും ഓഫാക്കിയാൽ എല്ലാ പേരുകളും മറക്കും.';

  @override
  String get settingsAutoMuteTitle =>
      'ഇതിനു ശേഷം ദൈനംദിന സ്ഥലങ്ങൾ മ്യൂട്ട് ചെയ്യുക';

  @override
  String get settingsAutoMuteBody =>
      'ഇത്രയും വ്യത്യസ്ത ദിവസങ്ങളിൽ ഫോട്ടോകളുള്ള സ്ഥലം നിങ്ങൾ സന്ദർശിക്കുന്ന ഇടമല്ല, നിങ്ങൾ താമസിക്കുന്ന ഇടമാണ്.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ദിവസം',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'ഫോട്ടോ ഇൻഡെക്സ്';

  @override
  String get settingsReindex => 'തുടക്കം മുതൽ വീണ്ടും ഇൻഡെക്സ് ചെയ്യുക';

  @override
  String get settingsPrivacyTitle => 'ഈ ഫോണിൽ തുടരുന്നത് എന്താണ്';

  @override
  String get settingsPrivacyBody =>
      'നിങ്ങളുടെ ഫോട്ടോകൾ, അവ എടുത്ത സ്ഥലങ്ങൾ, ഈ ആപ്പ് അവയിൽ നിന്ന് കണ്ടെത്തുന്ന എല്ലാം. അക്കൗണ്ടില്ല, സെർവറില്ല, അനലിറ്റിക്സില്ല.';

  @override
  String get placesName => 'ഈ സ്ഥലത്തിന് പേരിടുക';

  @override
  String get placesRename => 'പേര് മാറ്റുക';

  @override
  String get placesNameDialogTitle => 'സ്ഥലത്തിന്റെ പേര്';

  @override
  String get placesNameHint => 'മുത്തശ്ശിയുടെ വീട്, തടാകം, ഓഫീസ്…';

  @override
  String get placesNameSave => 'സംരക്ഷിക്കുക';

  @override
  String get placesNameClear => 'പേര് നീക്കുക';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'നിങ്ങൾ മുമ്പ് ഇവിടെ വന്നിട്ടുണ്ട്';

  @override
  String notificationBody(String age, String photos) {
    return 'നിങ്ങൾ അവസാനം ഇവിടെ വന്നത് $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'നിങ്ങൾക്കായി Been Here ശ്രദ്ധിക്കട്ടെ';

  @override
  String get alwaysLocationBody =>
      'പശ്ചാത്തല ലൊക്കേഷൻ ഉണ്ടെങ്കിൽ, മുമ്പ് ഫോട്ടോ എടുത്ത ഇടത്ത് നിങ്ങൾ എത്തുമ്പോൾ നിങ്ങളുടെ ഫോണിന് Been Here നെ അറിയിക്കാം — നിങ്ങൾ ഒന്നും തുറക്കാതെ തന്നെ അത് ഒരിക്കൽ പറയും.\n\nആപ്പ് ഒരിക്കലും നിങ്ങളെ പിന്തുടരില്ല. നിങ്ങളുടെ ഫോൺ ഏതാനും വൃത്തങ്ങൾ നിരീക്ഷിക്കുകയും അവയിലൊന്നിൽ പ്രവേശിക്കുമ്പോൾ മാത്രം ആപ്പിനെ ഉണർത്തുകയും ചെയ്യുന്നു. നിങ്ങൾ എവിടെയാണെന്നതിനെക്കുറിച്ച് ഒന്നും ഈ ഉപകരണത്തിൽ നിന്ന് പുറത്തുപോകില്ല.';

  @override
  String get alwaysLocationAction => 'വരവുകൾ ഓണാക്കുക';

  @override
  String get alwaysLocationLater => 'ഇപ്പോൾ വേണ്ട';

  @override
  String get alwaysLocationDeniedBody =>
      'പശ്ചാത്തല ലൊക്കേഷൻ ഓഫാണ്, അതിനാൽ വരവുകൾ നിശ്ശബ്ദമായിരിക്കും. ബാക്കിയെല്ലാം മുമ്പത്തെപ്പോലെ പ്രവർത്തിക്കും; ഇഷ്ടമുള്ളപ്പോൾ സിസ്റ്റം ക്രമീകരണങ്ങളിൽ ഓണാക്കാം.';

  @override
  String get settingsArrivalsTitle => 'വരവുകൾ';

  @override
  String get settingsArrivalsOn =>
      'കുറച്ചുകാലമായി ഫോട്ടോ എടുക്കാത്ത ഇടത്ത് നിങ്ങൾ എത്തുമ്പോൾ Been Here നിങ്ങളോട് പറയും.';

  @override
  String get settingsArrivalsOff =>
      'Been Here നിശ്ശബ്ദമായിരിക്കും. ഇത് ഓണാക്കിയാൽ പശ്ചാത്തല ലൊക്കേഷൻ ചോദിക്കും.';

  @override
  String get settingsMemoryAgeTitle =>
      'ഇതിനെക്കാൾ പഴയ സ്ഥലങ്ങൾ മാത്രം പരാമർശിക്കുക';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ദിവസം',
      one: '1 ദിവസം',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle =>
      'പിന്നെ ആ സ്ഥലം ഇത്രനേരം നിശ്ശബ്ദമാക്കുക';

  @override
  String get settingsDailyLimitTitle => 'പിന്നെ ഇത്രനേരം ഒന്നും പറയാതിരിക്കുക';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours മണിക്കൂർ',
      one: '1 മണിക്കൂർ',
      zero: 'സമയമില്ല',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'അരവർഷം കാത്തിരിക്കാതെ വരവുകൾ പരീക്ഷിക്കാൻ ഇവ കുറയ്ക്കുക.';

  @override
  String get placesTestArrival => 'ഇവിടെ ഒരു വരവ് പരീക്ഷിക്കുക';

  @override
  String get arrivalTestNotified => 'അറിയിപ്പ് അയച്ചു';

  @override
  String get arrivalTestMuted => 'ഒന്നുമില്ല: സ്ഥലം മ്യൂട്ടാണ്';

  @override
  String get arrivalTestTooFewPhotos =>
      'ഒന്നുമില്ല: ഇവിടെ ഫോട്ടോകൾ വളരെ കുറവാണ്';

  @override
  String get arrivalTestTooRecent =>
      'ഒന്നുമില്ല: നിങ്ങൾ ഇവിടെ അടുത്തിടെയാണ് ഫോട്ടോ എടുത്തത്';

  @override
  String get arrivalTestPlaceCooldown =>
      'ഒന്നുമില്ല: ഈ സ്ഥലം അടുത്തിടെ സംസാരിച്ചു';

  @override
  String get arrivalTestDailyLimit => 'ഒന്നുമില്ല: ഇന്ന് മറ്റെന്തോ സംസാരിച്ചു';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'നിങ്ങളുടെ ഫോൺ ലൊക്കേഷൻ \"ഉപയോഗിക്കുമ്പോൾ\" എന്നുതന്നെ നിലനിർത്തി. ആപ്പിനുള്ളിൽ നിന്ന് iOS ഈ തിരഞ്ഞെടുപ്പ് വീണ്ടും തരില്ല, അതിനാൽ പശ്ചാത്തല ലൊക്കേഷൻ സിസ്റ്റം ക്രമീകരണങ്ങളിൽ \"എപ്പോഴും\" ആക്കണം — അപ്പോൾ വരവുകൾ പ്രവർത്തിച്ചുതുടങ്ങും.';

  @override
  String get commonOpenSettings => 'ക്രമീകരണങ്ങൾ തുറക്കുക';

  @override
  String get settingsArrivalsPending =>
      'ഏതാണ്ട് ആയി: ലൊക്കേഷൻ ഇപ്പോഴും \"ഉപയോഗിക്കുമ്പോൾ\" ആണ്. സിസ്റ്റം ക്രമീകരണങ്ങളിൽ \"എപ്പോഴും\" ആക്കുക.';

  @override
  String get placesSortVisits => 'ഏറ്റവും കൂടുതൽ സന്ദർശനങ്ങൾ';

  @override
  String get placesSortAscending => 'ക്രമം തിരിക്കുക';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count സന്ദർശനങ്ങൾ',
      one: '1 സന്ദർശനം',
      zero: 'ഒരിക്കലുമില്ല',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'സ്ഥലങ്ങൾ മാപ്പിൽ കാണിക്കുക';

  @override
  String get settingsMapBody =>
      'നിങ്ങൾ പാൻ ചെയ്യുകയും സൂം ചെയ്യുകയും ചെയ്യുമ്പോൾ മാപ്പ് ടൈലുകൾ OpenStreetMap ൽ നിന്ന് ഡൗൺലോഡ് ചെയ്യുന്നു, അതിനാൽ ആ സെർവർ നിങ്ങൾ എവിടെ നോക്കുന്നു എന്ന തുടർച്ചയായ കണക്ക് കാണുന്നു. ഒരു തവണ മാത്രം ചോദിക്കുന്ന സ്ഥലപ്പേരിൽ നിന്ന് വ്യത്യസ്തമായി, മാപ്പ് തുറന്നിരിക്കുന്നിടത്തോളം ഇത് തുടരും. സ്ഥിരമായി ഓഫ്.';

  @override
  String get placesShowMap => 'മാപ്പ്';

  @override
  String get placesShowList => 'പട്ടിക';

  @override
  String get placesMapAttribution => '© OpenStreetMap സംഭാവകർ';

  @override
  String get rephotoOverlay => 'മങ്ങൽ';

  @override
  String get rephotoEdges => 'രൂപരേഖ';

  @override
  String get rephotoCapture => 'എടുക്കുക';

  @override
  String get rephotoSaved => 'നിങ്ങളുടെ ഫോട്ടോകളിൽ സംരക്ഷിച്ചു';

  @override
  String get rephotoNotSaved =>
      'സംരക്ഷിക്കാനായില്ല. ഫോട്ടോ ചേർക്കൽ ഓഫായിരിക്കാം.';

  @override
  String get rephotoNoCamera =>
      'ക്യാമറ ലഭ്യമല്ല. പഴയ ഫോട്ടോയ്ക്ക് മറുപടിയായ ഫോട്ടോ എടുക്കാൻ Been Here ന് ക്യാമറ വേണം.';

  @override
  String get rephotoThenAndNow => 'അന്നും ഇന്നും';

  @override
  String get rephotoShare => 'പങ്കിടുക';

  @override
  String get rephotoThen => 'അന്ന്';

  @override
  String get rephotoNow => 'ഇന്ന്';

  @override
  String get rephotoShareFailed => 'പങ്കിടാനുള്ള ചിത്രം ഉണ്ടാക്കാനായില്ല.';

  @override
  String get onboardingSkip => 'ഒഴിവാക്കുക';

  @override
  String get onboardingNext => 'അടുത്തത്';

  @override
  String get onboardingWhatTitle => 'നിങ്ങൾ നിൽക്കുന്ന സ്ഥലത്തെ ഫോട്ടോകൾ';

  @override
  String get onboardingWhatBody =>
      'മുമ്പ് ഫോട്ടോ എടുത്ത ഇടത്ത് എത്തൂ, അവിടെ എടുത്തത് Been Here കാണിച്ചുതരും — സന്ദർശനം സന്ദർശനമായി, ഏറ്റവും പഴയത് ആദ്യം.';

  @override
  String get onboardingPrivacyTitle => 'ഒന്നും നിങ്ങളുടെ ഫോൺ വിട്ടുപോകുന്നില്ല';

  @override
  String get onboardingPrivacyBody =>
      'അക്കൗണ്ടില്ല, സെർവറില്ല, അനലിറ്റിക്സില്ല. Been Here ഉപകരണത്തിൽ തന്നെ നിങ്ങളുടെ ഫോട്ടോ ലൈബ്രറി വായിക്കുകയും അതിനടുത്ത് ഒരു ചെറിയ ഇൻഡെക്സ് സൂക്ഷിക്കുകയും ചെയ്യുന്നു. നിങ്ങളുടെ ഫോട്ടോകളും അവ എടുത്ത സ്ഥലങ്ങളും ഉള്ളിടത്തുതന്നെ തുടരും.';

  @override
  String get onboardingPrivacyFootnote =>
      'രണ്ട് കാര്യങ്ങൾക്ക് നെറ്റ്‌വർക്കിലെത്താനാകും, നിങ്ങൾ ഓണാക്കുന്നതുവരെ രണ്ടും ഓഫാണ്: സ്ഥലപ്പേരുകളും മാപ്പും.';

  @override
  String get onboardingPhotosTitle => 'അതിന് നിങ്ങളുടെ ഫോട്ടോകൾ വേണം';

  @override
  String get onboardingPhotosBody =>
      'ഏത് ഫോട്ടോ എവിടെ എടുത്തു എന്ന് Been Here കുറിച്ചുവയ്ക്കുന്നു. അത് ഒന്നും പകർത്തുകയോ നീക്കുകയോ ചെയ്യില്ല — ഐഡികളും കോർഡിനേറ്റുകളും ഓർക്കുന്നു, ചിത്രങ്ങൾ നിങ്ങളെ കാണിക്കുമ്പോൾ മാത്രം വായിക്കുന്നു.';

  @override
  String get onboardingPhotosAction => 'ഫോട്ടോകൾ അനുവദിക്കുക';

  @override
  String get onboardingDone => 'തുടങ്ങുക';

  @override
  String get settingsAboutTitle => 'വിവരം';

  @override
  String settingsVersion(String version, String build) {
    return 'പതിപ്പ് $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'സോഴ്സ് കോഡ്';

  @override
  String get settingsShowIntro => 'ആമുഖം വീണ്ടും കാണിക്കുക';

  @override
  String photoSemanticLabel(String date) {
    return '$date ലെ ഫോട്ടോ';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return '$total ൽ $index ാമത്തെ ഫോട്ടോ, $date';
  }

  @override
  String get placesActionsLabel => 'ഈ സ്ഥലത്തെ എന്തുചെയ്യണം';

  @override
  String get radiusSemanticLabel => 'തിരച്ചിൽ ആരം';

  @override
  String get hereMapTitle => 'ഇവിടത്തെ ചുറ്റുപാട്';

  @override
  String get hereOpenInMaps => 'മാപ്സിൽ തുറക്കുക';

  @override
  String get hereBackToMe => 'ഞാൻ ഉള്ളിടത്തേക്ക് തിരിച്ച്';

  @override
  String get herePlaceFallbackTitle => 'നിങ്ങൾക്ക് അറിയാവുന്ന ഒരിടം';

  @override
  String get arrivalTestNearHome => 'വാർത്തയാകാൻ വീടിനോട് വളരെ അടുത്താണ്.';

  @override
  String get settingsHomeRadiusTitle => 'ഇതിനുള്ളിൽ നിശ്ശബ്ദമായിരിക്കുക';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: 'വീട്ടിൽ നിന്ന് $km കി.മീ',
      one: 'വീട്ടിൽ നിന്ന് 1 കി.മീ',
      zero: 'ദൂരമില്ല — ഒരിക്കലും നിശ്ശബ്ദമല്ല',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'ദൈനംദിന ജീവിതം വീടിനടുത്താണ് നടക്കുന്നത്, അവിടെയാണ് ഫോൺ അതിനെക്കുറിച്ച് അഭിപ്രായം പറയുന്നത് ഏറ്റവും അനിഷ്ടം. ഇതിനെക്കാൾ അടുത്തുള്ള സ്ഥലങ്ങൾ ഒരിക്കലും നിരീക്ഷിക്കില്ല.';

  @override
  String get settingsQuietTitle => 'എന്തുകൊണ്ട് നിശ്ശബ്ദം';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count സ്ഥലങ്ങൾ നിരീക്ഷിക്കുന്നു',
      one: '1 സ്ഥലം നിരീക്ഷിക്കുന്നു',
      zero: 'ഒരു സ്ഥലവും നിരീക്ഷിക്കുന്നില്ല',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'ഏറ്റവും അടുത്ത നിരീക്ഷിക്കുന്ന സ്ഥലം: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'ഒന്നും നിരീക്ഷിക്കുന്നില്ല, അതിനാൽ ഒന്നും വരാനില്ല.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'അവസാന അറിയിപ്പ്: $when';
  }

  @override
  String get settingsQuietNever => 'ഒരിക്കലുമില്ല';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return '$total സ്ഥലങ്ങളിൽ: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count മ്യൂട്ട്';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count വീടിനടുത്ത്';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count ഫോട്ടോകൾ വളരെ കുറവ്';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count അടുത്തിടെ ഫോട്ടോ എടുത്തത്';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count ഇപ്പോഴും തണുക്കുന്നു';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count നിരീക്ഷിക്കാൻ കൊള്ളാം';
  }

  @override
  String get ageSemanticLabel => 'ഫോട്ടോയുടെ പഴക്കം';

  @override
  String get ageStopNow => 'ഇപ്പോൾ';

  @override
  String get ageStopDay => '1 ദിവസം';

  @override
  String get ageStop3Days => '3 ദിവസം';

  @override
  String get ageStopWeek => '1 ആഴ്ച';

  @override
  String get ageStop2Weeks => '2 ആഴ്ച';

  @override
  String get ageStopMonth => '1 മാസം';

  @override
  String get ageStop3Months => '3 മാസം';

  @override
  String get ageStop6Months => '6 മാസം';

  @override
  String get ageStopYear => '1 വർഷം';

  @override
  String get ageStop2Years => '2 വർഷം';

  @override
  String get ageStop5Years => '5 വർഷം';

  @override
  String get ageStop10Years => '10 വർഷം';

  @override
  String get ageStopAll => 'എല്ലാം';

  @override
  String get ageWindowAll => 'എല്ലാ ഫോട്ടോകളും';

  @override
  String ageWindowNewerThan(String stop) {
    return '$stop വരെ പഴക്കമുള്ളത്';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return '$stop ൽ കൂടുതൽ പഴക്കമുള്ളത്';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest മുതൽ $oldest വരെ പഴക്കം';
  }

  @override
  String get ageWindowReset => 'റീസെറ്റ്';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ ഫോട്ടോകൾ';
  }
}
