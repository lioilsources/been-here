// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Burada';

  @override
  String get placesTabLabel => 'Yerler';

  @override
  String get settingsTabLabel => 'Ayarlar';

  @override
  String get hereEmptyTitle => 'Burada fotoğraf çekmemişsin';

  @override
  String get hereEmptyBody =>
      'Arama yarıçapını büyüt ya da daha önce bulunduğun bir yere geri dön.';

  @override
  String get hereNotIndexedTitle => 'Henüz hiçbir şey dizinlenmedi';

  @override
  String get hereNotIndexedBody =>
      'Been Here\'ın nerelerde bulunduğunu bilmesi için fotoğraf arşivini bir kez okuması gerekiyor. Hiçbir şey telefonundan çıkmaz.';

  @override
  String get indexStartAction => 'Fotoğraflarımı dizinle';

  @override
  String get indexPermissionTitle =>
      'Been Here\'ın fotoğraflarına ihtiyacı var';

  @override
  String get indexPermissionBody =>
      'Yalnızca her fotoğrafın nerede ve ne zaman çekildiğini okur ve bunu bu telefonda tutar.';

  @override
  String get indexPermissionAction => 'Erişime izin ver';

  @override
  String get indexPermissionDeniedTitle => 'Fotoğraf erişimi kapalı';

  @override
  String get indexPermissionDeniedBody =>
      'Bu olmadan Been Here sana hiçbir şey gösteremez. Sistem ayarlarından açabilirsin.';

  @override
  String get indexLimitedAccessNotice =>
      'Yalnızca seçili fotoğrafları paylaştın, bu yüzden Been Here yalnızca onları görebiliyor. Tam erişim, bulunduğun her yeri bulmasını sağlar.';

  @override
  String get indexRunningTitle => 'Fotoğraf arşivin okunuyor';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed / $total';
  }

  @override
  String get indexFailedTitle => 'Dizinleme durdu';

  @override
  String get indexFailedBody =>
      'Yarı yolda bir şeyler ters gitti. Yeniden denemek kaldığı yerden devam eder.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotoğraf dizinlendi',
      one: '$count fotoğraf dizinlendi',
      zero: 'Dizinlenmiş fotoğraf yok',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '%$percent kadarında konum var';
  }

  @override
  String get commonLoading => 'Yükleniyor…';

  @override
  String get commonRetry => 'Tekrar dene';

  @override
  String get commonCancel => 'İptal';

  @override
  String hereRadiusLabel(String radius) {
    return '$radius içinde';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotoğraf',
      one: '$count fotoğraf',
      zero: 'Fotoğraf yok',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ziyaret',
      one: '$count ziyaret',
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
  String get ageToday => 'Bugün';

  @override
  String get ageYesterday => 'Dün';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days gün önce',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months ay önce',
      one: 'Bir ay önce',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years yıl önce',
      one: 'Bir yıl önce',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Neredesin?';

  @override
  String get locationPermissionBody =>
      'Been Here konumunu fotoğraflarının çekildiği yerlerle karşılaştırır. Karşılaştırma bu telefonda yapılır.';

  @override
  String get locationPermissionAction => 'Konumumu kullan';

  @override
  String get locationDeniedTitle => 'Konum kapalı';

  @override
  String get locationDeniedBody =>
      'Konum olmadan uygulama burada neyin olduğunu bilemez. Sistem ayarlarından açabilirsin.';

  @override
  String get locationUnavailableTitle => 'Henüz konum yok';

  @override
  String get locationUnavailableBody =>
      'Telefonun henüz nerede olduğunu bulamadı. Kapalı alanda bu biraz sürebilir.';

  @override
  String get locationServicesDisabledTitle => 'Konum servisleri kapalı';

  @override
  String get locationServicesDisabledBody =>
      'Sistem ayarlarından aç ve geri gel.';

  @override
  String get hereNothingTitle => 'Burada fotoğraf çekmemişsin';

  @override
  String get hereNothingBody =>
      'Daha geniş bir yarıçap dene ya da daha önce bulunduğun bir yere geri dön.';

  @override
  String hereNearestHint(String distance) {
    return 'En yakın anın $distance uzakta.';
  }

  @override
  String get photoDetailRephoto => 'Yeniden çek';

  @override
  String get photoDetailRephotoSoon =>
      'Yeniden çekim sonraki bir sürümde gelecek.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index / $total';
  }

  @override
  String get debugLocationTitle => 'Test konumu';

  @override
  String get debugLocationBody =>
      'Burada ekranının kanepeden test edilebilmesi için başka bir yerdeymiş gibi yap.';

  @override
  String get debugLocationLatitude => 'Enlem';

  @override
  String get debugLocationLongitude => 'Boylam';

  @override
  String get debugLocationApply => 'Oraya git';

  @override
  String get debugLocationClear => 'Gerçek konumu kullan';

  @override
  String get debugLocationActive => 'Test konumu etkin';

  @override
  String get commonClose => 'Kapat';

  @override
  String get placesEmptyTitle => 'Henüz yer yok';

  @override
  String get placesEmptyBody => 'Fotoğrafların dizinlenince yerler görünür.';

  @override
  String get placesSortLabel => 'Sırala';

  @override
  String get placesSortLongestAgo => 'En uzun süre önce';

  @override
  String get placesSortMostPhotos => 'En çok fotoğraf';

  @override
  String get placesSortNearest => 'En yakın';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sessize alınmış yer',
      one: '$count sessize alınmış yer',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Sessize al';

  @override
  String get placesUnmute => 'Sesi aç';

  @override
  String get placesUseAutoRule => 'Otomatik karar ver';

  @override
  String get placesAutoMutedNote =>
      'Otomatik olarak sessizde — buraya çoğu gün geliyorsun';

  @override
  String get placesUserMutedNote => 'Sen sessize aldın';

  @override
  String get placesUserUnmutedNote => 'Sen görünür tuttun';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days gün',
      one: '$days gün',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Yerleri adlandır';

  @override
  String get settingsPlaceNamesBody =>
      'Sistemden bir yerin koordinatlarını bir ada dönüştürmesini ister. Bu koordinat Apple\'a veya Google\'a gider — bu uygulamada telefonundan çıkan tek şey budur. Varsayılan olarak kapalı; tekrar kapatınca tüm adlar unutulur.';

  @override
  String get settingsAutoMuteTitle =>
      'Gündelik yerleri şu süreden sonra sessize al';

  @override
  String get settingsAutoMuteBody =>
      'Bu kadar farklı günde fotoğraf çekilmiş bir yer, ziyaret ettiğin değil, yaşadığın bir yerdir.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days gün',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Fotoğraf dizini';

  @override
  String get settingsReindex => 'Baştan yeniden dizinle';

  @override
  String get settingsPrivacyTitle => 'Bu telefonda kalanlar';

  @override
  String get settingsPrivacyBody =>
      'Fotoğrafların, nerede çekildikleri ve bu uygulamanın onlardan çıkardığı her şey. Hesap, sunucu ya da analiz yok.';

  @override
  String get placesName => 'Bu yere ad ver';

  @override
  String get placesRename => 'Yeniden adlandır';

  @override
  String get placesNameDialogTitle => 'Yerin adı';

  @override
  String get placesNameHint => 'Anneannemler, göl, ofis…';

  @override
  String get placesNameSave => 'Kaydet';

  @override
  String get placesNameClear => 'Adı kaldır';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Buraya daha önce gelmiştin';

  @override
  String notificationBody(String age, String photos) {
    return 'Buraya son gelişin: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Been Here senin yerine fark etsin';

  @override
  String get alwaysLocationBody =>
      'Arka planda konum ile telefonun, daha önce fotoğrafladığın bir yere vardığında Been Here\'a haber verebilir — uygulama da sen hiçbir şey açmadan bunu bir kez söyleyebilir.\n\nUygulama seni asla takip etmez. Telefonun bir avuç çemberi izler ve yalnızca birine girdiğinde uygulamayı uyandırır. Nerede olduğunla ilgili hiçbir şey bu cihazdan çıkmaz.';

  @override
  String get alwaysLocationAction => 'Varışları aç';

  @override
  String get alwaysLocationLater => 'Şimdi değil';

  @override
  String get alwaysLocationDeniedBody =>
      'Arka planda konum kapalı, bu yüzden varışlar sessiz kalır. Diğer her şey eskisi gibi çalışır; istediğin zaman sistem ayarlarından açabilirsin.';

  @override
  String get settingsArrivalsTitle => 'Varışlar';

  @override
  String get settingsArrivalsOn =>
      'Been Here, bir süredir fotoğraflamadığın bir yere vardığında sana haber verir.';

  @override
  String get settingsArrivalsOff =>
      'Been Here sessiz kalır. Açmak arka planda konum izni ister.';

  @override
  String get settingsMemoryAgeTitle => 'Yalnızca şundan eski yerlerden bahset';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days gün',
      one: '$days gün',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => 'Sonra o yeri şu süre sessiz tut';

  @override
  String get settingsDailyLimitTitle => 'Ve şu süre hiçbir şey söyleme';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours saat',
      one: '$hours saat',
      zero: 'hiç',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Varışları yarım yıl beklemeden denemek için bunları düşür.';

  @override
  String get placesTestArrival => 'Burada bir varışı test et';

  @override
  String get arrivalTestNotified => 'Bildirim gönderildi';

  @override
  String get arrivalTestMuted => 'Hiçbir şey: yer sessizde';

  @override
  String get arrivalTestTooFewPhotos =>
      'Hiçbir şey: burada çok az fotoğraf var';

  @override
  String get arrivalTestTooRecent =>
      'Hiçbir şey: burayı çok yakın zamanda fotoğrafladın';

  @override
  String get arrivalTestPlaceCooldown =>
      'Hiçbir şey: bu yer yakın zamanda konuştu';

  @override
  String get arrivalTestDailyLimit => 'Hiçbir şey: bugün başka bir şey konuştu';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Telefonun konumu \"Uygulamayı Kullanırken\" olarak bıraktı. iOS bu seçimi uygulama içinden tekrar sunmaz, bu yüzden arka planda konumun sistem ayarlarından \"Her Zaman\" olarak değiştirilmesi gerekir — sonra varışlar çalışmaya başlar.';

  @override
  String get commonOpenSettings => 'Ayarları aç';

  @override
  String get settingsArrivalsPending =>
      'Neredeyse: konum hâlâ \"Uygulamayı Kullanırken\". Sistem ayarlarından \"Her Zaman\" yap.';

  @override
  String get placesSortVisits => 'En çok ziyaret';

  @override
  String get placesSortAscending => 'Ters sıra';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ziyaret',
      one: '$count ziyaret',
      zero: 'hiç',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Yerleri haritada göster';

  @override
  String get settingsMapBody =>
      'Harita parçaları sen kaydırıp yakınlaştırdıkça OpenStreetMap\'ten indirilir, bu yüzden o sunucu nereye baktığını sürekli görür. Bir kez sorulan yer adının aksine, bu harita açık kaldığı sürece devam eder. Varsayılan olarak kapalı.';

  @override
  String get placesShowMap => 'Harita';

  @override
  String get placesShowList => 'Liste';

  @override
  String get placesMapAttribution => '© OpenStreetMap katkıda bulunanlar';

  @override
  String get rephotoOverlay => 'Soldur';

  @override
  String get rephotoEdges => 'Kontur';

  @override
  String get rephotoCapture => 'Çek';

  @override
  String get rephotoSaved => 'Fotoğraflarına kaydedildi';

  @override
  String get rephotoNotSaved =>
      'Kaydedilemedi. Fotoğraf ekleme kapalı olabilir.';

  @override
  String get rephotoNoCamera =>
      'Kamera yok. Been Here\'ın eski bir fotoğrafa yanıt veren bir fotoğraf çekmesi için kameraya ihtiyacı var.';

  @override
  String get rephotoThenAndNow => 'O zaman ve şimdi';

  @override
  String get rephotoShare => 'Paylaş';

  @override
  String get rephotoThen => 'O zaman';

  @override
  String get rephotoNow => 'Şimdi';

  @override
  String get rephotoShareFailed => 'Paylaşılacak görüntü oluşturulamadı.';

  @override
  String get onboardingSkip => 'Atla';

  @override
  String get onboardingNext => 'İleri';

  @override
  String get onboardingWhatTitle => 'Tam durduğun yerden fotoğraflar';

  @override
  String get onboardingWhatBody =>
      'Daha önce fotoğrafladığın bir yere var, Been Here orada çektiklerini sana göstersin — ziyaret ziyaret, en eskisi önce.';

  @override
  String get onboardingPrivacyTitle => 'Hiçbir şey telefonundan çıkmaz';

  @override
  String get onboardingPrivacyBody =>
      'Hesap yok, sunucu yok, analiz yok. Been Here fotoğraf arşivini cihazda okur ve yanında küçük bir dizin tutar. Fotoğrafların ve nerede çekildikleri olduğu yerde kalır.';

  @override
  String get onboardingPrivacyFootnote =>
      'İki şey ağa ulaşabilir ve ikisi de sen açana kadar kapalıdır: yer adları ve harita.';

  @override
  String get onboardingPhotosTitle => 'Fotoğraflarına ihtiyacı var';

  @override
  String get onboardingPhotosBody =>
      'Been Here hangi fotoğrafın nerede çekildiğini not eder. Hiçbir şeyi kopyalamaz ya da taşımaz — kimlikleri ve koordinatları hatırlar, görüntülerin kendisini yalnızca sana gösterirken okur.';

  @override
  String get onboardingPhotosAction => 'Fotoğraflara izin ver';

  @override
  String get onboardingDone => 'Başla';

  @override
  String get settingsAboutTitle => 'Hakkında';

  @override
  String settingsVersion(String version, String build) {
    return 'Sürüm $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Kaynak kodu';

  @override
  String get settingsShowIntro => 'Tanıtımı tekrar göster';

  @override
  String photoSemanticLabel(String date) {
    return '$date tarihli fotoğraf';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Fotoğraf $index / $total, $date';
  }

  @override
  String get placesActionsLabel => 'Bu yerle ne yapılacak';

  @override
  String get radiusSemanticLabel => 'Arama yarıçapı';

  @override
  String get hereMapTitle => 'Buralarda';

  @override
  String get hereOpenInMaps => 'Haritalar\'da aç';

  @override
  String get hereBackToMe => 'Bulunduğum yere dön';

  @override
  String get herePlaceFallbackTitle => 'Tanıdığın bir yer';

  @override
  String get arrivalTestNearHome => 'Haber olamayacak kadar eve yakın.';

  @override
  String get settingsHomeRadiusTitle => 'Şu mesafe içinde sessiz kal';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: 'evden $km km',
      one: 'evden $km km',
      zero: 'mesafe yok — asla sessiz değil',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'Gündelik hayat eve yakın geçer ve onu yorumlayan bir telefon en az orada hoş karşılanır. Bundan daha yakın yerler asla izlenmez.';

  @override
  String get settingsQuietTitle => 'Neden sessiz';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yer izleniyor',
      one: '$count yer izleniyor',
      zero: 'Hiçbir yer izlenmiyor',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'İzlenen en yakın yer: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Hiçbir şey izlenmiyor, bu yüzden hiçbir varış olamaz.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Son bildirim: $when';
  }

  @override
  String get settingsQuietNever => 'hiç';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return '$total yerden: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count sessizde';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count eve yakın';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count çok az fotoğraflı';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count yakın zamanda fotoğraflandı';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count hâlâ beklemede';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count izlemeye değer';
  }

  @override
  String get ageSemanticLabel => 'Fotoğraf yaşı';

  @override
  String get ageStopNow => 'şimdi';

  @override
  String get ageStopDay => '1 gün';

  @override
  String get ageStop3Days => '3 gün';

  @override
  String get ageStopWeek => '1 hafta';

  @override
  String get ageStop2Weeks => '2 hafta';

  @override
  String get ageStopMonth => '1 ay';

  @override
  String get ageStop3Months => '3 ay';

  @override
  String get ageStop6Months => '6 ay';

  @override
  String get ageStopYear => '1 yıl';

  @override
  String get ageStop2Years => '2 yıl';

  @override
  String get ageStop5Years => '5 yıl';

  @override
  String get ageStop10Years => '10 yıl';

  @override
  String get ageStopAll => 'tümü';

  @override
  String get ageWindowAll => 'Tüm fotoğraflar';

  @override
  String ageWindowNewerThan(String stop) {
    return 'En fazla $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return '$stop üzeri';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest – $oldest';
  }

  @override
  String get ageWindowReset => 'Sıfırla';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ fotoğraf';
  }
}
