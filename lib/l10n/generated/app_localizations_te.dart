// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'ఇక్కడ';

  @override
  String get placesTabLabel => 'ప్రదేశాలు';

  @override
  String get settingsTabLabel => 'సెట్టింగ్‌లు';

  @override
  String get hereEmptyTitle => 'మీరు ఇక్కడ ఫోటోలు తీయలేదు';

  @override
  String get hereEmptyBody =>
      'శోధన వ్యాసార్థాన్ని పెంచండి, లేదా ఇంతకు ముందు వెళ్లిన చోటికి తిరిగి రండి.';

  @override
  String get hereNotIndexedTitle => 'ఇంకా ఏదీ ఇండెక్స్ కాలేదు';

  @override
  String get hereNotIndexedBody =>
      'మీరు ఎక్కడెక్కడ ఉన్నారో తెలుసుకోవడానికి Been Here మీ ఫోటో లైబ్రరీని ఒకసారి చదవాలి. ఏదీ మీ ఫోన్‌ను వదిలి వెళ్ళదు.';

  @override
  String get indexStartAction => 'నా ఫోటోలను ఇండెక్స్ చేయి';

  @override
  String get indexPermissionTitle => 'Been Here కు మీ ఫోటోలు కావాలి';

  @override
  String get indexPermissionBody =>
      'ప్రతి ఫోటో ఎక్కడ, ఎప్పుడు తీశారో మాత్రమే అది చదువుతుంది, దాన్ని ఈ ఫోన్‌లోనే ఉంచుతుంది.';

  @override
  String get indexPermissionAction => 'యాక్సెస్ అనుమతించు';

  @override
  String get indexPermissionDeniedTitle => 'ఫోటో యాక్సెస్ ఆఫ్‌లో ఉంది';

  @override
  String get indexPermissionDeniedBody =>
      'అది లేకుండా Been Here మీకు ఏమీ చూపలేదు. సిస్టమ్ సెట్టింగ్‌లలో దాన్ని ఆన్ చేయవచ్చు.';

  @override
  String get indexLimitedAccessNotice =>
      'మీరు ఎంచుకున్న ఫోటోలను మాత్రమే షేర్ చేశారు, కాబట్టి Been Here వాటిని మాత్రమే చూడగలదు. పూర్తి యాక్సెస్ ఇస్తే మీరు వెళ్లిన ప్రతి చోటునూ అది కనుగొనగలదు.';

  @override
  String get indexRunningTitle => 'మీ ఫోటో లైబ్రరీని చదువుతోంది';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$total లో $processed';
  }

  @override
  String get indexFailedTitle => 'ఇండెక్సింగ్ ఆగిపోయింది';

  @override
  String get indexFailedBody =>
      'మధ్యలో ఏదో తప్పు జరిగింది. మళ్ళీ ప్రయత్నిస్తే ఆగిన చోటు నుండి కొనసాగుతుంది.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ఫోటోలు ఇండెక్స్ అయ్యాయి',
      one: '1 ఫోటో ఇండెక్స్ అయింది',
      zero: 'ఫోటోలు ఇండెక్స్ కాలేదు',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return 'వాటిలో $percent% కు స్థానం ఉంది';
  }

  @override
  String get commonLoading => 'లోడ్ అవుతోంది…';

  @override
  String get commonRetry => 'మళ్ళీ ప్రయత్నించు';

  @override
  String get commonCancel => 'రద్దు చేయి';

  @override
  String hereRadiusLabel(String radius) {
    return '$radius లోపు';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ఫోటోలు',
      one: '1 ఫోటో',
      zero: 'ఫోటోలు లేవు',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count సందర్శనలు',
      one: '1 సందర్శన',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters మీ';
  }

  @override
  String distanceKilometers(String km) {
    return '$km కి.మీ';
  }

  @override
  String get ageToday => 'ఈరోజు';

  @override
  String get ageYesterday => 'నిన్న';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days రోజుల క్రితం',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months నెలల క్రితం',
      one: 'ఒక నెల క్రితం',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years సంవత్సరాల క్రితం',
      one: 'ఒక సంవత్సరం క్రితం',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'మీరు ఎక్కడ ఉన్నారు?';

  @override
  String get locationPermissionBody =>
      'Been Here మీ స్థానాన్ని మీ ఫోటోలు తీసిన ప్రదేశాలతో పోలుస్తుంది. పోలిక ఈ ఫోన్‌లోనే జరుగుతుంది.';

  @override
  String get locationPermissionAction => 'నా స్థానాన్ని ఉపయోగించు';

  @override
  String get locationDeniedTitle => 'లొకేషన్ ఆఫ్‌లో ఉంది';

  @override
  String get locationDeniedBody =>
      'అది లేకుండా మీకు ఇక్కడ ఏమి ఉందో యాప్ చెప్పలేదు. సిస్టమ్ సెట్టింగ్‌లలో దాన్ని ఆన్ చేయవచ్చు.';

  @override
  String get locationUnavailableTitle => 'ఇంకా స్థానం దొరకలేదు';

  @override
  String get locationUnavailableBody =>
      'మీ ఫోన్‌కు తాను ఎక్కడ ఉందో ఇంకా తెలియలేదు. ఇంటి లోపల దీనికి కొంత సమయం పట్టవచ్చు.';

  @override
  String get locationServicesDisabledTitle => 'లొకేషన్ సేవలు ఆఫ్‌లో ఉన్నాయి';

  @override
  String get locationServicesDisabledBody =>
      'సిస్టమ్ సెట్టింగ్‌లలో వాటిని ఆన్ చేసి తిరిగి రండి.';

  @override
  String get hereNothingTitle => 'మీరు ఇక్కడ ఫోటోలు తీయలేదు';

  @override
  String get hereNothingBody =>
      'పెద్ద వ్యాసార్థం ప్రయత్నించండి, లేదా ఇంతకు ముందు వెళ్లిన చోటికి తిరిగి రండి.';

  @override
  String hereNearestHint(String distance) {
    return 'మీకు అత్యంత దగ్గరి జ్ఞాపకం $distance దూరంలో ఉంది.';
  }

  @override
  String get photoDetailRephoto => 'రీఫోటో';

  @override
  String get photoDetailRephotoSoon => 'రీఫోటో తర్వాతి వెర్షన్‌లో వస్తుంది.';

  @override
  String photoDetailOf(int index, int total) {
    return '$total లో $index';
  }

  @override
  String get debugLocationTitle => 'డీబగ్ లొకేషన్';

  @override
  String get debugLocationBody =>
      'మరెక్కడో ఉన్నట్లు నటించండి, అప్పుడు ఇక్కడ స్క్రీన్‌ను సోఫాలోనే కూర్చొని పరీక్షించవచ్చు.';

  @override
  String get debugLocationLatitude => 'అక్షాంశం';

  @override
  String get debugLocationLongitude => 'రేఖాంశం';

  @override
  String get debugLocationApply => 'అక్కడికి వెళ్ళు';

  @override
  String get debugLocationClear => 'నిజమైన లొకేషన్ ఉపయోగించు';

  @override
  String get debugLocationActive => 'డీబగ్ లొకేషన్ చురుకుగా ఉంది';

  @override
  String get commonClose => 'మూసివేయి';

  @override
  String get placesEmptyTitle => 'ఇంకా ప్రదేశాలు లేవు';

  @override
  String get placesEmptyBody =>
      'మీ ఫోటోలు ఇండెక్స్ అయిన తర్వాత ప్రదేశాలు కనిపిస్తాయి.';

  @override
  String get placesSortLabel => 'ఇలా క్రమబద్ధీకరించు';

  @override
  String get placesSortLongestAgo => 'ఎక్కువ కాలం క్రితం';

  @override
  String get placesSortMostPhotos => 'ఎక్కువ ఫోటోలు';

  @override
  String get placesSortNearest => 'అత్యంత దగ్గరి';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count మ్యూట్ చేసిన ప్రదేశాలు',
      one: '1 మ్యూట్ చేసిన ప్రదేశం',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'మ్యూట్';

  @override
  String get placesUnmute => 'అన్‌మ్యూట్';

  @override
  String get placesUseAutoRule => 'ఆటోమేటిక్‌గా నిర్ణయించు';

  @override
  String get placesAutoMutedNote =>
      'ఆటోమేటిక్‌గా మ్యూట్ అయింది — మీరు దాదాపు ప్రతిరోజూ ఇక్కడే ఉంటారు';

  @override
  String get placesUserMutedNote => 'మీరు మ్యూట్ చేశారు';

  @override
  String get placesUserUnmutedNote => 'మీరు కనిపించేలా ఉంచారు';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days రోజులు',
      one: '1 రోజు',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'ప్రదేశాలకు పేరు పెట్టు';

  @override
  String get settingsPlaceNamesBody =>
      'ఒక ప్రదేశం కోఆర్డినేట్లను పేరుగా మార్చమని సిస్టమ్‌ను అడుగుతుంది. ఆ కోఆర్డినేట్ Apple లేదా Google కు వెళ్తుంది — ఈ యాప్‌లో మీ ఫోన్‌ను వదిలి వెళ్లే ఏకైక విషయం అదే. డిఫాల్ట్‌గా ఆఫ్; మళ్ళీ ఆఫ్ చేస్తే అన్ని పేర్లనూ మర్చిపోతుంది.';

  @override
  String get settingsAutoMuteTitle =>
      'దీని తర్వాత రోజువారీ ప్రదేశాలను మ్యూట్ చేయి';

  @override
  String get settingsAutoMuteBody =>
      'ఇన్ని వేర్వేరు రోజుల్లో ఫోటోలు ఉన్న ప్రదేశం మీరు సందర్శించే చోటు కాదు, మీరు నివసించే చోటు.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days రోజులు',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'ఫోటో ఇండెక్స్';

  @override
  String get settingsReindex => 'మొదటి నుండి మళ్ళీ ఇండెక్స్ చేయి';

  @override
  String get settingsPrivacyTitle => 'ఈ ఫోన్‌లో ఏమి ఉంటుంది';

  @override
  String get settingsPrivacyBody =>
      'మీ ఫోటోలు, అవి తీసిన చోట్లు, ఈ యాప్ వాటి నుండి లెక్కించే ప్రతిదీ. ఖాతా లేదు, సర్వర్ లేదు, అనలిటిక్స్ లేదు.';

  @override
  String get placesName => 'ఈ ప్రదేశానికి పేరు పెట్టు';

  @override
  String get placesRename => 'పేరు మార్చు';

  @override
  String get placesNameDialogTitle => 'ప్రదేశం పేరు';

  @override
  String get placesNameHint => 'అమ్మమ్మ ఇల్లు, సరస్సు, ఆఫీసు…';

  @override
  String get placesNameSave => 'సేవ్ చేయి';

  @override
  String get placesNameClear => 'పేరు తొలగించు';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'మీరు ఇంతకు ముందు ఇక్కడ ఉన్నారు';

  @override
  String notificationBody(String age, String photos) {
    return 'మీరు చివరిసారి ఇక్కడ ఉన్నది $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'మీ కోసం Been Here గమనించనివ్వండి';

  @override
  String get alwaysLocationBody =>
      'బ్యాక్‌గ్రౌండ్ లొకేషన్‌తో, మీరు ఇంతకు ముందు ఫోటో తీసిన చోటికి చేరుకున్నప్పుడు మీ ఫోన్ Been Here కు చెప్పగలదు — మీరు ఏమీ తెరవకుండానే అది ఒకసారి చెప్పగలదు.\n\nయాప్ మిమ్మల్ని ఎప్పుడూ అనుసరించదు. మీ ఫోన్ కొన్ని వృత్తాలను గమనిస్తుంది, వాటిలో ఒకదానిలోకి మీరు ప్రవేశించినప్పుడు మాత్రమే యాప్‌ను నిద్రలేపుతుంది. మీరు ఎక్కడ ఉన్నారో అన్నదాని గురించి ఏదీ ఈ పరికరాన్ని వదిలి వెళ్లదు.';

  @override
  String get alwaysLocationAction => 'రాకలను ఆన్ చేయి';

  @override
  String get alwaysLocationLater => 'ఇప్పుడు కాదు';

  @override
  String get alwaysLocationDeniedBody =>
      'బ్యాక్‌గ్రౌండ్ లొకేషన్ ఆఫ్‌లో ఉంది, కాబట్టి రాకలు నిశ్శబ్దంగా ఉంటాయి. మిగతావన్నీ ముందులాగే పనిచేస్తాయి; మీకు ఇష్టమైనప్పుడు సిస్టమ్ సెట్టింగ్‌లలో ఆన్ చేయవచ్చు.';

  @override
  String get settingsArrivalsTitle => 'రాకలు';

  @override
  String get settingsArrivalsOn =>
      'మీరు కొంతకాలంగా ఫోటో తీయని చోటికి చేరుకున్నప్పుడు Been Here మీకు చెబుతుంది.';

  @override
  String get settingsArrivalsOff =>
      'Been Here నిశ్శబ్దంగా ఉంటుంది. దీన్ని ఆన్ చేస్తే బ్యాక్‌గ్రౌండ్ లొకేషన్ అడుగుతుంది.';

  @override
  String get settingsMemoryAgeTitle =>
      'దీని కంటే పాత ప్రదేశాలను మాత్రమే ప్రస్తావించు';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days రోజులు',
      one: '1 రోజు',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle =>
      'తర్వాత ఆ ప్రదేశాన్ని ఇంతసేపు నిశ్శబ్దంగా ఉంచు';

  @override
  String get settingsDailyLimitTitle => 'ఇంకా ఇంతసేపు ఏమీ చెప్పకు';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours గంటలు',
      one: '1 గంట',
      zero: 'సమయం లేదు',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'అర్ధ సంవత్సరం వేచి చూడకుండా రాకలను పరీక్షించడానికి వీటిని తగ్గించండి.';

  @override
  String get placesTestArrival => 'ఇక్కడ ఒక రాకను పరీక్షించు';

  @override
  String get arrivalTestNotified => 'నోటిఫికేషన్ పంపబడింది';

  @override
  String get arrivalTestMuted => 'ఏమీ లేదు: ప్రదేశం మ్యూట్‌లో ఉంది';

  @override
  String get arrivalTestTooFewPhotos => 'ఏమీ లేదు: ఇక్కడ ఫోటోలు చాలా తక్కువ';

  @override
  String get arrivalTestTooRecent => 'ఏమీ లేదు: మీరు ఇక్కడ ఇటీవలే ఫోటో తీశారు';

  @override
  String get arrivalTestPlaceCooldown =>
      'ఏమీ లేదు: ఈ ప్రదేశం ఇటీవల మాట్లాడింది';

  @override
  String get arrivalTestDailyLimit => 'ఏమీ లేదు: ఈరోజు మరొకటి మాట్లాడింది';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'మీ ఫోన్ లొకేషన్‌ను \"ఉపయోగిస్తున్నప్పుడు\" గానే ఉంచింది. యాప్ లోపల నుండి iOS ఈ ఎంపికను మళ్ళీ ఇవ్వదు, కాబట్టి బ్యాక్‌గ్రౌండ్ లొకేషన్‌ను సిస్టమ్ సెట్టింగ్‌లలో \"ఎల్లప్పుడూ\" గా మార్చాలి — అప్పుడు రాకలు పనిచేయడం మొదలవుతుంది.';

  @override
  String get commonOpenSettings => 'సెట్టింగ్‌లు తెరువు';

  @override
  String get settingsArrivalsPending =>
      'దాదాపు అయింది: లొకేషన్ ఇంకా \"ఉపయోగిస్తున్నప్పుడు\" లోనే ఉంది. సిస్టమ్ సెట్టింగ్‌లలో \"ఎల్లప్పుడూ\" కు సెట్ చేయండి.';

  @override
  String get placesSortVisits => 'ఎక్కువ సందర్శనలు';

  @override
  String get placesSortAscending => 'క్రమాన్ని తిప్పు';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count సందర్శనలు',
      one: '1 సందర్శన',
      zero: 'ఎప్పుడూ లేదు',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'ప్రదేశాలను మ్యాప్‌లో చూపించు';

  @override
  String get settingsMapBody =>
      'మీరు పాన్ చేసి జూమ్ చేస్తున్నప్పుడు మ్యాప్ టైల్స్ OpenStreetMap నుండి డౌన్‌లోడ్ అవుతాయి, కాబట్టి ఆ సర్వర్ మీరు ఎక్కడ చూస్తున్నారో అనే నిరంతర లెక్కను చూస్తుంది. ఒకసారి మాత్రమే అడిగే ప్రదేశం పేరులా కాకుండా, మ్యాప్ తెరిచి ఉన్నంతసేపూ ఇది కొనసాగుతుంది. డిఫాల్ట్‌గా ఆఫ్.';

  @override
  String get placesShowMap => 'మ్యాప్';

  @override
  String get placesShowList => 'జాబితా';

  @override
  String get placesMapAttribution => '© OpenStreetMap కంట్రిబ్యూటర్లు';

  @override
  String get rephotoOverlay => 'మసకబారు';

  @override
  String get rephotoEdges => 'అవుట్‌లైన్';

  @override
  String get rephotoCapture => 'తీయి';

  @override
  String get rephotoSaved => 'మీ ఫోటోలలో సేవ్ చేయబడింది';

  @override
  String get rephotoNotSaved =>
      'సేవ్ చేయలేకపోయాం. ఫోటోలు జోడించడం ఆఫ్ చేసి ఉండవచ్చు.';

  @override
  String get rephotoNoCamera =>
      'కెమెరా అందుబాటులో లేదు. పాత ఫోటోకు సమాధానంగా ఫోటో తీయడానికి Been Here కు కెమెరా కావాలి.';

  @override
  String get rephotoThenAndNow => 'అప్పుడు & ఇప్పుడు';

  @override
  String get rephotoShare => 'షేర్ చేయి';

  @override
  String get rephotoThen => 'అప్పుడు';

  @override
  String get rephotoNow => 'ఇప్పుడు';

  @override
  String get rephotoShareFailed =>
      'షేర్ చేయడానికి చిత్రాన్ని తయారు చేయలేకపోయాం.';

  @override
  String get onboardingSkip => 'దాటవేయి';

  @override
  String get onboardingNext => 'తర్వాత';

  @override
  String get onboardingWhatTitle => 'మీరు నిలబడిన చోటు ఫోటోలు';

  @override
  String get onboardingWhatBody =>
      'మీరు ఇంతకు ముందు ఫోటో తీసిన చోటికి చేరుకుంటే చాలు, Been Here అక్కడ మీరు తీసినవి చూపిస్తుంది — సందర్శన వారీగా, అన్నిటికంటే పాతది ముందు.';

  @override
  String get onboardingPrivacyTitle => 'ఏదీ మీ ఫోన్‌ను వదిలి వెళ్ళదు';

  @override
  String get onboardingPrivacyBody =>
      'ఖాతా లేదు, సర్వర్ లేదు, అనలిటిక్స్ లేదు. Been Here మీ ఫోటో లైబ్రరీని పరికరంలోనే చదివి దాని పక్కన చిన్న ఇండెక్స్‌ను ఉంచుతుంది. మీ ఫోటోలు, అవి తీసిన చోట్లు ఉన్న చోటే ఉంటాయి.';

  @override
  String get onboardingPrivacyFootnote =>
      'రెండు విషయాలు నెట్‌వర్క్‌ను చేరగలవు, మీరు ఆన్ చేసే వరకు రెండూ ఆఫ్: ప్రదేశాల పేర్లు, మ్యాప్.';

  @override
  String get onboardingPhotosTitle => 'దీనికి మీ ఫోటోలు కావాలి';

  @override
  String get onboardingPhotosBody =>
      'ఏ ఫోటో ఎక్కడ తీశారో Been Here గుర్తుపెట్టుకుంటుంది. అది ఏదీ కాపీ చేయదు, కదపదు — ఐడీలు, కోఆర్డినేట్లు గుర్తుంచుకుంటుంది, చిత్రాలను మీకు చూపేటప్పుడు మాత్రమే చదువుతుంది.';

  @override
  String get onboardingPhotosAction => 'ఫోటోలను అనుమతించు';

  @override
  String get onboardingDone => 'ప్రారంభించు';

  @override
  String get settingsAboutTitle => 'గురించి';

  @override
  String settingsVersion(String version, String build) {
    return 'వెర్షన్ $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'సోర్స్ కోడ్';

  @override
  String get settingsShowIntro => 'పరిచయాన్ని మళ్ళీ చూపించు';

  @override
  String photoSemanticLabel(String date) {
    return '$date నాటి ఫోటో';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return '$total లో $indexవ ఫోటో, $date';
  }

  @override
  String get placesActionsLabel => 'ఈ ప్రదేశంతో ఏమి చేయాలి';

  @override
  String get radiusSemanticLabel => 'శోధన వ్యాసార్థం';

  @override
  String get hereMapTitle => 'ఇక్కడ చుట్టూ';

  @override
  String get hereOpenInMaps => 'మ్యాప్స్‌లో తెరువు';

  @override
  String get hereBackToMe => 'నేను ఉన్న చోటికి తిరిగి';

  @override
  String get herePlaceFallbackTitle => 'మీకు తెలిసిన ప్రదేశం';

  @override
  String get arrivalTestNearHome =>
      'వార్త అయ్యేంత కాదు, ఇంటికి చాలా దగ్గరగా ఉంది.';

  @override
  String get settingsHomeRadiusTitle => 'దీని లోపల నిశ్శబ్దంగా ఉండు';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: 'ఇంటి నుండి $km కి.మీ',
      one: 'ఇంటి నుండి 1 కి.మీ',
      zero: 'దూరం లేదు — ఎప్పుడూ నిశ్శబ్దం కాదు',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'రోజువారీ జీవితం ఇంటి దగ్గరే జరుగుతుంది, అక్కడ ఫోన్ దాని గురించి వ్యాఖ్యానించడం అత్యంత అవాంఛనీయం. దీని కంటే దగ్గరి ప్రదేశాలను ఎప్పుడూ గమనించరు.';

  @override
  String get settingsQuietTitle => 'ఎందుకు నిశ్శబ్దంగా ఉంది';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ప్రదేశాలను గమనిస్తోంది',
      one: '1 ప్రదేశాన్ని గమనిస్తోంది',
      zero: 'ఏ ప్రదేశాన్నీ గమనించడం లేదు',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'అత్యంత దగ్గరి గమనిస్తున్న ప్రదేశం: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'ఏదీ గమనించడం లేదు, కాబట్టి ఏదీ రాలేదు.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'చివరి నోటిఫికేషన్: $when';
  }

  @override
  String get settingsQuietNever => 'ఎప్పుడూ లేదు';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return '$total ప్రదేశాల్లో: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count మ్యూట్';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count ఇంటి దగ్గర';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count లో ఫోటోలు చాలా తక్కువ';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count ఇటీవల ఫోటో తీసినవి';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count ఇంకా చల్లబడుతున్నాయి';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count గమనించదగినవి';
  }

  @override
  String get ageSemanticLabel => 'ఫోటో వయసు';

  @override
  String get ageStopNow => 'ఇప్పుడు';

  @override
  String get ageStopDay => '1 రోజు';

  @override
  String get ageStop3Days => '3 రోజులు';

  @override
  String get ageStopWeek => '1 వారం';

  @override
  String get ageStop2Weeks => '2 వారాలు';

  @override
  String get ageStopMonth => '1 నెల';

  @override
  String get ageStop3Months => '3 నెలలు';

  @override
  String get ageStop6Months => '6 నెలలు';

  @override
  String get ageStopYear => '1 సంవత్సరం';

  @override
  String get ageStop2Years => '2 సంవత్సరాలు';

  @override
  String get ageStop5Years => '5 సంవత్సరాలు';

  @override
  String get ageStop10Years => '10 సంవత్సరాలు';

  @override
  String get ageStopAll => 'అన్నీ';

  @override
  String get ageWindowAll => 'అన్ని ఫోటోలు';

  @override
  String ageWindowNewerThan(String stop) {
    return '$stop వరకు పాతవి';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return '$stop కంటే పాతవి';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest నుండి $oldest వరకు పాతవి';
  }

  @override
  String get ageWindowReset => 'రీసెట్';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ ఫోటోలు';
  }
}
