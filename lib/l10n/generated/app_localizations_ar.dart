// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'هنا';

  @override
  String get placesTabLabel => 'الأماكن';

  @override
  String get settingsTabLabel => 'الإعدادات';

  @override
  String get hereEmptyTitle => 'لم تلتقط صورًا هنا';

  @override
  String get hereEmptyBody => 'وسّع نطاق البحث، أو عُد إلى مكان سبق أن زرته.';

  @override
  String get hereNotIndexedTitle => 'لم تتم فهرسة أي شيء بعد';

  @override
  String get hereNotIndexedBody =>
      'يحتاج Been Here إلى قراءة مكتبة صورك مرة واحدة ليعرف أين كنت. لا يغادر أي شيء هاتفك.';

  @override
  String get indexStartAction => 'فهرسة صوري';

  @override
  String get indexPermissionTitle => 'يحتاج Been Here إلى صورك';

  @override
  String get indexPermissionBody =>
      'يقرأ فقط مكان وزمان التقاط كل صورة، ويحتفظ بذلك على هذا الهاتف.';

  @override
  String get indexPermissionAction => 'السماح بالوصول';

  @override
  String get indexPermissionDeniedTitle => 'الوصول إلى الصور متوقف';

  @override
  String get indexPermissionDeniedBody =>
      'لا يستطيع Been Here أن يعرض لك شيئًا بدونه. يمكنك تفعيله من إعدادات النظام.';

  @override
  String get indexLimitedAccessNotice =>
      'شاركت صورًا محددة فقط، لذا لا يرى Been Here سواها. السماح بالوصول الكامل يتيح له العثور على كل مكان زرته.';

  @override
  String get indexRunningTitle => 'جارٍ قراءة مكتبة صورك';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed من $total';
  }

  @override
  String get indexFailedTitle => 'توقفت الفهرسة';

  @override
  String get indexFailedBody =>
      'حدث خطأ في منتصف الطريق. ستستأنف المحاولة التالية من حيث توقفت.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تمت فهرسة $count صورة',
      many: 'تمت فهرسة $count صورة',
      few: 'تمت فهرسة $count صور',
      two: 'تمت فهرسة صورتين',
      one: 'تمت فهرسة صورة واحدة',
      zero: 'لا توجد صور مفهرسة',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent٪ منها تحمل موقعًا';
  }

  @override
  String get commonLoading => 'جارٍ التحميل…';

  @override
  String get commonRetry => 'إعادة المحاولة';

  @override
  String get commonCancel => 'إلغاء';

  @override
  String hereRadiusLabel(String radius) {
    return 'ضمن $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صورة',
      many: '$count صورة',
      few: '$count صور',
      two: 'صورتان',
      one: 'صورة واحدة',
      zero: 'لا توجد صور',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count زيارة',
      many: '$count زيارة',
      few: '$count زيارات',
      two: 'زيارتان',
      one: 'زيارة واحدة',
      zero: 'لا زيارات',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters م';
  }

  @override
  String distanceKilometers(String km) {
    return '$km كم';
  }

  @override
  String get ageToday => 'اليوم';

  @override
  String get ageYesterday => 'أمس';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'قبل $days يوم',
      many: 'قبل $days يومًا',
      few: 'قبل $days أيام',
      two: 'قبل يومين',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: 'قبل $months شهر',
      many: 'قبل $months شهرًا',
      few: 'قبل $months أشهر',
      two: 'قبل شهرين',
      one: 'قبل شهر',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: 'قبل $years سنة',
      many: 'قبل $years سنة',
      few: 'قبل $years سنوات',
      two: 'قبل سنتين',
      one: 'قبل سنة',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'أين أنت؟';

  @override
  String get locationPermissionBody =>
      'يقارن Been Here موقعك بالأماكن التي التُقطت فيها صورك. تتم المقارنة على هذا الهاتف.';

  @override
  String get locationPermissionAction => 'استخدام موقعي';

  @override
  String get locationDeniedTitle => 'الموقع متوقف';

  @override
  String get locationDeniedBody =>
      'بدونه لا يعرف التطبيق ما لديك هنا. يمكنك تفعيله من إعدادات النظام.';

  @override
  String get locationUnavailableTitle => 'لم يُحدَّد الموقع بعد';

  @override
  String get locationUnavailableBody =>
      'لم يحدد هاتفك مكانه بعد. قد يستغرق ذلك لحظة في الأماكن المغلقة.';

  @override
  String get locationServicesDisabledTitle => 'خدمات الموقع متوقفة';

  @override
  String get locationServicesDisabledBody => 'فعّلها من إعدادات النظام ثم عُد.';

  @override
  String get hereNothingTitle => 'لم تلتقط صورًا هنا';

  @override
  String get hereNothingBody =>
      'جرّب نطاقًا أوسع، أو عُد إلى مكان سبق أن زرته.';

  @override
  String hereNearestHint(String distance) {
    return 'أقرب ذكرى لك على بُعد $distance.';
  }

  @override
  String get photoDetailRephoto => 'إعادة التصوير';

  @override
  String get photoDetailRephotoSoon => 'ستتوفر إعادة التصوير في إصدار لاحق.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index من $total';
  }

  @override
  String get debugLocationTitle => 'موقع التصحيح';

  @override
  String get debugLocationBody =>
      'تظاهر بأنك في مكان آخر، لتختبر شاشة «هنا» وأنت على الأريكة.';

  @override
  String get debugLocationLatitude => 'خط العرض';

  @override
  String get debugLocationLongitude => 'خط الطول';

  @override
  String get debugLocationApply => 'اذهب إلى هناك';

  @override
  String get debugLocationClear => 'استخدام الموقع الحقيقي';

  @override
  String get debugLocationActive => 'موقع التصحيح مفعّل';

  @override
  String get commonClose => 'إغلاق';

  @override
  String get placesEmptyTitle => 'لا توجد أماكن بعد';

  @override
  String get placesEmptyBody => 'تظهر الأماكن بعد فهرسة صورك.';

  @override
  String get placesSortLabel => 'الترتيب حسب';

  @override
  String get placesSortLongestAgo => 'الأقدم زيارة';

  @override
  String get placesSortMostPhotos => 'الأكثر صورًا';

  @override
  String get placesSortNearest => 'الأقرب';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مكان مكتوم',
      many: '$count مكانًا مكتومًا',
      few: '$count أماكن مكتومة',
      two: 'مكانان مكتومان',
      one: 'مكان مكتوم واحد',
      zero: 'لا أماكن مكتومة',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'كتم';

  @override
  String get placesUnmute => 'إلغاء الكتم';

  @override
  String get placesUseAutoRule => 'القرار تلقائيًا';

  @override
  String get placesAutoMutedNote => 'مكتوم تلقائيًا — أنت هنا معظم الأيام';

  @override
  String get placesUserMutedNote => 'كتمته أنت';

  @override
  String get placesUserUnmutedNote => 'أبقيته ظاهرًا أنت';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days يوم',
      many: '$days يومًا',
      few: '$days أيام',
      two: 'يومان',
      one: 'يوم واحد',
      zero: 'لا أيام',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'تسمية الأماكن';

  @override
  String get settingsPlaceNamesBody =>
      'يطلب من النظام تحويل إحداثيات المكان إلى اسم. تُرسل هذه الإحداثيات إلى Apple أو Google — وهي الشيء الوحيد في هذا التطبيق الذي يغادر هاتفك. متوقف افتراضيًا؛ وإيقافه مجددًا يمحو كل الأسماء.';

  @override
  String get settingsAutoMuteTitle => 'كتم الأماكن اليومية بعد';

  @override
  String get settingsAutoMuteBody =>
      'المكان الذي فيه صور من هذا العدد من الأيام المختلفة هو مكان تعيش فيه، لا مكان تزوره.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days يوم',
      many: '$days يومًا',
      few: '$days أيام',
      two: 'يومين',
      one: 'يوم واحد',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'فهرس الصور';

  @override
  String get settingsReindex => 'إعادة الفهرسة من البداية';

  @override
  String get settingsPrivacyTitle => 'ما يبقى على هذا الهاتف';

  @override
  String get settingsPrivacyBody =>
      'صورك، وأماكن التقاطها، وكل ما يستنتجه هذا التطبيق منها. لا حساب ولا خادم ولا تحليلات.';

  @override
  String get placesName => 'تسمية هذا المكان';

  @override
  String get placesRename => 'إعادة التسمية';

  @override
  String get placesNameDialogTitle => 'اسم المكان';

  @override
  String get placesNameHint => 'بيت الجدة، البحيرة، المكتب…';

  @override
  String get placesNameSave => 'حفظ';

  @override
  String get placesNameClear => 'إزالة الاسم';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'سبق أن كنت هنا';

  @override
  String notificationBody(String age, String photos) {
    return 'آخر مرة كنت هنا: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'دع Been Here ينتبه نيابة عنك';

  @override
  String get alwaysLocationBody =>
      'مع الموقع في الخلفية، يستطيع هاتفك إبلاغ Been Here عندما تصل إلى مكان سبق أن صوّرته — ويمكن للتطبيق أن يخبرك بذلك مرة واحدة، دون أن تفتح أي شيء.\n\nالتطبيق لا يتتبعك أبدًا. يراقب هاتفك عددًا قليلًا من الدوائر ولا يوقظ التطبيق إلا عندما تدخل إحداها. لا يغادر هذا الجهاز أي شيء عن مكان وجودك.';

  @override
  String get alwaysLocationAction => 'تفعيل الوصول';

  @override
  String get alwaysLocationLater => 'ليس الآن';

  @override
  String get alwaysLocationDeniedBody =>
      'الموقع في الخلفية متوقف، لذا تبقى تنبيهات الوصول صامتة. كل شيء آخر يعمل كما كان؛ يمكنك تفعيله من إعدادات النظام متى شئت.';

  @override
  String get settingsArrivalsTitle => 'الوصول';

  @override
  String get settingsArrivalsOn =>
      'سيخبرك Been Here عندما تصل إلى مكان لم تصوّره منذ مدة.';

  @override
  String get settingsArrivalsOff =>
      'يبقى Been Here صامتًا. تفعيل هذا يطلب الموقع في الخلفية.';

  @override
  String get settingsMemoryAgeTitle => 'لا تذكر إلا الأماكن الأقدم من';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days يوم',
      many: '$days يومًا',
      few: '$days أيام',
      two: 'يومين',
      one: 'يوم واحد',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => 'ثم أبقِ ذلك المكان هادئًا لمدة';

  @override
  String get settingsDailyLimitTitle => 'ولا تقل شيئًا على الإطلاق لمدة';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ساعة',
      many: '$hours ساعة',
      few: '$hours ساعات',
      two: 'ساعتين',
      one: 'ساعة واحدة',
      zero: 'لا وقت',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'خفّض هذه القيم لتجربة تنبيهات الوصول دون انتظار نصف عام.';

  @override
  String get placesTestArrival => 'اختبار وصول هنا';

  @override
  String get arrivalTestNotified => 'تم إرسال الإشعار';

  @override
  String get arrivalTestMuted => 'لا شيء: المكان مكتوم';

  @override
  String get arrivalTestTooFewPhotos => 'لا شيء: الصور هنا قليلة جدًا';

  @override
  String get arrivalTestTooRecent => 'لا شيء: صوّرت هنا منذ وقت قريب جدًا';

  @override
  String get arrivalTestPlaceCooldown => 'لا شيء: هذا المكان نبّه مؤخرًا';

  @override
  String get arrivalTestDailyLimit => 'لا شيء: شيء آخر نبّه اليوم';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'أبقى هاتفك الموقع على «أثناء استخدام التطبيق». لن يعرض iOS هذا الخيار مجددًا من داخل التطبيق، لذا يجب تغيير الموقع في الخلفية إلى «دائمًا» من إعدادات النظام — وعندها تبدأ تنبيهات الوصول بالعمل.';

  @override
  String get commonOpenSettings => 'فتح الإعدادات';

  @override
  String get settingsArrivalsPending =>
      'تقريبًا: الموقع ما زال على «أثناء استخدام التطبيق». غيّره إلى «دائمًا» من إعدادات النظام.';

  @override
  String get placesSortVisits => 'الأكثر زيارة';

  @override
  String get placesSortAscending => 'ترتيب معكوس';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count زيارة',
      many: '$count زيارة',
      few: '$count زيارات',
      two: 'زيارتان',
      one: 'زيارة واحدة',
      zero: 'أبدًا',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'عرض الأماكن على خريطة';

  @override
  String get settingsMapBody =>
      'تُنزَّل مربعات الخريطة من OpenStreetMap أثناء التحريك والتكبير، لذا يرى ذلك الخادم باستمرار إلى أين تنظر. على عكس اسم المكان الذي يُطلب مرة واحدة، يستمر هذا ما دامت الخريطة مفتوحة. متوقف افتراضيًا.';

  @override
  String get placesShowMap => 'الخريطة';

  @override
  String get placesShowList => 'القائمة';

  @override
  String get placesMapAttribution => '© المساهمون في OpenStreetMap';

  @override
  String get rephotoOverlay => 'تلاشٍ';

  @override
  String get rephotoEdges => 'الحواف';

  @override
  String get rephotoCapture => 'التقطها';

  @override
  String get rephotoSaved => 'تم الحفظ في صورك';

  @override
  String get rephotoNotSaved => 'تعذّر الحفظ. قد تكون إضافة الصور متوقفة.';

  @override
  String get rephotoNoCamera =>
      'لا تتوفر كاميرا. يحتاج Been Here إلى الكاميرا لالتقاط صورة تجيب عن صورة قديمة.';

  @override
  String get rephotoThenAndNow => 'حينها والآن';

  @override
  String get rephotoShare => 'مشاركة';

  @override
  String get rephotoThen => 'حينها';

  @override
  String get rephotoNow => 'الآن';

  @override
  String get rephotoShareFailed => 'تعذّر إنشاء الصورة للمشاركة.';

  @override
  String get onboardingSkip => 'تخطٍّ';

  @override
  String get onboardingNext => 'التالي';

  @override
  String get onboardingWhatTitle => 'صور من البقعة التي تقف عليها';

  @override
  String get onboardingWhatBody =>
      'صِل إلى مكان سبق أن صوّرته وسيعرض لك Been Here ما التقطته هناك — زيارة بعد زيارة، الأقدم أولًا.';

  @override
  String get onboardingPrivacyTitle => 'لا شيء يغادر هاتفك';

  @override
  String get onboardingPrivacyBody =>
      'لا حساب ولا خادم ولا تحليلات. يقرأ Been Here مكتبة صورك على الجهاز ويحتفظ بجانبها بفهرس صغير. صورك وأماكن التقاطها تبقى حيث هي.';

  @override
  String get onboardingPrivacyFootnote =>
      'شيئان فقط قد يصلان إلى الشبكة، وكلاهما متوقف حتى تفعّله: أسماء الأماكن والخريطة.';

  @override
  String get onboardingPhotosTitle => 'يحتاج إلى صورك';

  @override
  String get onboardingPhotosBody =>
      'يدوّن Been Here أي صورة التُقطت في أي مكان. لا ينسخ أي شيء ولا ينقله أبدًا — يتذكر المعرّفات والإحداثيات، ولا يقرأ الصور نفسها إلا عند عرضها عليك.';

  @override
  String get onboardingPhotosAction => 'السماح بالصور';

  @override
  String get onboardingDone => 'ابدأ';

  @override
  String get settingsAboutTitle => 'حول';

  @override
  String settingsVersion(String version, String build) {
    return 'الإصدار $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'الشيفرة المصدرية';

  @override
  String get settingsShowIntro => 'عرض المقدمة مرة أخرى';

  @override
  String photoSemanticLabel(String date) {
    return 'صورة من $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'الصورة $index من $total، $date';
  }

  @override
  String get placesActionsLabel => 'ماذا تفعل بهذا المكان';

  @override
  String get radiusSemanticLabel => 'نطاق البحث';

  @override
  String get hereMapTitle => 'بالقرب من هنا';

  @override
  String get hereOpenInMaps => 'فتح في الخرائط';

  @override
  String get hereBackToMe => 'العودة إلى موقعي';

  @override
  String get herePlaceFallbackTitle => 'مكان تعرفه';

  @override
  String get arrivalTestNearHome => 'قريب جدًا من البيت ليكون خبرًا.';

  @override
  String get settingsHomeRadiusTitle => 'التزم الصمت ضمن';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km كم من البيت',
      many: '$km كم من البيت',
      few: '$km كم من البيت',
      two: 'كيلومترين من البيت',
      one: 'كيلومتر واحد من البيت',
      zero: 'بلا مسافة — لا صمت أبدًا',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'الحياة اليومية تجري قرب البيت، وهناك بالذات يكون الهاتف الذي يعلّق عليها أقل ترحيبًا. الأماكن الأقرب من ذلك لا تُراقَب أبدًا.';

  @override
  String get settingsQuietTitle => 'لماذا الهدوء';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'يراقب $count مكان',
      many: 'يراقب $count مكانًا',
      few: 'يراقب $count أماكن',
      two: 'يراقب مكانين',
      one: 'يراقب مكانًا واحدًا',
      zero: 'لا يراقب أي مكان',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'أقرب مكان مراقَب: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'لا شيء مراقَب، لذا لا يمكن أن يحدث أي وصول.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'آخر إشعار: $when';
  }

  @override
  String get settingsQuietNever => 'أبدًا';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'من أصل $total مكان: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return 'مكتومة: $count';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return 'قرب البيت: $count';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return 'صورها قليلة: $count';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return 'صُوّرت مؤخرًا: $count';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return 'ما زالت في فترة تهدئة: $count';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return 'تستحق المراقبة: $count';
  }

  @override
  String get ageSemanticLabel => 'عمر الصور';

  @override
  String get ageStopNow => 'الآن';

  @override
  String get ageStopDay => 'يوم';

  @override
  String get ageStop3Days => '3 أيام';

  @override
  String get ageStopWeek => 'أسبوع';

  @override
  String get ageStop2Weeks => 'أسبوعان';

  @override
  String get ageStopMonth => 'شهر';

  @override
  String get ageStop3Months => '3 أشهر';

  @override
  String get ageStop6Months => '6 أشهر';

  @override
  String get ageStopYear => 'سنة';

  @override
  String get ageStop2Years => 'سنتان';

  @override
  String get ageStop5Years => '5 سنوات';

  @override
  String get ageStop10Years => '10 سنوات';

  @override
  String get ageStopAll => 'الكل';

  @override
  String get ageWindowAll => 'كل الصور';

  @override
  String ageWindowNewerThan(String stop) {
    return 'حتى $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'أقدم من $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return 'من $newest إلى $oldest';
  }

  @override
  String get ageWindowReset => 'إعادة الضبط';

  @override
  String mapDotCountCapped(int count) {
    return '+$count صورة';
  }
}
