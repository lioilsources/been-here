// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Tại đây';

  @override
  String get placesTabLabel => 'Địa điểm';

  @override
  String get settingsTabLabel => 'Cài đặt';

  @override
  String get hereEmptyTitle => 'Bạn chưa chụp ảnh ở đây';

  @override
  String get hereEmptyBody =>
      'Hãy mở rộng bán kính tìm kiếm, hoặc quay lại nơi bạn từng đến.';

  @override
  String get hereNotIndexedTitle => 'Chưa lập chỉ mục gì';

  @override
  String get hereNotIndexedBody =>
      'Been Here cần đọc thư viện ảnh của bạn một lần để biết bạn đã từng đi đâu. Không có gì rời khỏi điện thoại của bạn.';

  @override
  String get indexStartAction => 'Lập chỉ mục ảnh của tôi';

  @override
  String get indexPermissionTitle => 'Been Here cần ảnh của bạn';

  @override
  String get indexPermissionBody =>
      'Ứng dụng chỉ đọc nơi và thời điểm chụp mỗi ảnh, và giữ thông tin đó trên điện thoại này.';

  @override
  String get indexPermissionAction => 'Cho phép truy cập';

  @override
  String get indexPermissionDeniedTitle => 'Quyền truy cập ảnh đang tắt';

  @override
  String get indexPermissionDeniedBody =>
      'Không có quyền này, Been Here không thể cho bạn xem gì. Bạn có thể bật nó trong cài đặt hệ thống.';

  @override
  String get indexLimitedAccessNotice =>
      'Bạn chỉ chia sẻ một số ảnh đã chọn, nên Been Here chỉ thấy những ảnh đó. Cho phép truy cập đầy đủ giúp ứng dụng tìm ra mọi nơi bạn từng đến.';

  @override
  String get indexRunningTitle => 'Đang đọc thư viện ảnh';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed/$total';
  }

  @override
  String get indexFailedTitle => 'Đã dừng lập chỉ mục';

  @override
  String get indexFailedBody =>
      'Có lỗi xảy ra giữa chừng. Thử lại sẽ tiếp tục từ chỗ đã dừng.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã lập chỉ mục $count ảnh',
      zero: 'Chưa lập chỉ mục ảnh nào',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent% trong số đó có vị trí';
  }

  @override
  String get commonLoading => 'Đang tải…';

  @override
  String get commonRetry => 'Thử lại';

  @override
  String get commonCancel => 'Hủy';

  @override
  String hereRadiusLabel(String radius) {
    return 'Trong vòng $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ảnh',
      zero: 'Không có ảnh',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lần ghé',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters m';
  }

  @override
  String distanceKilometers(String km) {
    return '$km km';
  }

  @override
  String get ageToday => 'Hôm nay';

  @override
  String get ageYesterday => 'Hôm qua';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ngày trước',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months tháng trước',
      one: 'Một tháng trước',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years năm trước',
      one: 'Một năm trước',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Bạn đang ở đâu?';

  @override
  String get locationPermissionBody =>
      'Been Here so sánh vị trí của bạn với những nơi ảnh của bạn được chụp. Việc so sánh diễn ra trên điện thoại này.';

  @override
  String get locationPermissionAction => 'Dùng vị trí của tôi';

  @override
  String get locationDeniedTitle => 'Vị trí đang tắt';

  @override
  String get locationDeniedBody =>
      'Không có vị trí, ứng dụng không biết bạn có gì ở đây. Bạn có thể bật nó trong cài đặt hệ thống.';

  @override
  String get locationUnavailableTitle => 'Chưa xác định được vị trí';

  @override
  String get locationUnavailableBody =>
      'Điện thoại chưa xác định được nó đang ở đâu. Trong nhà, việc này có thể mất một lúc.';

  @override
  String get locationServicesDisabledTitle => 'Dịch vụ định vị đang tắt';

  @override
  String get locationServicesDisabledBody =>
      'Hãy bật chúng trong cài đặt hệ thống rồi quay lại.';

  @override
  String get hereNothingTitle => 'Bạn chưa chụp ảnh ở đây';

  @override
  String get hereNothingBody =>
      'Hãy thử bán kính rộng hơn, hoặc quay lại nơi bạn từng đến.';

  @override
  String hereNearestHint(String distance) {
    return 'Kỷ niệm gần nhất của bạn cách đây $distance.';
  }

  @override
  String get photoDetailRephoto => 'Chụp lại';

  @override
  String get photoDetailRephotoSoon =>
      'Tính năng chụp lại sẽ có trong phiên bản sau.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index/$total';
  }

  @override
  String get debugLocationTitle => 'Vị trí thử nghiệm';

  @override
  String get debugLocationBody =>
      'Giả vờ đang ở nơi khác để có thể thử màn hình Tại đây ngay từ ghế sofa.';

  @override
  String get debugLocationLatitude => 'Vĩ độ';

  @override
  String get debugLocationLongitude => 'Kinh độ';

  @override
  String get debugLocationApply => 'Đến đó';

  @override
  String get debugLocationClear => 'Dùng vị trí thật';

  @override
  String get debugLocationActive => 'Đang dùng vị trí thử nghiệm';

  @override
  String get commonClose => 'Đóng';

  @override
  String get placesEmptyTitle => 'Chưa có địa điểm';

  @override
  String get placesEmptyBody =>
      'Địa điểm sẽ xuất hiện khi ảnh của bạn đã được lập chỉ mục.';

  @override
  String get placesSortLabel => 'Sắp xếp theo';

  @override
  String get placesSortLongestAgo => 'Lâu nhất';

  @override
  String get placesSortMostPhotos => 'Nhiều ảnh nhất';

  @override
  String get placesSortNearest => 'Gần nhất';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count địa điểm đã tắt tiếng',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Tắt tiếng';

  @override
  String get placesUnmute => 'Bật tiếng';

  @override
  String get placesUseAutoRule => 'Tự động quyết định';

  @override
  String get placesAutoMutedNote =>
      'Tự động tắt tiếng — bạn ở đây gần như mỗi ngày';

  @override
  String get placesUserMutedNote => 'Bạn đã tắt tiếng';

  @override
  String get placesUserUnmutedNote => 'Bạn đã giữ hiển thị';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ngày',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Đặt tên địa điểm';

  @override
  String get settingsPlaceNamesBody =>
      'Yêu cầu hệ thống chuyển tọa độ của một địa điểm thành tên. Tọa độ đó được gửi tới Apple hoặc Google — đây là thứ duy nhất trong ứng dụng rời khỏi điện thoại của bạn. Mặc định tắt; tắt lại sẽ xóa mọi tên.';

  @override
  String get settingsAutoMuteTitle => 'Tắt tiếng nơi quen thuộc sau';

  @override
  String get settingsAutoMuteBody =>
      'Một nơi có ảnh chụp vào nhiều ngày khác nhau như vậy là nơi bạn sống, không phải nơi bạn ghé thăm.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ngày',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Chỉ mục ảnh';

  @override
  String get settingsReindex => 'Lập chỉ mục lại từ đầu';

  @override
  String get settingsPrivacyTitle => 'Những gì ở lại trên điện thoại này';

  @override
  String get settingsPrivacyBody =>
      'Ảnh của bạn, nơi chúng được chụp và mọi thứ ứng dụng suy ra từ chúng. Không có tài khoản, không máy chủ, không phân tích.';

  @override
  String get placesName => 'Đặt tên cho nơi này';

  @override
  String get placesRename => 'Đổi tên';

  @override
  String get placesNameDialogTitle => 'Tên địa điểm';

  @override
  String get placesNameHint => 'Nhà bà, hồ, văn phòng…';

  @override
  String get placesNameSave => 'Lưu';

  @override
  String get placesNameClear => 'Xóa tên';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Bạn từng đến đây';

  @override
  String notificationBody(String age, String photos) {
    return 'Lần cuối bạn ở đây: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Để Been Here để ý thay bạn';

  @override
  String get alwaysLocationBody =>
      'Với vị trí nền, điện thoại có thể báo cho Been Here khi bạn đến một nơi đã từng chụp ảnh — và ứng dụng có thể nhắc bạn một lần, mà bạn không cần mở gì.\n\nỨng dụng không bao giờ theo dõi bạn. Điện thoại chỉ canh vài vòng tròn và chỉ đánh thức ứng dụng khi bạn bước vào một vòng. Không có gì về vị trí của bạn rời khỏi thiết bị này.';

  @override
  String get alwaysLocationAction => 'Bật thông báo khi đến';

  @override
  String get alwaysLocationLater => 'Để sau';

  @override
  String get alwaysLocationDeniedBody =>
      'Vị trí nền đang tắt, nên sẽ không có thông báo khi đến. Mọi thứ khác vẫn hoạt động như cũ; bạn có thể bật nó trong cài đặt hệ thống bất cứ lúc nào.';

  @override
  String get settingsArrivalsTitle => 'Khi đến nơi';

  @override
  String get settingsArrivalsOn =>
      'Been Here sẽ báo cho bạn khi bạn đến một nơi đã lâu chưa chụp ảnh.';

  @override
  String get settingsArrivalsOff =>
      'Been Here giữ im lặng. Bật tính năng này sẽ yêu cầu vị trí nền.';

  @override
  String get settingsMemoryAgeTitle => 'Chỉ nhắc những nơi cũ hơn';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ngày',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => 'Sau đó để nơi đó yên trong';

  @override
  String get settingsDailyLimitTitle => 'Và không nói gì trong';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours giờ',
      zero: 'không chút nào',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Giảm các giá trị này để thử thông báo khi đến mà không phải chờ nửa năm.';

  @override
  String get placesTestArrival => 'Thử một lần đến tại đây';

  @override
  String get arrivalTestNotified => 'Đã gửi thông báo';

  @override
  String get arrivalTestMuted => 'Không có: nơi này đã tắt tiếng';

  @override
  String get arrivalTestTooFewPhotos => 'Không có: quá ít ảnh ở đây';

  @override
  String get arrivalTestTooRecent => 'Không có: bạn vừa chụp ảnh ở đây gần đây';

  @override
  String get arrivalTestPlaceCooldown => 'Không có: nơi này vừa nhắc gần đây';

  @override
  String get arrivalTestDailyLimit => 'Không có: hôm nay đã có thông báo khác';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Điện thoại của bạn vẫn để vị trí ở \"Khi dùng ứng dụng\". iOS sẽ không hỏi lại lựa chọn này từ bên trong ứng dụng, nên bạn cần chuyển vị trí nền sang \"Luôn luôn\" trong cài đặt hệ thống — khi đó thông báo khi đến mới hoạt động.';

  @override
  String get commonOpenSettings => 'Mở cài đặt';

  @override
  String get settingsArrivalsPending =>
      'Gần xong: vị trí vẫn ở \"Khi dùng ứng dụng\". Hãy chuyển sang \"Luôn luôn\" trong cài đặt hệ thống.';

  @override
  String get placesSortVisits => 'Nhiều lần ghé nhất';

  @override
  String get placesSortAscending => 'Đảo thứ tự';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lần ghé',
      zero: 'chưa bao giờ',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Hiển thị địa điểm trên bản đồ';

  @override
  String get settingsMapBody =>
      'Các ô bản đồ được tải từ OpenStreetMap khi bạn kéo và thu phóng, nên máy chủ đó liên tục thấy bạn đang nhìn vào đâu. Khác với tên địa điểm chỉ hỏi một lần, việc này kéo dài suốt khi bản đồ còn mở. Mặc định tắt.';

  @override
  String get placesShowMap => 'Bản đồ';

  @override
  String get placesShowList => 'Danh sách';

  @override
  String get placesMapAttribution => '© Những người đóng góp OpenStreetMap';

  @override
  String get rephotoOverlay => 'Mờ dần';

  @override
  String get rephotoEdges => 'Đường viền';

  @override
  String get rephotoCapture => 'Chụp';

  @override
  String get rephotoSaved => 'Đã lưu vào ảnh của bạn';

  @override
  String get rephotoNotSaved =>
      'Không lưu được. Có thể việc thêm ảnh đang bị tắt.';

  @override
  String get rephotoNoCamera =>
      'Không có camera. Been Here cần camera để chụp một bức ảnh đáp lại bức ảnh cũ.';

  @override
  String get rephotoThenAndNow => 'Xưa & nay';

  @override
  String get rephotoShare => 'Chia sẻ';

  @override
  String get rephotoThen => 'Xưa';

  @override
  String get rephotoNow => 'Nay';

  @override
  String get rephotoShareFailed => 'Không tạo được ảnh để chia sẻ.';

  @override
  String get onboardingSkip => 'Bỏ qua';

  @override
  String get onboardingNext => 'Tiếp';

  @override
  String get onboardingWhatTitle => 'Ảnh từ đúng chỗ bạn đang đứng';

  @override
  String get onboardingWhatBody =>
      'Đến một nơi bạn từng chụp ảnh và Been Here sẽ cho bạn xem những gì bạn đã chụp ở đó — từng lần ghé, lâu nhất trước.';

  @override
  String get onboardingPrivacyTitle => 'Không có gì rời khỏi điện thoại';

  @override
  String get onboardingPrivacyBody =>
      'Không tài khoản, không máy chủ, không phân tích. Been Here đọc thư viện ảnh ngay trên thiết bị và giữ một chỉ mục nhỏ bên cạnh. Ảnh của bạn, và nơi chúng được chụp, vẫn ở nguyên chỗ cũ.';

  @override
  String get onboardingPrivacyFootnote =>
      'Có hai thứ có thể kết nối mạng, và cả hai đều tắt cho đến khi bạn bật: tên địa điểm và bản đồ.';

  @override
  String get onboardingPhotosTitle => 'Ứng dụng cần ảnh của bạn';

  @override
  String get onboardingPhotosBody =>
      'Been Here ghi lại ảnh nào được chụp ở đâu. Ứng dụng không bao giờ sao chép hay di chuyển gì — chỉ nhớ mã định danh và tọa độ, và chỉ đọc chính bức ảnh khi hiển thị cho bạn.';

  @override
  String get onboardingPhotosAction => 'Cho phép truy cập ảnh';

  @override
  String get onboardingDone => 'Bắt đầu';

  @override
  String get settingsAboutTitle => 'Giới thiệu';

  @override
  String settingsVersion(String version, String build) {
    return 'Phiên bản $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Mã nguồn';

  @override
  String get settingsShowIntro => 'Xem lại phần giới thiệu';

  @override
  String photoSemanticLabel(String date) {
    return 'Ảnh ngày $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Ảnh $index/$total, $date';
  }

  @override
  String get placesActionsLabel => 'Làm gì với nơi này';

  @override
  String get radiusSemanticLabel => 'Bán kính tìm kiếm';

  @override
  String get hereMapTitle => 'Quanh đây';

  @override
  String get hereOpenInMaps => 'Mở trong Bản đồ';

  @override
  String get hereBackToMe => 'Quay về chỗ tôi đang ở';

  @override
  String get herePlaceFallbackTitle => 'Một nơi bạn biết';

  @override
  String get arrivalTestNearHome => 'Quá gần nhà để thành tin mới.';

  @override
  String get settingsHomeRadiusTitle => 'Giữ im lặng trong phạm vi';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km quanh nhà',
      zero: 'không khoảng cách — không bao giờ im lặng',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'Cuộc sống thường ngày diễn ra gần nhà, và đó là nơi một chiếc điện thoại bình luận về nó ít được chào đón nhất. Những nơi gần hơn khoảng cách này sẽ không bao giờ được theo dõi.';

  @override
  String get settingsQuietTitle => 'Vì sao im lặng';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đang theo dõi $count nơi',
      zero: 'Không theo dõi nơi nào',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Nơi được theo dõi gần nhất: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Không có gì được theo dõi, nên không thể có lần đến nào.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Thông báo gần nhất: $when';
  }

  @override
  String get settingsQuietNever => 'chưa bao giờ';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'Trong $total nơi: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count đã tắt tiếng';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count gần nhà';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count có quá ít ảnh';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count vừa chụp gần đây';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count vẫn đang nghỉ';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count đáng theo dõi';
  }

  @override
  String get ageSemanticLabel => 'Tuổi ảnh';

  @override
  String get ageStopNow => 'bây giờ';

  @override
  String get ageStopDay => '1 ngày';

  @override
  String get ageStop3Days => '3 ngày';

  @override
  String get ageStopWeek => '1 tuần';

  @override
  String get ageStop2Weeks => '2 tuần';

  @override
  String get ageStopMonth => '1 tháng';

  @override
  String get ageStop3Months => '3 tháng';

  @override
  String get ageStop6Months => '6 tháng';

  @override
  String get ageStopYear => '1 năm';

  @override
  String get ageStop2Years => '2 năm';

  @override
  String get ageStop5Years => '5 năm';

  @override
  String get ageStop10Years => '10 năm';

  @override
  String get ageStopAll => 'tất cả';

  @override
  String get ageWindowAll => 'Tất cả ảnh';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Tối đa $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Cũ hơn $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return 'Từ $newest đến $oldest';
  }

  @override
  String get ageWindowReset => 'Đặt lại';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ ảnh';
  }
}
