// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Di sini';

  @override
  String get placesTabLabel => 'Tempat';

  @override
  String get settingsTabLabel => 'Pengaturan';

  @override
  String get hereEmptyTitle => 'Kamu belum memotret di sini';

  @override
  String get hereEmptyBody =>
      'Perluas radius pencarian, atau kembali ke tempat yang pernah kamu kunjungi.';

  @override
  String get hereNotIndexedTitle => 'Belum ada yang diindeks';

  @override
  String get hereNotIndexedBody =>
      'Been Here perlu membaca galeri fotomu sekali untuk tahu ke mana saja kamu pernah pergi. Tidak ada yang keluar dari ponselmu.';

  @override
  String get indexStartAction => 'Indeks foto saya';

  @override
  String get indexPermissionTitle => 'Been Here memerlukan fotomu';

  @override
  String get indexPermissionBody =>
      'Aplikasi hanya membaca di mana dan kapan setiap foto diambil, dan menyimpannya di ponsel ini.';

  @override
  String get indexPermissionAction => 'Izinkan akses';

  @override
  String get indexPermissionDeniedTitle => 'Akses foto nonaktif';

  @override
  String get indexPermissionDeniedBody =>
      'Tanpa akses ini, Been Here tidak bisa menampilkan apa pun. Kamu bisa mengaktifkannya di pengaturan sistem.';

  @override
  String get indexLimitedAccessNotice =>
      'Kamu hanya membagikan foto tertentu, jadi Been Here hanya bisa melihat foto itu. Dengan akses penuh, aplikasi bisa menemukan setiap tempat yang pernah kamu kunjungi.';

  @override
  String get indexRunningTitle => 'Membaca galeri fotomu';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed dari $total';
  }

  @override
  String get indexFailedTitle => 'Pengindeksan berhenti';

  @override
  String get indexFailedBody =>
      'Ada yang salah di tengah jalan. Mencoba lagi akan melanjutkan dari titik berhentinya.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto diindeks',
      one: '$count foto diindeks',
      zero: 'Tidak ada foto diindeks',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent% di antaranya punya lokasi';
  }

  @override
  String get commonLoading => 'Memuat…';

  @override
  String get commonRetry => 'Coba lagi';

  @override
  String get commonCancel => 'Batal';

  @override
  String hereRadiusLabel(String radius) {
    return 'Dalam $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto',
      one: '$count foto',
      zero: 'Tidak ada foto',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kunjungan',
      one: '$count kunjungan',
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
  String get ageToday => 'Hari ini';

  @override
  String get ageYesterday => 'Kemarin';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari lalu',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months bulan lalu',
      one: 'Sebulan lalu',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years tahun lalu',
      one: 'Setahun lalu',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Kamu di mana?';

  @override
  String get locationPermissionBody =>
      'Been Here membandingkan posisimu dengan tempat-tempat fotomu diambil. Perbandingan dilakukan di ponsel ini.';

  @override
  String get locationPermissionAction => 'Gunakan lokasi saya';

  @override
  String get locationDeniedTitle => 'Lokasi nonaktif';

  @override
  String get locationDeniedBody =>
      'Tanpa lokasi, aplikasi tidak tahu apa yang kamu punya di sini. Kamu bisa mengaktifkannya di pengaturan sistem.';

  @override
  String get locationUnavailableTitle => 'Belum ada posisi';

  @override
  String get locationUnavailableBody =>
      'Ponselmu belum tahu di mana ia berada. Di dalam ruangan, ini bisa butuh waktu sebentar.';

  @override
  String get locationServicesDisabledTitle => 'Layanan lokasi nonaktif';

  @override
  String get locationServicesDisabledBody =>
      'Aktifkan di pengaturan sistem lalu kembali.';

  @override
  String get hereNothingTitle => 'Kamu belum memotret di sini';

  @override
  String get hereNothingBody =>
      'Coba radius yang lebih lebar, atau kembali ke tempat yang pernah kamu kunjungi.';

  @override
  String hereNearestHint(String distance) {
    return 'Kenangan terdekatmu berjarak $distance.';
  }

  @override
  String get photoDetailRephoto => 'Foto ulang';

  @override
  String get photoDetailRephotoSoon => 'Foto ulang hadir di versi berikutnya.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index dari $total';
  }

  @override
  String get debugLocationTitle => 'Lokasi uji';

  @override
  String get debugLocationBody =>
      'Berpura-puralah berada di tempat lain, agar layar Di sini bisa diuji dari sofa.';

  @override
  String get debugLocationLatitude => 'Lintang';

  @override
  String get debugLocationLongitude => 'Bujur';

  @override
  String get debugLocationApply => 'Pergi ke sana';

  @override
  String get debugLocationClear => 'Gunakan lokasi sebenarnya';

  @override
  String get debugLocationActive => 'Lokasi uji aktif';

  @override
  String get commonClose => 'Tutup';

  @override
  String get placesEmptyTitle => 'Belum ada tempat';

  @override
  String get placesEmptyBody => 'Tempat muncul setelah fotomu diindeks.';

  @override
  String get placesSortLabel => 'Urutkan menurut';

  @override
  String get placesSortLongestAgo => 'Paling lama';

  @override
  String get placesSortMostPhotos => 'Foto terbanyak';

  @override
  String get placesSortNearest => 'Terdekat';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tempat dibisukan',
      one: '$count tempat dibisukan',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Bisukan';

  @override
  String get placesUnmute => 'Bunyikan';

  @override
  String get placesUseAutoRule => 'Putuskan otomatis';

  @override
  String get placesAutoMutedNote =>
      'Dibisukan otomatis — kamu di sini hampir setiap hari';

  @override
  String get placesUserMutedNote => 'Dibisukan olehmu';

  @override
  String get placesUserUnmutedNote => 'Tetap ditampilkan olehmu';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari',
      one: '$days hari',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Beri nama tempat';

  @override
  String get settingsPlaceNamesBody =>
      'Meminta sistem mengubah koordinat tempat menjadi nama. Koordinat itu dikirim ke Apple atau Google — satu-satunya hal di aplikasi ini yang keluar dari ponselmu. Nonaktif secara default; menonaktifkannya lagi akan melupakan semua nama.';

  @override
  String get settingsAutoMuteTitle => 'Bisukan tempat sehari-hari setelah';

  @override
  String get settingsAutoMuteBody =>
      'Tempat dengan foto dari sebanyak ini hari yang berbeda adalah tempat kamu tinggal, bukan tempat yang kamu kunjungi.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Indeks foto';

  @override
  String get settingsReindex => 'Indeks ulang dari awal';

  @override
  String get settingsPrivacyTitle => 'Apa yang tetap di ponsel ini';

  @override
  String get settingsPrivacyBody =>
      'Fotomu, tempat foto itu diambil, dan semua yang disimpulkan aplikasi ini darinya. Tidak ada akun, server, atau analitik.';

  @override
  String get placesName => 'Beri nama tempat ini';

  @override
  String get placesRename => 'Ganti nama';

  @override
  String get placesNameDialogTitle => 'Nama tempat';

  @override
  String get placesNameHint => 'Rumah nenek, danau, kantor…';

  @override
  String get placesNameSave => 'Simpan';

  @override
  String get placesNameClear => 'Hapus nama';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Kamu pernah ke sini';

  @override
  String notificationBody(String age, String photos) {
    return 'Terakhir kali di sini: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Biarkan Been Here memperhatikan untukmu';

  @override
  String get alwaysLocationBody =>
      'Dengan lokasi latar belakang, ponselmu bisa memberi tahu Been Here saat kamu tiba di tempat yang pernah kamu potret — dan aplikasi bisa memberitahumu, sekali, tanpa kamu membuka apa pun.\n\nAplikasi ini tidak pernah mengikutimu. Ponselmu mengawasi beberapa lingkaran dan hanya membangunkan aplikasi saat kamu memasuki salah satunya. Tidak ada informasi tentang lokasimu yang keluar dari perangkat ini.';

  @override
  String get alwaysLocationAction => 'Aktifkan kedatangan';

  @override
  String get alwaysLocationLater => 'Nanti saja';

  @override
  String get alwaysLocationDeniedBody =>
      'Lokasi latar belakang nonaktif, jadi kedatangan tetap senyap. Semua fitur lain berjalan seperti biasa; kamu bisa mengaktifkannya di pengaturan sistem kapan saja.';

  @override
  String get settingsArrivalsTitle => 'Kedatangan';

  @override
  String get settingsArrivalsOn =>
      'Been Here akan memberitahumu saat kamu tiba di tempat yang sudah lama tidak kamu potret.';

  @override
  String get settingsArrivalsOff =>
      'Been Here tetap senyap. Mengaktifkannya akan meminta lokasi latar belakang.';

  @override
  String get settingsMemoryAgeTitle =>
      'Hanya sebut tempat yang lebih lama dari';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days hari',
      one: '$days hari',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => 'Lalu diamkan tempat itu selama';

  @override
  String get settingsDailyLimitTitle => 'Dan jangan bilang apa-apa selama';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours jam',
      one: '$hours jam',
      zero: 'tidak sama sekali',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Turunkan nilai ini untuk mencoba kedatangan tanpa menunggu setengah tahun.';

  @override
  String get placesTestArrival => 'Uji kedatangan di sini';

  @override
  String get arrivalTestNotified => 'Notifikasi terkirim';

  @override
  String get arrivalTestMuted => 'Tidak ada: tempat ini dibisukan';

  @override
  String get arrivalTestTooFewPhotos =>
      'Tidak ada: foto di sini terlalu sedikit';

  @override
  String get arrivalTestTooRecent =>
      'Tidak ada: kamu memotret di sini baru-baru ini';

  @override
  String get arrivalTestPlaceCooldown =>
      'Tidak ada: tempat ini baru saja bersuara';

  @override
  String get arrivalTestDailyLimit =>
      'Tidak ada: hal lain sudah bersuara hari ini';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Ponselmu membiarkan lokasi di \"Saat Menggunakan App\". iOS tidak akan menawarkan pilihan itu lagi dari dalam aplikasi, jadi lokasi latar belakang harus diubah ke \"Selalu\" di pengaturan sistem — lalu kedatangan mulai berfungsi.';

  @override
  String get commonOpenSettings => 'Buka pengaturan';

  @override
  String get settingsArrivalsPending =>
      'Hampir: lokasi masih \"Saat Menggunakan App\". Ubah ke \"Selalu\" di pengaturan sistem.';

  @override
  String get placesSortVisits => 'Kunjungan terbanyak';

  @override
  String get placesSortAscending => 'Urutan terbalik';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kunjungan',
      one: '$count kunjungan',
      zero: 'belum pernah',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Tampilkan tempat di peta';

  @override
  String get settingsMapBody =>
      'Ubin peta diunduh dari OpenStreetMap saat kamu menggeser dan memperbesar, jadi server itu terus melihat ke mana kamu melihat. Berbeda dengan nama tempat yang diminta sekali, ini berlangsung selama peta terbuka. Nonaktif secara default.';

  @override
  String get placesShowMap => 'Peta';

  @override
  String get placesShowList => 'Daftar';

  @override
  String get placesMapAttribution => '© Kontributor OpenStreetMap';

  @override
  String get rephotoOverlay => 'Pudar';

  @override
  String get rephotoEdges => 'Garis tepi';

  @override
  String get rephotoCapture => 'Ambil';

  @override
  String get rephotoSaved => 'Disimpan ke fotomu';

  @override
  String get rephotoNotSaved =>
      'Tidak bisa menyimpan. Menambahkan foto mungkin dinonaktifkan.';

  @override
  String get rephotoNoCamera =>
      'Kamera tidak tersedia. Been Here perlu kamera untuk mengambil foto yang menjawab foto lama.';

  @override
  String get rephotoThenAndNow => 'Dulu & sekarang';

  @override
  String get rephotoShare => 'Bagikan';

  @override
  String get rephotoThen => 'Dulu';

  @override
  String get rephotoNow => 'Sekarang';

  @override
  String get rephotoShareFailed => 'Tidak bisa membuat gambar untuk dibagikan.';

  @override
  String get onboardingSkip => 'Lewati';

  @override
  String get onboardingNext => 'Berikutnya';

  @override
  String get onboardingWhatTitle => 'Foto dari tempat kamu berdiri';

  @override
  String get onboardingWhatBody =>
      'Datangi tempat yang pernah kamu potret dan Been Here menampilkan apa yang kamu ambil di sana — kunjungan demi kunjungan, yang terlama lebih dulu.';

  @override
  String get onboardingPrivacyTitle => 'Tidak ada yang keluar dari ponselmu';

  @override
  String get onboardingPrivacyBody =>
      'Tanpa akun, tanpa server, tanpa analitik. Been Here membaca galeri fotomu di perangkat dan menyimpan indeks kecil di sampingnya. Fotomu, dan tempat foto itu diambil, tetap di tempatnya.';

  @override
  String get onboardingPrivacyFootnote =>
      'Dua hal bisa menjangkau jaringan, dan keduanya nonaktif sampai kamu mengaktifkannya: nama tempat dan peta.';

  @override
  String get onboardingPhotosTitle => 'Aplikasi perlu fotomu';

  @override
  String get onboardingPhotosBody =>
      'Been Here mencatat foto mana diambil di mana. Aplikasi tidak pernah menyalin atau memindahkan apa pun — hanya mengingat ID dan koordinat, dan membaca gambarnya hanya saat menampilkannya kepadamu.';

  @override
  String get onboardingPhotosAction => 'Izinkan foto';

  @override
  String get onboardingDone => 'Mulai';

  @override
  String get settingsAboutTitle => 'Tentang';

  @override
  String settingsVersion(String version, String build) {
    return 'Versi $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Kode sumber';

  @override
  String get settingsShowIntro => 'Tampilkan pengantar lagi';

  @override
  String photoSemanticLabel(String date) {
    return 'Foto dari $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Foto $index dari $total, $date';
  }

  @override
  String get placesActionsLabel => 'Apa yang dilakukan dengan tempat ini';

  @override
  String get radiusSemanticLabel => 'Radius pencarian';

  @override
  String get hereMapTitle => 'Di sekitar sini';

  @override
  String get hereOpenInMaps => 'Buka di Peta';

  @override
  String get hereBackToMe => 'Kembali ke lokasiku';

  @override
  String get herePlaceFallbackTitle => 'Tempat yang kamu kenal';

  @override
  String get arrivalTestNearHome =>
      'Terlalu dekat dengan rumah untuk jadi kabar.';

  @override
  String get settingsHomeRadiusTitle => 'Tetap senyap dalam';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km dari rumah',
      one: '$km km dari rumah',
      zero: 'tanpa jarak — tidak pernah senyap',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'Kehidupan sehari-hari terjadi dekat rumah, dan di sanalah ponsel yang mengomentarinya paling tidak diharapkan. Tempat yang lebih dekat dari ini tidak pernah diawasi.';

  @override
  String get settingsQuietTitle => 'Mengapa senyap';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mengawasi $count tempat',
      one: 'Mengawasi $count tempat',
      zero: 'Tidak mengawasi tempat apa pun',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Tempat terawasi terdekat: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Tidak ada yang diawasi, jadi tidak ada kedatangan yang bisa terjadi.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Notifikasi terakhir: $when';
  }

  @override
  String get settingsQuietNever => 'belum pernah';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'Dari $total tempat: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count dibisukan';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count dekat rumah';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count dengan foto terlalu sedikit';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count baru saja dipotret';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count masih jeda';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count layak diawasi';
  }

  @override
  String get ageSemanticLabel => 'Usia foto';

  @override
  String get ageStopNow => 'sekarang';

  @override
  String get ageStopDay => '1 hari';

  @override
  String get ageStop3Days => '3 hari';

  @override
  String get ageStopWeek => '1 minggu';

  @override
  String get ageStop2Weeks => '2 minggu';

  @override
  String get ageStopMonth => '1 bulan';

  @override
  String get ageStop3Months => '3 bulan';

  @override
  String get ageStop6Months => '6 bulan';

  @override
  String get ageStopYear => '1 tahun';

  @override
  String get ageStop2Years => '2 tahun';

  @override
  String get ageStop5Years => '5 tahun';

  @override
  String get ageStop10Years => '10 tahun';

  @override
  String get ageStopAll => 'semua';

  @override
  String get ageWindowAll => 'Semua foto';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Hingga $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Lebih dari $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest sampai $oldest';
  }

  @override
  String get ageWindowReset => 'Atur ulang';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ foto';
  }
}
