// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'כאן';

  @override
  String get placesTabLabel => 'מקומות';

  @override
  String get settingsTabLabel => 'הגדרות';

  @override
  String get hereEmptyTitle => 'לא צילמת כאן';

  @override
  String get hereEmptyBody =>
      'הרחב את רדיוס החיפוש, או חזור למקום שכבר היית בו.';

  @override
  String get hereNotIndexedTitle => 'עדיין לא נוצר אינדקס';

  @override
  String get hereNotIndexedBody =>
      'Been Here צריך לקרוא את ספריית התמונות שלך פעם אחת כדי לדעת איפה היית. שום דבר לא יוצא מהטלפון שלך.';

  @override
  String get indexStartAction => 'יצירת אינדקס לתמונות שלי';

  @override
  String get indexPermissionTitle => 'Been Here צריך את התמונות שלך';

  @override
  String get indexPermissionBody =>
      'הוא קורא רק איפה ומתי צולמה כל תמונה, ושומר את זה בטלפון הזה.';

  @override
  String get indexPermissionAction => 'מתן גישה';

  @override
  String get indexPermissionDeniedTitle => 'הגישה לתמונות כבויה';

  @override
  String get indexPermissionDeniedBody =>
      'בלי גישה, Been Here לא יכול להראות לך כלום. אפשר להפעיל אותה בהגדרות המערכת.';

  @override
  String get indexLimitedAccessNotice =>
      'שיתפת רק תמונות נבחרות, אז Been Here רואה רק אותן. גישה מלאה תאפשר לו למצוא כל מקום שהיית בו.';

  @override
  String get indexRunningTitle => 'קורא את ספריית התמונות שלך';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed מתוך $total';
  }

  @override
  String get indexFailedTitle => 'יצירת האינדקס נעצרה';

  @override
  String get indexFailedBody =>
      'משהו השתבש באמצע. ניסיון חוזר ימשיך מהמקום שבו נעצר.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count תמונות באינדקס',
      two: 'שתי תמונות באינדקס',
      one: 'תמונה אחת באינדקס',
      zero: 'אין תמונות באינדקס',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return 'ל־$percent% מהן יש מיקום';
  }

  @override
  String get commonLoading => 'טוען…';

  @override
  String get commonRetry => 'לנסות שוב';

  @override
  String get commonCancel => 'ביטול';

  @override
  String hereRadiusLabel(String radius) {
    return 'בטווח $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count תמונות',
      two: 'שתי תמונות',
      one: 'תמונה אחת',
      zero: 'אין תמונות',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ביקורים',
      two: 'שני ביקורים',
      one: 'ביקור אחד',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters מ׳';
  }

  @override
  String distanceKilometers(String km) {
    return '$km ק״מ';
  }

  @override
  String get ageToday => 'היום';

  @override
  String get ageYesterday => 'אתמול';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'לפני $days ימים',
      two: 'לפני יומיים',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: 'לפני $months חודשים',
      two: 'לפני חודשיים',
      one: 'לפני חודש',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: 'לפני $years שנים',
      two: 'לפני שנתיים',
      one: 'לפני שנה',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'איפה אתה?';

  @override
  String get locationPermissionBody =>
      'Been Here משווה את המיקום שלך למקומות שבהם צולמו התמונות שלך. ההשוואה מתבצעת בטלפון הזה.';

  @override
  String get locationPermissionAction => 'שימוש במיקום שלי';

  @override
  String get locationDeniedTitle => 'המיקום כבוי';

  @override
  String get locationDeniedBody =>
      'בלי מיקום, האפליקציה לא יודעת מה יש לך כאן. אפשר להפעיל אותו בהגדרות המערכת.';

  @override
  String get locationUnavailableTitle => 'עדיין אין מיקום';

  @override
  String get locationUnavailableBody =>
      'הטלפון עדיין לא הבין איפה הוא. בתוך מבנה זה יכול לקחת רגע.';

  @override
  String get locationServicesDisabledTitle => 'שירותי המיקום כבויים';

  @override
  String get locationServicesDisabledBody => 'הפעל אותם בהגדרות המערכת וחזור.';

  @override
  String get hereNothingTitle => 'לא צילמת כאן';

  @override
  String get hereNothingBody =>
      'נסה רדיוס רחב יותר, או חזור למקום שכבר היית בו.';

  @override
  String hereNearestHint(String distance) {
    return 'הזיכרון הקרוב ביותר שלך נמצא במרחק $distance.';
  }

  @override
  String get photoDetailRephoto => 'צילום מחדש';

  @override
  String get photoDetailRephotoSoon => 'צילום מחדש יגיע בגרסה מאוחרת יותר.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index מתוך $total';
  }

  @override
  String get debugLocationTitle => 'מיקום לבדיקה';

  @override
  String get debugLocationBody =>
      'העמד פנים שאתה במקום אחר, כדי לבדוק את מסך ״כאן״ מהספה.';

  @override
  String get debugLocationLatitude => 'קו רוחב';

  @override
  String get debugLocationLongitude => 'קו אורך';

  @override
  String get debugLocationApply => 'לעבור לשם';

  @override
  String get debugLocationClear => 'שימוש במיקום האמיתי';

  @override
  String get debugLocationActive => 'מיקום לבדיקה פעיל';

  @override
  String get commonClose => 'סגירה';

  @override
  String get placesEmptyTitle => 'עדיין אין מקומות';

  @override
  String get placesEmptyBody =>
      'מקומות יופיעו אחרי שייווצר אינדקס לתמונות שלך.';

  @override
  String get placesSortLabel => 'מיון לפי';

  @override
  String get placesSortLongestAgo => 'הכי מזמן';

  @override
  String get placesSortMostPhotos => 'הכי הרבה תמונות';

  @override
  String get placesSortNearest => 'הכי קרוב';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count מקומות מושתקים',
      two: 'שני מקומות מושתקים',
      one: 'מקום מושתק אחד',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'השתקה';

  @override
  String get placesUnmute => 'ביטול השתקה';

  @override
  String get placesUseAutoRule => 'החלטה אוטומטית';

  @override
  String get placesAutoMutedNote => 'הושתק אוטומטית — אתה כאן כמעט כל יום';

  @override
  String get placesUserMutedNote => 'הושתק על ידך';

  @override
  String get placesUserUnmutedNote => 'נשאר גלוי לבחירתך';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ימים',
      two: 'יומיים',
      one: 'יום אחד',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'מתן שמות למקומות';

  @override
  String get settingsPlaceNamesBody =>
      'מבקש מהמערכת להפוך את הקואורדינטות של מקום לשם. הקואורדינטה נשלחת ל־Apple או ל־Google — זה הדבר היחיד באפליקציה שיוצא מהטלפון שלך. כבוי כברירת מחדל; כיבוי מחדש מוחק את כל השמות.';

  @override
  String get settingsAutoMuteTitle => 'השתקת מקומות יומיומיים אחרי';

  @override
  String get settingsAutoMuteBody =>
      'מקום עם תמונות מכל כך הרבה ימים שונים הוא מקום שבו אתה גר, לא מקום שאתה מבקר בו.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ימים',
      two: 'יומיים',
      one: 'יום אחד',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'אינדקס תמונות';

  @override
  String get settingsReindex => 'יצירת אינדקס מחדש מההתחלה';

  @override
  String get settingsPrivacyTitle => 'מה נשאר בטלפון הזה';

  @override
  String get settingsPrivacyBody =>
      'התמונות שלך, איפה הן צולמו, וכל מה שהאפליקציה מסיקה מהן. אין חשבון, אין שרת ואין אנליטיקה.';

  @override
  String get placesName => 'מתן שם למקום הזה';

  @override
  String get placesRename => 'שינוי שם';

  @override
  String get placesNameDialogTitle => 'שם המקום';

  @override
  String get placesNameHint => 'אצל סבתא, האגם, המשרד…';

  @override
  String get placesNameSave => 'שמירה';

  @override
  String get placesNameClear => 'הסרת השם';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'כבר היית כאן';

  @override
  String notificationBody(String age, String photos) {
    return 'הפעם האחרונה כאן: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'תן ל־Been Here לשים לב בשבילך';

  @override
  String get alwaysLocationBody =>
      'עם מיקום ברקע, הטלפון יכול להודיע ל־Been Here כשאתה מגיע למקום שכבר צילמת — והאפליקציה יכולה לומר לך את זה פעם אחת, בלי שתפתח כלום.\n\nהאפליקציה אף פעם לא עוקבת אחריך. הטלפון משגיח על כמה עיגולים ומעיר את האפליקציה רק כשאתה נכנס לאחד מהם. שום דבר על המקום שבו אתה נמצא לא יוצא מהמכשיר הזה.';

  @override
  String get alwaysLocationAction => 'הפעלת הגעות';

  @override
  String get alwaysLocationLater => 'לא עכשיו';

  @override
  String get alwaysLocationDeniedBody =>
      'המיקום ברקע כבוי, כך שההגעות נשארות שקטות. כל השאר עובד כרגיל; אפשר להפעיל אותו בהגדרות המערכת מתי שתרצה.';

  @override
  String get settingsArrivalsTitle => 'הגעות';

  @override
  String get settingsArrivalsOn =>
      'Been Here יודיע לך כשתגיע למקום שלא צילמת בו כבר זמן מה.';

  @override
  String get settingsArrivalsOff => 'Been Here שותק. ההפעלה תבקש מיקום ברקע.';

  @override
  String get settingsMemoryAgeTitle => 'להזכיר רק מקומות ישנים מ־';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ימים',
      two: 'יומיים',
      one: 'יום אחד',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => 'ואז להשאיר את המקום בשקט למשך';

  @override
  String get settingsDailyLimitTitle => 'ולא לומר דבר במשך';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours שעות',
      two: 'שעתיים',
      one: 'שעה',
      zero: 'אפס זמן',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'הורד את הערכים האלה כדי לנסות הגעות בלי לחכות חצי שנה.';

  @override
  String get placesTestArrival => 'בדיקת הגעה לכאן';

  @override
  String get arrivalTestNotified => 'ההתראה נשלחה';

  @override
  String get arrivalTestMuted => 'כלום: המקום מושתק';

  @override
  String get arrivalTestTooFewPhotos => 'כלום: מעט מדי תמונות כאן';

  @override
  String get arrivalTestTooRecent => 'כלום: צילמת כאן לא מזמן';

  @override
  String get arrivalTestPlaceCooldown => 'כלום: המקום הזה דיבר לאחרונה';

  @override
  String get arrivalTestDailyLimit => 'כלום: משהו אחר כבר דיבר היום';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'הטלפון השאיר את המיקום על ״בזמן השימוש ביישום״. iOS לא יציע את הבחירה שוב מתוך אפליקציה, לכן צריך להעביר את המיקום ברקע ל״תמיד״ בהגדרות המערכת — ואז ההגעות יתחילו לעבוד.';

  @override
  String get commonOpenSettings => 'פתיחת ההגדרות';

  @override
  String get settingsArrivalsPending =>
      'כמעט: המיקום עדיין על ״בזמן השימוש ביישום״. העבר אותו ל״תמיד״ בהגדרות המערכת.';

  @override
  String get placesSortVisits => 'הכי הרבה ביקורים';

  @override
  String get placesSortAscending => 'סדר הפוך';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ביקורים',
      two: 'שני ביקורים',
      one: 'ביקור אחד',
      zero: 'אף פעם',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'הצגת מקומות על מפה';

  @override
  String get settingsMapBody =>
      'אריחי המפה מורדים מ־OpenStreetMap בזמן שאתה גולל ומגדיל, כך שהשרת הזה רואה כל הזמן לאן אתה מסתכל. בניגוד לשם מקום, שמתבקש פעם אחת, זה נמשך כל עוד המפה פתוחה. כבוי כברירת מחדל.';

  @override
  String get placesShowMap => 'מפה';

  @override
  String get placesShowList => 'רשימה';

  @override
  String get placesMapAttribution => '© תורמי OpenStreetMap';

  @override
  String get rephotoOverlay => 'עמעום';

  @override
  String get rephotoEdges => 'קווי מתאר';

  @override
  String get rephotoCapture => 'צילום';

  @override
  String get rephotoSaved => 'נשמר בתמונות שלך';

  @override
  String get rephotoNotSaved => 'לא ניתן לשמור. ייתכן שהוספת תמונות כבויה.';

  @override
  String get rephotoNoCamera =>
      'אין מצלמה זמינה. Been Here צריך מצלמה כדי לצלם תמונה שעונה לתמונה ישנה.';

  @override
  String get rephotoThenAndNow => 'אז ועכשיו';

  @override
  String get rephotoShare => 'שיתוף';

  @override
  String get rephotoThen => 'אז';

  @override
  String get rephotoNow => 'עכשיו';

  @override
  String get rephotoShareFailed => 'לא ניתן ליצור את התמונה לשיתוף.';

  @override
  String get onboardingSkip => 'דילוג';

  @override
  String get onboardingNext => 'הבא';

  @override
  String get onboardingWhatTitle => 'תמונות מהנקודה שבה אתה עומד';

  @override
  String get onboardingWhatBody =>
      'הגע למקום שכבר צילמת ו־Been Here יראה לך מה צילמת שם — ביקור אחר ביקור, הישן ביותר קודם.';

  @override
  String get onboardingPrivacyTitle => 'שום דבר לא יוצא מהטלפון שלך';

  @override
  String get onboardingPrivacyBody =>
      'אין חשבון, אין שרת, אין אנליטיקה. Been Here קורא את ספריית התמונות במכשיר ושומר לצידה אינדקס קטן. התמונות שלך, והמקומות שבהם צולמו, נשארים איפה שהם.';

  @override
  String get onboardingPrivacyFootnote =>
      'רק שני דברים יכולים להגיע לרשת, ושניהם כבויים עד שתפעיל אותם: שמות מקומות והמפה.';

  @override
  String get onboardingPhotosTitle => 'הוא צריך את התמונות שלך';

  @override
  String get onboardingPhotosBody =>
      'Been Here רושם איזו תמונה צולמה איפה. הוא אף פעם לא מעתיק או מזיז דבר — הוא זוכר מזהים וקואורדינטות, וקורא את התמונות עצמן רק כשהוא מציג לך אותן.';

  @override
  String get onboardingPhotosAction => 'מתן גישה לתמונות';

  @override
  String get onboardingDone => 'בוא נתחיל';

  @override
  String get settingsAboutTitle => 'אודות';

  @override
  String settingsVersion(String version, String build) {
    return 'גרסה $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'קוד מקור';

  @override
  String get settingsShowIntro => 'הצגת ההיכרות שוב';

  @override
  String photoSemanticLabel(String date) {
    return 'תמונה מ־$date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'תמונה $index מתוך $total, $date';
  }

  @override
  String get placesActionsLabel => 'מה לעשות עם המקום הזה';

  @override
  String get radiusSemanticLabel => 'רדיוס חיפוש';

  @override
  String get hereMapTitle => 'כאן בסביבה';

  @override
  String get hereOpenInMaps => 'פתיחה במפות';

  @override
  String get hereBackToMe => 'חזרה למקום שבו אני';

  @override
  String get herePlaceFallbackTitle => 'מקום שאתה מכיר';

  @override
  String get arrivalTestNearHome => 'קרוב מדי לבית מכדי להיות חדשות.';

  @override
  String get settingsHomeRadiusTitle => 'שקט בטווח';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km ק״מ מהבית',
      one: 'ק״מ אחד מהבית',
      zero: 'אפס — אף פעם לא שקט',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'חיי היומיום מתרחשים ליד הבית, ושם בדיוק טלפון שמעיר עליהם הכי פחות רצוי. מקומות קרובים יותר מזה אף פעם לא נמצאים במעקב.';

  @override
  String get settingsQuietTitle => 'למה שקט';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count מקומות במעקב',
      two: 'שני מקומות במעקב',
      one: 'מקום אחד במעקב',
      zero: 'אין מקומות במעקב',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'המקום הקרוב ביותר במעקב: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'שום דבר לא במעקב, אז לא יכולה להיות הגעה.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'ההתראה האחרונה: $when';
  }

  @override
  String get settingsQuietNever => 'אף פעם';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'מתוך $total מקומות: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return 'מושתקים: $count';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return 'ליד הבית: $count';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return 'מעט מדי תמונות: $count';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return 'צולמו לאחרונה: $count';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return 'עדיין בהפסקה: $count';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return 'שווים מעקב: $count';
  }

  @override
  String get ageSemanticLabel => 'גיל התמונות';

  @override
  String get ageStopNow => 'עכשיו';

  @override
  String get ageStopDay => 'יום';

  @override
  String get ageStop3Days => '3 ימים';

  @override
  String get ageStopWeek => 'שבוע';

  @override
  String get ageStop2Weeks => 'שבועיים';

  @override
  String get ageStopMonth => 'חודש';

  @override
  String get ageStop3Months => '3 חודשים';

  @override
  String get ageStop6Months => '6 חודשים';

  @override
  String get ageStopYear => 'שנה';

  @override
  String get ageStop2Years => 'שנתיים';

  @override
  String get ageStop5Years => '5 שנים';

  @override
  String get ageStop10Years => '10 שנים';

  @override
  String get ageStopAll => 'הכול';

  @override
  String get ageWindowAll => 'כל התמונות';

  @override
  String ageWindowNewerThan(String stop) {
    return 'עד $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'ישנות מ־$stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return 'מ־$newest עד $oldest';
  }

  @override
  String get ageWindowReset => 'איפוס';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ תמונות';
  }
}
