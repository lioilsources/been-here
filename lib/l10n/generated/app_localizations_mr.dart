// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'इथे';

  @override
  String get placesTabLabel => 'ठिकाणे';

  @override
  String get settingsTabLabel => 'सेटिंग्ज';

  @override
  String get hereEmptyTitle => 'तुम्ही इथे फोटो काढलेले नाहीत';

  @override
  String get hereEmptyBody =>
      'शोधाची त्रिज्या वाढवा, किंवा आधी गेलेल्या एखाद्या ठिकाणी परत जा.';

  @override
  String get hereNotIndexedTitle => 'अजून काहीही इंडेक्स झालेले नाही';

  @override
  String get hereNotIndexedBody =>
      'तुम्ही कुठे कुठे गेलात हे कळण्यासाठी Been Here ला तुमची फोटो लायब्ररी एकदा वाचावी लागेल. काहीही तुमच्या फोनबाहेर जात नाही.';

  @override
  String get indexStartAction => 'माझे फोटो इंडेक्स करा';

  @override
  String get indexPermissionTitle => 'Been Here ला तुमचे फोटो हवे आहेत';

  @override
  String get indexPermissionBody =>
      'प्रत्येक फोटो कुठे आणि कधी काढला एवढेच ते वाचते, आणि ते याच फोनवर ठेवते.';

  @override
  String get indexPermissionAction => 'ॲक्सेस द्या';

  @override
  String get indexPermissionDeniedTitle => 'फोटो ॲक्सेस बंद आहे';

  @override
  String get indexPermissionDeniedBody =>
      'त्याशिवाय Been Here तुम्हाला काहीच दाखवू शकत नाही. सिस्टम सेटिंग्जमध्ये तुम्ही ते चालू करू शकता.';

  @override
  String get indexLimitedAccessNotice =>
      'तुम्ही फक्त निवडक फोटो शेअर केले आहेत, त्यामुळे Been Here फक्त तेच पाहू शकते. पूर्ण ॲक्सेस दिल्यास ते तुम्ही गेलेले प्रत्येक ठिकाण शोधू शकते.';

  @override
  String get indexRunningTitle => 'तुमची फोटो लायब्ररी वाचत आहे';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$total पैकी $processed';
  }

  @override
  String get indexFailedTitle => 'इंडेक्सिंग थांबले';

  @override
  String get indexFailedBody =>
      'मध्येच काहीतरी बिघडले. पुन्हा प्रयत्न केल्यास जिथे थांबले तिथून पुढे सुरू होईल.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फोटो इंडेक्स झाले',
      one: '$count फोटो इंडेक्स झाला',
      zero: 'एकही फोटो इंडेक्स झालेला नाही',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return 'त्यापैकी $percent% मध्ये लोकेशन आहे';
  }

  @override
  String get commonLoading => 'लोड होत आहे…';

  @override
  String get commonRetry => 'पुन्हा प्रयत्न करा';

  @override
  String get commonCancel => 'रद्द करा';

  @override
  String hereRadiusLabel(String radius) {
    return '$radius च्या आत';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फोटो',
      zero: 'फोटो नाहीत',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count भेटी',
      one: '$count भेट',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters मी';
  }

  @override
  String distanceKilometers(String km) {
    return '$km किमी';
  }

  @override
  String get ageToday => 'आज';

  @override
  String get ageYesterday => 'काल';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days दिवसांपूर्वी',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months महिन्यांपूर्वी',
      one: 'एक महिन्यापूर्वी',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years वर्षांपूर्वी',
      one: 'एक वर्षापूर्वी',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'तुम्ही कुठे आहात?';

  @override
  String get locationPermissionBody =>
      'Been Here तुमच्या स्थानाची तुलना तुमचे फोटो जिथे काढले त्या ठिकाणांशी करते. ही तुलना याच फोनवर होते.';

  @override
  String get locationPermissionAction => 'माझे लोकेशन वापरा';

  @override
  String get locationDeniedTitle => 'लोकेशन बंद आहे';

  @override
  String get locationDeniedBody =>
      'त्याशिवाय ॲपला इथे तुमच्याकडे काय आहे हे कळू शकत नाही. सिस्टम सेटिंग्जमध्ये तुम्ही ते चालू करू शकता.';

  @override
  String get locationUnavailableTitle => 'अजून स्थान मिळालेले नाही';

  @override
  String get locationUnavailableBody =>
      'तुमच्या फोनला अजून तो कुठे आहे ते कळलेले नाही. घरात याला थोडा वेळ लागू शकतो.';

  @override
  String get locationServicesDisabledTitle => 'लोकेशन सेवा बंद आहेत';

  @override
  String get locationServicesDisabledBody =>
      'सिस्टम सेटिंग्जमध्ये त्या चालू करा आणि परत या.';

  @override
  String get hereNothingTitle => 'तुम्ही इथे फोटो काढलेले नाहीत';

  @override
  String get hereNothingBody =>
      'मोठी त्रिज्या वापरून पाहा, किंवा आधी गेलेल्या एखाद्या ठिकाणी परत जा.';

  @override
  String hereNearestHint(String distance) {
    return 'तुमची सर्वात जवळची आठवण $distance दूर आहे.';
  }

  @override
  String get photoDetailRephoto => 'पुन्हा फोटो काढा';

  @override
  String get photoDetailRephotoSoon =>
      'पुन्हा फोटो काढण्याची सुविधा पुढील आवृत्तीत येईल.';

  @override
  String photoDetailOf(int index, int total) {
    return '$total पैकी $index';
  }

  @override
  String get debugLocationTitle => 'डीबग लोकेशन';

  @override
  String get debugLocationBody =>
      'तुम्ही दुसरीकडे आहात असे समजा, म्हणजे इथे स्क्रीन सोफ्यावर बसूनच तपासता येईल.';

  @override
  String get debugLocationLatitude => 'अक्षांश';

  @override
  String get debugLocationLongitude => 'रेखांश';

  @override
  String get debugLocationApply => 'तिथे जा';

  @override
  String get debugLocationClear => 'खरे लोकेशन वापरा';

  @override
  String get debugLocationActive => 'डीबग लोकेशन सुरू आहे';

  @override
  String get commonClose => 'बंद करा';

  @override
  String get placesEmptyTitle => 'अजून ठिकाणे नाहीत';

  @override
  String get placesEmptyBody => 'फोटो इंडेक्स झाल्यावर ठिकाणे दिसतील.';

  @override
  String get placesSortLabel => 'क्रमवारी';

  @override
  String get placesSortLongestAgo => 'सर्वात आधी';

  @override
  String get placesSortMostPhotos => 'सर्वाधिक फोटो';

  @override
  String get placesSortNearest => 'सर्वात जवळ';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count म्यूट केलेली ठिकाणे',
      one: '$count म्यूट केलेले ठिकाण',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'म्यूट करा';

  @override
  String get placesUnmute => 'अनम्यूट करा';

  @override
  String get placesUseAutoRule => 'आपोआप ठरवा';

  @override
  String get placesAutoMutedNote => 'आपोआप म्यूट — तुम्ही इथे बहुतेक दिवस असता';

  @override
  String get placesUserMutedNote => 'तुम्ही म्यूट केले';

  @override
  String get placesUserUnmutedNote => 'तुम्ही दृश्यमान ठेवले';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days दिवस',
      one: '$days दिवस',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'ठिकाणांची नावे';

  @override
  String get settingsPlaceNamesBody =>
      'एखाद्या ठिकाणाच्या निर्देशांकांचे नावात रूपांतर करण्यास सिस्टमला सांगते. तो निर्देशांक Apple किंवा Google कडे जातो — या ॲपमधून फोनबाहेर जाणारी हीच एकमेव गोष्ट आहे. डीफॉल्टनुसार बंद; पुन्हा बंद केल्यावर सर्व नावे विसरली जातात.';

  @override
  String get settingsAutoMuteTitle =>
      'रोजची ठिकाणे इतक्या दिवसांनंतर म्यूट करा';

  @override
  String get settingsAutoMuteBody =>
      'इतक्या वेगवेगळ्या दिवशी काढलेले फोटो असलेले ठिकाण म्हणजे तुम्ही राहता ते ठिकाण, भेट देता ते नव्हे.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days दिवस',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'फोटो इंडेक्स';

  @override
  String get settingsReindex => 'सुरुवातीपासून पुन्हा इंडेक्स करा';

  @override
  String get settingsPrivacyTitle => 'या फोनवर काय राहते';

  @override
  String get settingsPrivacyBody =>
      'तुमचे फोटो, ते कुठे काढले, आणि त्यावरून हे ॲप जे काही समजते ते सर्व. खाते नाही, सर्व्हर नाही, ॲनालिटिक्स नाही.';

  @override
  String get placesName => 'या ठिकाणाला नाव द्या';

  @override
  String get placesRename => 'नाव बदला';

  @override
  String get placesNameDialogTitle => 'ठिकाणाचे नाव';

  @override
  String get placesNameHint => 'आजीचे घर, तलाव, ऑफिस…';

  @override
  String get placesNameSave => 'सेव्ह करा';

  @override
  String get placesNameClear => 'नाव काढा';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'तुम्ही इथे आधी आला आहात';

  @override
  String notificationBody(String age, String photos) {
    return 'शेवटच्या वेळी इथे: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Been Here ला तुमच्यासाठी लक्ष ठेवू द्या';

  @override
  String get alwaysLocationBody =>
      'बॅकग्राउंड लोकेशनमुळे, तुम्ही आधी फोटो काढलेल्या ठिकाणी पोहोचल्यावर तुमचा फोन Been Here ला कळवू शकतो — आणि ॲप तुम्हाला काहीही न उघडता एकदा सांगू शकते.\n\nॲप कधीही तुमचा पाठलाग करत नाही. तुमचा फोन काही मोजक्या वर्तुळांवर लक्ष ठेवतो आणि तुम्ही त्यापैकी एकात शिरल्यावरच ॲपला जागे करतो. तुम्ही कुठे आहात याबद्दल काहीही या डिव्हाइसबाहेर जात नाही.';

  @override
  String get alwaysLocationAction => 'आगमन सूचना चालू करा';

  @override
  String get alwaysLocationLater => 'आत्ता नको';

  @override
  String get alwaysLocationDeniedBody =>
      'बॅकग्राउंड लोकेशन बंद आहे, त्यामुळे आगमन सूचना शांत राहतील. बाकी सर्व पूर्वीसारखेच चालते; तुम्हाला हवे तेव्हा सिस्टम सेटिंग्जमध्ये ते चालू करू शकता.';

  @override
  String get settingsArrivalsTitle => 'आगमन';

  @override
  String get settingsArrivalsOn =>
      'बऱ्याच काळापासून फोटो न काढलेल्या ठिकाणी तुम्ही पोहोचल्यावर Been Here तुम्हाला सांगेल.';

  @override
  String get settingsArrivalsOff =>
      'Been Here शांत राहते. हे चालू केल्यास बॅकग्राउंड लोकेशन मागितले जाईल.';

  @override
  String get settingsMemoryAgeTitle =>
      'फक्त यापेक्षा जुन्या ठिकाणांचा उल्लेख करा';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days दिवस',
      one: '$days दिवस',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => 'नंतर ते ठिकाण इतका वेळ शांत ठेवा';

  @override
  String get settingsDailyLimitTitle => 'आणि इतका वेळ काहीच बोलू नका';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours तास',
      one: '$hours तास',
      zero: 'अजिबात नाही',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'अर्धे वर्ष न थांबता आगमन सूचना वापरून पाहण्यासाठी ही मूल्ये कमी करा.';

  @override
  String get placesTestArrival => 'इथे आगमनाची चाचणी करा';

  @override
  String get arrivalTestNotified => 'सूचना पाठवली';

  @override
  String get arrivalTestMuted => 'काही नाही: ठिकाण म्यूट आहे';

  @override
  String get arrivalTestTooFewPhotos => 'काही नाही: इथे खूप कमी फोटो आहेत';

  @override
  String get arrivalTestTooRecent => 'काही नाही: तुम्ही इथे अलीकडेच फोटो काढले';

  @override
  String get arrivalTestPlaceCooldown => 'काही नाही: हे ठिकाण अलीकडेच बोलले';

  @override
  String get arrivalTestDailyLimit => 'काही नाही: आज दुसरे काहीतरी आधीच बोलले';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'तुमच्या फोनने लोकेशन \"ॲप वापरताना\" वर ठेवले आहे. iOS ॲपमधून हा पर्याय पुन्हा देत नाही, त्यामुळे सिस्टम सेटिंग्जमध्ये बॅकग्राउंड लोकेशन \"नेहमी\" वर बदलावे लागेल — मग आगमन सूचना काम करू लागतील.';

  @override
  String get commonOpenSettings => 'सेटिंग्ज उघडा';

  @override
  String get settingsArrivalsPending =>
      'जवळजवळ: लोकेशन अजूनही \"ॲप वापरताना\" वर आहे. सिस्टम सेटिंग्जमध्ये ते \"नेहमी\" करा.';

  @override
  String get placesSortVisits => 'सर्वाधिक भेटी';

  @override
  String get placesSortAscending => 'उलटा क्रम';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count भेटी',
      one: '$count भेट',
      zero: 'कधीच नाही',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'ठिकाणे नकाशावर दाखवा';

  @override
  String get settingsMapBody =>
      'तुम्ही नकाशा सरकवता आणि झूम करता तसे OpenStreetMap वरून टाइल्स डाउनलोड होतात, त्यामुळे तो सर्व्हर तुम्ही कुठे पाहत आहात हे सतत पाहतो. एकदाच विचारल्या जाणाऱ्या ठिकाणाच्या नावाप्रमाणे नव्हे, हे नकाशा उघडा असेपर्यंत चालू राहते. डीफॉल्टनुसार बंद.';

  @override
  String get placesShowMap => 'नकाशा';

  @override
  String get placesShowList => 'यादी';

  @override
  String get placesMapAttribution => '© OpenStreetMap योगदानकर्ते';

  @override
  String get rephotoOverlay => 'फिकट';

  @override
  String get rephotoEdges => 'बाह्यरेषा';

  @override
  String get rephotoCapture => 'फोटो काढा';

  @override
  String get rephotoSaved => 'तुमच्या फोटोंमध्ये सेव्ह केला';

  @override
  String get rephotoNotSaved => 'सेव्ह करता आला नाही. फोटो जोडणे बंद असू शकते.';

  @override
  String get rephotoNoCamera =>
      'कॅमेरा उपलब्ध नाही. जुन्या फोटोला उत्तर देणारा फोटो काढण्यासाठी Been Here ला कॅमेरा हवा.';

  @override
  String get rephotoThenAndNow => 'तेव्हा आणि आता';

  @override
  String get rephotoShare => 'शेअर करा';

  @override
  String get rephotoThen => 'तेव्हा';

  @override
  String get rephotoNow => 'आता';

  @override
  String get rephotoShareFailed => 'शेअर करण्यासाठी इमेज तयार करता आली नाही.';

  @override
  String get onboardingSkip => 'वगळा';

  @override
  String get onboardingNext => 'पुढे';

  @override
  String get onboardingWhatTitle => 'तुम्ही उभे आहात त्याच ठिकाणचे फोटो';

  @override
  String get onboardingWhatBody =>
      'आधी फोटो काढलेल्या ठिकाणी पोहोचा आणि Been Here तुम्ही तिथे काय काढले ते दाखवेल — भेटीनुसार, सर्वात जुनी आधी.';

  @override
  String get onboardingPrivacyTitle => 'काहीही तुमच्या फोनबाहेर जात नाही';

  @override
  String get onboardingPrivacyBody =>
      'खाते नाही, सर्व्हर नाही, ॲनालिटिक्स नाही. Been Here डिव्हाइसवरच तुमची फोटो लायब्ररी वाचते आणि शेजारी एक छोटा इंडेक्स ठेवते. तुमचे फोटो, आणि ते कुठे काढले, जिथे आहेत तिथेच राहतात.';

  @override
  String get onboardingPrivacyFootnote =>
      'दोनच गोष्टी नेटवर्कपर्यंत पोहोचू शकतात, आणि तुम्ही चालू करेपर्यंत दोन्ही बंद असतात: ठिकाणांची नावे आणि नकाशा.';

  @override
  String get onboardingPhotosTitle => 'त्याला तुमचे फोटो हवे आहेत';

  @override
  String get onboardingPhotosBody =>
      'कोणता फोटो कुठे काढला याची Been Here नोंद ठेवते. ते कधीही काहीही कॉपी किंवा हलवत नाही — ते आयडी आणि निर्देशांक लक्षात ठेवते, आणि फोटो फक्त तुम्हाला दाखवतानाच वाचते.';

  @override
  String get onboardingPhotosAction => 'फोटोंना परवानगी द्या';

  @override
  String get onboardingDone => 'सुरू करा';

  @override
  String get settingsAboutTitle => 'माहिती';

  @override
  String settingsVersion(String version, String build) {
    return 'आवृत्ती $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'सोर्स कोड';

  @override
  String get settingsShowIntro => 'ओळख पुन्हा दाखवा';

  @override
  String photoSemanticLabel(String date) {
    return '$date चा फोटो';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return '$total पैकी फोटो $index, $date';
  }

  @override
  String get placesActionsLabel => 'या ठिकाणाचे काय करायचे';

  @override
  String get radiusSemanticLabel => 'शोधाची त्रिज्या';

  @override
  String get hereMapTitle => 'आसपास';

  @override
  String get hereOpenInMaps => 'नकाशात उघडा';

  @override
  String get hereBackToMe => 'मी जिथे आहे तिथे परत जा';

  @override
  String get herePlaceFallbackTitle => 'तुमच्या ओळखीचे ठिकाण';

  @override
  String get arrivalTestNearHome => 'बातमी होण्याइतके घरापासून दूर नाही.';

  @override
  String get settingsHomeRadiusTitle => 'इतक्या अंतरात शांत राहा';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: 'घरापासून $km किमी',
      zero: 'अंतर नाही — कधीच शांत नाही',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'रोजचे आयुष्य घराजवळ घडते, आणि तिथेच त्यावर टिप्पणी करणारा फोन सर्वात कमी हवासा वाटतो. यापेक्षा जवळच्या ठिकाणांवर कधीच लक्ष ठेवले जात नाही.';

  @override
  String get settingsQuietTitle => 'हे शांत का आहे';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ठिकाणांवर लक्ष',
      zero: 'एकाही ठिकाणावर लक्ष नाही',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'लक्ष ठेवलेले सर्वात जवळचे ठिकाण: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'कशावरच लक्ष ठेवले जात नाही, त्यामुळे कोणतेही आगमन होऊ शकत नाही.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'शेवटची सूचना: $when';
  }

  @override
  String get settingsQuietNever => 'कधीच नाही';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return '$total ठिकाणांपैकी: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count म्यूट';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count घराजवळ';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count मध्ये खूप कमी फोटो';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count चे अलीकडे फोटो';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count अजून विश्रांतीत';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count लक्ष ठेवण्याजोगी';
  }

  @override
  String get ageSemanticLabel => 'फोटोंचे वय';

  @override
  String get ageStopNow => 'आता';

  @override
  String get ageStopDay => '१ दिवस';

  @override
  String get ageStop3Days => '३ दिवस';

  @override
  String get ageStopWeek => '१ आठवडा';

  @override
  String get ageStop2Weeks => '२ आठवडे';

  @override
  String get ageStopMonth => '१ महिना';

  @override
  String get ageStop3Months => '३ महिने';

  @override
  String get ageStop6Months => '६ महिने';

  @override
  String get ageStopYear => '१ वर्ष';

  @override
  String get ageStop2Years => '२ वर्षे';

  @override
  String get ageStop5Years => '५ वर्षे';

  @override
  String get ageStop10Years => '१० वर्षे';

  @override
  String get ageStopAll => 'सर्व';

  @override
  String get ageWindowAll => 'सर्व फोटो';

  @override
  String ageWindowNewerThan(String stop) {
    return '$stop पर्यंत';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return '$stop पेक्षा जुने';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest ते $oldest';
  }

  @override
  String get ageWindowReset => 'रीसेट करा';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ फोटो';
  }
}
