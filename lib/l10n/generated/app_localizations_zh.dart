// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => '此处';

  @override
  String get placesTabLabel => '地点';

  @override
  String get settingsTabLabel => '设置';

  @override
  String get hereEmptyTitle => '你没有在这里拍过照片';

  @override
  String get hereEmptyBody => '扩大搜索半径，或者回到你曾经去过的地方。';

  @override
  String get hereNotIndexedTitle => '尚未建立索引';

  @override
  String get hereNotIndexedBody =>
      'Been Here 需要读取一次你的照片图库，才能知道你去过哪里。所有内容都不会离开你的手机。';

  @override
  String get indexStartAction => '为我的照片建立索引';

  @override
  String get indexPermissionTitle => 'Been Here 需要访问你的照片';

  @override
  String get indexPermissionBody => '它只读取每张照片的拍摄地点和时间，并把这些信息保存在这部手机上。';

  @override
  String get indexPermissionAction => '允许访问';

  @override
  String get indexPermissionDeniedTitle => '照片访问已关闭';

  @override
  String get indexPermissionDeniedBody =>
      '没有它，Been Here 无法为你显示任何内容。你可以在系统设置中开启。';

  @override
  String get indexLimitedAccessNotice =>
      '你只共享了部分照片，所以 Been Here 只能看到这些。允许完全访问后，它就能找到你去过的每一个地方。';

  @override
  String get indexRunningTitle => '正在读取你的照片图库';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed / $total';
  }

  @override
  String get indexFailedTitle => '索引已中断';

  @override
  String get indexFailedBody => '中途出了点问题。重试会从中断的地方继续。';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已索引 $count 张照片',
      zero: '没有已索引的照片',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '其中 $percent% 带有位置信息';
  }

  @override
  String get commonLoading => '正在加载…';

  @override
  String get commonRetry => '重试';

  @override
  String get commonCancel => '取消';

  @override
  String hereRadiusLabel(String radius) {
    return '$radius 范围内';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 张照片',
      zero: '没有照片',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 次到访',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters 米';
  }

  @override
  String distanceKilometers(String km) {
    return '$km 公里';
  }

  @override
  String get ageToday => '今天';

  @override
  String get ageYesterday => '昨天';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天前',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months 个月前',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years 年前',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => '你在哪里？';

  @override
  String get locationPermissionBody =>
      'Been Here 会把你的位置与照片的拍摄地点进行比较。比较在这部手机上完成。';

  @override
  String get locationPermissionAction => '使用我的位置';

  @override
  String get locationDeniedTitle => '定位已关闭';

  @override
  String get locationDeniedBody => '没有定位，应用就不知道你在这里有什么。你可以在系统设置中开启。';

  @override
  String get locationUnavailableTitle => '尚未获得位置';

  @override
  String get locationUnavailableBody => '你的手机还没确定自己在哪里。在室内可能需要一会儿。';

  @override
  String get locationServicesDisabledTitle => '定位服务已关闭';

  @override
  String get locationServicesDisabledBody => '请在系统设置中开启，然后回来。';

  @override
  String get hereNothingTitle => '你没有在这里拍过照片';

  @override
  String get hereNothingBody => '试试更大的半径，或者回到你曾经去过的地方。';

  @override
  String hereNearestHint(String distance) {
    return '离你最近的回忆在 $distance 之外。';
  }

  @override
  String get photoDetailRephoto => '重拍';

  @override
  String get photoDetailRephotoSoon => '重拍功能将在后续版本中推出。';

  @override
  String photoDetailOf(int index, int total) {
    return '第 $index 张，共 $total 张';
  }

  @override
  String get debugLocationTitle => '调试位置';

  @override
  String get debugLocationBody => '假装身在别处，这样坐在沙发上就能测试“此处”页面。';

  @override
  String get debugLocationLatitude => '纬度';

  @override
  String get debugLocationLongitude => '经度';

  @override
  String get debugLocationApply => '前往该处';

  @override
  String get debugLocationClear => '使用真实位置';

  @override
  String get debugLocationActive => '调试位置已启用';

  @override
  String get commonClose => '关闭';

  @override
  String get placesEmptyTitle => '还没有地点';

  @override
  String get placesEmptyBody => '照片建立索引后，地点就会出现。';

  @override
  String get placesSortLabel => '排序方式';

  @override
  String get placesSortLongestAgo => '最久未去';

  @override
  String get placesSortMostPhotos => '照片最多';

  @override
  String get placesSortNearest => '最近';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个已静音的地点',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => '静音';

  @override
  String get placesUnmute => '取消静音';

  @override
  String get placesUseAutoRule => '自动决定';

  @override
  String get placesAutoMutedNote => '已自动静音——你几乎每天都在这里';

  @override
  String get placesUserMutedNote => '由你静音';

  @override
  String get placesUserUnmutedNote => '由你保持显示';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => '为地点命名';

  @override
  String get settingsPlaceNamesBody =>
      '请求系统把地点的坐标转换成名称。该坐标会发送给 Apple 或 Google——这是本应用中唯一会离开你手机的内容。默认关闭；再次关闭会清除所有名称。';

  @override
  String get settingsAutoMuteTitle => '日常地点静音的天数';

  @override
  String get settingsAutoMuteBody => '在这么多不同日子里都有照片的地方，是你生活的地方，而不是你到访的地方。';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天后',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => '照片索引';

  @override
  String get settingsReindex => '从头重新建立索引';

  @override
  String get settingsPrivacyTitle => '留在这部手机上的内容';

  @override
  String get settingsPrivacyBody => '你的照片、拍摄地点，以及本应用据此得出的一切。没有账户、没有服务器、没有分析。';

  @override
  String get placesName => '为此地点命名';

  @override
  String get placesRename => '重命名';

  @override
  String get placesNameDialogTitle => '地点名称';

  @override
  String get placesNameHint => '外婆家、湖边、办公室…';

  @override
  String get placesNameSave => '保存';

  @override
  String get placesNameClear => '移除名称';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => '你以前来过这里';

  @override
  String notificationBody(String age, String photos) {
    return '你上次来这里是$age。$photos。';
  }

  @override
  String get alwaysLocationTitle => '让 Been Here 替你留意';

  @override
  String get alwaysLocationBody =>
      '开启后台定位后，当你到达曾经拍过照的地方，手机可以通知 Been Here——应用会提醒你一次，你无需打开任何东西。\n\n应用从不跟踪你。你的手机只关注几个圆形区域，只有当你进入其中一个时才会唤醒应用。关于你位置的任何信息都不会离开这台设备。';

  @override
  String get alwaysLocationAction => '开启到达提醒';

  @override
  String get alwaysLocationLater => '以后再说';

  @override
  String get alwaysLocationDeniedBody =>
      '后台定位已关闭，所以不会有到达提醒。其他功能照常使用；你可以随时在系统设置中开启。';

  @override
  String get settingsArrivalsTitle => '到达提醒';

  @override
  String get settingsArrivalsOn => '当你到达一个许久未拍照的地方时，Been Here 会告诉你。';

  @override
  String get settingsArrivalsOff => 'Been Here 保持安静。开启时会请求后台定位。';

  @override
  String get settingsMemoryAgeTitle => '只提及早于此时间的地点';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => '之后让该地点安静';

  @override
  String get settingsDailyLimitTitle => '并且完全不提醒';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours 小时',
      zero: '不限制',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody => '调低这些值，无需等待半年就能试用到达提醒。';

  @override
  String get placesTestArrival => '在此测试到达';

  @override
  String get arrivalTestNotified => '已发送通知';

  @override
  String get arrivalTestMuted => '无：该地点已静音';

  @override
  String get arrivalTestTooFewPhotos => '无：这里的照片太少';

  @override
  String get arrivalTestTooRecent => '无：你最近才在这里拍过照';

  @override
  String get arrivalTestPlaceCooldown => '无：该地点最近刚提醒过';

  @override
  String get arrivalTestDailyLimit => '无：今天已经有别的提醒';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      '你的手机将定位保持为“使用 App 期间”。iOS 不会在应用内再次提供这个选择，因此需要在系统设置中把后台定位改为“始终”——到达提醒才会开始工作。';

  @override
  String get commonOpenSettings => '打开设置';

  @override
  String get settingsArrivalsPending => '就差一步：定位仍是“使用 App 期间”。请在系统设置中改为“始终”。';

  @override
  String get placesSortVisits => '到访最多';

  @override
  String get placesSortAscending => '倒序';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 次到访',
      zero: '从未到访',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => '在地图上显示地点';

  @override
  String get settingsMapBody =>
      '地图图块会在你拖动和缩放时从 OpenStreetMap 下载，因此该服务器会持续看到你在看哪里。与只查询一次的地点名称不同，只要地图开着，这就会一直持续。默认关闭。';

  @override
  String get placesShowMap => '地图';

  @override
  String get placesShowList => '列表';

  @override
  String get placesMapAttribution => '© OpenStreetMap 贡献者';

  @override
  String get rephotoOverlay => '淡入淡出';

  @override
  String get rephotoEdges => '轮廓';

  @override
  String get rephotoCapture => '拍摄';

  @override
  String get rephotoSaved => '已保存到你的照片';

  @override
  String get rephotoNotSaved => '无法保存。添加照片的权限可能已关闭。';

  @override
  String get rephotoNoCamera => '没有可用的相机。Been Here 需要相机来拍一张回应旧照片的新照片。';

  @override
  String get rephotoThenAndNow => '当年与今天';

  @override
  String get rephotoShare => '分享';

  @override
  String get rephotoThen => '当年';

  @override
  String get rephotoNow => '今天';

  @override
  String get rephotoShareFailed => '无法生成要分享的图片。';

  @override
  String get onboardingSkip => '跳过';

  @override
  String get onboardingNext => '下一步';

  @override
  String get onboardingWhatTitle => '你脚下这个地方的照片';

  @override
  String get onboardingWhatBody =>
      '到达一个你曾拍过照的地方，Been Here 就会按到访逐次展示你在那里拍的照片，最早的排在最前。';

  @override
  String get onboardingPrivacyTitle => '所有内容都不会离开你的手机';

  @override
  String get onboardingPrivacyBody =>
      '没有账户、没有服务器、没有分析。Been Here 在设备上读取你的照片图库，并在旁边保留一个小小的索引。你的照片以及拍摄地点，都原样留在原处。';

  @override
  String get onboardingPrivacyFootnote => '只有两项可能连接网络，而且在你开启之前都处于关闭状态：地点名称和地图。';

  @override
  String get onboardingPhotosTitle => '它需要你的照片';

  @override
  String get onboardingPhotosBody =>
      'Been Here 会记下哪张照片是在哪里拍的。它从不复制或移动任何东西——只记住 ID 和坐标，只有在给你看照片时才读取照片本身。';

  @override
  String get onboardingPhotosAction => '允许访问照片';

  @override
  String get onboardingDone => '开始';

  @override
  String get settingsAboutTitle => '关于';

  @override
  String settingsVersion(String version, String build) {
    return '版本 $version（$build）';
  }

  @override
  String get settingsSourceTitle => '源代码';

  @override
  String get settingsShowIntro => '再次查看介绍';

  @override
  String photoSemanticLabel(String date) {
    return '$date 的照片';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return '第 $index 张照片，共 $total 张，$date';
  }

  @override
  String get placesActionsLabel => '对此地点的操作';

  @override
  String get radiusSemanticLabel => '搜索半径';

  @override
  String get hereMapTitle => '附近';

  @override
  String get hereOpenInMaps => '在地图中打开';

  @override
  String get hereBackToMe => '回到我的位置';

  @override
  String get herePlaceFallbackTitle => '你熟悉的地方';

  @override
  String get arrivalTestNearHome => '离家太近，不算新鲜事。';

  @override
  String get settingsHomeRadiusTitle => '在此范围内保持安静';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '家附近 $km 公里',
      zero: '不设范围——从不安静',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      '日常生活都发生在家附近，而在那里对它评头论足的手机最不受欢迎。比这更近的地点永远不会被关注。';

  @override
  String get settingsQuietTitle => '为什么这么安静';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '正在关注 $count 个地点',
      zero: '没有关注任何地点',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return '最近的关注地点：$distance';
  }

  @override
  String get settingsQuietNothingWatched => '没有关注任何地点，所以不会有到达提醒。';

  @override
  String settingsQuietLastNotified(String when) {
    return '上次通知：$when';
  }

  @override
  String get settingsQuietNever => '从未';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return '在 $total 个地点中：$reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count 个已静音';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count 个离家近';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count 个照片太少';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count 个最近拍过';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count 个仍在冷却';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count 个值得关注';
  }

  @override
  String get ageSemanticLabel => '照片时间';

  @override
  String get ageStopNow => '现在';

  @override
  String get ageStopDay => '1 天';

  @override
  String get ageStop3Days => '3 天';

  @override
  String get ageStopWeek => '1 周';

  @override
  String get ageStop2Weeks => '2 周';

  @override
  String get ageStopMonth => '1 个月';

  @override
  String get ageStop3Months => '3 个月';

  @override
  String get ageStop6Months => '6 个月';

  @override
  String get ageStopYear => '1 年';

  @override
  String get ageStop2Years => '2 年';

  @override
  String get ageStop5Years => '5 年';

  @override
  String get ageStop10Years => '10 年';

  @override
  String get ageStopAll => '全部';

  @override
  String get ageWindowAll => '所有照片';

  @override
  String ageWindowNewerThan(String stop) {
    return '$stop以内';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return '早于$stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest至$oldest';
  }

  @override
  String get ageWindowReset => '重置';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ 张照片';
  }
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => '此處';

  @override
  String get placesTabLabel => '地點';

  @override
  String get settingsTabLabel => '設定';

  @override
  String get hereEmptyTitle => '你沒有在這裡拍過照片';

  @override
  String get hereEmptyBody => '擴大搜尋半徑，或回到你曾經去過的地方。';

  @override
  String get hereNotIndexedTitle => '尚未建立索引';

  @override
  String get hereNotIndexedBody =>
      'Been Here 需要讀取一次你的照片圖庫，才能知道你去過哪裡。任何內容都不會離開你的手機。';

  @override
  String get indexStartAction => '為我的照片建立索引';

  @override
  String get indexPermissionTitle => 'Been Here 需要存取你的照片';

  @override
  String get indexPermissionBody => '它只讀取每張照片的拍攝地點和時間，並將這些資訊保存在這支手機上。';

  @override
  String get indexPermissionAction => '允許存取';

  @override
  String get indexPermissionDeniedTitle => '照片存取已關閉';

  @override
  String get indexPermissionDeniedBody =>
      '沒有它，Been Here 無法為你顯示任何內容。你可以在系統設定中開啟。';

  @override
  String get indexLimitedAccessNotice =>
      '你只分享了部分照片，所以 Been Here 只能看到這些。允許完整存取後，它就能找到你去過的每一個地方。';

  @override
  String get indexRunningTitle => '正在讀取你的照片圖庫';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed / $total';
  }

  @override
  String get indexFailedTitle => '索引已中斷';

  @override
  String get indexFailedBody => '中途發生問題。重試會從中斷的地方繼續。';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已索引 $count 張照片',
      zero: '沒有已索引的照片',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '其中 $percent% 含有位置資訊';
  }

  @override
  String get commonLoading => '載入中…';

  @override
  String get commonRetry => '重試';

  @override
  String get commonCancel => '取消';

  @override
  String hereRadiusLabel(String radius) {
    return '$radius 範圍內';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 張照片',
      zero: '沒有照片',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 次造訪',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters 公尺';
  }

  @override
  String distanceKilometers(String km) {
    return '$km 公里';
  }

  @override
  String get ageToday => '今天';

  @override
  String get ageYesterday => '昨天';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天前',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months 個月前',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years 年前',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => '你在哪裡？';

  @override
  String get locationPermissionBody =>
      'Been Here 會將你的位置與照片的拍攝地點進行比較。比較在這支手機上完成。';

  @override
  String get locationPermissionAction => '使用我的位置';

  @override
  String get locationDeniedTitle => '定位已關閉';

  @override
  String get locationDeniedBody => '沒有定位，App 就不知道你在這裡有什麼。你可以在系統設定中開啟。';

  @override
  String get locationUnavailableTitle => '尚未取得位置';

  @override
  String get locationUnavailableBody => '你的手機還沒確定自己在哪裡。在室內可能需要一點時間。';

  @override
  String get locationServicesDisabledTitle => '定位服務已關閉';

  @override
  String get locationServicesDisabledBody => '請在系統設定中開啟，然後回來。';

  @override
  String get hereNothingTitle => '你沒有在這裡拍過照片';

  @override
  String get hereNothingBody => '試試更大的半徑，或回到你曾經去過的地方。';

  @override
  String hereNearestHint(String distance) {
    return '離你最近的回憶在 $distance 之外。';
  }

  @override
  String get photoDetailRephoto => '重拍';

  @override
  String get photoDetailRephotoSoon => '重拍功能將在之後的版本推出。';

  @override
  String photoDetailOf(int index, int total) {
    return '第 $index 張，共 $total 張';
  }

  @override
  String get debugLocationTitle => '除錯位置';

  @override
  String get debugLocationBody => '假裝身在別處，這樣坐在沙發上就能測試「此處」畫面。';

  @override
  String get debugLocationLatitude => '緯度';

  @override
  String get debugLocationLongitude => '經度';

  @override
  String get debugLocationApply => '前往該處';

  @override
  String get debugLocationClear => '使用真實位置';

  @override
  String get debugLocationActive => '除錯位置已啟用';

  @override
  String get commonClose => '關閉';

  @override
  String get placesEmptyTitle => '還沒有地點';

  @override
  String get placesEmptyBody => '照片建立索引後，地點就會出現。';

  @override
  String get placesSortLabel => '排序方式';

  @override
  String get placesSortLongestAgo => '最久未去';

  @override
  String get placesSortMostPhotos => '照片最多';

  @override
  String get placesSortNearest => '最近';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個已靜音的地點',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => '靜音';

  @override
  String get placesUnmute => '取消靜音';

  @override
  String get placesUseAutoRule => '自動決定';

  @override
  String get placesAutoMutedNote => '已自動靜音——你幾乎每天都在這裡';

  @override
  String get placesUserMutedNote => '由你靜音';

  @override
  String get placesUserUnmutedNote => '由你保持顯示';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => '為地點命名';

  @override
  String get settingsPlaceNamesBody =>
      '請系統將地點的座標轉換成名稱。該座標會傳送給 Apple 或 Google——這是本 App 中唯一會離開你手機的內容。預設關閉；再次關閉會清除所有名稱。';

  @override
  String get settingsAutoMuteTitle => '日常地點靜音的天數';

  @override
  String get settingsAutoMuteBody => '在這麼多不同日子裡都有照片的地方，是你生活的地方，而不是你造訪的地方。';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天後',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => '照片索引';

  @override
  String get settingsReindex => '從頭重新建立索引';

  @override
  String get settingsPrivacyTitle => '留在這支手機上的內容';

  @override
  String get settingsPrivacyBody =>
      '你的照片、拍攝地點，以及本 App 從中推得的一切。沒有帳號、沒有伺服器、沒有分析。';

  @override
  String get placesName => '為此地點命名';

  @override
  String get placesRename => '重新命名';

  @override
  String get placesNameDialogTitle => '地點名稱';

  @override
  String get placesNameHint => '外婆家、湖邊、辦公室…';

  @override
  String get placesNameSave => '儲存';

  @override
  String get placesNameClear => '移除名稱';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => '你以前來過這裡';

  @override
  String notificationBody(String age, String photos) {
    return '你上次來這裡是$age。$photos。';
  }

  @override
  String get alwaysLocationTitle => '讓 Been Here 替你留意';

  @override
  String get alwaysLocationBody =>
      '開啟背景定位後，當你抵達曾經拍過照的地方，手機可以通知 Been Here——App 會提醒你一次，你不必打開任何東西。\n\nApp 從不追蹤你。你的手機只留意幾個圓形區域，只有當你進入其中一個時才會喚醒 App。關於你位置的任何資訊都不會離開這部裝置。';

  @override
  String get alwaysLocationAction => '開啟抵達提醒';

  @override
  String get alwaysLocationLater => '稍後再說';

  @override
  String get alwaysLocationDeniedBody =>
      '背景定位已關閉，所以不會有抵達提醒。其他功能照常運作；你可以隨時在系統設定中開啟。';

  @override
  String get settingsArrivalsTitle => '抵達提醒';

  @override
  String get settingsArrivalsOn => '當你抵達一個許久沒拍照的地方時，Been Here 會告訴你。';

  @override
  String get settingsArrivalsOff => 'Been Here 保持安靜。開啟時會要求背景定位。';

  @override
  String get settingsMemoryAgeTitle => '只提及早於此時間的地點';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => '之後讓該地點安靜';

  @override
  String get settingsDailyLimitTitle => '並且完全不提醒';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours 小時',
      zero: '不限制',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody => '調低這些數值，不必等半年就能試用抵達提醒。';

  @override
  String get placesTestArrival => '在此測試抵達';

  @override
  String get arrivalTestNotified => '已傳送通知';

  @override
  String get arrivalTestMuted => '無：此地點已靜音';

  @override
  String get arrivalTestTooFewPhotos => '無：這裡的照片太少';

  @override
  String get arrivalTestTooRecent => '無：你最近才在這裡拍過照';

  @override
  String get arrivalTestPlaceCooldown => '無：此地點最近才提醒過';

  @override
  String get arrivalTestDailyLimit => '無：今天已經有別的提醒';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      '你的手機將定位保持為「使用 App 期間」。iOS 不會在 App 內再次提供這個選擇，因此需要在系統設定中將背景定位改為「永遠」——抵達提醒才會開始運作。';

  @override
  String get commonOpenSettings => '打開設定';

  @override
  String get settingsArrivalsPending => '就差一步：定位仍是「使用 App 期間」。請在系統設定中改為「永遠」。';

  @override
  String get placesSortVisits => '造訪最多';

  @override
  String get placesSortAscending => '反向排序';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 次造訪',
      zero: '從未造訪',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => '在地圖上顯示地點';

  @override
  String get settingsMapBody =>
      '地圖圖磚會在你拖曳和縮放時從 OpenStreetMap 下載，因此該伺服器會持續看到你在看哪裡。與只查詢一次的地點名稱不同，只要地圖開著，這就會一直持續。預設關閉。';

  @override
  String get placesShowMap => '地圖';

  @override
  String get placesShowList => '列表';

  @override
  String get placesMapAttribution => '© OpenStreetMap 貢獻者';

  @override
  String get rephotoOverlay => '淡入淡出';

  @override
  String get rephotoEdges => '輪廓';

  @override
  String get rephotoCapture => '拍攝';

  @override
  String get rephotoSaved => '已儲存到你的照片';

  @override
  String get rephotoNotSaved => '無法儲存。新增照片的權限可能已關閉。';

  @override
  String get rephotoNoCamera => '沒有可用的相機。Been Here 需要相機來拍一張回應舊照片的新照片。';

  @override
  String get rephotoThenAndNow => '當年與今天';

  @override
  String get rephotoShare => '分享';

  @override
  String get rephotoThen => '當年';

  @override
  String get rephotoNow => '今天';

  @override
  String get rephotoShareFailed => '無法產生要分享的圖片。';

  @override
  String get onboardingSkip => '略過';

  @override
  String get onboardingNext => '下一步';

  @override
  String get onboardingWhatTitle => '你腳下這個地方的照片';

  @override
  String get onboardingWhatBody =>
      '抵達一個你曾拍過照的地方，Been Here 就會依每次造訪顯示你在那裡拍的照片，最早的排在最前面。';

  @override
  String get onboardingPrivacyTitle => '任何內容都不會離開你的手機';

  @override
  String get onboardingPrivacyBody =>
      '沒有帳號、沒有伺服器、沒有分析。Been Here 在裝置上讀取你的照片圖庫，並在旁邊保留一個小小的索引。你的照片以及拍攝地點，都原封不動留在原處。';

  @override
  String get onboardingPrivacyFootnote => '只有兩項可能連上網路，而且在你開啟之前都是關閉的：地點名稱和地圖。';

  @override
  String get onboardingPhotosTitle => '它需要你的照片';

  @override
  String get onboardingPhotosBody =>
      'Been Here 會記下哪張照片是在哪裡拍的。它從不複製或移動任何東西——只記住 ID 和座標，只有在給你看照片時才讀取照片本身。';

  @override
  String get onboardingPhotosAction => '允許存取照片';

  @override
  String get onboardingDone => '開始';

  @override
  String get settingsAboutTitle => '關於';

  @override
  String settingsVersion(String version, String build) {
    return '版本 $version（$build）';
  }

  @override
  String get settingsSourceTitle => '原始碼';

  @override
  String get settingsShowIntro => '再次查看介紹';

  @override
  String photoSemanticLabel(String date) {
    return '$date 的照片';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return '第 $index 張照片，共 $total 張，$date';
  }

  @override
  String get placesActionsLabel => '對此地點的操作';

  @override
  String get radiusSemanticLabel => '搜尋半徑';

  @override
  String get hereMapTitle => '附近';

  @override
  String get hereOpenInMaps => '在地圖中打開';

  @override
  String get hereBackToMe => '回到我的位置';

  @override
  String get herePlaceFallbackTitle => '你熟悉的地方';

  @override
  String get arrivalTestNearHome => '離家太近，不算新鮮事。';

  @override
  String get settingsHomeRadiusTitle => '在此範圍內保持安靜';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '家附近 $km 公里',
      zero: '不設範圍——從不安靜',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      '日常生活都在家附近發生，而在那裡對它說三道四的手機最不受歡迎。比這更近的地點永遠不會被留意。';

  @override
  String get settingsQuietTitle => '為什麼這麼安靜';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '正在留意 $count 個地點',
      zero: '沒有留意任何地點',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return '最近的留意地點：$distance';
  }

  @override
  String get settingsQuietNothingWatched => '沒有留意任何地點，所以不會有抵達提醒。';

  @override
  String settingsQuietLastNotified(String when) {
    return '上次通知：$when';
  }

  @override
  String get settingsQuietNever => '從未';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return '在 $total 個地點中：$reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count 個已靜音';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count 個離家近';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count 個照片太少';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count 個最近拍過';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count 個仍在冷卻';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count 個值得留意';
  }

  @override
  String get ageSemanticLabel => '照片時間';

  @override
  String get ageStopNow => '現在';

  @override
  String get ageStopDay => '1 天';

  @override
  String get ageStop3Days => '3 天';

  @override
  String get ageStopWeek => '1 週';

  @override
  String get ageStop2Weeks => '2 週';

  @override
  String get ageStopMonth => '1 個月';

  @override
  String get ageStop3Months => '3 個月';

  @override
  String get ageStop6Months => '6 個月';

  @override
  String get ageStopYear => '1 年';

  @override
  String get ageStop2Years => '2 年';

  @override
  String get ageStop5Years => '5 年';

  @override
  String get ageStop10Years => '10 年';

  @override
  String get ageStopAll => '全部';

  @override
  String get ageWindowAll => '所有照片';

  @override
  String ageWindowNewerThan(String stop) {
    return '$stop以內';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return '早於$stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest至$oldest';
  }

  @override
  String get ageWindowReset => '重設';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ 張照片';
  }
}
