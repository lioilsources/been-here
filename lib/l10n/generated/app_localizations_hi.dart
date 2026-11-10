// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'यहाँ';

  @override
  String get placesTabLabel => 'जगहें';

  @override
  String get settingsTabLabel => 'सेटिंग्स';

  @override
  String get hereEmptyTitle => 'आपने यहाँ कोई फ़ोटो नहीं ली';

  @override
  String get hereEmptyBody =>
      'खोज का दायरा बढ़ाएँ, या किसी ऐसी जगह लौटें जहाँ आप पहले जा चुके हैं।';

  @override
  String get hereNotIndexedTitle => 'अभी कुछ भी इंडेक्स नहीं हुआ';

  @override
  String get hereNotIndexedBody =>
      'आप कहाँ-कहाँ गए हैं, यह जानने के लिए Been Here को आपकी फ़ोटो लाइब्रेरी एक बार पढ़नी होगी। कुछ भी आपके फ़ोन से बाहर नहीं जाता।';

  @override
  String get indexStartAction => 'मेरी फ़ोटो इंडेक्स करें';

  @override
  String get indexPermissionTitle => 'Been Here को आपकी फ़ोटो चाहिए';

  @override
  String get indexPermissionBody =>
      'यह सिर्फ़ यह पढ़ता है कि हर फ़ोटो कहाँ और कब ली गई, और इसे इसी फ़ोन पर रखता है।';

  @override
  String get indexPermissionAction => 'ऐक्सेस दें';

  @override
  String get indexPermissionDeniedTitle => 'फ़ोटो ऐक्सेस बंद है';

  @override
  String get indexPermissionDeniedBody =>
      'इसके बिना Been Here आपको कुछ नहीं दिखा सकता। आप इसे सिस्टम सेटिंग्स में चालू कर सकते हैं।';

  @override
  String get indexLimitedAccessNotice =>
      'आपने सिर्फ़ चुनी हुई फ़ोटो शेयर की हैं, इसलिए Been Here सिर्फ़ उन्हें देख सकता है। पूरा ऐक्सेस देने पर यह हर वह जगह ढूँढ सकता है जहाँ आप गए हैं।';

  @override
  String get indexRunningTitle => 'आपकी फ़ोटो लाइब्रेरी पढ़ी जा रही है';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$total में से $processed';
  }

  @override
  String get indexFailedTitle => 'इंडेक्सिंग रुक गई';

  @override
  String get indexFailedBody =>
      'बीच में कुछ गड़बड़ हो गई। दोबारा कोशिश करने पर यह वहीं से आगे बढ़ेगा जहाँ रुका था।';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोटो इंडेक्स हुईं',
      one: '$count फ़ोटो इंडेक्स हुई',
      zero: 'कोई फ़ोटो इंडेक्स नहीं हुई',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return 'इनमें से $percent% में लोकेशन है';
  }

  @override
  String get commonLoading => 'लोड हो रहा है…';

  @override
  String get commonRetry => 'फिर से कोशिश करें';

  @override
  String get commonCancel => 'रद्द करें';

  @override
  String hereRadiusLabel(String radius) {
    return '$radius के भीतर';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ोटो',
      zero: 'कोई फ़ोटो नहीं',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count बार आना',
      one: '$count बार आना',
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
  String get ageYesterday => 'कल';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days दिन पहले',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months महीने पहले',
      one: 'एक महीना पहले',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years साल पहले',
      one: 'एक साल पहले',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'आप कहाँ हैं?';

  @override
  String get locationPermissionBody =>
      'Been Here आपकी जगह की तुलना उन जगहों से करता है जहाँ आपकी फ़ोटो ली गई थीं। यह तुलना इसी फ़ोन पर होती है।';

  @override
  String get locationPermissionAction => 'मेरी लोकेशन इस्तेमाल करें';

  @override
  String get locationDeniedTitle => 'लोकेशन बंद है';

  @override
  String get locationDeniedBody =>
      'इसके बिना ऐप नहीं जान सकता कि यहाँ आपके पास क्या है। आप इसे सिस्टम सेटिंग्स में चालू कर सकते हैं।';

  @override
  String get locationUnavailableTitle => 'अभी लोकेशन नहीं मिली';

  @override
  String get locationUnavailableBody =>
      'आपके फ़ोन को अभी पता नहीं चला कि वह कहाँ है। घर के अंदर इसमें थोड़ा समय लग सकता है।';

  @override
  String get locationServicesDisabledTitle => 'लोकेशन सेवाएँ बंद हैं';

  @override
  String get locationServicesDisabledBody =>
      'इन्हें सिस्टम सेटिंग्स में चालू करें और वापस आएँ।';

  @override
  String get hereNothingTitle => 'आपने यहाँ कोई फ़ोटो नहीं ली';

  @override
  String get hereNothingBody =>
      'बड़ा दायरा आज़माएँ, या किसी ऐसी जगह लौटें जहाँ आप पहले जा चुके हैं।';

  @override
  String hereNearestHint(String distance) {
    return 'आपकी सबसे नज़दीकी याद $distance दूर है।';
  }

  @override
  String get photoDetailRephoto => 'फिर से फ़ोटो लें';

  @override
  String get photoDetailRephotoSoon =>
      'फिर से फ़ोटो लेने की सुविधा बाद के वर्शन में आएगी।';

  @override
  String photoDetailOf(int index, int total) {
    return '$total में से $index';
  }

  @override
  String get debugLocationTitle => 'डीबग लोकेशन';

  @override
  String get debugLocationBody =>
      'मान लीजिए कि आप कहीं और हैं, ताकि यहाँ वाली स्क्रीन को सोफ़े पर बैठे-बैठे जाँचा जा सके।';

  @override
  String get debugLocationLatitude => 'अक्षांश';

  @override
  String get debugLocationLongitude => 'देशांतर';

  @override
  String get debugLocationApply => 'वहाँ जाएँ';

  @override
  String get debugLocationClear => 'असली लोकेशन इस्तेमाल करें';

  @override
  String get debugLocationActive => 'डीबग लोकेशन चालू है';

  @override
  String get commonClose => 'बंद करें';

  @override
  String get placesEmptyTitle => 'अभी कोई जगह नहीं';

  @override
  String get placesEmptyBody => 'फ़ोटो इंडेक्स होने के बाद जगहें दिखेंगी।';

  @override
  String get placesSortLabel => 'इसके अनुसार क्रम';

  @override
  String get placesSortLongestAgo => 'सबसे पहले गए';

  @override
  String get placesSortMostPhotos => 'सबसे ज़्यादा फ़ोटो';

  @override
  String get placesSortNearest => 'सबसे नज़दीक';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count म्यूट की गई जगहें',
      one: '$count म्यूट की गई जगह',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'म्यूट करें';

  @override
  String get placesUnmute => 'अनम्यूट करें';

  @override
  String get placesUseAutoRule => 'अपने-आप तय करें';

  @override
  String get placesAutoMutedNote =>
      'अपने-आप म्यूट — आप यहाँ लगभग रोज़ होते हैं';

  @override
  String get placesUserMutedNote => 'आपने म्यूट किया';

  @override
  String get placesUserUnmutedNote => 'आपने दिखता रखा';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days दिन',
      one: '$days दिन',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'जगहों के नाम';

  @override
  String get settingsPlaceNamesBody =>
      'सिस्टम से किसी जगह के निर्देशांकों को नाम में बदलने को कहता है। वह निर्देशांक Apple या Google को जाता है — इस ऐप में बस यही एक चीज़ है जो आपके फ़ोन से बाहर जाती है। डिफ़ॉल्ट रूप से बंद; फिर से बंद करने पर सारे नाम भूल जाते हैं।';

  @override
  String get settingsAutoMuteTitle =>
      'रोज़मर्रा की जगहों को इतने दिनों बाद म्यूट करें';

  @override
  String get settingsAutoMuteBody =>
      'जिस जगह इतने अलग-अलग दिनों की फ़ोटो हों, वह आपके रहने की जगह है, घूमने की नहीं।';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days दिन',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'फ़ोटो इंडेक्स';

  @override
  String get settingsReindex => 'शुरू से दोबारा इंडेक्स करें';

  @override
  String get settingsPrivacyTitle => 'इस फ़ोन पर क्या रहता है';

  @override
  String get settingsPrivacyBody =>
      'आपकी फ़ोटो, वे कहाँ ली गईं, और उनसे यह ऐप जो कुछ समझता है। न कोई खाता, न सर्वर, न एनालिटिक्स।';

  @override
  String get placesName => 'इस जगह का नाम रखें';

  @override
  String get placesRename => 'नाम बदलें';

  @override
  String get placesNameDialogTitle => 'जगह का नाम';

  @override
  String get placesNameHint => 'नानी का घर, झील, दफ़्तर…';

  @override
  String get placesNameSave => 'सहेजें';

  @override
  String get placesNameClear => 'नाम हटाएँ';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'आप यहाँ पहले आ चुके हैं';

  @override
  String notificationBody(String age, String photos) {
    return 'पिछली बार यहाँ: $age। $photos।';
  }

  @override
  String get alwaysLocationTitle => 'Been Here को आपके लिए ध्यान रखने दें';

  @override
  String get alwaysLocationBody =>
      'बैकग्राउंड लोकेशन के साथ, जब आप किसी ऐसी जगह पहुँचते हैं जिसकी आपने पहले फ़ोटो ली है, तो आपका फ़ोन Been Here को बता सकता है — और ऐप आपको एक बार बता सकता है, बिना आपके कुछ खोले।\n\nऐप कभी आपका पीछा नहीं करता। आपका फ़ोन कुछ गिने-चुने घेरों पर नज़र रखता है और ऐप को सिर्फ़ तब जगाता है जब आप उनमें से किसी में जाते हैं। आप कहाँ हैं, इसके बारे में कुछ भी इस डिवाइस से बाहर नहीं जाता।';

  @override
  String get alwaysLocationAction => 'पहुँचने की सूचना चालू करें';

  @override
  String get alwaysLocationLater => 'अभी नहीं';

  @override
  String get alwaysLocationDeniedBody =>
      'बैकग्राउंड लोकेशन बंद है, इसलिए पहुँचने की सूचनाएँ चुप रहेंगी। बाक़ी सब पहले जैसा चलता है; आप जब चाहें सिस्टम सेटिंग्स में इसे चालू कर सकते हैं।';

  @override
  String get settingsArrivalsTitle => 'पहुँचना';

  @override
  String get settingsArrivalsOn =>
      'जब आप किसी ऐसी जगह पहुँचेंगे जिसकी काफ़ी समय से फ़ोटो नहीं ली, तो Been Here आपको बताएगा।';

  @override
  String get settingsArrivalsOff =>
      'Been Here चुप रहता है। इसे चालू करने पर बैकग्राउंड लोकेशन माँगी जाएगी।';

  @override
  String get settingsMemoryAgeTitle =>
      'सिर्फ़ इससे पुरानी जगहों का ज़िक्र करें';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days दिन',
      one: '$days दिन',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => 'फिर उस जगह को इतनी देर शांत रखें';

  @override
  String get settingsDailyLimitTitle => 'और इतनी देर कुछ भी न कहें';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours घंटे',
      one: '$hours घंटा',
      zero: 'बिल्कुल नहीं',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'आधा साल इंतज़ार किए बिना पहुँचने की सूचनाएँ आज़माने के लिए इन्हें कम करें।';

  @override
  String get placesTestArrival => 'यहाँ पहुँचने की जाँच करें';

  @override
  String get arrivalTestNotified => 'सूचना भेज दी गई';

  @override
  String get arrivalTestMuted => 'कुछ नहीं: जगह म्यूट है';

  @override
  String get arrivalTestTooFewPhotos => 'कुछ नहीं: यहाँ बहुत कम फ़ोटो हैं';

  @override
  String get arrivalTestTooRecent =>
      'कुछ नहीं: आपने यहाँ हाल ही में फ़ोटो ली थी';

  @override
  String get arrivalTestPlaceCooldown =>
      'कुछ नहीं: यह जगह हाल ही में बोल चुकी है';

  @override
  String get arrivalTestDailyLimit => 'कुछ नहीं: आज कुछ और बोल चुका है';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'आपके फ़ोन ने लोकेशन को \"ऐप इस्तेमाल करते समय\" पर रखा है। iOS ऐप के अंदर से यह विकल्प दोबारा नहीं देता, इसलिए बैकग्राउंड लोकेशन को सिस्टम सेटिंग्स में \"हमेशा\" पर करना होगा — फिर पहुँचने की सूचनाएँ काम करने लगेंगी।';

  @override
  String get commonOpenSettings => 'सेटिंग्स खोलें';

  @override
  String get settingsArrivalsPending =>
      'लगभग: लोकेशन अभी भी \"ऐप इस्तेमाल करते समय\" पर है। इसे सिस्टम सेटिंग्स में \"हमेशा\" पर करें।';

  @override
  String get placesSortVisits => 'सबसे ज़्यादा बार गए';

  @override
  String get placesSortAscending => 'उलटा क्रम';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count बार गए',
      zero: 'कभी नहीं',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'जगहें नक्शे पर दिखाएँ';

  @override
  String get settingsMapBody =>
      'नक्शे की टाइलें OpenStreetMap से तब डाउनलोड होती हैं जब आप नक्शा खिसकाते और ज़ूम करते हैं, इसलिए वह सर्वर लगातार देखता है कि आप कहाँ देख रहे हैं। जगह के नाम के उलट, जो एक बार पूछा जाता है, यह तब तक चलता है जब तक नक्शा खुला है। डिफ़ॉल्ट रूप से बंद।';

  @override
  String get placesShowMap => 'नक्शा';

  @override
  String get placesShowList => 'सूची';

  @override
  String get placesMapAttribution => '© OpenStreetMap योगदानकर्ता';

  @override
  String get rephotoOverlay => 'फ़ेड';

  @override
  String get rephotoEdges => 'आउटलाइन';

  @override
  String get rephotoCapture => 'फ़ोटो लें';

  @override
  String get rephotoSaved => 'आपकी फ़ोटो में सहेजी गई';

  @override
  String get rephotoNotSaved =>
      'सहेजी नहीं जा सकी। हो सकता है फ़ोटो जोड़ना बंद हो।';

  @override
  String get rephotoNoCamera =>
      'कोई कैमरा उपलब्ध नहीं। किसी पुरानी फ़ोटो का जवाब देने वाली फ़ोटो लेने के लिए Been Here को कैमरा चाहिए।';

  @override
  String get rephotoThenAndNow => 'तब और अब';

  @override
  String get rephotoShare => 'शेयर करें';

  @override
  String get rephotoThen => 'तब';

  @override
  String get rephotoNow => 'अब';

  @override
  String get rephotoShareFailed => 'शेयर करने के लिए इमेज नहीं बन सकी।';

  @override
  String get onboardingSkip => 'छोड़ें';

  @override
  String get onboardingNext => 'आगे';

  @override
  String get onboardingWhatTitle => 'उसी जगह की फ़ोटो जहाँ आप खड़े हैं';

  @override
  String get onboardingWhatBody =>
      'किसी ऐसी जगह पहुँचें जिसकी आप पहले फ़ोटो ले चुके हैं और Been Here आपको दिखाएगा कि आपने वहाँ क्या खींचा — एक-एक बार की यात्रा, सबसे पुरानी पहले।';

  @override
  String get onboardingPrivacyTitle => 'कुछ भी आपके फ़ोन से बाहर नहीं जाता';

  @override
  String get onboardingPrivacyBody =>
      'न खाता, न सर्वर, न एनालिटिक्स। Been Here डिवाइस पर ही आपकी फ़ोटो लाइब्रेरी पढ़ता है और उसके साथ एक छोटा-सा इंडेक्स रखता है। आपकी फ़ोटो, और वे कहाँ ली गईं, अपनी जगह पर रहती हैं।';

  @override
  String get onboardingPrivacyFootnote =>
      'दो चीज़ें नेटवर्क तक पहुँच सकती हैं, और दोनों तब तक बंद हैं जब तक आप उन्हें चालू न करें: जगहों के नाम और नक्शा।';

  @override
  String get onboardingPhotosTitle => 'इसे आपकी फ़ोटो चाहिए';

  @override
  String get onboardingPhotosBody =>
      'Been Here नोट करता है कि कौन-सी फ़ोटो कहाँ ली गई। यह कभी कुछ कॉपी या मूव नहीं करता — यह आईडी और निर्देशांक याद रखता है, और फ़ोटो सिर्फ़ तभी पढ़ता है जब आपको दिखाता है।';

  @override
  String get onboardingPhotosAction => 'फ़ोटो की अनुमति दें';

  @override
  String get onboardingDone => 'शुरू करें';

  @override
  String get settingsAboutTitle => 'जानकारी';

  @override
  String settingsVersion(String version, String build) {
    return 'वर्शन $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'सोर्स कोड';

  @override
  String get settingsShowIntro => 'परिचय फिर से दिखाएँ';

  @override
  String photoSemanticLabel(String date) {
    return '$date की फ़ोटो';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return '$total में से फ़ोटो $index, $date';
  }

  @override
  String get placesActionsLabel => 'इस जगह का क्या करें';

  @override
  String get radiusSemanticLabel => 'खोज का दायरा';

  @override
  String get hereMapTitle => 'आसपास';

  @override
  String get hereOpenInMaps => 'मैप्स में खोलें';

  @override
  String get hereBackToMe => 'मेरी जगह पर वापस जाएँ';

  @override
  String get herePlaceFallbackTitle => 'एक जानी-पहचानी जगह';

  @override
  String get arrivalTestNearHome => 'घर के इतने पास है कि ख़बर नहीं बनती।';

  @override
  String get settingsHomeRadiusTitle => 'इतनी दूरी के भीतर चुप रहें';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: 'घर से $km किमी',
      zero: 'कोई दूरी नहीं — कभी चुप नहीं',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'रोज़ की ज़िंदगी घर के पास बीतती है, और वहीं उस पर टिप्पणी करने वाला फ़ोन सबसे कम पसंद आता है। इससे नज़दीक की जगहों पर कभी नज़र नहीं रखी जाती।';

  @override
  String get settingsQuietTitle => 'यह चुप क्यों है';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count जगहों पर नज़र',
      zero: 'किसी जगह पर नज़र नहीं',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'नज़र में सबसे नज़दीकी जगह: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'किसी चीज़ पर नज़र नहीं रखी जा रही, इसलिए पहुँचने की कोई सूचना नहीं आ सकती।';

  @override
  String settingsQuietLastNotified(String when) {
    return 'पिछली सूचना: $when';
  }

  @override
  String get settingsQuietNever => 'कभी नहीं';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return '$total जगहों में से: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count म्यूट';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count घर के पास';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count में बहुत कम फ़ोटो';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count की हाल में फ़ोटो ली गई';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count अभी विराम में';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count नज़र रखने लायक';
  }

  @override
  String get ageSemanticLabel => 'फ़ोटो की उम्र';

  @override
  String get ageStopNow => 'अभी';

  @override
  String get ageStopDay => '1 दिन';

  @override
  String get ageStop3Days => '3 दिन';

  @override
  String get ageStopWeek => '1 हफ़्ता';

  @override
  String get ageStop2Weeks => '2 हफ़्ते';

  @override
  String get ageStopMonth => '1 महीना';

  @override
  String get ageStop3Months => '3 महीने';

  @override
  String get ageStop6Months => '6 महीने';

  @override
  String get ageStopYear => '1 साल';

  @override
  String get ageStop2Years => '2 साल';

  @override
  String get ageStop5Years => '5 साल';

  @override
  String get ageStop10Years => '10 साल';

  @override
  String get ageStopAll => 'सभी';

  @override
  String get ageWindowAll => 'सभी फ़ोटो';

  @override
  String ageWindowNewerThan(String stop) {
    return '$stop तक';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return '$stop से पुरानी';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest से $oldest तक';
  }

  @override
  String get ageWindowReset => 'रीसेट करें';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ फ़ोटो';
  }
}
