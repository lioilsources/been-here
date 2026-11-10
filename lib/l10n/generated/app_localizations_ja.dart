// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'ここ';

  @override
  String get placesTabLabel => '場所';

  @override
  String get settingsTabLabel => '設定';

  @override
  String get hereEmptyTitle => 'ここで撮った写真はありません';

  @override
  String get hereEmptyBody => '検索範囲を広げるか、以前行ったことのある場所に戻ってみてください。';

  @override
  String get hereNotIndexedTitle => 'まだインデックスがありません';

  @override
  String get hereNotIndexedBody =>
      'Been Here は、あなたが行った場所を知るために写真ライブラリを一度読み込む必要があります。データが端末の外に出ることはありません。';

  @override
  String get indexStartAction => '写真をインデックス';

  @override
  String get indexPermissionTitle => 'Been Here には写真へのアクセスが必要です';

  @override
  String get indexPermissionBody => '読み取るのは各写真の撮影場所と日時だけで、その情報はこの端末に保存されます。';

  @override
  String get indexPermissionAction => 'アクセスを許可';

  @override
  String get indexPermissionDeniedTitle => '写真へのアクセスがオフです';

  @override
  String get indexPermissionDeniedBody =>
      'アクセスがないと Been Here は何も表示できません。システム設定でオンにできます。';

  @override
  String get indexLimitedAccessNotice =>
      '選択した写真だけを共有しているため、Been Here にはそれらしか見えません。フルアクセスを許可すると、訪れたすべての場所を見つけられます。';

  @override
  String get indexRunningTitle => '写真ライブラリを読み込み中';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed / $total';
  }

  @override
  String get indexFailedTitle => 'インデックス作成が止まりました';

  @override
  String get indexFailedBody => '途中で問題が発生しました。再試行すると、止まったところから続きます。';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 枚の写真をインデックス済み',
      zero: 'インデックス済みの写真はありません',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return 'そのうち $percent% に位置情報があります';
  }

  @override
  String get commonLoading => '読み込み中…';

  @override
  String get commonRetry => '再試行';

  @override
  String get commonCancel => 'キャンセル';

  @override
  String hereRadiusLabel(String radius) {
    return '$radius 以内';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 枚の写真',
      zero: '写真なし',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 回の訪問',
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
  String get ageToday => '今日';

  @override
  String get ageYesterday => '昨日';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 日前',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months か月前',
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
  String get locationPermissionTitle => '今どこにいますか？';

  @override
  String get locationPermissionBody =>
      'Been Here は、現在地と写真の撮影場所を比較します。比較はこの端末上で行われます。';

  @override
  String get locationPermissionAction => '現在地を使用';

  @override
  String get locationDeniedTitle => '位置情報がオフです';

  @override
  String get locationDeniedBody =>
      '位置情報がないと、ここに何があるのかアプリにはわかりません。システム設定でオンにできます。';

  @override
  String get locationUnavailableTitle => 'まだ位置を取得できていません';

  @override
  String get locationUnavailableBody =>
      '端末がまだ現在地を特定できていません。屋内では少し時間がかかることがあります。';

  @override
  String get locationServicesDisabledTitle => '位置情報サービスがオフです';

  @override
  String get locationServicesDisabledBody => 'システム設定でオンにしてから戻ってきてください。';

  @override
  String get hereNothingTitle => 'ここで撮った写真はありません';

  @override
  String get hereNothingBody => '範囲を広げるか、以前行ったことのある場所に戻ってみてください。';

  @override
  String hereNearestHint(String distance) {
    return 'いちばん近い思い出は $distance 先です。';
  }

  @override
  String get photoDetailRephoto => '撮り直す';

  @override
  String get photoDetailRephotoSoon => '撮り直しは今後のバージョンで対応予定です。';

  @override
  String photoDetailOf(int index, int total) {
    return '$index / $total';
  }

  @override
  String get debugLocationTitle => 'デバッグ用の位置';

  @override
  String get debugLocationBody => '別の場所にいることにして、ソファにいながら「ここ」画面をテストできます。';

  @override
  String get debugLocationLatitude => '緯度';

  @override
  String get debugLocationLongitude => '経度';

  @override
  String get debugLocationApply => 'そこへ移動';

  @override
  String get debugLocationClear => '実際の位置を使う';

  @override
  String get debugLocationActive => 'デバッグ用の位置を使用中';

  @override
  String get commonClose => '閉じる';

  @override
  String get placesEmptyTitle => 'まだ場所がありません';

  @override
  String get placesEmptyBody => '写真のインデックスが済むと場所が表示されます。';

  @override
  String get placesSortLabel => '並べ替え';

  @override
  String get placesSortLongestAgo => '最後に訪れたのが古い順';

  @override
  String get placesSortMostPhotos => '写真が多い順';

  @override
  String get placesSortNearest => '近い順';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ミュート中の場所 $count 件',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'ミュート';

  @override
  String get placesUnmute => 'ミュート解除';

  @override
  String get placesUseAutoRule => '自動で判断';

  @override
  String get placesAutoMutedNote => '自動でミュート — ほぼ毎日ここにいます';

  @override
  String get placesUserMutedNote => 'あなたがミュートしました';

  @override
  String get placesUserUnmutedNote => 'あなたが表示を維持しています';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 日',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => '場所に名前を付ける';

  @override
  String get settingsPlaceNamesBody =>
      '場所の座標を地名に変換するようシステムに依頼します。その座標は Apple または Google に送信されます。このアプリで端末の外に出るのはこれだけです。初期設定はオフで、再びオフにするとすべての名前が消去されます。';

  @override
  String get settingsAutoMuteTitle => '日常の場所をミュートするまでの日数';

  @override
  String get settingsAutoMuteBody =>
      'これほど多くの別々の日に写真がある場所は、訪れる場所ではなく暮らしている場所です。';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 日',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => '写真インデックス';

  @override
  String get settingsReindex => '最初からインデックスし直す';

  @override
  String get settingsPrivacyTitle => 'この端末に残るもの';

  @override
  String get settingsPrivacyBody =>
      'あなたの写真、撮影場所、そしてこのアプリがそこから導き出すすべて。アカウントもサーバーも分析もありません。';

  @override
  String get placesName => 'この場所に名前を付ける';

  @override
  String get placesRename => '名前を変更';

  @override
  String get placesNameDialogTitle => '場所の名前';

  @override
  String get placesNameHint => 'おばあちゃんの家、湖、オフィス…';

  @override
  String get placesNameSave => '保存';

  @override
  String get placesNameClear => '名前を削除';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => '以前ここに来たことがあります';

  @override
  String notificationBody(String age, String photos) {
    return '前回ここに来たのは $age。$photos。';
  }

  @override
  String get alwaysLocationTitle => 'Been Here に気づかせましょう';

  @override
  String get alwaysLocationBody =>
      'バックグラウンドの位置情報を使うと、以前写真を撮った場所に着いたときに端末が Been Here に知らせ、アプリを開かなくても一度だけお知らせできます。\n\nアプリがあなたを追跡することはありません。端末はいくつかの円を見守り、そのどれかに入ったときだけアプリを起こします。あなたの居場所に関する情報がこの端末の外に出ることはありません。';

  @override
  String get alwaysLocationAction => '到着通知をオンにする';

  @override
  String get alwaysLocationLater => '後で';

  @override
  String get alwaysLocationDeniedBody =>
      'バックグラウンドの位置情報がオフのため、到着通知は届きません。ほかの機能はこれまでどおり使えます。システム設定でいつでもオンにできます。';

  @override
  String get settingsArrivalsTitle => '到着通知';

  @override
  String get settingsArrivalsOn => 'しばらく写真を撮っていない場所に着くと、Been Here がお知らせします。';

  @override
  String get settingsArrivalsOff =>
      'Been Here は通知しません。オンにするとバックグラウンドの位置情報を求めます。';

  @override
  String get settingsMemoryAgeTitle => '通知するのはこれより前の場所だけ';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 日',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => 'その後、その場所を静かにする期間';

  @override
  String get settingsDailyLimitTitle => 'さらに何も通知しない期間';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours 時間',
      zero: 'なし',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody => '値を下げると、半年待たずに到着通知を試せます。';

  @override
  String get placesTestArrival => 'ここで到着をテスト';

  @override
  String get arrivalTestNotified => '通知を送信しました';

  @override
  String get arrivalTestMuted => 'なし: この場所はミュート中です';

  @override
  String get arrivalTestTooFewPhotos => 'なし: ここの写真が少なすぎます';

  @override
  String get arrivalTestTooRecent => 'なし: ここでは最近撮影したばかりです';

  @override
  String get arrivalTestPlaceCooldown => 'なし: この場所は最近通知しました';

  @override
  String get arrivalTestDailyLimit => 'なし: 今日はすでに別の通知がありました';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      '位置情報が「このAppの使用中のみ許可」のままです。iOS はアプリ内でこの選択を再度表示しないため、システム設定でバックグラウンドの位置情報を「常に」に変更する必要があります。そうすれば到着通知が動き始めます。';

  @override
  String get commonOpenSettings => '設定を開く';

  @override
  String get settingsArrivalsPending =>
      'あと少し: 位置情報がまだ「このAppの使用中のみ許可」です。システム設定で「常に」にしてください。';

  @override
  String get placesSortVisits => '訪問回数が多い順';

  @override
  String get placesSortAscending => '逆順';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 回の訪問',
      zero: 'なし',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => '場所を地図に表示';

  @override
  String get settingsMapBody =>
      '地図タイルはスクロールやズームに合わせて OpenStreetMap からダウンロードされるため、そのサーバーにはあなたがどこを見ているかが継続的に伝わります。一度だけ問い合わせる地名とは違い、地図を開いている間ずっと続きます。初期設定はオフです。';

  @override
  String get placesShowMap => '地図';

  @override
  String get placesShowList => 'リスト';

  @override
  String get placesMapAttribution => '© OpenStreetMap contributors';

  @override
  String get rephotoOverlay => '重ねる';

  @override
  String get rephotoEdges => '輪郭';

  @override
  String get rephotoCapture => '撮影';

  @override
  String get rephotoSaved => '写真に保存しました';

  @override
  String get rephotoNotSaved => '保存できませんでした。写真の追加がオフになっている可能性があります。';

  @override
  String get rephotoNoCamera =>
      'カメラを使用できません。昔の写真に応える一枚を撮るには、Been Here にカメラが必要です。';

  @override
  String get rephotoThenAndNow => 'あの頃と今';

  @override
  String get rephotoShare => '共有';

  @override
  String get rephotoThen => 'あの頃';

  @override
  String get rephotoNow => '今';

  @override
  String get rephotoShareFailed => '共有用の画像を作成できませんでした。';

  @override
  String get onboardingSkip => 'スキップ';

  @override
  String get onboardingNext => '次へ';

  @override
  String get onboardingWhatTitle => '今立っている場所の写真';

  @override
  String get onboardingWhatBody =>
      '以前写真を撮った場所に着くと、Been Here がそこで撮った写真を訪問ごとに、古い順に表示します。';

  @override
  String get onboardingPrivacyTitle => 'データは端末の外に出ません';

  @override
  String get onboardingPrivacyBody =>
      'アカウントもサーバーも分析もありません。Been Here は端末上で写真ライブラリを読み込み、その横に小さなインデックスを保持します。写真も撮影場所も、元の場所に残ります。';

  @override
  String get onboardingPrivacyFootnote =>
      'ネットワークに接続しうるのは2つだけで、どちらもオンにするまでオフです: 地名と地図。';

  @override
  String get onboardingPhotosTitle => '写真へのアクセスが必要です';

  @override
  String get onboardingPhotosBody =>
      'Been Here はどの写真がどこで撮られたかを記録します。コピーや移動は一切せず、ID と座標だけを覚え、写真そのものは表示するときにだけ読み込みます。';

  @override
  String get onboardingPhotosAction => '写真を許可';

  @override
  String get onboardingDone => '始める';

  @override
  String get settingsAboutTitle => 'このアプリについて';

  @override
  String settingsVersion(String version, String build) {
    return 'バージョン $version（$build）';
  }

  @override
  String get settingsSourceTitle => 'ソースコード';

  @override
  String get settingsShowIntro => '紹介をもう一度見る';

  @override
  String photoSemanticLabel(String date) {
    return '$date の写真';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return '写真 $index / $total、$date';
  }

  @override
  String get placesActionsLabel => 'この場所への操作';

  @override
  String get radiusSemanticLabel => '検索範囲';

  @override
  String get hereMapTitle => 'この周辺';

  @override
  String get hereOpenInMaps => 'マップで開く';

  @override
  String get hereBackToMe => '現在地に戻る';

  @override
  String get herePlaceFallbackTitle => '知っている場所';

  @override
  String get arrivalTestNearHome => '自宅に近すぎるのでお知らせしません。';

  @override
  String get settingsHomeRadiusTitle => '通知しない自宅からの範囲';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '自宅から $km km',
      zero: 'なし — 常に通知',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      '日常は自宅の近くで営まれ、そこでいちいち口を出す端末ほど歓迎されないものはありません。これより近い場所は見守りません。';

  @override
  String get settingsQuietTitle => '通知が来ない理由';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count か所を見守り中',
      zero: '見守っている場所はありません',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return '見守り中の最寄りの場所: $distance';
  }

  @override
  String get settingsQuietNothingWatched => '何も見守っていないので、到着通知は届きません。';

  @override
  String settingsQuietLastNotified(String when) {
    return '最後の通知: $when';
  }

  @override
  String get settingsQuietNever => 'なし';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return '$total か所のうち: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return 'ミュート $count';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '自宅の近く $count';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '写真が少なすぎる $count';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '最近撮影した $count';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '休止中 $count';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '見守る価値あり $count';
  }

  @override
  String get ageSemanticLabel => '写真の古さ';

  @override
  String get ageStopNow => '今';

  @override
  String get ageStopDay => '1日';

  @override
  String get ageStop3Days => '3日';

  @override
  String get ageStopWeek => '1週間';

  @override
  String get ageStop2Weeks => '2週間';

  @override
  String get ageStopMonth => '1か月';

  @override
  String get ageStop3Months => '3か月';

  @override
  String get ageStop6Months => '6か月';

  @override
  String get ageStopYear => '1年';

  @override
  String get ageStop2Years => '2年';

  @override
  String get ageStop5Years => '5年';

  @override
  String get ageStop10Years => '10年';

  @override
  String get ageStopAll => 'すべて';

  @override
  String get ageWindowAll => 'すべての写真';

  @override
  String ageWindowNewerThan(String stop) {
    return '$stop 以内';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return '$stop より前';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest〜$oldest';
  }

  @override
  String get ageWindowReset => 'リセット';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ 枚';
  }
}
