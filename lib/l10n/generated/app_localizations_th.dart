// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'ที่นี่';

  @override
  String get placesTabLabel => 'สถานที่';

  @override
  String get settingsTabLabel => 'การตั้งค่า';

  @override
  String get hereEmptyTitle => 'คุณยังไม่เคยถ่ายรูปที่นี่';

  @override
  String get hereEmptyBody =>
      'ขยายรัศมีการค้นหา หรือกลับไปยังที่ที่คุณเคยไปมาก่อน';

  @override
  String get hereNotIndexedTitle => 'ยังไม่มีการจัดทำดัชนี';

  @override
  String get hereNotIndexedBody =>
      'Been Here ต้องอ่านคลังรูปภาพของคุณหนึ่งครั้งเพื่อรู้ว่าคุณเคยไปที่ไหนมาบ้าง ไม่มีข้อมูลใดออกจากโทรศัพท์ของคุณ';

  @override
  String get indexStartAction => 'จัดทำดัชนีรูปของฉัน';

  @override
  String get indexPermissionTitle => 'Been Here ต้องการเข้าถึงรูปของคุณ';

  @override
  String get indexPermissionBody =>
      'แอปอ่านเฉพาะสถานที่และเวลาที่ถ่ายรูปแต่ละรูป และเก็บข้อมูลไว้ในโทรศัพท์เครื่องนี้';

  @override
  String get indexPermissionAction => 'อนุญาตการเข้าถึง';

  @override
  String get indexPermissionDeniedTitle => 'การเข้าถึงรูปปิดอยู่';

  @override
  String get indexPermissionDeniedBody =>
      'หากไม่มีสิทธิ์นี้ Been Here จะแสดงอะไรให้คุณไม่ได้ คุณเปิดได้ในการตั้งค่าระบบ';

  @override
  String get indexLimitedAccessNotice =>
      'คุณแชร์เฉพาะรูปที่เลือกไว้ Been Here จึงเห็นแค่รูปเหล่านั้น การอนุญาตให้เข้าถึงทั้งหมดจะช่วยให้แอปพบทุกที่ที่คุณเคยไป';

  @override
  String get indexRunningTitle => 'กำลังอ่านคลังรูปภาพ';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed จาก $total';
  }

  @override
  String get indexFailedTitle => 'การจัดทำดัชนีหยุดลง';

  @override
  String get indexFailedBody =>
      'เกิดข้อผิดพลาดระหว่างทาง การลองอีกครั้งจะทำต่อจากจุดที่หยุดไว้';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'จัดทำดัชนีแล้ว $count รูป',
      zero: 'ยังไม่มีรูปที่จัดทำดัชนี',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent% ของรูปเหล่านั้นมีตำแหน่ง';
  }

  @override
  String get commonLoading => 'กำลังโหลด…';

  @override
  String get commonRetry => 'ลองอีกครั้ง';

  @override
  String get commonCancel => 'ยกเลิก';

  @override
  String hereRadiusLabel(String radius) {
    return 'ภายใน $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count รูป',
      zero: 'ไม่มีรูป',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'มาเยือน $count ครั้ง',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters ม.';
  }

  @override
  String distanceKilometers(String km) {
    return '$km กม.';
  }

  @override
  String get ageToday => 'วันนี้';

  @override
  String get ageYesterday => 'เมื่อวาน';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days วันที่แล้ว',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months เดือนที่แล้ว',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years ปีที่แล้ว',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'คุณอยู่ที่ไหน';

  @override
  String get locationPermissionBody =>
      'Been Here เปรียบเทียบตำแหน่งของคุณกับสถานที่ที่ถ่ายรูปของคุณ การเปรียบเทียบเกิดขึ้นในโทรศัพท์เครื่องนี้';

  @override
  String get locationPermissionAction => 'ใช้ตำแหน่งของฉัน';

  @override
  String get locationDeniedTitle => 'ตำแหน่งปิดอยู่';

  @override
  String get locationDeniedBody =>
      'หากไม่มีตำแหน่ง แอปจะไม่รู้ว่าคุณมีอะไรที่นี่ คุณเปิดได้ในการตั้งค่าระบบ';

  @override
  String get locationUnavailableTitle => 'ยังไม่ทราบตำแหน่ง';

  @override
  String get locationUnavailableBody =>
      'โทรศัพท์ยังหาไม่เจอว่าตัวเองอยู่ที่ไหน ในอาคารอาจใช้เวลาสักครู่';

  @override
  String get locationServicesDisabledTitle => 'บริการหาตำแหน่งปิดอยู่';

  @override
  String get locationServicesDisabledBody =>
      'เปิดในการตั้งค่าระบบแล้วกลับมาที่นี่';

  @override
  String get hereNothingTitle => 'คุณยังไม่เคยถ่ายรูปที่นี่';

  @override
  String get hereNothingBody =>
      'ลองใช้รัศมีที่กว้างขึ้น หรือกลับไปยังที่ที่คุณเคยไปมาก่อน';

  @override
  String hereNearestHint(String distance) {
    return 'ความทรงจำที่ใกล้ที่สุดอยู่ห่างออกไป $distance';
  }

  @override
  String get photoDetailRephoto => 'ถ่ายซ้ำ';

  @override
  String get photoDetailRephotoSoon => 'การถ่ายซ้ำจะมาในเวอร์ชันถัดไป';

  @override
  String photoDetailOf(int index, int total) {
    return '$index จาก $total';
  }

  @override
  String get debugLocationTitle => 'ตำแหน่งสำหรับดีบัก';

  @override
  String get debugLocationBody =>
      'แกล้งทำเป็นอยู่ที่อื่น เพื่อทดสอบหน้าจอที่นี่ได้จากโซฟา';

  @override
  String get debugLocationLatitude => 'ละติจูด';

  @override
  String get debugLocationLongitude => 'ลองจิจูด';

  @override
  String get debugLocationApply => 'ไปที่นั่น';

  @override
  String get debugLocationClear => 'ใช้ตำแหน่งจริง';

  @override
  String get debugLocationActive => 'กำลังใช้ตำแหน่งสำหรับดีบัก';

  @override
  String get commonClose => 'ปิด';

  @override
  String get placesEmptyTitle => 'ยังไม่มีสถานที่';

  @override
  String get placesEmptyBody => 'สถานที่จะปรากฏเมื่อจัดทำดัชนีรูปของคุณแล้ว';

  @override
  String get placesSortLabel => 'เรียงตาม';

  @override
  String get placesSortLongestAgo => 'นานที่สุด';

  @override
  String get placesSortMostPhotos => 'รูปมากที่สุด';

  @override
  String get placesSortNearest => 'ใกล้ที่สุด';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ปิดเสียง $count สถานที่',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'ปิดเสียง';

  @override
  String get placesUnmute => 'เปิดเสียง';

  @override
  String get placesUseAutoRule => 'ตัดสินใจอัตโนมัติ';

  @override
  String get placesAutoMutedNote => 'ปิดเสียงอัตโนมัติ — คุณมาที่นี่แทบทุกวัน';

  @override
  String get placesUserMutedNote => 'คุณปิดเสียงไว้';

  @override
  String get placesUserUnmutedNote => 'คุณเลือกให้แสดงไว้';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days วัน',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'ตั้งชื่อสถานที่';

  @override
  String get settingsPlaceNamesBody =>
      'ขอให้ระบบแปลงพิกัดของสถานที่เป็นชื่อ พิกัดนั้นจะถูกส่งไปยัง Apple หรือ Google — เป็นสิ่งเดียวในแอปนี้ที่ออกจากโทรศัพท์ของคุณ ปิดไว้โดยค่าเริ่มต้น และเมื่อปิดอีกครั้ง ชื่อทั้งหมดจะถูกลบ';

  @override
  String get settingsAutoMuteTitle => 'ปิดเสียงสถานที่ประจำวันหลังจาก';

  @override
  String get settingsAutoMuteBody =>
      'สถานที่ที่มีรูปจากวันต่าง ๆ มากขนาดนี้คือที่ที่คุณอาศัยอยู่ ไม่ใช่ที่ที่คุณไปเยือน';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days วัน',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'ดัชนีรูปภาพ';

  @override
  String get settingsReindex => 'จัดทำดัชนีใหม่ตั้งแต่ต้น';

  @override
  String get settingsPrivacyTitle => 'สิ่งที่อยู่ในโทรศัพท์เครื่องนี้';

  @override
  String get settingsPrivacyBody =>
      'รูปของคุณ สถานที่ที่ถ่าย และทุกอย่างที่แอปนี้อนุมานได้จากรูปเหล่านั้น ไม่มีบัญชี ไม่มีเซิร์ฟเวอร์ และไม่มีการวิเคราะห์';

  @override
  String get placesName => 'ตั้งชื่อสถานที่นี้';

  @override
  String get placesRename => 'เปลี่ยนชื่อ';

  @override
  String get placesNameDialogTitle => 'ชื่อสถานที่';

  @override
  String get placesNameHint => 'บ้านยาย ทะเลสาบ ออฟฟิศ…';

  @override
  String get placesNameSave => 'บันทึก';

  @override
  String get placesNameClear => 'ลบชื่อ';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'คุณเคยมาที่นี่แล้ว';

  @override
  String notificationBody(String age, String photos) {
    return 'ครั้งล่าสุดที่มาที่นี่: $age $photos';
  }

  @override
  String get alwaysLocationTitle => 'ให้ Been Here สังเกตแทนคุณ';

  @override
  String get alwaysLocationBody =>
      'เมื่อเปิดตำแหน่งในพื้นหลัง โทรศัพท์จะบอก Been Here ได้เมื่อคุณมาถึงที่ที่เคยถ่ายรูปไว้ — และแอปจะบอกคุณหนึ่งครั้งโดยที่คุณไม่ต้องเปิดอะไรเลย\n\nแอปไม่ติดตามคุณเลย โทรศัพท์เฝ้าดูวงกลมเพียงไม่กี่วงและปลุกแอปเฉพาะเมื่อคุณเข้าไปในวงใดวงหนึ่ง ไม่มีข้อมูลใดเกี่ยวกับตำแหน่งของคุณออกจากอุปกรณ์นี้';

  @override
  String get alwaysLocationAction => 'เปิดการแจ้งเตือนเมื่อมาถึง';

  @override
  String get alwaysLocationLater => 'ไว้ภายหลัง';

  @override
  String get alwaysLocationDeniedBody =>
      'ตำแหน่งในพื้นหลังปิดอยู่ จึงไม่มีการแจ้งเตือนเมื่อมาถึง ส่วนอื่นยังทำงานตามปกติ คุณเปิดได้ในการตั้งค่าระบบทุกเมื่อ';

  @override
  String get settingsArrivalsTitle => 'การมาถึง';

  @override
  String get settingsArrivalsOn =>
      'Been Here จะบอกคุณเมื่อมาถึงที่ที่ไม่ได้ถ่ายรูปมาระยะหนึ่ง';

  @override
  String get settingsArrivalsOff =>
      'Been Here จะเงียบไว้ การเปิดจะขอสิทธิ์ตำแหน่งในพื้นหลัง';

  @override
  String get settingsMemoryAgeTitle => 'พูดถึงเฉพาะสถานที่ที่เก่ากว่า';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days วัน',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => 'จากนั้นให้สถานที่นั้นเงียบเป็นเวลา';

  @override
  String get settingsDailyLimitTitle => 'และไม่แจ้งอะไรเลยเป็นเวลา';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ชั่วโมง',
      zero: 'ไม่มี',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'ลดค่าเหล่านี้เพื่อลองการแจ้งเตือนเมื่อมาถึงโดยไม่ต้องรอครึ่งปี';

  @override
  String get placesTestArrival => 'ทดสอบการมาถึงที่นี่';

  @override
  String get arrivalTestNotified => 'ส่งการแจ้งเตือนแล้ว';

  @override
  String get arrivalTestMuted => 'ไม่มี: สถานที่นี้ถูกปิดเสียง';

  @override
  String get arrivalTestTooFewPhotos => 'ไม่มี: รูปที่นี่น้อยเกินไป';

  @override
  String get arrivalTestTooRecent => 'ไม่มี: คุณเพิ่งถ่ายรูปที่นี่ไม่นาน';

  @override
  String get arrivalTestPlaceCooldown => 'ไม่มี: สถานที่นี้เพิ่งแจ้งเตือนไป';

  @override
  String get arrivalTestDailyLimit => 'ไม่มี: วันนี้มีการแจ้งเตือนอื่นแล้ว';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'โทรศัพท์ของคุณยังตั้งตำแหน่งไว้ที่ \"ขณะใช้แอป\" iOS จะไม่ถามตัวเลือกนี้อีกจากในแอป คุณจึงต้องเปลี่ยนตำแหน่งในพื้นหลังเป็น \"ตลอดเวลา\" ในการตั้งค่าระบบ — แล้วการแจ้งเตือนเมื่อมาถึงจะเริ่มทำงาน';

  @override
  String get commonOpenSettings => 'เปิดการตั้งค่า';

  @override
  String get settingsArrivalsPending =>
      'เกือบแล้ว: ตำแหน่งยังเป็น \"ขณะใช้แอป\" เปลี่ยนเป็น \"ตลอดเวลา\" ในการตั้งค่าระบบ';

  @override
  String get placesSortVisits => 'มาเยือนมากที่สุด';

  @override
  String get placesSortAscending => 'เรียงกลับด้าน';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'มาเยือน $count ครั้ง',
      zero: 'ไม่เคย',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'แสดงสถานที่บนแผนที่';

  @override
  String get settingsMapBody =>
      'ไทล์แผนที่จะดาวน์โหลดจาก OpenStreetMap ขณะที่คุณเลื่อนและซูม เซิร์ฟเวอร์นั้นจึงเห็นตลอดว่าคุณกำลังดูที่ใด ต่างจากชื่อสถานที่ที่ถามเพียงครั้งเดียว สิ่งนี้จะดำเนินต่อไปตราบที่แผนที่ยังเปิดอยู่ ปิดไว้โดยค่าเริ่มต้น';

  @override
  String get placesShowMap => 'แผนที่';

  @override
  String get placesShowList => 'รายการ';

  @override
  String get placesMapAttribution => '© ผู้มีส่วนร่วม OpenStreetMap';

  @override
  String get rephotoOverlay => 'ซ้อนจาง';

  @override
  String get rephotoEdges => 'เส้นขอบ';

  @override
  String get rephotoCapture => 'ถ่าย';

  @override
  String get rephotoSaved => 'บันทึกลงในรูปภาพแล้ว';

  @override
  String get rephotoNotSaved => 'บันทึกไม่ได้ การเพิ่มรูปภาพอาจถูกปิดอยู่';

  @override
  String get rephotoNoCamera =>
      'ไม่มีกล้องให้ใช้ Been Here ต้องใช้กล้องเพื่อถ่ายรูปที่ตอบรับรูปเก่า';

  @override
  String get rephotoThenAndNow => 'วันนั้นกับวันนี้';

  @override
  String get rephotoShare => 'แชร์';

  @override
  String get rephotoThen => 'วันนั้น';

  @override
  String get rephotoNow => 'วันนี้';

  @override
  String get rephotoShareFailed => 'สร้างภาพสำหรับแชร์ไม่ได้';

  @override
  String get onboardingSkip => 'ข้าม';

  @override
  String get onboardingNext => 'ถัดไป';

  @override
  String get onboardingWhatTitle => 'รูปจากจุดที่คุณยืนอยู่';

  @override
  String get onboardingWhatBody =>
      'เมื่อมาถึงที่ที่คุณเคยถ่ายรูปไว้ Been Here จะแสดงสิ่งที่คุณถ่ายที่นั่น — ทีละครั้งที่มาเยือน เริ่มจากครั้งที่เก่าที่สุด';

  @override
  String get onboardingPrivacyTitle => 'ไม่มีข้อมูลใดออกจากโทรศัพท์';

  @override
  String get onboardingPrivacyBody =>
      'ไม่มีบัญชี ไม่มีเซิร์ฟเวอร์ ไม่มีการวิเคราะห์ Been Here อ่านคลังรูปภาพในอุปกรณ์และเก็บดัชนีเล็ก ๆ ไว้ข้าง ๆ รูปของคุณและสถานที่ที่ถ่ายยังคงอยู่ที่เดิม';

  @override
  String get onboardingPrivacyFootnote =>
      'มีเพียงสองอย่างที่อาจเชื่อมต่อเครือข่าย และทั้งคู่ปิดอยู่จนกว่าคุณจะเปิด: ชื่อสถานที่และแผนที่';

  @override
  String get onboardingPhotosTitle => 'แอปต้องใช้รูปของคุณ';

  @override
  String get onboardingPhotosBody =>
      'Been Here จดว่ารูปไหนถ่ายที่ไหน แอปไม่คัดลอกหรือย้ายอะไรเลย — จำเพียง ID และพิกัด และอ่านตัวรูปเฉพาะตอนที่แสดงให้คุณดู';

  @override
  String get onboardingPhotosAction => 'อนุญาตรูปภาพ';

  @override
  String get onboardingDone => 'เริ่มต้น';

  @override
  String get settingsAboutTitle => 'เกี่ยวกับ';

  @override
  String settingsVersion(String version, String build) {
    return 'เวอร์ชัน $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'ซอร์สโค้ด';

  @override
  String get settingsShowIntro => 'แสดงบทแนะนำอีกครั้ง';

  @override
  String photoSemanticLabel(String date) {
    return 'รูปจากวันที่ $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'รูปที่ $index จาก $total, $date';
  }

  @override
  String get placesActionsLabel => 'จะทำอะไรกับสถานที่นี้';

  @override
  String get radiusSemanticLabel => 'รัศมีการค้นหา';

  @override
  String get hereMapTitle => 'รอบ ๆ ที่นี่';

  @override
  String get hereOpenInMaps => 'เปิดในแผนที่';

  @override
  String get hereBackToMe => 'กลับไปยังตำแหน่งของฉัน';

  @override
  String get herePlaceFallbackTitle => 'สถานที่ที่คุณรู้จัก';

  @override
  String get arrivalTestNearHome => 'ใกล้บ้านเกินกว่าจะเป็นเรื่องใหม่';

  @override
  String get settingsHomeRadiusTitle => 'เงียบไว้ภายในระยะ';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km กม. จากบ้าน',
      zero: 'ไม่มีระยะ — ไม่เงียบเลย',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'ชีวิตประจำวันเกิดขึ้นใกล้บ้าน และที่นั่นคือที่ที่โทรศัพท์ซึ่งคอยพูดถึงมันเป็นที่ต้องการน้อยที่สุด สถานที่ที่ใกล้กว่านี้จะไม่ถูกเฝ้าดูเลย';

  @override
  String get settingsQuietTitle => 'ทำไมถึงเงียบ';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'กำลังเฝ้าดู $count สถานที่',
      zero: 'ไม่ได้เฝ้าดูสถานที่ใด',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'สถานที่ที่เฝ้าดูใกล้ที่สุด: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'ไม่มีอะไรถูกเฝ้าดู จึงไม่มีการมาถึงเกิดขึ้นได้';

  @override
  String settingsQuietLastNotified(String when) {
    return 'การแจ้งเตือนล่าสุด: $when';
  }

  @override
  String get settingsQuietNever => 'ไม่เคย';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'จาก $total สถานที่: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return 'ปิดเสียง $count';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return 'ใกล้บ้าน $count';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return 'รูปน้อยเกินไป $count';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return 'เพิ่งถ่ายไม่นาน $count';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return 'ยังพักอยู่ $count';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return 'น่าเฝ้าดู $count';
  }

  @override
  String get ageSemanticLabel => 'อายุของรูป';

  @override
  String get ageStopNow => 'ตอนนี้';

  @override
  String get ageStopDay => '1 วัน';

  @override
  String get ageStop3Days => '3 วัน';

  @override
  String get ageStopWeek => '1 สัปดาห์';

  @override
  String get ageStop2Weeks => '2 สัปดาห์';

  @override
  String get ageStopMonth => '1 เดือน';

  @override
  String get ageStop3Months => '3 เดือน';

  @override
  String get ageStop6Months => '6 เดือน';

  @override
  String get ageStopYear => '1 ปี';

  @override
  String get ageStop2Years => '2 ปี';

  @override
  String get ageStop5Years => '5 ปี';

  @override
  String get ageStop10Years => '10 ปี';

  @override
  String get ageStopAll => 'ทั้งหมด';

  @override
  String get ageWindowAll => 'รูปทั้งหมด';

  @override
  String ageWindowNewerThan(String stop) {
    return 'ไม่เกิน $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'เก่ากว่า $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest ถึง $oldest';
  }

  @override
  String get ageWindowReset => 'รีเซ็ต';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ รูป';
  }
}
