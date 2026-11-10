// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'இங்கே';

  @override
  String get placesTabLabel => 'இடங்கள்';

  @override
  String get settingsTabLabel => 'அமைப்புகள்';

  @override
  String get hereEmptyTitle => 'நீங்கள் இங்கே புகைப்படம் எடுக்கவில்லை';

  @override
  String get hereEmptyBody =>
      'தேடல் ஆரத்தை அதிகரியுங்கள், அல்லது முன்பு சென்ற இடத்துக்குத் திரும்புங்கள்.';

  @override
  String get hereNotIndexedTitle => 'இன்னும் எதுவும் அட்டவணைப்படுத்தப்படவில்லை';

  @override
  String get hereNotIndexedBody =>
      'நீங்கள் எங்கெல்லாம் சென்றீர்கள் என அறிய Been Here உங்கள் புகைப்பட நூலகத்தை ஒருமுறை படிக்க வேண்டும். எதுவும் உங்கள் தொலைபேசியை விட்டு வெளியே போகாது.';

  @override
  String get indexStartAction => 'என் புகைப்படங்களை அட்டவணைப்படுத்து';

  @override
  String get indexPermissionTitle => 'Been Here க்கு உங்கள் புகைப்படங்கள் தேவை';

  @override
  String get indexPermissionBody =>
      'ஒவ்வொரு புகைப்படமும் எங்கே, எப்போது எடுக்கப்பட்டது என்பதை மட்டுமே இது படிக்கும், அதை இந்தத் தொலைபேசியிலேயே வைத்திருக்கும்.';

  @override
  String get indexPermissionAction => 'அணுகலை அனுமதி';

  @override
  String get indexPermissionDeniedTitle => 'புகைப்பட அணுகல் அணைக்கப்பட்டுள்ளது';

  @override
  String get indexPermissionDeniedBody =>
      'அது இல்லாமல் Been Here உங்களுக்கு எதையும் காட்ட முடியாது. கணினி அமைப்புகளில் அதை இயக்கலாம்.';

  @override
  String get indexLimitedAccessNotice =>
      'நீங்கள் தேர்ந்தெடுத்த புகைப்படங்களை மட்டுமே பகிர்ந்துள்ளீர்கள், எனவே Been Here அவற்றை மட்டுமே பார்க்க முடியும். முழு அணுகலை அனுமதித்தால் நீங்கள் சென்ற ஒவ்வொரு இடத்தையும் அது கண்டுபிடிக்கும்.';

  @override
  String get indexRunningTitle => 'உங்கள் புகைப்பட நூலகம் படிக்கப்படுகிறது';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$total இல் $processed';
  }

  @override
  String get indexFailedTitle => 'அட்டவணைப்படுத்தல் நின்றது';

  @override
  String get indexFailedBody =>
      'நடுவில் ஏதோ தவறு நடந்தது. மீண்டும் முயன்றால் நின்ற இடத்திலிருந்து தொடரும்.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count புகைப்படங்கள் அட்டவணைப்படுத்தப்பட்டன',
      one: '1 புகைப்படம் அட்டவணைப்படுத்தப்பட்டது',
      zero: 'புகைப்படங்கள் அட்டவணைப்படுத்தப்படவில்லை',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return 'அவற்றில் $percent% க்கு இடம் உள்ளது';
  }

  @override
  String get commonLoading => 'ஏற்றுகிறது…';

  @override
  String get commonRetry => 'மீண்டும் முயற்சி';

  @override
  String get commonCancel => 'ரத்து';

  @override
  String hereRadiusLabel(String radius) {
    return '$radius க்குள்';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count புகைப்படங்கள்',
      one: '1 புகைப்படம்',
      zero: 'புகைப்படங்கள் இல்லை',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count வருகைகள்',
      one: '1 வருகை',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters மீ';
  }

  @override
  String distanceKilometers(String km) {
    return '$km கி.மீ';
  }

  @override
  String get ageToday => 'இன்று';

  @override
  String get ageYesterday => 'நேற்று';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days நாட்களுக்கு முன்',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months மாதங்களுக்கு முன்',
      one: 'ஒரு மாதத்துக்கு முன்',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years வருடங்களுக்கு முன்',
      one: 'ஒரு வருடத்துக்கு முன்',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'நீங்கள் எங்கே இருக்கிறீர்கள்?';

  @override
  String get locationPermissionBody =>
      'Been Here உங்கள் நிலையை உங்கள் புகைப்படங்கள் எடுக்கப்பட்ட இடங்களுடன் ஒப்பிடுகிறது. இந்த ஒப்பீடு இந்தத் தொலைபேசியிலேயே நடக்கிறது.';

  @override
  String get locationPermissionAction => 'என் இருப்பிடத்தைப் பயன்படுத்து';

  @override
  String get locationDeniedTitle => 'இருப்பிடம் அணைக்கப்பட்டுள்ளது';

  @override
  String get locationDeniedBody =>
      'அது இல்லாமல் உங்களிடம் இங்கே என்ன உள்ளது என்று ஆப்ஸால் சொல்ல முடியாது. கணினி அமைப்புகளில் அதை இயக்கலாம்.';

  @override
  String get locationUnavailableTitle => 'இன்னும் நிலை கிடைக்கவில்லை';

  @override
  String get locationUnavailableBody =>
      'உங்கள் தொலைபேசிக்கு தான் எங்கிருக்கிறது என்று இன்னும் தெரியவில்லை. கட்டடத்துக்குள் இதற்குச் சற்று நேரம் ஆகலாம்.';

  @override
  String get locationServicesDisabledTitle =>
      'இருப்பிடச் சேவைகள் அணைக்கப்பட்டுள்ளன';

  @override
  String get locationServicesDisabledBody =>
      'கணினி அமைப்புகளில் அவற்றை இயக்கிவிட்டுத் திரும்பி வாருங்கள்.';

  @override
  String get hereNothingTitle => 'நீங்கள் இங்கே புகைப்படம் எடுக்கவில்லை';

  @override
  String get hereNothingBody =>
      'பெரிய ஆரத்தை முயலுங்கள், அல்லது முன்பு சென்ற இடத்துக்குத் திரும்புங்கள்.';

  @override
  String hereNearestHint(String distance) {
    return 'உங்கள் மிக அருகிலுள்ள நினைவு $distance தொலைவில் உள்ளது.';
  }

  @override
  String get photoDetailRephoto => 'மறுபடம்';

  @override
  String get photoDetailRephotoSoon => 'மறுபடம் பிந்தைய பதிப்பில் வரும்.';

  @override
  String photoDetailOf(int index, int total) {
    return '$total இல் $index';
  }

  @override
  String get debugLocationTitle => 'பிழைத்திருத்த இருப்பிடம்';

  @override
  String get debugLocationBody =>
      'வேறெங்கோ இருப்பது போல நடியுங்கள், அப்போது இங்கே திரையை சோபாவிலிருந்தே சோதிக்கலாம்.';

  @override
  String get debugLocationLatitude => 'அட்சரேகை';

  @override
  String get debugLocationLongitude => 'தீர்க்கரேகை';

  @override
  String get debugLocationApply => 'அங்கே செல்';

  @override
  String get debugLocationClear => 'உண்மையான இருப்பிடத்தைப் பயன்படுத்து';

  @override
  String get debugLocationActive => 'பிழைத்திருத்த இருப்பிடம் செயலில் உள்ளது';

  @override
  String get commonClose => 'மூடு';

  @override
  String get placesEmptyTitle => 'இன்னும் இடங்கள் இல்லை';

  @override
  String get placesEmptyBody =>
      'உங்கள் புகைப்படங்கள் அட்டவணைப்படுத்தப்பட்டதும் இடங்கள் தோன்றும்.';

  @override
  String get placesSortLabel => 'இப்படி வரிசைப்படுத்து';

  @override
  String get placesSortLongestAgo => 'மிக நீண்ட காலமாக';

  @override
  String get placesSortMostPhotos => 'அதிக புகைப்படங்கள்';

  @override
  String get placesSortNearest => 'மிக அருகில்';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count முடக்கிய இடங்கள்',
      one: '1 முடக்கிய இடம்',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'முடக்கு';

  @override
  String get placesUnmute => 'முடக்கத்தை நீக்கு';

  @override
  String get placesUseAutoRule => 'தானாக முடிவு செய்';

  @override
  String get placesAutoMutedNote =>
      'தானாக முடக்கப்பட்டது — நீங்கள் பெரும்பாலான நாட்கள் இங்கே இருக்கிறீர்கள்';

  @override
  String get placesUserMutedNote => 'நீங்கள் முடக்கினீர்கள்';

  @override
  String get placesUserUnmutedNote => 'நீங்கள் தெரியும்படி வைத்தீர்கள்';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days நாட்கள்',
      one: '1 நாள்',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'இடங்களுக்குப் பெயரிடு';

  @override
  String get settingsPlaceNamesBody =>
      'ஒரு இடத்தின் ஆயங்களை பெயராக மாற்றுமாறு கணினியிடம் கேட்கிறது. அந்த ஆயம் Apple அல்லது Google க்குப் போகிறது — இந்த ஆப்ஸில் உங்கள் தொலைபேசியை விட்டு வெளியே போகும் ஒரே விஷயம் அதுதான். இயல்பாக அணைந்திருக்கும்; மீண்டும் அணைத்தால் எல்லாப் பெயர்களையும் மறந்துவிடும்.';

  @override
  String get settingsAutoMuteTitle => 'இதற்குப் பிறகு அன்றாட இடங்களை முடக்கு';

  @override
  String get settingsAutoMuteBody =>
      'இத்தனை வெவ்வேறு நாட்களில் புகைப்படங்கள் உள்ள இடம் நீங்கள் செல்லும் இடம் அல்ல, நீங்கள் வசிக்கும் இடம்.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days நாட்கள்',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'புகைப்பட அட்டவணை';

  @override
  String get settingsReindex => 'தொடக்கத்திலிருந்து மீண்டும் அட்டவணைப்படுத்து';

  @override
  String get settingsPrivacyTitle => 'இந்தத் தொலைபேசியில் எது இருக்கும்';

  @override
  String get settingsPrivacyBody =>
      'உங்கள் புகைப்படங்கள், அவை எடுக்கப்பட்ட இடங்கள், இந்த ஆப்ஸ் அவற்றிலிருந்து கணக்கிடும் அனைத்தும். கணக்கு இல்லை, சர்வர் இல்லை, பகுப்பாய்வு இல்லை.';

  @override
  String get placesName => 'இந்த இடத்துக்குப் பெயரிடு';

  @override
  String get placesRename => 'பெயர் மாற்று';

  @override
  String get placesNameDialogTitle => 'இடத்தின் பெயர்';

  @override
  String get placesNameHint => 'பாட்டி வீடு, ஏரி, அலுவலகம்…';

  @override
  String get placesNameSave => 'சேமி';

  @override
  String get placesNameClear => 'பெயரை நீக்கு';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'நீங்கள் முன்பே இங்கே இருந்திருக்கிறீர்கள்';

  @override
  String notificationBody(String age, String photos) {
    return 'நீங்கள் கடைசியாக இங்கே இருந்தது $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'உங்களுக்காக Been Here கவனிக்கட்டும்';

  @override
  String get alwaysLocationBody =>
      'பின்னணி இருப்பிடம் இருந்தால், நீங்கள் முன்பு புகைப்படம் எடுத்த இடத்துக்கு வரும்போது உங்கள் தொலைபேசி Been Here க்குத் தெரிவிக்கும் — நீங்கள் எதையும் திறக்காமலே அது ஒருமுறை சொல்லும்.\n\nஆப்ஸ் ஒருபோதும் உங்களைப் பின்தொடராது. உங்கள் தொலைபேசி சில வட்டங்களைக் கவனிக்கும், அவற்றில் ஒன்றுக்குள் நுழையும்போது மட்டுமே ஆப்ஸை எழுப்பும். நீங்கள் எங்கே இருக்கிறீர்கள் என்பது பற்றி எதுவும் இந்தச் சாதனத்தை விட்டு வெளியேறாது.';

  @override
  String get alwaysLocationAction => 'வருகைகளை இயக்கு';

  @override
  String get alwaysLocationLater => 'இப்போது வேண்டாம்';

  @override
  String get alwaysLocationDeniedBody =>
      'பின்னணி இருப்பிடம் அணைந்துள்ளது, எனவே வருகைகள் அமைதியாக இருக்கும். மற்றவை எல்லாம் முன்பு போலவே செயல்படும்; விரும்பும்போது கணினி அமைப்புகளில் இயக்கலாம்.';

  @override
  String get settingsArrivalsTitle => 'வருகைகள்';

  @override
  String get settingsArrivalsOn =>
      'நீங்கள் சிறிது காலமாகப் புகைப்படம் எடுக்காத இடத்துக்கு வரும்போது Been Here உங்களுக்குச் சொல்லும்.';

  @override
  String get settingsArrivalsOff =>
      'Been Here அமைதியாக இருக்கும். இதை இயக்கினால் பின்னணி இருப்பிடம் கேட்கும்.';

  @override
  String get settingsMemoryAgeTitle =>
      'இதைவிடப் பழைய இடங்களை மட்டும் குறிப்பிடு';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days நாட்கள்',
      one: '1 நாள்',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle =>
      'பிறகு அந்த இடத்தை இவ்வளவு நேரம் அமைதியாக வை';

  @override
  String get settingsDailyLimitTitle => 'பிறகு இவ்வளவு நேரம் எதுவுமே சொல்லாதே';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours மணி நேரம்',
      one: '1 மணி நேரம்',
      zero: 'நேரம் இல்லை',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'அரை ஆண்டு காத்திராமல் வருகைகளைச் சோதிக்க இவற்றைக் குறையுங்கள்.';

  @override
  String get placesTestArrival => 'இங்கே ஒரு வருகையைச் சோதி';

  @override
  String get arrivalTestNotified => 'அறிவிப்பு அனுப்பப்பட்டது';

  @override
  String get arrivalTestMuted => 'எதுவுமில்லை: இடம் முடக்கப்பட்டுள்ளது';

  @override
  String get arrivalTestTooFewPhotos =>
      'எதுவுமில்லை: இங்கே புகைப்படங்கள் மிகக் குறைவு';

  @override
  String get arrivalTestTooRecent =>
      'எதுவுமில்லை: நீங்கள் இங்கே சமீபத்தில்தான் புகைப்படம் எடுத்தீர்கள்';

  @override
  String get arrivalTestPlaceCooldown =>
      'எதுவுமில்லை: இந்த இடம் சமீபத்தில் பேசியது';

  @override
  String get arrivalTestDailyLimit => 'எதுவுமில்லை: இன்று வேறொன்று பேசியது';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'உங்கள் தொலைபேசி இருப்பிடத்தை \"பயன்படுத்தும்போது\" என்றே வைத்துள்ளது. ஆப்ஸுக்குள்ளிருந்து iOS இந்தத் தேர்வை மீண்டும் தராது, எனவே பின்னணி இருப்பிடத்தை கணினி அமைப்புகளில் \"எப்போதும்\" என மாற்ற வேண்டும் — பிறகு வருகைகள் செயல்படத் தொடங்கும்.';

  @override
  String get commonOpenSettings => 'அமைப்புகளைத் திற';

  @override
  String get settingsArrivalsPending =>
      'கிட்டத்தட்ட முடிந்தது: இருப்பிடம் இன்னும் \"பயன்படுத்தும்போது\" என்றே உள்ளது. கணினி அமைப்புகளில் \"எப்போதும்\" என அமையுங்கள்.';

  @override
  String get placesSortVisits => 'அதிக வருகைகள்';

  @override
  String get placesSortAscending => 'வரிசையைத் தலைகீழாக்கு';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count வருகைகள்',
      one: '1 வருகை',
      zero: 'ஒருபோதும் இல்லை',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'இடங்களை வரைபடத்தில் காட்டு';

  @override
  String get settingsMapBody =>
      'நீங்கள் நகர்த்தி பெரிதாக்கும்போது வரைபட ஓடுகள் OpenStreetMap இலிருந்து பதிவிறக்கப்படுகின்றன, எனவே அந்த சர்வர் நீங்கள் எங்கே பார்க்கிறீர்கள் என்ற தொடர் கணக்கைப் பார்க்கும். ஒருமுறை மட்டும் கேட்கப்படும் இடப்பெயர் போலன்றி, வரைபடம் திறந்திருக்கும் வரை இது தொடரும். இயல்பாக அணைந்திருக்கும்.';

  @override
  String get placesShowMap => 'வரைபடம்';

  @override
  String get placesShowList => 'பட்டியல்';

  @override
  String get placesMapAttribution => '© OpenStreetMap பங்களிப்பாளர்கள்';

  @override
  String get rephotoOverlay => 'மங்கல்';

  @override
  String get rephotoEdges => 'வெளிக்கோடு';

  @override
  String get rephotoCapture => 'எடு';

  @override
  String get rephotoSaved => 'உங்கள் புகைப்படங்களில் சேமிக்கப்பட்டது';

  @override
  String get rephotoNotSaved =>
      'சேமிக்க முடியவில்லை. புகைப்படம் சேர்ப்பது அணைக்கப்பட்டிருக்கலாம்.';

  @override
  String get rephotoNoCamera =>
      'கேமரா இல்லை. பழைய புகைப்படத்துக்குப் பதிலாக ஒரு புகைப்படம் எடுக்க Been Here க்குக் கேமரா தேவை.';

  @override
  String get rephotoThenAndNow => 'அன்றும் இன்றும்';

  @override
  String get rephotoShare => 'பகிர்';

  @override
  String get rephotoThen => 'அன்று';

  @override
  String get rephotoNow => 'இன்று';

  @override
  String get rephotoShareFailed => 'பகிர்வதற்கான படத்தை உருவாக்க முடியவில்லை.';

  @override
  String get onboardingSkip => 'தவிர்';

  @override
  String get onboardingNext => 'அடுத்து';

  @override
  String get onboardingWhatTitle => 'நீங்கள் நிற்கும் இடத்தின் புகைப்படங்கள்';

  @override
  String get onboardingWhatBody =>
      'முன்பு புகைப்படம் எடுத்த இடத்துக்கு வாருங்கள், அங்கே நீங்கள் எடுத்ததை Been Here காட்டும் — வருகை வருகையாக, மிகப் பழையது முதலில்.';

  @override
  String get onboardingPrivacyTitle =>
      'எதுவும் உங்கள் தொலைபேசியை விட்டு வெளியேறாது';

  @override
  String get onboardingPrivacyBody =>
      'கணக்கு இல்லை, சர்வர் இல்லை, பகுப்பாய்வு இல்லை. Been Here உங்கள் புகைப்பட நூலகத்தைச் சாதனத்திலேயே படித்து அதன் அருகில் ஒரு சிறிய அட்டவணையை வைத்திருக்கும். உங்கள் புகைப்படங்களும் அவை எடுக்கப்பட்ட இடங்களும் இருக்கும் இடத்திலேயே இருக்கும்.';

  @override
  String get onboardingPrivacyFootnote =>
      'இரண்டு விஷயங்கள் நெட்வொர்க்கை அடையலாம், நீங்கள் இயக்கும் வரை இரண்டும் அணைந்திருக்கும்: இடப்பெயர்களும் வரைபடமும்.';

  @override
  String get onboardingPhotosTitle => 'இதற்கு உங்கள் புகைப்படங்கள் தேவை';

  @override
  String get onboardingPhotosBody =>
      'எந்தப் புகைப்படம் எங்கே எடுக்கப்பட்டது என்பதை Been Here குறித்துக்கொள்கிறது. அது எதையும் நகலெடுக்காது, நகர்த்தாது — அடையாளங்களையும் ஆயங்களையும் நினைவில் வைக்கும், படங்களை உங்களுக்குக் காட்டும்போது மட்டுமே படிக்கும்.';

  @override
  String get onboardingPhotosAction => 'புகைப்படங்களை அனுமதி';

  @override
  String get onboardingDone => 'தொடங்கு';

  @override
  String get settingsAboutTitle => 'பற்றி';

  @override
  String settingsVersion(String version, String build) {
    return 'பதிப்பு $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'மூலக் குறியீடு';

  @override
  String get settingsShowIntro => 'அறிமுகத்தை மீண்டும் காட்டு';

  @override
  String photoSemanticLabel(String date) {
    return '$date அன்றைய புகைப்படம்';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return '$total இல் $indexவது புகைப்படம், $date';
  }

  @override
  String get placesActionsLabel => 'இந்த இடத்தை என்ன செய்வது';

  @override
  String get radiusSemanticLabel => 'தேடல் ஆரம்';

  @override
  String get hereMapTitle => 'இங்கே சுற்றிலும்';

  @override
  String get hereOpenInMaps => 'வரைபடத்தில் திற';

  @override
  String get hereBackToMe => 'நான் இருக்கும் இடத்துக்குத் திரும்பு';

  @override
  String get herePlaceFallbackTitle => 'உங்களுக்குத் தெரிந்த இடம்';

  @override
  String get arrivalTestNearHome =>
      'செய்தியாகும் அளவுக்கு இல்லை, வீட்டுக்கு மிக அருகில்.';

  @override
  String get settingsHomeRadiusTitle => 'இதற்குள் அமைதியாக இரு';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: 'வீட்டிலிருந்து $km கி.மீ',
      one: 'வீட்டிலிருந்து 1 கி.மீ',
      zero: 'தூரம் இல்லை — ஒருபோதும் அமைதி இல்லை',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'அன்றாட வாழ்க்கை வீட்டுக்கு அருகிலேயே நடக்கிறது, அங்கே தொலைபேசி அதைப் பற்றிக் கருத்துச் சொல்வது மிகவும் விரும்பத்தகாதது. இதைவிட அருகிலுள்ள இடங்கள் ஒருபோதும் கண்காணிக்கப்படாது.';

  @override
  String get settingsQuietTitle => 'ஏன் அமைதியாக உள்ளது';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count இடங்கள் கண்காணிக்கப்படுகின்றன',
      one: '1 இடம் கண்காணிக்கப்படுகிறது',
      zero: 'எந்த இடமும் கண்காணிக்கப்படவில்லை',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'மிக அருகிலுள்ள கண்காணிக்கப்படும் இடம்: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'எதுவும் கண்காணிக்கப்படவில்லை, எனவே எதுவும் வர முடியாது.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'கடைசி அறிவிப்பு: $when';
  }

  @override
  String get settingsQuietNever => 'ஒருபோதும் இல்லை';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return '$total இடங்களில்: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count முடக்கப்பட்டவை';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count வீட்டுக்கு அருகில்';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count இல் புகைப்படங்கள் மிகக் குறைவு';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count சமீபத்தில் புகைப்படம் எடுக்கப்பட்டவை';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count இன்னும் குளிர்ந்துகொண்டிருப்பவை';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count கண்காணிக்கத் தகுந்தவை';
  }

  @override
  String get ageSemanticLabel => 'புகைப்படத்தின் வயது';

  @override
  String get ageStopNow => 'இப்போது';

  @override
  String get ageStopDay => '1 நாள்';

  @override
  String get ageStop3Days => '3 நாட்கள்';

  @override
  String get ageStopWeek => '1 வாரம்';

  @override
  String get ageStop2Weeks => '2 வாரங்கள்';

  @override
  String get ageStopMonth => '1 மாதம்';

  @override
  String get ageStop3Months => '3 மாதங்கள்';

  @override
  String get ageStop6Months => '6 மாதங்கள்';

  @override
  String get ageStopYear => '1 வருடம்';

  @override
  String get ageStop2Years => '2 வருடங்கள்';

  @override
  String get ageStop5Years => '5 வருடங்கள்';

  @override
  String get ageStop10Years => '10 வருடங்கள்';

  @override
  String get ageStopAll => 'எல்லாம்';

  @override
  String get ageWindowAll => 'எல்லாப் புகைப்படங்களும்';

  @override
  String ageWindowNewerThan(String stop) {
    return '$stop வரை பழையவை';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return '$stop ஐ விடப் பழையவை';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest முதல் $oldest வரை பழையவை';
  }

  @override
  String get ageWindowReset => 'மீட்டமை';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ புகைப்படங்கள்';
  }
}
