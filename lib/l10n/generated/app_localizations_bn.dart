// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'এখানে';

  @override
  String get placesTabLabel => 'জায়গা';

  @override
  String get settingsTabLabel => 'সেটিংস';

  @override
  String get hereEmptyTitle => 'আপনি এখানে কোনো ছবি তোলেননি';

  @override
  String get hereEmptyBody =>
      'খোঁজার পরিসর বাড়ান, অথবা এমন কোনো জায়গায় ফিরে যান যেখানে আগে গিয়েছিলেন।';

  @override
  String get hereNotIndexedTitle => 'এখনো কিছু ইনডেক্স হয়নি';

  @override
  String get hereNotIndexedBody =>
      'আপনি কোথায় কোথায় গেছেন তা জানতে Been Here-কে আপনার ছবির লাইব্রেরি একবার পড়তে হবে। কিছুই আপনার ফোনের বাইরে যায় না।';

  @override
  String get indexStartAction => 'আমার ছবি ইনডেক্স করুন';

  @override
  String get indexPermissionTitle => 'Been Here-এর আপনার ছবি দরকার';

  @override
  String get indexPermissionBody =>
      'এটি শুধু পড়ে প্রতিটি ছবি কোথায় ও কখন তোলা হয়েছে, এবং তা এই ফোনেই রাখে।';

  @override
  String get indexPermissionAction => 'অ্যাক্সেস দিন';

  @override
  String get indexPermissionDeniedTitle => 'ছবির অ্যাক্সেস বন্ধ';

  @override
  String get indexPermissionDeniedBody =>
      'এটি ছাড়া Been Here আপনাকে কিছুই দেখাতে পারে না। সিস্টেম সেটিংসে এটি চালু করতে পারেন।';

  @override
  String get indexLimitedAccessNotice =>
      'আপনি শুধু বাছাই করা ছবি শেয়ার করেছেন, তাই Been Here শুধু সেগুলোই দেখতে পায়। পূর্ণ অ্যাক্সেস দিলে এটি আপনার যাওয়া প্রতিটি জায়গা খুঁজে পাবে।';

  @override
  String get indexRunningTitle => 'আপনার ছবির লাইব্রেরি পড়া হচ্ছে';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$total-এর মধ্যে $processed';
  }

  @override
  String get indexFailedTitle => 'ইনডেক্সিং থেমে গেছে';

  @override
  String get indexFailedBody =>
      'মাঝপথে কিছু একটা গোলমাল হয়েছে। আবার চেষ্টা করলে যেখানে থেমেছিল সেখান থেকে চলবে।';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ছবি ইনডেক্স হয়েছে',
      zero: 'কোনো ছবি ইনডেক্স হয়নি',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return 'এর মধ্যে $percent%-এ লোকেশন আছে';
  }

  @override
  String get commonLoading => 'লোড হচ্ছে…';

  @override
  String get commonRetry => 'আবার চেষ্টা করুন';

  @override
  String get commonCancel => 'বাতিল';

  @override
  String hereRadiusLabel(String radius) {
    return '$radius-এর মধ্যে';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি ছবি',
      zero: 'কোনো ছবি নেই',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count বার যাওয়া',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters মি';
  }

  @override
  String distanceKilometers(String km) {
    return '$km কিমি';
  }

  @override
  String get ageToday => 'আজ';

  @override
  String get ageYesterday => 'গতকাল';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days দিন আগে',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months মাস আগে',
      one: 'এক মাস আগে',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years বছর আগে',
      one: 'এক বছর আগে',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'আপনি কোথায়?';

  @override
  String get locationPermissionBody =>
      'Been Here আপনার অবস্থানকে সেই জায়গাগুলোর সঙ্গে মেলায় যেখানে আপনার ছবি তোলা হয়েছিল। মেলানোর কাজটা এই ফোনেই হয়।';

  @override
  String get locationPermissionAction => 'আমার লোকেশন ব্যবহার করুন';

  @override
  String get locationDeniedTitle => 'লোকেশন বন্ধ';

  @override
  String get locationDeniedBody =>
      'এটি ছাড়া অ্যাপ জানতে পারে না এখানে আপনার কী আছে। সিস্টেম সেটিংসে এটি চালু করতে পারেন।';

  @override
  String get locationUnavailableTitle => 'এখনো অবস্থান পাওয়া যায়নি';

  @override
  String get locationUnavailableBody =>
      'আপনার ফোন এখনো বুঝতে পারেনি সে কোথায়। ঘরের ভেতরে এতে একটু সময় লাগতে পারে।';

  @override
  String get locationServicesDisabledTitle => 'লোকেশন পরিষেবা বন্ধ';

  @override
  String get locationServicesDisabledBody =>
      'সিস্টেম সেটিংসে এগুলো চালু করে ফিরে আসুন।';

  @override
  String get hereNothingTitle => 'আপনি এখানে কোনো ছবি তোলেননি';

  @override
  String get hereNothingBody =>
      'বড় পরিসর চেষ্টা করুন, অথবা এমন কোনো জায়গায় ফিরে যান যেখানে আগে গিয়েছিলেন।';

  @override
  String hereNearestHint(String distance) {
    return 'আপনার সবচেয়ে কাছের স্মৃতি $distance দূরে।';
  }

  @override
  String get photoDetailRephoto => 'আবার ছবি তুলুন';

  @override
  String get photoDetailRephotoSoon =>
      'আবার ছবি তোলার সুবিধা পরের কোনো সংস্করণে আসবে।';

  @override
  String photoDetailOf(int index, int total) {
    return '$total-এর মধ্যে $index';
  }

  @override
  String get debugLocationTitle => 'ডিবাগ লোকেশন';

  @override
  String get debugLocationBody =>
      'ধরে নিন আপনি অন্য কোথাও আছেন, যাতে সোফায় বসেই এখানে স্ক্রিনটি পরীক্ষা করা যায়।';

  @override
  String get debugLocationLatitude => 'অক্ষাংশ';

  @override
  String get debugLocationLongitude => 'দ্রাঘিমাংশ';

  @override
  String get debugLocationApply => 'সেখানে যান';

  @override
  String get debugLocationClear => 'আসল লোকেশন ব্যবহার করুন';

  @override
  String get debugLocationActive => 'ডিবাগ লোকেশন চালু';

  @override
  String get commonClose => 'বন্ধ করুন';

  @override
  String get placesEmptyTitle => 'এখনো কোনো জায়গা নেই';

  @override
  String get placesEmptyBody => 'ছবি ইনডেক্স হয়ে গেলে জায়গাগুলো দেখা যাবে।';

  @override
  String get placesSortLabel => 'সাজানোর ভিত্তি';

  @override
  String get placesSortLongestAgo => 'সবচেয়ে আগে';

  @override
  String get placesSortMostPhotos => 'সবচেয়ে বেশি ছবি';

  @override
  String get placesSortNearest => 'সবচেয়ে কাছে';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি মিউট করা জায়গা',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'মিউট করুন';

  @override
  String get placesUnmute => 'আনমিউট করুন';

  @override
  String get placesUseAutoRule => 'স্বয়ংক্রিয়ভাবে ঠিক করুন';

  @override
  String get placesAutoMutedNote =>
      'স্বয়ংক্রিয়ভাবে মিউট — আপনি প্রায় প্রতিদিন এখানে থাকেন';

  @override
  String get placesUserMutedNote => 'আপনি মিউট করেছেন';

  @override
  String get placesUserUnmutedNote => 'আপনি দৃশ্যমান রেখেছেন';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days দিন',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'জায়গার নাম';

  @override
  String get settingsPlaceNamesBody =>
      'সিস্টেমকে একটি জায়গার স্থানাঙ্ক নামে বদলাতে বলে। সেই স্থানাঙ্ক Apple বা Google-এর কাছে যায় — এই অ্যাপে শুধু এটিই আপনার ফোনের বাইরে যায়। ডিফল্টভাবে বন্ধ; আবার বন্ধ করলে সব নাম মুছে যায়।';

  @override
  String get settingsAutoMuteTitle => 'রোজকার জায়গা এত দিন পরে মিউট করুন';

  @override
  String get settingsAutoMuteBody =>
      'যে জায়গায় এত আলাদা আলাদা দিনের ছবি আছে, সেটা আপনার থাকার জায়গা, বেড়ানোর নয়।';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days দিন',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'ছবির ইনডেক্স';

  @override
  String get settingsReindex => 'শুরু থেকে আবার ইনডেক্স করুন';

  @override
  String get settingsPrivacyTitle => 'এই ফোনে কী থাকে';

  @override
  String get settingsPrivacyBody =>
      'আপনার ছবি, সেগুলো কোথায় তোলা, আর তা থেকে এই অ্যাপ যা কিছু বুঝে নেয়। কোনো অ্যাকাউন্ট নেই, সার্ভার নেই, অ্যানালিটিক্স নেই।';

  @override
  String get placesName => 'এই জায়গার নাম দিন';

  @override
  String get placesRename => 'নাম বদলান';

  @override
  String get placesNameDialogTitle => 'জায়গার নাম';

  @override
  String get placesNameHint => 'দিদিমার বাড়ি, লেক, অফিস…';

  @override
  String get placesNameSave => 'সংরক্ষণ করুন';

  @override
  String get placesNameClear => 'নাম সরান';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'আপনি আগে এখানে এসেছেন';

  @override
  String notificationBody(String age, String photos) {
    return 'শেষবার এখানে: $age। $photos।';
  }

  @override
  String get alwaysLocationTitle => 'Been Here-কে আপনার হয়ে খেয়াল রাখতে দিন';

  @override
  String get alwaysLocationBody =>
      'ব্যাকগ্রাউন্ড লোকেশন থাকলে, আগে ছবি তোলা কোনো জায়গায় পৌঁছালে আপনার ফোন Been Here-কে জানাতে পারে — আর অ্যাপ আপনাকে একবার জানাতে পারে, আপনাকে কিছু খুলতে হবে না।\n\nঅ্যাপ কখনো আপনাকে অনুসরণ করে না। আপনার ফোন কয়েকটি বৃত্তের ওপর নজর রাখে এবং আপনি তার কোনো একটিতে ঢুকলেই কেবল অ্যাপকে জাগায়। আপনি কোথায় আছেন সে বিষয়ে কিছুই এই ডিভাইসের বাইরে যায় না।';

  @override
  String get alwaysLocationAction => 'পৌঁছানোর বার্তা চালু করুন';

  @override
  String get alwaysLocationLater => 'এখন নয়';

  @override
  String get alwaysLocationDeniedBody =>
      'ব্যাকগ্রাউন্ড লোকেশন বন্ধ, তাই পৌঁছানোর বার্তা চুপ থাকবে। বাকি সব আগের মতোই চলবে; যখন খুশি সিস্টেম সেটিংসে এটি চালু করতে পারেন।';

  @override
  String get settingsArrivalsTitle => 'পৌঁছানো';

  @override
  String get settingsArrivalsOn =>
      'অনেক দিন ছবি তোলেননি এমন কোনো জায়গায় পৌঁছালে Been Here আপনাকে জানাবে।';

  @override
  String get settingsArrivalsOff =>
      'Been Here চুপ থাকে। চালু করলে ব্যাকগ্রাউন্ড লোকেশন চাওয়া হবে।';

  @override
  String get settingsMemoryAgeTitle => 'শুধু এর চেয়ে পুরোনো জায়গার কথা বলুন';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days দিন',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle =>
      'তারপর সেই জায়গাকে এতক্ষণ চুপ রাখুন';

  @override
  String get settingsDailyLimitTitle => 'আর এতক্ষণ কিছুই বলবেন না';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ঘণ্টা',
      zero: 'একদমই না',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'অর্ধেক বছর অপেক্ষা না করে পৌঁছানোর বার্তা পরখ করতে এগুলো কমান।';

  @override
  String get placesTestArrival => 'এখানে পৌঁছানো পরীক্ষা করুন';

  @override
  String get arrivalTestNotified => 'নোটিফিকেশন পাঠানো হয়েছে';

  @override
  String get arrivalTestMuted => 'কিছু না: জায়গাটি মিউট করা';

  @override
  String get arrivalTestTooFewPhotos => 'কিছু না: এখানে খুব কম ছবি';

  @override
  String get arrivalTestTooRecent => 'কিছু না: আপনি সম্প্রতি এখানে ছবি তুলেছেন';

  @override
  String get arrivalTestPlaceCooldown =>
      'কিছু না: এই জায়গা সম্প্রতি জানিয়েছে';

  @override
  String get arrivalTestDailyLimit => 'কিছু না: আজ অন্য কিছু জানিয়েছে';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'আপনার ফোন লোকেশন \"অ্যাপ ব্যবহারের সময়\"-এ রেখেছে। iOS অ্যাপের ভেতর থেকে এই বিকল্প আর দেয় না, তাই সিস্টেম সেটিংসে ব্যাকগ্রাউন্ড লোকেশন \"সবসময়\"-এ বদলাতে হবে — তখন পৌঁছানোর বার্তা কাজ শুরু করবে।';

  @override
  String get commonOpenSettings => 'সেটিংস খুলুন';

  @override
  String get settingsArrivalsPending =>
      'প্রায় হয়ে গেছে: লোকেশন এখনো \"অ্যাপ ব্যবহারের সময়\"-এ আছে। সিস্টেম সেটিংসে এটি \"সবসময়\" করুন।';

  @override
  String get placesSortVisits => 'সবচেয়ে বেশি যাওয়া';

  @override
  String get placesSortAscending => 'উল্টো ক্রম';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count বার যাওয়া',
      zero: 'কখনো না',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'মানচিত্রে জায়গা দেখান';

  @override
  String get settingsMapBody =>
      'মানচিত্র সরানো ও জুম করার সময় OpenStreetMap থেকে টাইল ডাউনলোড হয়, তাই সেই সার্ভার একটানা দেখে আপনি কোথায় দেখছেন। জায়গার নামের মতো একবার জিজ্ঞেস করা নয়, মানচিত্র খোলা থাকা পর্যন্ত এটা চলতে থাকে। ডিফল্টভাবে বন্ধ।';

  @override
  String get placesShowMap => 'মানচিত্র';

  @override
  String get placesShowList => 'তালিকা';

  @override
  String get placesMapAttribution => '© OpenStreetMap অবদানকারীরা';

  @override
  String get rephotoOverlay => 'ফিকে';

  @override
  String get rephotoEdges => 'রেখাচিত্র';

  @override
  String get rephotoCapture => 'ছবি তুলুন';

  @override
  String get rephotoSaved => 'আপনার ছবিতে সংরক্ষিত হয়েছে';

  @override
  String get rephotoNotSaved =>
      'সংরক্ষণ করা যায়নি। হয়তো ছবি যোগ করা বন্ধ আছে।';

  @override
  String get rephotoNoCamera =>
      'কোনো ক্যামেরা নেই। পুরোনো ছবির জবাবে নতুন ছবি তুলতে Been Here-এর ক্যামেরা দরকার।';

  @override
  String get rephotoThenAndNow => 'তখন আর এখন';

  @override
  String get rephotoShare => 'শেয়ার করুন';

  @override
  String get rephotoThen => 'তখন';

  @override
  String get rephotoNow => 'এখন';

  @override
  String get rephotoShareFailed => 'শেয়ার করার ছবি তৈরি করা যায়নি।';

  @override
  String get onboardingSkip => 'এড়িয়ে যান';

  @override
  String get onboardingNext => 'পরবর্তী';

  @override
  String get onboardingWhatTitle =>
      'আপনি যেখানে দাঁড়িয়ে আছেন ঠিক সেখানকার ছবি';

  @override
  String get onboardingWhatBody =>
      'আগে ছবি তোলা কোনো জায়গায় পৌঁছান, Been Here দেখাবে আপনি সেখানে কী তুলেছিলেন — প্রতিবার যাওয়ার হিসেবে, সবচেয়ে পুরোনোটা আগে।';

  @override
  String get onboardingPrivacyTitle => 'কিছুই আপনার ফোনের বাইরে যায় না';

  @override
  String get onboardingPrivacyBody =>
      'কোনো অ্যাকাউন্ট নেই, সার্ভার নেই, অ্যানালিটিক্স নেই। Been Here ডিভাইসেই আপনার ছবির লাইব্রেরি পড়ে এবং তার পাশে একটি ছোট ইনডেক্স রাখে। আপনার ছবি, আর সেগুলো কোথায় তোলা, যেখানে আছে সেখানেই থাকে।';

  @override
  String get onboardingPrivacyFootnote =>
      'দুটি জিনিস নেটওয়ার্কে পৌঁছাতে পারে, আর দুটিই বন্ধ থাকে যতক্ষণ না আপনি চালু করেন: জায়গার নাম আর মানচিত্র।';

  @override
  String get onboardingPhotosTitle => 'এর আপনার ছবি দরকার';

  @override
  String get onboardingPhotosBody =>
      'Been Here লিখে রাখে কোন ছবি কোথায় তোলা। এটি কখনো কিছু কপি বা সরায় না — শুধু আইডি আর স্থানাঙ্ক মনে রাখে, এবং ছবিগুলো কেবল আপনাকে দেখানোর সময় পড়ে।';

  @override
  String get onboardingPhotosAction => 'ছবির অনুমতি দিন';

  @override
  String get onboardingDone => 'শুরু করুন';

  @override
  String get settingsAboutTitle => 'সম্পর্কে';

  @override
  String settingsVersion(String version, String build) {
    return 'সংস্করণ $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'সোর্স কোড';

  @override
  String get settingsShowIntro => 'পরিচিতি আবার দেখান';

  @override
  String photoSemanticLabel(String date) {
    return '$date-এর ছবি';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return '$totalটির মধ্যে ছবি $index, $date';
  }

  @override
  String get placesActionsLabel => 'এই জায়গা নিয়ে কী করবেন';

  @override
  String get radiusSemanticLabel => 'খোঁজার পরিসর';

  @override
  String get hereMapTitle => 'আশেপাশে';

  @override
  String get hereOpenInMaps => 'ম্যাপে খুলুন';

  @override
  String get hereBackToMe => 'আমার জায়গায় ফিরুন';

  @override
  String get herePlaceFallbackTitle => 'আপনার চেনা একটি জায়গা';

  @override
  String get arrivalTestNearHome => 'বাড়ির এত কাছে যে খবর হয় না।';

  @override
  String get settingsHomeRadiusTitle => 'এই দূরত্বের মধ্যে চুপ থাকুন';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: 'বাড়ি থেকে $km কিমি',
      zero: 'কোনো দূরত্ব নয় — কখনো চুপ নয়',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'রোজকার জীবন বাড়ির কাছেই কাটে, আর সেখানেই তা নিয়ে মন্তব্য করা ফোন সবচেয়ে কম কাম্য। এর চেয়ে কাছের জায়গায় কখনো নজর রাখা হয় না।';

  @override
  String get settingsQuietTitle => 'কেন চুপচাপ';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি জায়গায় নজর রাখা হচ্ছে',
      zero: 'কোনো জায়গায় নজর নেই',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'নজরে থাকা সবচেয়ে কাছের জায়গা: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'কিছুতেই নজর রাখা হচ্ছে না, তাই কোনো পৌঁছানোর বার্তা আসতে পারে না।';

  @override
  String settingsQuietLastNotified(String when) {
    return 'শেষ নোটিফিকেশন: $when';
  }

  @override
  String get settingsQuietNever => 'কখনো না';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return '$totalটি জায়গার মধ্যে: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$countটি মিউট';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$countটি বাড়ির কাছে';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$countটিতে খুব কম ছবি';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$countটিতে সম্প্রতি ছবি তোলা';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$countটি এখনো বিরতিতে';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$countটি নজর রাখার মতো';
  }

  @override
  String get ageSemanticLabel => 'ছবির বয়স';

  @override
  String get ageStopNow => 'এখন';

  @override
  String get ageStopDay => '১ দিন';

  @override
  String get ageStop3Days => '৩ দিন';

  @override
  String get ageStopWeek => '১ সপ্তাহ';

  @override
  String get ageStop2Weeks => '২ সপ্তাহ';

  @override
  String get ageStopMonth => '১ মাস';

  @override
  String get ageStop3Months => '৩ মাস';

  @override
  String get ageStop6Months => '৬ মাস';

  @override
  String get ageStopYear => '১ বছর';

  @override
  String get ageStop2Years => '২ বছর';

  @override
  String get ageStop5Years => '৫ বছর';

  @override
  String get ageStop10Years => '১০ বছর';

  @override
  String get ageStopAll => 'সব';

  @override
  String get ageWindowAll => 'সব ছবি';

  @override
  String ageWindowNewerThan(String stop) {
    return '$stop পর্যন্ত';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return '$stop-এর বেশি পুরোনো';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest থেকে $oldest';
  }

  @override
  String get ageWindowReset => 'রিসেট';

  @override
  String mapDotCountCapped(int count) {
    return '$count+টি ছবি';
  }
}
