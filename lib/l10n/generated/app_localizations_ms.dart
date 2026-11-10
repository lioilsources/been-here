// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Di sini';

  @override
  String get placesTabLabel => 'Tempat';

  @override
  String get settingsTabLabel => 'Tetapan';

  @override
  String get hereEmptyTitle => 'Anda belum mengambil foto di sini';

  @override
  String get hereEmptyBody =>
      'Luaskan jejari carian, atau kembali ke tempat yang pernah anda kunjungi.';

  @override
  String get hereNotIndexedTitle => 'Belum ada yang diindeks';

  @override
  String get hereNotIndexedBody =>
      'Been Here perlu membaca pustaka foto anda sekali untuk mengetahui tempat yang pernah anda kunjungi. Tiada apa-apa yang keluar dari telefon anda.';

  @override
  String get indexStartAction => 'Indeks foto saya';

  @override
  String get indexPermissionTitle => 'Been Here memerlukan foto anda';

  @override
  String get indexPermissionBody =>
      'Ia hanya membaca di mana dan bila setiap foto diambil, dan menyimpannya pada telefon ini.';

  @override
  String get indexPermissionAction => 'Benarkan akses';

  @override
  String get indexPermissionDeniedTitle => 'Akses foto dimatikan';

  @override
  String get indexPermissionDeniedBody =>
      'Tanpanya, Been Here tidak dapat menunjukkan apa-apa. Anda boleh menghidupkannya dalam tetapan sistem.';

  @override
  String get indexLimitedAccessNotice =>
      'Anda hanya berkongsi foto terpilih, jadi Been Here hanya dapat melihat foto itu. Akses penuh membolehkannya mencari setiap tempat yang pernah anda kunjungi.';

  @override
  String get indexRunningTitle => 'Membaca pustaka foto anda';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed daripada $total';
  }

  @override
  String get indexFailedTitle => 'Pengindeksan terhenti';

  @override
  String get indexFailedBody =>
      'Ada masalah di pertengahan jalan. Mencuba semula akan menyambung dari tempat ia berhenti.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto diindeks',
      one: '$count foto diindeks',
      zero: 'Tiada foto diindeks',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent% daripadanya mempunyai lokasi';
  }

  @override
  String get commonLoading => 'Memuatkan…';

  @override
  String get commonRetry => 'Cuba lagi';

  @override
  String get commonCancel => 'Batal';

  @override
  String hereRadiusLabel(String radius) {
    return 'Dalam lingkungan $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto',
      one: '$count foto',
      zero: 'Tiada foto',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lawatan',
      one: '$count lawatan',
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
  String get ageYesterday => 'Semalam';

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
  String get locationPermissionTitle => 'Anda di mana?';

  @override
  String get locationPermissionBody =>
      'Been Here membandingkan kedudukan anda dengan tempat foto anda diambil. Perbandingan dibuat pada telefon ini.';

  @override
  String get locationPermissionAction => 'Gunakan lokasi saya';

  @override
  String get locationDeniedTitle => 'Lokasi dimatikan';

  @override
  String get locationDeniedBody =>
      'Tanpanya, apl tidak tahu apa yang anda ada di sini. Anda boleh menghidupkannya dalam tetapan sistem.';

  @override
  String get locationUnavailableTitle => 'Belum ada kedudukan';

  @override
  String get locationUnavailableBody =>
      'Telefon anda belum tahu di mana ia berada. Di dalam bangunan, ini mungkin mengambil sedikit masa.';

  @override
  String get locationServicesDisabledTitle => 'Perkhidmatan lokasi dimatikan';

  @override
  String get locationServicesDisabledBody =>
      'Hidupkannya dalam tetapan sistem dan kembali.';

  @override
  String get hereNothingTitle => 'Anda belum mengambil foto di sini';

  @override
  String get hereNothingBody =>
      'Cuba jejari yang lebih luas, atau kembali ke tempat yang pernah anda kunjungi.';

  @override
  String hereNearestHint(String distance) {
    return 'Kenangan terdekat anda sejauh $distance.';
  }

  @override
  String get photoDetailRephoto => 'Foto semula';

  @override
  String get photoDetailRephotoSoon =>
      'Foto semula akan tiba dalam versi akan datang.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index daripada $total';
  }

  @override
  String get debugLocationTitle => 'Lokasi ujian';

  @override
  String get debugLocationBody =>
      'Berpura-pura berada di tempat lain, supaya skrin Di sini boleh diuji dari sofa.';

  @override
  String get debugLocationLatitude => 'Latitud';

  @override
  String get debugLocationLongitude => 'Longitud';

  @override
  String get debugLocationApply => 'Pergi ke sana';

  @override
  String get debugLocationClear => 'Gunakan lokasi sebenar';

  @override
  String get debugLocationActive => 'Lokasi ujian aktif';

  @override
  String get commonClose => 'Tutup';

  @override
  String get placesEmptyTitle => 'Belum ada tempat';

  @override
  String get placesEmptyBody =>
      'Tempat akan muncul sebaik sahaja foto anda diindeks.';

  @override
  String get placesSortLabel => 'Isih mengikut';

  @override
  String get placesSortLongestAgo => 'Paling lama';

  @override
  String get placesSortMostPhotos => 'Paling banyak foto';

  @override
  String get placesSortNearest => 'Terdekat';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tempat disenyapkan',
      one: '$count tempat disenyapkan',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Senyapkan';

  @override
  String get placesUnmute => 'Nyahsenyap';

  @override
  String get placesUseAutoRule => 'Tentukan secara automatik';

  @override
  String get placesAutoMutedNote =>
      'Disenyapkan secara automatik — anda di sini hampir setiap hari';

  @override
  String get placesUserMutedNote => 'Disenyapkan oleh anda';

  @override
  String get placesUserUnmutedNote => 'Dikekalkan kelihatan oleh anda';

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
  String get settingsPlaceNamesTitle => 'Namakan tempat';

  @override
  String get settingsPlaceNamesBody =>
      'Meminta sistem menukar koordinat tempat kepada nama. Koordinat itu dihantar kepada Apple atau Google — itulah satu-satunya perkara dalam apl ini yang keluar dari telefon anda. Dimatikan secara lalai; mematikannya semula akan melupakan semua nama.';

  @override
  String get settingsAutoMuteTitle => 'Senyapkan tempat harian selepas';

  @override
  String get settingsAutoMuteBody =>
      'Tempat dengan foto daripada sebanyak ini hari yang berbeza ialah tempat anda tinggal, bukan tempat yang anda lawati.';

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
  String get settingsReindex => 'Indeks semula dari awal';

  @override
  String get settingsPrivacyTitle => 'Apa yang kekal pada telefon ini';

  @override
  String get settingsPrivacyBody =>
      'Foto anda, tempat ia diambil, dan segala yang dirumuskan oleh apl ini daripadanya. Tiada akaun, tiada pelayan dan tiada analitik.';

  @override
  String get placesName => 'Namakan tempat ini';

  @override
  String get placesRename => 'Namakan semula';

  @override
  String get placesNameDialogTitle => 'Nama tempat';

  @override
  String get placesNameHint => 'Rumah nenek, tasik, pejabat…';

  @override
  String get placesNameSave => 'Simpan';

  @override
  String get placesNameClear => 'Buang nama';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Anda pernah ke sini';

  @override
  String notificationBody(String age, String photos) {
    return 'Kali terakhir di sini: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Biar Been Here perasan untuk anda';

  @override
  String get alwaysLocationBody =>
      'Dengan lokasi latar belakang, telefon anda boleh memberitahu Been Here apabila anda tiba di tempat yang pernah anda foto — dan apl boleh memberitahu anda, sekali, tanpa anda membuka apa-apa.\n\nApl ini tidak pernah mengekori anda. Telefon anda memerhati beberapa bulatan dan hanya membangunkan apl apabila anda memasuki salah satunya. Tiada apa-apa tentang lokasi anda yang keluar dari peranti ini.';

  @override
  String get alwaysLocationAction => 'Hidupkan ketibaan';

  @override
  String get alwaysLocationLater => 'Bukan sekarang';

  @override
  String get alwaysLocationDeniedBody =>
      'Lokasi latar belakang dimatikan, jadi ketibaan kekal senyap. Semua yang lain berfungsi seperti biasa; anda boleh menghidupkannya dalam tetapan sistem bila-bila masa.';

  @override
  String get settingsArrivalsTitle => 'Ketibaan';

  @override
  String get settingsArrivalsOn =>
      'Been Here akan memberitahu anda apabila anda tiba di tempat yang sudah lama tidak anda foto.';

  @override
  String get settingsArrivalsOff =>
      'Been Here kekal senyap. Menghidupkannya akan meminta lokasi latar belakang.';

  @override
  String get settingsMemoryAgeTitle =>
      'Hanya sebut tempat yang lebih lama daripada';

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
  String get settingsPlaceCooldownTitle =>
      'Kemudian senyapkan tempat itu selama';

  @override
  String get settingsDailyLimitTitle => 'Dan jangan berkata apa-apa selama';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours jam',
      one: '$hours jam',
      zero: 'langsung tidak',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Rendahkan nilai ini untuk mencuba ketibaan tanpa menunggu setengah tahun.';

  @override
  String get placesTestArrival => 'Uji ketibaan di sini';

  @override
  String get arrivalTestNotified => 'Pemberitahuan dihantar';

  @override
  String get arrivalTestMuted => 'Tiada: tempat ini disenyapkan';

  @override
  String get arrivalTestTooFewPhotos => 'Tiada: terlalu sedikit foto di sini';

  @override
  String get arrivalTestTooRecent =>
      'Tiada: anda mengambil foto di sini baru-baru ini';

  @override
  String get arrivalTestPlaceCooldown =>
      'Tiada: tempat ini baru sahaja bersuara';

  @override
  String get arrivalTestDailyLimit =>
      'Tiada: perkara lain sudah bersuara hari ini';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Telefon anda mengekalkan lokasi pada \"Semasa Menggunakan App\". iOS tidak akan menawarkan pilihan itu lagi dari dalam apl, jadi lokasi latar belakang perlu ditukar kepada \"Sentiasa\" dalam tetapan sistem — barulah ketibaan berfungsi.';

  @override
  String get commonOpenSettings => 'Buka tetapan';

  @override
  String get settingsArrivalsPending =>
      'Hampir: lokasi masih pada \"Semasa Menggunakan App\". Tukar kepada \"Sentiasa\" dalam tetapan sistem.';

  @override
  String get placesSortVisits => 'Paling banyak lawatan';

  @override
  String get placesSortAscending => 'Susunan terbalik';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lawatan',
      one: '$count lawatan',
      zero: 'tidak pernah',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Tunjukkan tempat pada peta';

  @override
  String get settingsMapBody =>
      'Jubin peta dimuat turun daripada OpenStreetMap semasa anda menyorot dan mengezum, jadi pelayan itu sentiasa melihat ke mana anda melihat. Tidak seperti nama tempat yang diminta sekali, ini berterusan selagi peta dibuka. Dimatikan secara lalai.';

  @override
  String get placesShowMap => 'Peta';

  @override
  String get placesShowList => 'Senarai';

  @override
  String get placesMapAttribution => '© Penyumbang OpenStreetMap';

  @override
  String get rephotoOverlay => 'Pudar';

  @override
  String get rephotoEdges => 'Garis luar';

  @override
  String get rephotoCapture => 'Ambil';

  @override
  String get rephotoSaved => 'Disimpan ke foto anda';

  @override
  String get rephotoNotSaved =>
      'Tidak dapat menyimpan. Menambah foto mungkin dimatikan.';

  @override
  String get rephotoNoCamera =>
      'Tiada kamera tersedia. Been Here memerlukan kamera untuk mengambil foto yang menjawab foto lama.';

  @override
  String get rephotoThenAndNow => 'Dulu & kini';

  @override
  String get rephotoShare => 'Kongsi';

  @override
  String get rephotoThen => 'Dulu';

  @override
  String get rephotoNow => 'Kini';

  @override
  String get rephotoShareFailed => 'Tidak dapat membina imej untuk dikongsi.';

  @override
  String get onboardingSkip => 'Langkau';

  @override
  String get onboardingNext => 'Seterusnya';

  @override
  String get onboardingWhatTitle => 'Foto dari tempat anda berdiri';

  @override
  String get onboardingWhatBody =>
      'Tiba di tempat yang pernah anda foto dan Been Here menunjukkan apa yang anda ambil di sana — lawatan demi lawatan, yang paling lama dahulu.';

  @override
  String get onboardingPrivacyTitle =>
      'Tiada apa-apa yang keluar dari telefon anda';

  @override
  String get onboardingPrivacyBody =>
      'Tiada akaun, tiada pelayan, tiada analitik. Been Here membaca pustaka foto anda pada peranti dan menyimpan indeks kecil di sebelahnya. Foto anda, dan tempat ia diambil, kekal di tempatnya.';

  @override
  String get onboardingPrivacyFootnote =>
      'Dua perkara boleh sampai ke rangkaian, dan kedua-duanya dimatikan sehingga anda menghidupkannya: nama tempat dan peta.';

  @override
  String get onboardingPhotosTitle => 'Ia memerlukan foto anda';

  @override
  String get onboardingPhotosBody =>
      'Been Here mencatat foto mana diambil di mana. Ia tidak pernah menyalin atau memindahkan apa-apa — ia mengingati ID dan koordinat, dan hanya membaca gambar itu sendiri apabila menunjukkannya kepada anda.';

  @override
  String get onboardingPhotosAction => 'Benarkan foto';

  @override
  String get onboardingDone => 'Mula';

  @override
  String get settingsAboutTitle => 'Perihal';

  @override
  String settingsVersion(String version, String build) {
    return 'Versi $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Kod sumber';

  @override
  String get settingsShowIntro => 'Tunjukkan pengenalan semula';

  @override
  String photoSemanticLabel(String date) {
    return 'Foto dari $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Foto $index daripada $total, $date';
  }

  @override
  String get placesActionsLabel => 'Apa yang hendak dibuat dengan tempat ini';

  @override
  String get radiusSemanticLabel => 'Jejari carian';

  @override
  String get hereMapTitle => 'Di sekitar sini';

  @override
  String get hereOpenInMaps => 'Buka dalam Peta';

  @override
  String get hereBackToMe => 'Kembali ke lokasi saya';

  @override
  String get herePlaceFallbackTitle => 'Tempat yang anda kenali';

  @override
  String get arrivalTestNearHome =>
      'Terlalu dekat dengan rumah untuk menjadi berita.';

  @override
  String get settingsHomeRadiusTitle => 'Kekal senyap dalam lingkungan';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km dari rumah',
      one: '$km km dari rumah',
      zero: 'tiada jarak — tidak pernah senyap',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'Kehidupan harian berlaku dekat rumah, dan di situlah telefon yang mengulasnya paling tidak dialu-alukan. Tempat yang lebih dekat daripada ini tidak pernah diperhati.';

  @override
  String get settingsQuietTitle => 'Mengapa senyap';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Memerhati $count tempat',
      one: 'Memerhati $count tempat',
      zero: 'Tiada tempat diperhati',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Tempat diperhati terdekat: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Tiada apa-apa diperhati, jadi tiada ketibaan boleh berlaku.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Pemberitahuan terakhir: $when';
  }

  @override
  String get settingsQuietNever => 'tidak pernah';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'Daripada $total tempat: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count disenyapkan';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count dekat rumah';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count dengan terlalu sedikit foto';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count baru difoto';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count masih berehat';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count wajar diperhati';
  }

  @override
  String get ageSemanticLabel => 'Usia foto';

  @override
  String get ageStopNow => 'kini';

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
    return 'Sehingga $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Lebih daripada $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest hingga $oldest';
  }

  @override
  String get ageWindowReset => 'Set semula';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ foto';
  }
}
