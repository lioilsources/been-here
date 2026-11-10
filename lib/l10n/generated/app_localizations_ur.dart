// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'یہاں';

  @override
  String get placesTabLabel => 'مقامات';

  @override
  String get settingsTabLabel => 'ترتیبات';

  @override
  String get hereEmptyTitle => 'آپ نے یہاں تصویریں نہیں لیں';

  @override
  String get hereEmptyBody =>
      'تلاش کا دائرہ بڑھائیں، یا کسی ایسی جگہ واپس جائیں جہاں آپ پہلے جا چکے ہیں۔';

  @override
  String get hereNotIndexedTitle => 'ابھی کچھ انڈیکس نہیں ہوا';

  @override
  String get hereNotIndexedBody =>
      'Been Here کو یہ جاننے کے لیے کہ آپ کہاں کہاں گئے ہیں، آپ کی فوٹو لائبریری ایک بار پڑھنی ہوگی۔ کچھ بھی آپ کے فون سے باہر نہیں جاتا۔';

  @override
  String get indexStartAction => 'میری تصویریں انڈیکس کریں';

  @override
  String get indexPermissionTitle => 'Been Here کو آپ کی تصویریں درکار ہیں';

  @override
  String get indexPermissionBody =>
      'یہ صرف یہ پڑھتا ہے کہ ہر تصویر کہاں اور کب لی گئی، اور یہ معلومات اسی فون پر رکھتا ہے۔';

  @override
  String get indexPermissionAction => 'رسائی کی اجازت دیں';

  @override
  String get indexPermissionDeniedTitle => 'تصویروں تک رسائی بند ہے';

  @override
  String get indexPermissionDeniedBody =>
      'اس کے بغیر Been Here آپ کو کچھ نہیں دکھا سکتا۔ آپ اسے سسٹم کی ترتیبات میں آن کر سکتے ہیں۔';

  @override
  String get indexLimitedAccessNotice =>
      'آپ نے صرف منتخب تصویریں شیئر کی ہیں، اس لیے Been Here صرف وہی دیکھ سکتا ہے۔ مکمل رسائی سے یہ ہر وہ جگہ ڈھونڈ سکتا ہے جہاں آپ گئے ہیں۔';

  @override
  String get indexRunningTitle => 'آپ کی فوٹو لائبریری پڑھی جا رہی ہے';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$total میں سے $processed';
  }

  @override
  String get indexFailedTitle => 'انڈیکسنگ رک گئی';

  @override
  String get indexFailedBody =>
      'درمیان میں کچھ گڑبڑ ہو گئی۔ دوبارہ کوشش وہیں سے جاری رہے گی جہاں رکی تھی۔';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تصویریں انڈیکس ہوئیں',
      one: '$count تصویر انڈیکس ہوئی',
      zero: 'کوئی تصویر انڈیکس نہیں ہوئی',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return 'ان میں سے $percent% میں مقام موجود ہے';
  }

  @override
  String get commonLoading => 'لوڈ ہو رہا ہے…';

  @override
  String get commonRetry => 'دوبارہ کوشش کریں';

  @override
  String get commonCancel => 'منسوخ کریں';

  @override
  String hereRadiusLabel(String radius) {
    return '$radius کے اندر';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تصویریں',
      one: '$count تصویر',
      zero: 'کوئی تصویر نہیں',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دورے',
      one: '$count دورہ',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters میٹر';
  }

  @override
  String distanceKilometers(String km) {
    return '$km کلومیٹر';
  }

  @override
  String get ageToday => 'آج';

  @override
  String get ageYesterday => 'کل';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days دن پہلے',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months مہینے پہلے',
      one: 'ایک مہینہ پہلے',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years سال پہلے',
      one: 'ایک سال پہلے',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'آپ کہاں ہیں؟';

  @override
  String get locationPermissionBody =>
      'Been Here آپ کے مقام کا موازنہ ان جگہوں سے کرتا ہے جہاں آپ کی تصویریں لی گئیں۔ یہ موازنہ اسی فون پر ہوتا ہے۔';

  @override
  String get locationPermissionAction => 'میرا مقام استعمال کریں';

  @override
  String get locationDeniedTitle => 'مقام بند ہے';

  @override
  String get locationDeniedBody =>
      'اس کے بغیر ایپ نہیں جان سکتی کہ یہاں آپ کے پاس کیا ہے۔ آپ اسے سسٹم کی ترتیبات میں آن کر سکتے ہیں۔';

  @override
  String get locationUnavailableTitle => 'ابھی مقام معلوم نہیں';

  @override
  String get locationUnavailableBody =>
      'آپ کے فون کو ابھی پتا نہیں چلا کہ وہ کہاں ہے۔ عمارت کے اندر اس میں کچھ وقت لگ سکتا ہے۔';

  @override
  String get locationServicesDisabledTitle => 'لوکیشن سروسز بند ہیں';

  @override
  String get locationServicesDisabledBody =>
      'انہیں سسٹم کی ترتیبات میں آن کریں اور واپس آئیں۔';

  @override
  String get hereNothingTitle => 'آپ نے یہاں تصویریں نہیں لیں';

  @override
  String get hereNothingBody =>
      'بڑا دائرہ آزمائیں، یا کسی ایسی جگہ واپس جائیں جہاں آپ پہلے جا چکے ہیں۔';

  @override
  String hereNearestHint(String distance) {
    return 'آپ کی قریب ترین یاد $distance دور ہے۔';
  }

  @override
  String get photoDetailRephoto => 'دوبارہ تصویر لیں';

  @override
  String get photoDetailRephotoSoon =>
      'دوبارہ تصویر لینے کی سہولت اگلے ورژن میں آئے گی۔';

  @override
  String photoDetailOf(int index, int total) {
    return '$total میں سے $index';
  }

  @override
  String get debugLocationTitle => 'ڈیبگ مقام';

  @override
  String get debugLocationBody =>
      'فرض کریں کہ آپ کہیں اور ہیں، تاکہ یہاں والی اسکرین صوفے پر بیٹھے بیٹھے جانچی جا سکے۔';

  @override
  String get debugLocationLatitude => 'عرض بلد';

  @override
  String get debugLocationLongitude => 'طول بلد';

  @override
  String get debugLocationApply => 'وہاں جائیں';

  @override
  String get debugLocationClear => 'اصل مقام استعمال کریں';

  @override
  String get debugLocationActive => 'ڈیبگ مقام فعال ہے';

  @override
  String get commonClose => 'بند کریں';

  @override
  String get placesEmptyTitle => 'ابھی کوئی مقام نہیں';

  @override
  String get placesEmptyBody =>
      'آپ کی تصویریں انڈیکس ہونے کے بعد مقامات نظر آئیں گے۔';

  @override
  String get placesSortLabel => 'ترتیب';

  @override
  String get placesSortLongestAgo => 'سب سے پرانا';

  @override
  String get placesSortMostPhotos => 'سب سے زیادہ تصویریں';

  @override
  String get placesSortNearest => 'سب سے قریب';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count خاموش مقامات',
      one: '$count خاموش مقام',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'خاموش کریں';

  @override
  String get placesUnmute => 'خاموشی ختم کریں';

  @override
  String get placesUseAutoRule => 'خودکار فیصلہ';

  @override
  String get placesAutoMutedNote =>
      'خودکار طور پر خاموش — آپ یہاں تقریباً روز ہوتے ہیں';

  @override
  String get placesUserMutedNote => 'آپ نے خاموش کیا';

  @override
  String get placesUserUnmutedNote => 'آپ نے نمایاں رکھا';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days دن',
      one: '$days دن',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'مقامات کے نام';

  @override
  String get settingsPlaceNamesBody =>
      'سسٹم سے کہتا ہے کہ کسی مقام کے کوآرڈینیٹس کو نام میں بدلے۔ یہ کوآرڈینیٹ Apple یا Google کو جاتا ہے — اس ایپ میں یہی واحد چیز ہے جو آپ کے فون سے باہر جاتی ہے۔ بطور ڈیفالٹ بند؛ دوبارہ بند کرنے پر تمام نام بھلا دیے جاتے ہیں۔';

  @override
  String get settingsAutoMuteTitle =>
      'روزمرہ کے مقامات کو اتنے دن بعد خاموش کریں';

  @override
  String get settingsAutoMuteBody =>
      'جس جگہ اتنے مختلف دنوں کی تصویریں ہوں وہ آپ کے رہنے کی جگہ ہے، گھومنے کی نہیں۔';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days دن',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'تصویری انڈیکس';

  @override
  String get settingsReindex => 'شروع سے دوبارہ انڈیکس کریں';

  @override
  String get settingsPrivacyTitle => 'اس فون پر کیا رہتا ہے';

  @override
  String get settingsPrivacyBody =>
      'آپ کی تصویریں، وہ کہاں لی گئیں، اور ان سے یہ ایپ جو کچھ اخذ کرتی ہے۔ نہ کوئی اکاؤنٹ، نہ سرور، نہ اینالیٹکس۔';

  @override
  String get placesName => 'اس مقام کا نام رکھیں';

  @override
  String get placesRename => 'نام بدلیں';

  @override
  String get placesNameDialogTitle => 'مقام کا نام';

  @override
  String get placesNameHint => 'نانی کا گھر، جھیل، دفتر…';

  @override
  String get placesNameSave => 'محفوظ کریں';

  @override
  String get placesNameClear => 'نام ہٹائیں';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'آپ یہاں پہلے آ چکے ہیں';

  @override
  String notificationBody(String age, String photos) {
    return 'آخری بار یہاں: $age۔ $photos۔';
  }

  @override
  String get alwaysLocationTitle => 'Been Here کو آپ کی جگہ دھیان رکھنے دیں';

  @override
  String get alwaysLocationBody =>
      'پس منظر کے مقام کے ساتھ، جب آپ کسی ایسی جگہ پہنچیں جس کی پہلے تصویر لی ہو تو آپ کا فون Been Here کو بتا سکتا ہے — اور ایپ آپ کو ایک بار بتا سکتی ہے، بغیر اس کے کہ آپ کچھ کھولیں۔\n\nایپ کبھی آپ کا پیچھا نہیں کرتی۔ آپ کا فون چند دائروں پر نظر رکھتا ہے اور ایپ کو صرف تب جگاتا ہے جب آپ ان میں سے کسی میں داخل ہوں۔ آپ کہاں ہیں، اس بارے میں کچھ بھی اس ڈیوائس سے باہر نہیں جاتا۔';

  @override
  String get alwaysLocationAction => 'آمد کی اطلاع آن کریں';

  @override
  String get alwaysLocationLater => 'ابھی نہیں';

  @override
  String get alwaysLocationDeniedBody =>
      'پس منظر کا مقام بند ہے، اس لیے آمد کی اطلاعات خاموش رہیں گی۔ باقی سب پہلے کی طرح کام کرتا ہے؛ آپ جب چاہیں سسٹم کی ترتیبات میں اسے آن کر سکتے ہیں۔';

  @override
  String get settingsArrivalsTitle => 'آمد';

  @override
  String get settingsArrivalsOn =>
      'جب آپ کسی ایسی جگہ پہنچیں گے جس کی کافی عرصے سے تصویر نہیں لی، Been Here آپ کو بتائے گا۔';

  @override
  String get settingsArrivalsOff =>
      'Been Here خاموش رہتا ہے۔ اسے آن کرنے پر پس منظر کے مقام کی اجازت مانگی جائے گی۔';

  @override
  String get settingsMemoryAgeTitle =>
      'صرف ان مقامات کا ذکر کریں جو اس سے پرانے ہوں';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days دن',
      one: '$days دن',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle =>
      'پھر اس مقام کو اتنی دیر خاموش رکھیں';

  @override
  String get settingsDailyLimitTitle => 'اور اتنی دیر کچھ بھی نہ کہیں';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours گھنٹے',
      one: '$hours گھنٹہ',
      zero: 'بالکل نہیں',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'آدھا سال انتظار کیے بغیر آمد کی اطلاع آزمانے کے لیے یہ قدریں کم کریں۔';

  @override
  String get placesTestArrival => 'یہاں آمد کی جانچ کریں';

  @override
  String get arrivalTestNotified => 'اطلاع بھیج دی گئی';

  @override
  String get arrivalTestMuted => 'کچھ نہیں: مقام خاموش ہے';

  @override
  String get arrivalTestTooFewPhotos => 'کچھ نہیں: یہاں بہت کم تصویریں ہیں';

  @override
  String get arrivalTestTooRecent =>
      'کچھ نہیں: آپ نے حال ہی میں یہاں تصویر لی ہے';

  @override
  String get arrivalTestPlaceCooldown =>
      'کچھ نہیں: یہ مقام حال ہی میں بول چکا ہے';

  @override
  String get arrivalTestDailyLimit => 'کچھ نہیں: آج کوئی اور اطلاع آ چکی ہے';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'آپ کے فون نے مقام کو \"ایپ استعمال کرتے وقت\" پر رکھا ہے۔ iOS ایپ کے اندر سے یہ انتخاب دوبارہ پیش نہیں کرتا، اس لیے پس منظر کا مقام سسٹم کی ترتیبات میں \"ہمیشہ\" پر کرنا ہوگا — پھر آمد کی اطلاعات کام کرنے لگیں گی۔';

  @override
  String get commonOpenSettings => 'ترتیبات کھولیں';

  @override
  String get settingsArrivalsPending =>
      'تقریباً: مقام ابھی بھی \"ایپ استعمال کرتے وقت\" پر ہے۔ اسے سسٹم کی ترتیبات میں \"ہمیشہ\" پر کریں۔';

  @override
  String get placesSortVisits => 'سب سے زیادہ دورے';

  @override
  String get placesSortAscending => 'الٹی ترتیب';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دورے',
      one: '$count دورہ',
      zero: 'کبھی نہیں',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'مقامات نقشے پر دکھائیں';

  @override
  String get settingsMapBody =>
      'نقشے کے ٹائلز OpenStreetMap سے اس وقت ڈاؤن لوڈ ہوتے ہیں جب آپ نقشہ سرکاتے اور زوم کرتے ہیں، اس لیے وہ سرور مسلسل دیکھتا ہے کہ آپ کہاں دیکھ رہے ہیں۔ مقام کے نام کے برعکس، جو ایک بار پوچھا جاتا ہے، یہ تب تک جاری رہتا ہے جب تک نقشہ کھلا ہو۔ بطور ڈیفالٹ بند۔';

  @override
  String get placesShowMap => 'نقشہ';

  @override
  String get placesShowList => 'فہرست';

  @override
  String get placesMapAttribution => '© OpenStreetMap کے معاونین';

  @override
  String get rephotoOverlay => 'مدھم';

  @override
  String get rephotoEdges => 'خاکہ';

  @override
  String get rephotoCapture => 'تصویر لیں';

  @override
  String get rephotoSaved => 'آپ کی تصویروں میں محفوظ ہو گئی';

  @override
  String get rephotoNotSaved =>
      'محفوظ نہیں ہو سکی۔ ممکن ہے تصویریں شامل کرنا بند ہو۔';

  @override
  String get rephotoNoCamera =>
      'کوئی کیمرا دستیاب نہیں۔ کسی پرانی تصویر کا جواب دینے والی تصویر لینے کے لیے Been Here کو کیمرا چاہیے۔';

  @override
  String get rephotoThenAndNow => 'تب اور اب';

  @override
  String get rephotoShare => 'شیئر کریں';

  @override
  String get rephotoThen => 'تب';

  @override
  String get rephotoNow => 'اب';

  @override
  String get rephotoShareFailed => 'شیئر کرنے کے لیے تصویر نہیں بن سکی۔';

  @override
  String get onboardingSkip => 'چھوڑیں';

  @override
  String get onboardingNext => 'اگلا';

  @override
  String get onboardingWhatTitle => 'اسی جگہ کی تصویریں جہاں آپ کھڑے ہیں';

  @override
  String get onboardingWhatBody =>
      'کسی ایسی جگہ پہنچیں جس کی آپ پہلے تصویر لے چکے ہیں اور Been Here آپ کو دکھائے گا کہ آپ نے وہاں کیا کھینچا — ایک ایک دورہ، سب سے پرانا پہلے۔';

  @override
  String get onboardingPrivacyTitle => 'کچھ بھی آپ کے فون سے باہر نہیں جاتا';

  @override
  String get onboardingPrivacyBody =>
      'نہ اکاؤنٹ، نہ سرور، نہ اینالیٹکس۔ Been Here ڈیوائس پر آپ کی فوٹو لائبریری پڑھتا ہے اور ساتھ ایک چھوٹا سا انڈیکس رکھتا ہے۔ آپ کی تصویریں، اور وہ کہاں لی گئیں، اپنی جگہ پر رہتی ہیں۔';

  @override
  String get onboardingPrivacyFootnote =>
      'دو چیزیں نیٹ ورک تک پہنچ سکتی ہیں، اور دونوں تب تک بند ہیں جب تک آپ انہیں آن نہ کریں: مقامات کے نام اور نقشہ۔';

  @override
  String get onboardingPhotosTitle => 'اسے آپ کی تصویریں چاہییں';

  @override
  String get onboardingPhotosBody =>
      'Been Here نوٹ کرتا ہے کہ کون سی تصویر کہاں لی گئی۔ یہ کبھی کچھ کاپی یا منتقل نہیں کرتا — یہ آئی ڈیز اور کوآرڈینیٹس یاد رکھتا ہے، اور تصویریں صرف تب پڑھتا ہے جب آپ کو دکھاتا ہے۔';

  @override
  String get onboardingPhotosAction => 'تصویروں کی اجازت دیں';

  @override
  String get onboardingDone => 'شروع کریں';

  @override
  String get settingsAboutTitle => 'تعارف';

  @override
  String settingsVersion(String version, String build) {
    return 'ورژن $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'سورس کوڈ';

  @override
  String get settingsShowIntro => 'تعارف دوبارہ دکھائیں';

  @override
  String photoSemanticLabel(String date) {
    return '$date کی تصویر';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'تصویر $index از $total، $date';
  }

  @override
  String get placesActionsLabel => 'اس مقام کا کیا کرنا ہے';

  @override
  String get radiusSemanticLabel => 'تلاش کا دائرہ';

  @override
  String get hereMapTitle => 'آس پاس';

  @override
  String get hereOpenInMaps => 'نقشوں میں کھولیں';

  @override
  String get hereBackToMe => 'میری جگہ پر واپس جائیں';

  @override
  String get herePlaceFallbackTitle => 'ایک جانی پہچانی جگہ';

  @override
  String get arrivalTestNearHome => 'گھر کے اتنا قریب ہے کہ خبر نہیں بنتی۔';

  @override
  String get settingsHomeRadiusTitle => 'اتنے فاصلے کے اندر خاموش رہیں';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: 'گھر سے $km کلومیٹر',
      one: 'گھر سے $km کلومیٹر',
      zero: 'کوئی فاصلہ نہیں — کبھی خاموش نہیں',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'روزمرہ زندگی گھر کے قریب گزرتی ہے، اور وہیں اس پر تبصرہ کرنے والا فون سب سے کم پسند کیا جاتا ہے۔ اس سے قریب کے مقامات پر کبھی نظر نہیں رکھی جاتی۔';

  @override
  String get settingsQuietTitle => 'خاموشی کیوں ہے';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مقامات پر نظر ہے',
      one: '$count مقام پر نظر ہے',
      zero: 'کسی مقام پر نظر نہیں',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'قریب ترین زیرِ نظر مقام: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'کسی چیز پر نظر نہیں رکھی جا رہی، اس لیے کوئی آمد نہیں ہو سکتی۔';

  @override
  String settingsQuietLastNotified(String when) {
    return 'آخری اطلاع: $when';
  }

  @override
  String get settingsQuietNever => 'کبھی نہیں';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return '$total مقامات میں سے: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count خاموش';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count گھر کے قریب';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count میں بہت کم تصویریں';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count کی حال ہی میں تصویر لی گئی';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count ابھی وقفے میں';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count نظر رکھنے کے قابل';
  }

  @override
  String get ageSemanticLabel => 'تصویروں کی عمر';

  @override
  String get ageStopNow => 'اب';

  @override
  String get ageStopDay => '1 دن';

  @override
  String get ageStop3Days => '3 دن';

  @override
  String get ageStopWeek => '1 ہفتہ';

  @override
  String get ageStop2Weeks => '2 ہفتے';

  @override
  String get ageStopMonth => '1 مہینہ';

  @override
  String get ageStop3Months => '3 مہینے';

  @override
  String get ageStop6Months => '6 مہینے';

  @override
  String get ageStopYear => '1 سال';

  @override
  String get ageStop2Years => '2 سال';

  @override
  String get ageStop5Years => '5 سال';

  @override
  String get ageStop10Years => '10 سال';

  @override
  String get ageStopAll => 'سب';

  @override
  String get ageWindowAll => 'تمام تصویریں';

  @override
  String ageWindowNewerThan(String stop) {
    return '$stop تک';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return '$stop سے پرانی';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest سے $oldest تک';
  }

  @override
  String get ageWindowReset => 'ری سیٹ کریں';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ تصویریں';
  }
}
