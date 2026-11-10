// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'અહીં';

  @override
  String get placesTabLabel => 'સ્થળો';

  @override
  String get settingsTabLabel => 'સેટિંગ્સ';

  @override
  String get hereEmptyTitle => 'તમે અહીં કોઈ ફોટો લીધો નથી';

  @override
  String get hereEmptyBody =>
      'શોધની ત્રિજ્યા વધારો, અથવા પહેલાં ગયા હો એવી કોઈ જગ્યાએ પાછા જાઓ.';

  @override
  String get hereNotIndexedTitle => 'હજી કંઈ ઇન્ડેક્સ થયું નથી';

  @override
  String get hereNotIndexedBody =>
      'તમે ક્યાં ક્યાં ગયા છો તે જાણવા Been Here ને તમારી ફોટો લાઇબ્રેરી એક વાર વાંચવી પડશે. કંઈ પણ તમારા ફોનની બહાર જતું નથી.';

  @override
  String get indexStartAction => 'મારા ફોટો ઇન્ડેક્સ કરો';

  @override
  String get indexPermissionTitle => 'Been Here ને તમારા ફોટોની જરૂર છે';

  @override
  String get indexPermissionBody =>
      'તે માત્ર દરેક ફોટો ક્યાં અને ક્યારે લેવાયો તે વાંચે છે, અને તેને આ જ ફોન પર રાખે છે.';

  @override
  String get indexPermissionAction => 'ઍક્સેસ આપો';

  @override
  String get indexPermissionDeniedTitle => 'ફોટો ઍક્સેસ બંધ છે';

  @override
  String get indexPermissionDeniedBody =>
      'તેના વિના Been Here તમને કંઈ બતાવી શકતું નથી. તમે તેને સિસ્ટમ સેટિંગ્સમાં ચાલુ કરી શકો છો.';

  @override
  String get indexLimitedAccessNotice =>
      'તમે માત્ર પસંદ કરેલા ફોટો શેર કર્યા છે, તેથી Been Here માત્ર તે જ જોઈ શકે છે. પૂર્ણ ઍક્સેસથી તે તમે ગયેલી દરેક જગ્યા શોધી શકે છે.';

  @override
  String get indexRunningTitle => 'તમારી ફોટો લાઇબ્રેરી વંચાઈ રહી છે';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$total માંથી $processed';
  }

  @override
  String get indexFailedTitle => 'ઇન્ડેક્સિંગ અટકી ગયું';

  @override
  String get indexFailedBody =>
      'વચ્ચે કંઈક ખોટું થયું. ફરી પ્રયાસ કરવાથી જ્યાં અટક્યું હતું ત્યાંથી આગળ વધશે.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ફોટો ઇન્ડેક્સ થયા',
      zero: 'કોઈ ફોટો ઇન્ડેક્સ થયો નથી',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return 'તેમાંથી $percent% માં લોકેશન છે';
  }

  @override
  String get commonLoading => 'લોડ થઈ રહ્યું છે…';

  @override
  String get commonRetry => 'ફરી પ્રયાસ કરો';

  @override
  String get commonCancel => 'રદ કરો';

  @override
  String hereRadiusLabel(String radius) {
    return '$radius ની અંદર';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ફોટો',
      zero: 'કોઈ ફોટો નથી',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count મુલાકાત',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters મી';
  }

  @override
  String distanceKilometers(String km) {
    return '$km કિમી';
  }

  @override
  String get ageToday => 'આજે';

  @override
  String get ageYesterday => 'ગઈકાલે';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days દિવસ પહેલાં',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months મહિના પહેલાં',
      one: 'એક મહિના પહેલાં',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years વર્ષ પહેલાં',
      one: 'એક વર્ષ પહેલાં',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'તમે ક્યાં છો?';

  @override
  String get locationPermissionBody =>
      'Been Here તમારા સ્થાનની સરખામણી તમારા ફોટો જ્યાં લેવાયા હતા તે સ્થળો સાથે કરે છે. સરખામણી આ જ ફોન પર થાય છે.';

  @override
  String get locationPermissionAction => 'મારું લોકેશન વાપરો';

  @override
  String get locationDeniedTitle => 'લોકેશન બંધ છે';

  @override
  String get locationDeniedBody =>
      'તેના વિના ઍપ જાણી શકતી નથી કે અહીં તમારી પાસે શું છે. તમે તેને સિસ્ટમ સેટિંગ્સમાં ચાલુ કરી શકો છો.';

  @override
  String get locationUnavailableTitle => 'હજી સ્થાન મળ્યું નથી';

  @override
  String get locationUnavailableBody =>
      'તમારા ફોનને હજી ખબર નથી કે તે ક્યાં છે. ઘરની અંદર આમાં થોડો સમય લાગી શકે.';

  @override
  String get locationServicesDisabledTitle => 'લોકેશન સેવાઓ બંધ છે';

  @override
  String get locationServicesDisabledBody =>
      'તેને સિસ્ટમ સેટિંગ્સમાં ચાલુ કરો અને પાછા આવો.';

  @override
  String get hereNothingTitle => 'તમે અહીં કોઈ ફોટો લીધો નથી';

  @override
  String get hereNothingBody =>
      'મોટી ત્રિજ્યા અજમાવો, અથવા પહેલાં ગયા હો એવી કોઈ જગ્યાએ પાછા જાઓ.';

  @override
  String hereNearestHint(String distance) {
    return 'તમારી સૌથી નજીકની યાદ $distance દૂર છે.';
  }

  @override
  String get photoDetailRephoto => 'ફરી ફોટો લો';

  @override
  String get photoDetailRephotoSoon =>
      'ફરી ફોટો લેવાની સુવિધા પછીના વર્ઝનમાં આવશે.';

  @override
  String photoDetailOf(int index, int total) {
    return '$total માંથી $index';
  }

  @override
  String get debugLocationTitle => 'ડિબગ લોકેશન';

  @override
  String get debugLocationBody =>
      'માની લો કે તમે બીજે ક્યાંક છો, જેથી અહીં સ્ક્રીન સોફા પર બેઠાં જ ચકાસી શકાય.';

  @override
  String get debugLocationLatitude => 'અક્ષાંશ';

  @override
  String get debugLocationLongitude => 'રેખાંશ';

  @override
  String get debugLocationApply => 'ત્યાં જાઓ';

  @override
  String get debugLocationClear => 'સાચું લોકેશન વાપરો';

  @override
  String get debugLocationActive => 'ડિબગ લોકેશન ચાલુ છે';

  @override
  String get commonClose => 'બંધ કરો';

  @override
  String get placesEmptyTitle => 'હજી કોઈ સ્થળ નથી';

  @override
  String get placesEmptyBody => 'ફોટો ઇન્ડેક્સ થયા પછી સ્થળો દેખાશે.';

  @override
  String get placesSortLabel => 'આ મુજબ ગોઠવો';

  @override
  String get placesSortLongestAgo => 'સૌથી પહેલાં';

  @override
  String get placesSortMostPhotos => 'સૌથી વધુ ફોટો';

  @override
  String get placesSortNearest => 'સૌથી નજીક';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count મ્યૂટ કરેલાં સ્થળો',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'મ્યૂટ કરો';

  @override
  String get placesUnmute => 'અનમ્યૂટ કરો';

  @override
  String get placesUseAutoRule => 'આપમેળે નક્કી કરો';

  @override
  String get placesAutoMutedNote => 'આપમેળે મ્યૂટ — તમે અહીં લગભગ રોજ હો છો';

  @override
  String get placesUserMutedNote => 'તમે મ્યૂટ કર્યું';

  @override
  String get placesUserUnmutedNote => 'તમે દેખાતું રાખ્યું';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days દિવસ',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'સ્થળોનાં નામ';

  @override
  String get settingsPlaceNamesBody =>
      'સિસ્ટમને કોઈ સ્થળના કોઓર્ડિનેટ્સને નામમાં બદલવા કહે છે. તે કોઓર્ડિનેટ Apple અથવા Google ને જાય છે — આ ઍપમાંથી તમારા ફોનની બહાર જતી એકમાત્ર વસ્તુ આ જ છે. ડિફૉલ્ટ રીતે બંધ; ફરી બંધ કરવાથી બધાં નામ ભૂંસાઈ જાય છે.';

  @override
  String get settingsAutoMuteTitle =>
      'રોજિંદાં સ્થળોને આટલા દિવસ પછી મ્યૂટ કરો';

  @override
  String get settingsAutoMuteBody =>
      'જે જગ્યાએ આટલા જુદા જુદા દિવસોના ફોટો હોય, તે તમારું રહેઠાણ છે, મુલાકાતનું સ્થળ નથી.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days દિવસ',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'ફોટો ઇન્ડેક્સ';

  @override
  String get settingsReindex => 'શરૂઆતથી ફરી ઇન્ડેક્સ કરો';

  @override
  String get settingsPrivacyTitle => 'આ ફોન પર શું રહે છે';

  @override
  String get settingsPrivacyBody =>
      'તમારા ફોટો, તે ક્યાં લેવાયા, અને તેમાંથી આ ઍપ જે કંઈ તારવે છે તે બધું. કોઈ એકાઉન્ટ નહીં, સર્વર નહીં, ઍનાલિટિક્સ નહીં.';

  @override
  String get placesName => 'આ સ્થળને નામ આપો';

  @override
  String get placesRename => 'નામ બદલો';

  @override
  String get placesNameDialogTitle => 'સ્થળનું નામ';

  @override
  String get placesNameHint => 'દાદીનું ઘર, તળાવ, ઑફિસ…';

  @override
  String get placesNameSave => 'સાચવો';

  @override
  String get placesNameClear => 'નામ દૂર કરો';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'તમે અહીં પહેલાં આવી ચૂક્યા છો';

  @override
  String notificationBody(String age, String photos) {
    return 'છેલ્લે અહીં: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Been Here ને તમારા માટે ધ્યાન રાખવા દો';

  @override
  String get alwaysLocationBody =>
      'બૅકગ્રાઉન્ડ લોકેશનથી, તમે પહેલાં ફોટો લીધા હોય તેવી જગ્યાએ પહોંચો ત્યારે તમારો ફોન Been Here ને જણાવી શકે — અને ઍપ તમને કંઈ ખોલ્યા વગર એક વાર કહી શકે.\n\nઍપ ક્યારેય તમારો પીછો કરતી નથી. તમારો ફોન થોડાંક વર્તુળો પર નજર રાખે છે અને તમે તેમાંના કોઈમાં પ્રવેશો ત્યારે જ ઍપને જગાડે છે. તમે ક્યાં છો તે વિશે કંઈ પણ આ ડિવાઇસની બહાર જતું નથી.';

  @override
  String get alwaysLocationAction => 'આગમન સૂચના ચાલુ કરો';

  @override
  String get alwaysLocationLater => 'હમણાં નહીં';

  @override
  String get alwaysLocationDeniedBody =>
      'બૅકગ્રાઉન્ડ લોકેશન બંધ છે, તેથી આગમન સૂચનાઓ શાંત રહેશે. બાકીનું બધું પહેલાંની જેમ ચાલે છે; તમે ઇચ્છો ત્યારે સિસ્ટમ સેટિંગ્સમાં તેને ચાલુ કરી શકો છો.';

  @override
  String get settingsArrivalsTitle => 'આગમન';

  @override
  String get settingsArrivalsOn =>
      'લાંબા સમયથી ફોટો ન લીધો હોય તેવી જગ્યાએ પહોંચશો ત્યારે Been Here તમને જણાવશે.';

  @override
  String get settingsArrivalsOff =>
      'Been Here શાંત રહે છે. ચાલુ કરવાથી બૅકગ્રાઉન્ડ લોકેશન માગવામાં આવશે.';

  @override
  String get settingsMemoryAgeTitle => 'ફક્ત આનાથી જૂનાં સ્થળોનો ઉલ્લેખ કરો';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days દિવસ',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => 'પછી તે સ્થળને આટલો સમય શાંત રાખો';

  @override
  String get settingsDailyLimitTitle => 'અને આટલો સમય કંઈ જ ન કહો';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours કલાક',
      zero: 'બિલકુલ નહીં',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'અડધું વર્ષ રાહ જોયા વગર આગમન સૂચના અજમાવવા માટે આ મૂલ્યો ઘટાડો.';

  @override
  String get placesTestArrival => 'અહીં આગમનનું પરીક્ષણ કરો';

  @override
  String get arrivalTestNotified => 'સૂચના મોકલી';

  @override
  String get arrivalTestMuted => 'કંઈ નહીં: સ્થળ મ્યૂટ છે';

  @override
  String get arrivalTestTooFewPhotos => 'કંઈ નહીં: અહીં બહુ ઓછા ફોટો છે';

  @override
  String get arrivalTestTooRecent =>
      'કંઈ નહીં: તમે અહીં તાજેતરમાં જ ફોટો લીધો છે';

  @override
  String get arrivalTestPlaceCooldown =>
      'કંઈ નહીં: આ સ્થળે તાજેતરમાં જ સૂચના આપી છે';

  @override
  String get arrivalTestDailyLimit =>
      'કંઈ નહીં: આજે બીજી કોઈ સૂચના આવી ચૂકી છે';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'તમારા ફોને લોકેશન \"ઍપ વાપરતી વખતે\" પર રાખ્યું છે. iOS ઍપની અંદરથી આ પસંદગી ફરી આપતું નથી, તેથી સિસ્ટમ સેટિંગ્સમાં બૅકગ્રાઉન્ડ લોકેશન \"હંમેશાં\" પર બદલવું પડશે — પછી આગમન સૂચનાઓ કામ કરવા લાગશે.';

  @override
  String get commonOpenSettings => 'સેટિંગ્સ ખોલો';

  @override
  String get settingsArrivalsPending =>
      'લગભગ: લોકેશન હજી \"ઍપ વાપરતી વખતે\" પર છે. સિસ્ટમ સેટિંગ્સમાં તેને \"હંમેશાં\" કરો.';

  @override
  String get placesSortVisits => 'સૌથી વધુ મુલાકાતો';

  @override
  String get placesSortAscending => 'ઊલટો ક્રમ';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count મુલાકાત',
      zero: 'ક્યારેય નહીં',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'સ્થળો નકશા પર બતાવો';

  @override
  String get settingsMapBody =>
      'તમે નકશો ખસેડો અને ઝૂમ કરો તેમ OpenStreetMap પરથી ટાઇલ્સ ડાઉનલોડ થાય છે, તેથી તે સર્વર સતત જુએ છે કે તમે ક્યાં જોઈ રહ્યા છો. એક વાર પૂછાતા સ્થળના નામથી વિપરીત, નકશો ખુલ્લો રહે ત્યાં સુધી આ ચાલુ રહે છે. ડિફૉલ્ટ રીતે બંધ.';

  @override
  String get placesShowMap => 'નકશો';

  @override
  String get placesShowList => 'યાદી';

  @override
  String get placesMapAttribution => '© OpenStreetMap યોગદાનકર્તાઓ';

  @override
  String get rephotoOverlay => 'ઝાંખું';

  @override
  String get rephotoEdges => 'રૂપરેખા';

  @override
  String get rephotoCapture => 'ફોટો લો';

  @override
  String get rephotoSaved => 'તમારા ફોટોમાં સાચવ્યો';

  @override
  String get rephotoNotSaved => 'સાચવી શકાયો નહીં. ફોટો ઉમેરવાનું બંધ હોઈ શકે.';

  @override
  String get rephotoNoCamera =>
      'કૅમેરા ઉપલબ્ધ નથી. જૂના ફોટાના જવાબરૂપ ફોટો લેવા Been Here ને કૅમેરાની જરૂર છે.';

  @override
  String get rephotoThenAndNow => 'ત્યારે અને અત્યારે';

  @override
  String get rephotoShare => 'શેર કરો';

  @override
  String get rephotoThen => 'ત્યારે';

  @override
  String get rephotoNow => 'અત્યારે';

  @override
  String get rephotoShareFailed => 'શેર કરવા માટે છબી બનાવી શકાઈ નહીં.';

  @override
  String get onboardingSkip => 'છોડો';

  @override
  String get onboardingNext => 'આગળ';

  @override
  String get onboardingWhatTitle => 'તમે ઊભા છો તે જ જગ્યાના ફોટો';

  @override
  String get onboardingWhatBody =>
      'પહેલાં ફોટો લીધા હોય તેવી જગ્યાએ પહોંચો અને Been Here બતાવશે કે તમે ત્યાં શું લીધું હતું — મુલાકાત પ્રમાણે, સૌથી જૂની પહેલાં.';

  @override
  String get onboardingPrivacyTitle => 'કંઈ પણ તમારા ફોનની બહાર જતું નથી';

  @override
  String get onboardingPrivacyBody =>
      'કોઈ એકાઉન્ટ નહીં, સર્વર નહીં, ઍનાલિટિક્સ નહીં. Been Here ડિવાઇસ પર જ તમારી ફોટો લાઇબ્રેરી વાંચે છે અને તેની બાજુમાં નાનો ઇન્ડેક્સ રાખે છે. તમારા ફોટો, અને તે ક્યાં લેવાયા, જ્યાં છે ત્યાં જ રહે છે.';

  @override
  String get onboardingPrivacyFootnote =>
      'બે જ વસ્તુ નેટવર્ક સુધી પહોંચી શકે છે, અને તમે ચાલુ ન કરો ત્યાં સુધી બંને બંધ છે: સ્થળોનાં નામ અને નકશો.';

  @override
  String get onboardingPhotosTitle => 'તેને તમારા ફોટોની જરૂર છે';

  @override
  String get onboardingPhotosBody =>
      'કયો ફોટો ક્યાં લેવાયો તેની Been Here નોંધ રાખે છે. તે ક્યારેય કંઈ કૉપિ કે ખસેડતું નથી — તે ID અને કોઓર્ડિનેટ્સ યાદ રાખે છે, અને ફોટો ફક્ત તમને બતાવતી વખતે જ વાંચે છે.';

  @override
  String get onboardingPhotosAction => 'ફોટોની પરવાનગી આપો';

  @override
  String get onboardingDone => 'શરૂ કરો';

  @override
  String get settingsAboutTitle => 'વિશે';

  @override
  String settingsVersion(String version, String build) {
    return 'વર્ઝન $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'સોર્સ કોડ';

  @override
  String get settingsShowIntro => 'પરિચય ફરી બતાવો';

  @override
  String photoSemanticLabel(String date) {
    return '$date નો ફોટો';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return '$total માંથી ફોટો $index, $date';
  }

  @override
  String get placesActionsLabel => 'આ સ્થળનું શું કરવું';

  @override
  String get radiusSemanticLabel => 'શોધની ત્રિજ્યા';

  @override
  String get hereMapTitle => 'આસપાસ';

  @override
  String get hereOpenInMaps => 'નકશામાં ખોલો';

  @override
  String get hereBackToMe => 'હું જ્યાં છું ત્યાં પાછા જાઓ';

  @override
  String get herePlaceFallbackTitle => 'તમે જાણો છો એવું સ્થળ';

  @override
  String get arrivalTestNearHome => 'સમાચાર બનવા માટે ઘરથી બહુ નજીક છે.';

  @override
  String get settingsHomeRadiusTitle => 'આટલા અંતરમાં શાંત રહો';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: 'ઘરથી $km કિમી',
      zero: 'કોઈ અંતર નહીં — ક્યારેય શાંત નહીં',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'રોજિંદું જીવન ઘરની નજીક જ વીતે છે, અને ત્યાં જ તેના પર ટિપ્પણી કરતો ફોન સૌથી ઓછો ગમે છે. આનાથી નજીકનાં સ્થળો પર ક્યારેય નજર રાખવામાં આવતી નથી.';

  @override
  String get settingsQuietTitle => 'કેમ શાંત છે';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count સ્થળો પર નજર',
      zero: 'કોઈ સ્થળ પર નજર નથી',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'નજર હેઠળનું સૌથી નજીકનું સ્થળ: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'કશા પર નજર નથી, તેથી કોઈ આગમન થઈ શકે નહીં.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'છેલ્લી સૂચના: $when';
  }

  @override
  String get settingsQuietNever => 'ક્યારેય નહીં';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return '$total સ્થળોમાંથી: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count મ્યૂટ';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count ઘરની નજીક';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count માં બહુ ઓછા ફોટો';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count ના તાજેતરમાં ફોટો';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count હજી વિરામમાં';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count નજર રાખવા જેવાં';
  }

  @override
  String get ageSemanticLabel => 'ફોટોની ઉંમર';

  @override
  String get ageStopNow => 'હમણાં';

  @override
  String get ageStopDay => '1 દિવસ';

  @override
  String get ageStop3Days => '3 દિવસ';

  @override
  String get ageStopWeek => '1 અઠવાડિયું';

  @override
  String get ageStop2Weeks => '2 અઠવાડિયાં';

  @override
  String get ageStopMonth => '1 મહિનો';

  @override
  String get ageStop3Months => '3 મહિના';

  @override
  String get ageStop6Months => '6 મહિના';

  @override
  String get ageStopYear => '1 વર્ષ';

  @override
  String get ageStop2Years => '2 વર્ષ';

  @override
  String get ageStop5Years => '5 વર્ષ';

  @override
  String get ageStop10Years => '10 વર્ષ';

  @override
  String get ageStopAll => 'બધા';

  @override
  String get ageWindowAll => 'બધા ફોટો';

  @override
  String ageWindowNewerThan(String stop) {
    return '$stop સુધી';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return '$stop થી જૂના';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest થી $oldest';
  }

  @override
  String get ageWindowReset => 'રીસેટ કરો';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ ફોટો';
  }
}
