// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => '여기';

  @override
  String get placesTabLabel => '장소';

  @override
  String get settingsTabLabel => '설정';

  @override
  String get hereEmptyTitle => '여기서 찍은 사진이 없어요';

  @override
  String get hereEmptyBody => '검색 반경을 넓히거나, 예전에 가 본 곳으로 다시 가 보세요.';

  @override
  String get hereNotIndexedTitle => '아직 색인된 항목이 없어요';

  @override
  String get hereNotIndexedBody =>
      'Been Here는 어디를 다녀왔는지 알기 위해 사진 보관함을 한 번 읽어야 해요. 어떤 것도 휴대폰 밖으로 나가지 않아요.';

  @override
  String get indexStartAction => '내 사진 색인하기';

  @override
  String get indexPermissionTitle => 'Been Here에 사진 접근 권한이 필요해요';

  @override
  String get indexPermissionBody => '각 사진을 어디서 언제 찍었는지만 읽고, 그 정보는 이 휴대폰에 보관해요.';

  @override
  String get indexPermissionAction => '접근 허용';

  @override
  String get indexPermissionDeniedTitle => '사진 접근이 꺼져 있어요';

  @override
  String get indexPermissionDeniedBody =>
      '권한이 없으면 Been Here가 아무것도 보여 줄 수 없어요. 시스템 설정에서 켤 수 있어요.';

  @override
  String get indexLimitedAccessNotice =>
      '선택한 사진만 공유했기 때문에 Been Here는 그 사진만 볼 수 있어요. 전체 접근을 허용하면 다녀온 모든 장소를 찾을 수 있어요.';

  @override
  String get indexRunningTitle => '사진 보관함을 읽는 중';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed / $total';
  }

  @override
  String get indexFailedTitle => '색인이 중단됐어요';

  @override
  String get indexFailedBody => '중간에 문제가 생겼어요. 다시 시도하면 멈춘 곳부터 이어서 해요.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사진 $count장 색인됨',
      zero: '색인된 사진 없음',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '그중 $percent%에 위치 정보가 있어요';
  }

  @override
  String get commonLoading => '불러오는 중…';

  @override
  String get commonRetry => '다시 시도';

  @override
  String get commonCancel => '취소';

  @override
  String hereRadiusLabel(String radius) {
    return '$radius 이내';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사진 $count장',
      zero: '사진 없음',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '방문 $count회',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '${meters}m';
  }

  @override
  String distanceKilometers(String km) {
    return '${km}km';
  }

  @override
  String get ageToday => '오늘';

  @override
  String get ageYesterday => '어제';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일 전',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months개월 전',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years년 전',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => '지금 어디에 계세요?';

  @override
  String get locationPermissionBody =>
      'Been Here는 현재 위치를 사진을 찍은 장소들과 비교해요. 비교는 이 휴대폰에서 이뤄져요.';

  @override
  String get locationPermissionAction => '내 위치 사용';

  @override
  String get locationDeniedTitle => '위치가 꺼져 있어요';

  @override
  String get locationDeniedBody =>
      '위치가 없으면 앱이 여기에 무엇이 있는지 알 수 없어요. 시스템 설정에서 켤 수 있어요.';

  @override
  String get locationUnavailableTitle => '아직 위치를 못 찾았어요';

  @override
  String get locationUnavailableBody =>
      '휴대폰이 아직 현재 위치를 파악하지 못했어요. 실내에서는 시간이 조금 걸릴 수 있어요.';

  @override
  String get locationServicesDisabledTitle => '위치 서비스가 꺼져 있어요';

  @override
  String get locationServicesDisabledBody => '시스템 설정에서 켠 다음 돌아오세요.';

  @override
  String get hereNothingTitle => '여기서 찍은 사진이 없어요';

  @override
  String get hereNothingBody => '반경을 넓히거나, 예전에 가 본 곳으로 다시 가 보세요.';

  @override
  String hereNearestHint(String distance) {
    return '가장 가까운 추억은 $distance 떨어져 있어요.';
  }

  @override
  String get photoDetailRephoto => '다시 찍기';

  @override
  String get photoDetailRephotoSoon => '다시 찍기는 이후 버전에서 제공돼요.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index / $total';
  }

  @override
  String get debugLocationTitle => '디버그 위치';

  @override
  String get debugLocationBody => '다른 곳에 있는 것처럼 설정해서 소파에서도 여기 화면을 테스트해 보세요.';

  @override
  String get debugLocationLatitude => '위도';

  @override
  String get debugLocationLongitude => '경도';

  @override
  String get debugLocationApply => '그곳으로 이동';

  @override
  String get debugLocationClear => '실제 위치 사용';

  @override
  String get debugLocationActive => '디버그 위치 사용 중';

  @override
  String get commonClose => '닫기';

  @override
  String get placesEmptyTitle => '아직 장소가 없어요';

  @override
  String get placesEmptyBody => '사진 색인이 끝나면 장소가 나타나요.';

  @override
  String get placesSortLabel => '정렬 기준';

  @override
  String get placesSortLongestAgo => '가장 오래전';

  @override
  String get placesSortMostPhotos => '사진 많은 순';

  @override
  String get placesSortNearest => '가까운 순';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '알림 끈 장소 $count곳',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => '알림 끄기';

  @override
  String get placesUnmute => '알림 켜기';

  @override
  String get placesUseAutoRule => '자동으로 결정';

  @override
  String get placesAutoMutedNote => '자동으로 알림 꺼짐 — 거의 매일 오는 곳이에요';

  @override
  String get placesUserMutedNote => '직접 알림을 껐어요';

  @override
  String get placesUserUnmutedNote => '직접 표시를 유지했어요';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => '장소 이름 붙이기';

  @override
  String get settingsPlaceNamesBody =>
      '장소의 좌표를 이름으로 바꿔 달라고 시스템에 요청해요. 그 좌표는 Apple 또는 Google로 전송되며, 이 앱에서 휴대폰 밖으로 나가는 유일한 정보예요. 기본값은 꺼짐이고, 다시 끄면 모든 이름이 지워져요.';

  @override
  String get settingsAutoMuteTitle => '일상 장소 알림 끄기 기준';

  @override
  String get settingsAutoMuteBody =>
      '이만큼 서로 다른 날에 찍은 사진이 있는 곳은 방문하는 곳이 아니라 사는 곳이에요.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일 이상',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => '사진 색인';

  @override
  String get settingsReindex => '처음부터 다시 색인';

  @override
  String get settingsPrivacyTitle => '이 휴대폰에 남는 것';

  @override
  String get settingsPrivacyBody =>
      '사진, 사진을 찍은 장소, 그리고 앱이 그로부터 알아낸 모든 것. 계정도 서버도 분석도 없어요.';

  @override
  String get placesName => '이 장소에 이름 붙이기';

  @override
  String get placesRename => '이름 바꾸기';

  @override
  String get placesNameDialogTitle => '장소 이름';

  @override
  String get placesNameHint => '할머니 댁, 호수, 사무실…';

  @override
  String get placesNameSave => '저장';

  @override
  String get placesNameClear => '이름 삭제';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => '예전에 와 본 곳이에요';

  @override
  String notificationBody(String age, String photos) {
    return '마지막 방문: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Been Here가 대신 알아차리게 하세요';

  @override
  String get alwaysLocationBody =>
      '백그라운드 위치를 사용하면 예전에 사진을 찍은 곳에 도착했을 때 휴대폰이 Been Here에 알려 주고, 앱은 아무것도 열지 않아도 한 번 알려 줄 수 있어요.\n\n앱은 절대 당신을 추적하지 않아요. 휴대폰은 몇 개의 원만 지켜보다가 그중 하나에 들어갈 때만 앱을 깨워요. 당신의 위치에 관한 어떤 정보도 이 기기 밖으로 나가지 않아요.';

  @override
  String get alwaysLocationAction => '도착 알림 켜기';

  @override
  String get alwaysLocationLater => '나중에';

  @override
  String get alwaysLocationDeniedBody =>
      '백그라운드 위치가 꺼져 있어서 도착 알림이 오지 않아요. 나머지는 그대로 작동하고, 시스템 설정에서 언제든 켤 수 있어요.';

  @override
  String get settingsArrivalsTitle => '도착 알림';

  @override
  String get settingsArrivalsOn => '한동안 사진을 찍지 않은 곳에 도착하면 Been Here가 알려 줘요.';

  @override
  String get settingsArrivalsOff => 'Been Here가 조용히 있어요. 켜면 백그라운드 위치를 요청해요.';

  @override
  String get settingsMemoryAgeTitle => '이보다 오래된 장소만 알리기';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => '그다음 그 장소를 조용히 둘 기간';

  @override
  String get settingsDailyLimitTitle => '그리고 아무 알림도 보내지 않을 기간';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours시간',
      zero: '없음',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      '값을 낮추면 반년을 기다리지 않고도 도착 알림을 시험해 볼 수 있어요.';

  @override
  String get placesTestArrival => '여기서 도착 테스트';

  @override
  String get arrivalTestNotified => '알림을 보냈어요';

  @override
  String get arrivalTestMuted => '없음: 알림을 끈 장소예요';

  @override
  String get arrivalTestTooFewPhotos => '없음: 여기 사진이 너무 적어요';

  @override
  String get arrivalTestTooRecent => '없음: 최근에 여기서 사진을 찍었어요';

  @override
  String get arrivalTestPlaceCooldown => '없음: 이 장소는 최근에 알림을 보냈어요';

  @override
  String get arrivalTestDailyLimit => '없음: 오늘 이미 다른 알림이 있었어요';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      '휴대폰이 위치를 \'앱을 사용하는 동안\'으로 유지했어요. iOS는 앱 안에서 이 선택을 다시 제공하지 않으니, 시스템 설정에서 백그라운드 위치를 \'항상\'으로 바꿔야 해요. 그러면 도착 알림이 작동하기 시작해요.';

  @override
  String get commonOpenSettings => '설정 열기';

  @override
  String get settingsArrivalsPending =>
      '거의 다 됐어요: 위치가 아직 \'앱을 사용하는 동안\'이에요. 시스템 설정에서 \'항상\'으로 바꿔 주세요.';

  @override
  String get placesSortVisits => '방문 많은 순';

  @override
  String get placesSortAscending => '역순';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '방문 $count회',
      zero: '방문 없음',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => '지도에 장소 표시';

  @override
  String get settingsMapBody =>
      '지도 타일은 이동하고 확대할 때마다 OpenStreetMap에서 내려받기 때문에, 그 서버는 당신이 어디를 보고 있는지 계속 알게 돼요. 한 번만 묻는 장소 이름과 달리, 지도가 열려 있는 동안 계속돼요. 기본값은 꺼짐이에요.';

  @override
  String get placesShowMap => '지도';

  @override
  String get placesShowList => '목록';

  @override
  String get placesMapAttribution => '© OpenStreetMap 기여자';

  @override
  String get rephotoOverlay => '겹쳐 보기';

  @override
  String get rephotoEdges => '윤곽선';

  @override
  String get rephotoCapture => '촬영';

  @override
  String get rephotoSaved => '사진에 저장했어요';

  @override
  String get rephotoNotSaved => '저장하지 못했어요. 사진 추가가 꺼져 있을 수 있어요.';

  @override
  String get rephotoNoCamera =>
      '사용할 수 있는 카메라가 없어요. 옛 사진에 답하는 사진을 찍으려면 Been Here에 카메라가 필요해요.';

  @override
  String get rephotoThenAndNow => '그때와 지금';

  @override
  String get rephotoShare => '공유';

  @override
  String get rephotoThen => '그때';

  @override
  String get rephotoNow => '지금';

  @override
  String get rephotoShareFailed => '공유할 이미지를 만들지 못했어요.';

  @override
  String get onboardingSkip => '건너뛰기';

  @override
  String get onboardingNext => '다음';

  @override
  String get onboardingWhatTitle => '지금 서 있는 바로 그 자리의 사진';

  @override
  String get onboardingWhatBody =>
      '예전에 사진을 찍은 곳에 도착하면 Been Here가 그곳에서 찍은 사진을 방문별로, 오래된 순서로 보여 줘요.';

  @override
  String get onboardingPrivacyTitle => '어떤 것도 휴대폰 밖으로 나가지 않아요';

  @override
  String get onboardingPrivacyBody =>
      '계정도, 서버도, 분석도 없어요. Been Here는 기기에서 사진 보관함을 읽고 그 옆에 작은 색인을 둬요. 사진과 사진을 찍은 장소는 원래 있던 곳에 그대로 있어요.';

  @override
  String get onboardingPrivacyFootnote =>
      '네트워크에 닿을 수 있는 건 두 가지뿐이고, 직접 켜기 전까지는 둘 다 꺼져 있어요: 장소 이름과 지도.';

  @override
  String get onboardingPhotosTitle => '사진 접근이 필요해요';

  @override
  String get onboardingPhotosBody =>
      'Been Here는 어떤 사진을 어디서 찍었는지 기록해요. 아무것도 복사하거나 옮기지 않고, ID와 좌표만 기억하며, 사진 자체는 보여 줄 때만 읽어요.';

  @override
  String get onboardingPhotosAction => '사진 허용';

  @override
  String get onboardingDone => '시작하기';

  @override
  String get settingsAboutTitle => '정보';

  @override
  String settingsVersion(String version, String build) {
    return '버전 $version ($build)';
  }

  @override
  String get settingsSourceTitle => '소스 코드';

  @override
  String get settingsShowIntro => '소개 다시 보기';

  @override
  String photoSemanticLabel(String date) {
    return '$date의 사진';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return '사진 $index / $total, $date';
  }

  @override
  String get placesActionsLabel => '이 장소에 대한 작업';

  @override
  String get radiusSemanticLabel => '검색 반경';

  @override
  String get hereMapTitle => '이 근처';

  @override
  String get hereOpenInMaps => '지도에서 열기';

  @override
  String get hereBackToMe => '내 위치로 돌아가기';

  @override
  String get herePlaceFallbackTitle => '알고 있는 장소';

  @override
  String get arrivalTestNearHome => '집에서 너무 가까워서 알릴 일이 아니에요.';

  @override
  String get settingsHomeRadiusTitle => '조용히 있을 범위';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '집에서 ${km}km 이내',
      zero: '없음 — 항상 알림',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      '일상은 집 근처에서 일어나고, 거기서 일일이 말을 거는 휴대폰은 가장 반갑지 않아요. 이보다 가까운 장소는 지켜보지 않아요.';

  @override
  String get settingsQuietTitle => '조용한 이유';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count곳을 지켜보는 중',
      zero: '지켜보는 장소 없음',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return '가장 가까운 지켜보는 장소: $distance';
  }

  @override
  String get settingsQuietNothingWatched => '지켜보는 곳이 없어서 도착 알림이 올 수 없어요.';

  @override
  String settingsQuietLastNotified(String when) {
    return '마지막 알림: $when';
  }

  @override
  String get settingsQuietNever => '없음';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return '$total곳 중: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '알림 끔 $count';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '집 근처 $count';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '사진이 너무 적음 $count';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '최근에 촬영함 $count';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '아직 쉬는 중 $count';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '지켜볼 만함 $count';
  }

  @override
  String get ageSemanticLabel => '사진 기간';

  @override
  String get ageStopNow => '지금';

  @override
  String get ageStopDay => '1일';

  @override
  String get ageStop3Days => '3일';

  @override
  String get ageStopWeek => '1주';

  @override
  String get ageStop2Weeks => '2주';

  @override
  String get ageStopMonth => '1개월';

  @override
  String get ageStop3Months => '3개월';

  @override
  String get ageStop6Months => '6개월';

  @override
  String get ageStopYear => '1년';

  @override
  String get ageStop2Years => '2년';

  @override
  String get ageStop5Years => '5년';

  @override
  String get ageStop10Years => '10년';

  @override
  String get ageStopAll => '전체';

  @override
  String get ageWindowAll => '모든 사진';

  @override
  String ageWindowNewerThan(String stop) {
    return '$stop 이내';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return '$stop 이상';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest~$oldest';
  }

  @override
  String get ageWindowReset => '초기화';

  @override
  String mapDotCountCapped(int count) {
    return '사진 $count+장';
  }
}
