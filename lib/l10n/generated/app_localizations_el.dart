// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Εδώ';

  @override
  String get placesTabLabel => 'Μέρη';

  @override
  String get settingsTabLabel => 'Ρυθμίσεις';

  @override
  String get hereEmptyTitle => 'Δεν έχεις τραβήξει φωτογραφίες εδώ';

  @override
  String get hereEmptyBody =>
      'Μεγάλωσε την ακτίνα αναζήτησης ή γύρνα κάπου όπου έχεις ξαναβρεθεί.';

  @override
  String get hereNotIndexedTitle => 'Τίποτα ευρετηριασμένο ακόμα';

  @override
  String get hereNotIndexedBody =>
      'Το Been Here πρέπει να διαβάσει μία φορά τη βιβλιοθήκη φωτογραφιών σου για να ξέρει πού έχεις πάει. Τίποτα δεν φεύγει από το τηλέφωνό σου.';

  @override
  String get indexStartAction => 'Ευρετηρίαση φωτογραφιών';

  @override
  String get indexPermissionTitle =>
      'Το Been Here χρειάζεται τις φωτογραφίες σου';

  @override
  String get indexPermissionBody =>
      'Διαβάζει μόνο πού και πότε τραβήχτηκε κάθε φωτογραφία και το κρατά σε αυτό το τηλέφωνο.';

  @override
  String get indexPermissionAction => 'Να επιτρέπεται η πρόσβαση';

  @override
  String get indexPermissionDeniedTitle =>
      'Η πρόσβαση στις φωτογραφίες είναι κλειστή';

  @override
  String get indexPermissionDeniedBody =>
      'Χωρίς αυτήν, το Been Here δεν μπορεί να σου δείξει τίποτα. Μπορείς να την ενεργοποιήσεις στις ρυθμίσεις του συστήματος.';

  @override
  String get indexLimitedAccessNotice =>
      'Έχεις μοιραστεί μόνο επιλεγμένες φωτογραφίες, οπότε το Been Here βλέπει μόνο αυτές. Με πλήρη πρόσβαση μπορεί να βρει κάθε μέρος όπου έχεις πάει.';

  @override
  String get indexRunningTitle => 'Ανάγνωση της βιβλιοθήκης φωτογραφιών';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed από $total';
  }

  @override
  String get indexFailedTitle => 'Η ευρετηρίαση σταμάτησε';

  @override
  String get indexFailedBody =>
      'Κάτι πήγε στραβά στη μέση. Με νέα προσπάθεια συνεχίζει από εκεί που σταμάτησε.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count φωτογραφίες στο ευρετήριο',
      one: '$count φωτογραφία στο ευρετήριο',
      zero: 'Καμία φωτογραφία στο ευρετήριο',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return 'Το $percent% έχει τοποθεσία';
  }

  @override
  String get commonLoading => 'Φόρτωση…';

  @override
  String get commonRetry => 'Δοκίμασε ξανά';

  @override
  String get commonCancel => 'Ακύρωση';

  @override
  String hereRadiusLabel(String radius) {
    return 'Σε ακτίνα $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count φωτογραφίες',
      one: '$count φωτογραφία',
      zero: 'Καμία φωτογραφία',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count επισκέψεις',
      one: '$count επίσκεψη',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters μ.';
  }

  @override
  String distanceKilometers(String km) {
    return '$km χλμ.';
  }

  @override
  String get ageToday => 'Σήμερα';

  @override
  String get ageYesterday => 'Χθες';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Πριν από $days ημέρες',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: 'Πριν από $months μήνες',
      one: 'Πριν από έναν μήνα',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: 'Πριν από $years χρόνια',
      one: 'Πριν από έναν χρόνο',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Πού είσαι;';

  @override
  String get locationPermissionBody =>
      'Το Been Here συγκρίνει τη θέση σου με τα μέρη όπου τραβήχτηκαν οι φωτογραφίες σου. Η σύγκριση γίνεται σε αυτό το τηλέφωνο.';

  @override
  String get locationPermissionAction => 'Χρήση της τοποθεσίας μου';

  @override
  String get locationDeniedTitle => 'Η τοποθεσία είναι κλειστή';

  @override
  String get locationDeniedBody =>
      'Χωρίς αυτήν, η εφαρμογή δεν ξέρει τι έχεις εδώ. Μπορείς να την ενεργοποιήσεις στις ρυθμίσεις του συστήματος.';

  @override
  String get locationUnavailableTitle => 'Δεν υπάρχει ακόμα θέση';

  @override
  String get locationUnavailableBody =>
      'Το τηλέφωνό σου δεν έχει βρει ακόμα πού βρίσκεται. Σε εσωτερικό χώρο μπορεί να πάρει λίγο χρόνο.';

  @override
  String get locationServicesDisabledTitle =>
      'Οι υπηρεσίες τοποθεσίας είναι κλειστές';

  @override
  String get locationServicesDisabledBody =>
      'Ενεργοποίησέ τες στις ρυθμίσεις του συστήματος και γύρνα πίσω.';

  @override
  String get hereNothingTitle => 'Δεν έχεις τραβήξει φωτογραφίες εδώ';

  @override
  String get hereNothingBody =>
      'Δοκίμασε μεγαλύτερη ακτίνα ή γύρνα κάπου όπου έχεις ξαναβρεθεί.';

  @override
  String hereNearestHint(String distance) {
    return 'Η πιο κοντινή σου ανάμνηση απέχει $distance.';
  }

  @override
  String get photoDetailRephoto => 'Επαναφωτογράφιση';

  @override
  String get photoDetailRephotoSoon =>
      'Η επαναφωτογράφιση έρχεται σε επόμενη έκδοση.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index από $total';
  }

  @override
  String get debugLocationTitle => 'Δοκιμαστική τοποθεσία';

  @override
  String get debugLocationBody =>
      'Κάνε πως είσαι αλλού, ώστε η οθόνη Εδώ να δοκιμάζεται από τον καναπέ.';

  @override
  String get debugLocationLatitude => 'Γεωγραφικό πλάτος';

  @override
  String get debugLocationLongitude => 'Γεωγραφικό μήκος';

  @override
  String get debugLocationApply => 'Πήγαινε εκεί';

  @override
  String get debugLocationClear => 'Χρήση της πραγματικής τοποθεσίας';

  @override
  String get debugLocationActive => 'Δοκιμαστική τοποθεσία ενεργή';

  @override
  String get commonClose => 'Κλείσιμο';

  @override
  String get placesEmptyTitle => 'Δεν υπάρχουν ακόμα μέρη';

  @override
  String get placesEmptyBody =>
      'Τα μέρη εμφανίζονται μόλις ευρετηριαστούν οι φωτογραφίες σου.';

  @override
  String get placesSortLabel => 'Ταξινόμηση κατά';

  @override
  String get placesSortLongestAgo => 'Πιο παλιά';

  @override
  String get placesSortMostPhotos => 'Περισσότερες φωτογραφίες';

  @override
  String get placesSortNearest => 'Πιο κοντά';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count μέρη σε σίγαση',
      one: '$count μέρος σε σίγαση',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Σίγαση';

  @override
  String get placesUnmute => 'Άρση σίγασης';

  @override
  String get placesUseAutoRule => 'Αυτόματη απόφαση';

  @override
  String get placesAutoMutedNote =>
      'Αυτόματη σίγαση — είσαι εδώ τις περισσότερες μέρες';

  @override
  String get placesUserMutedNote => 'Σε σίγαση από εσένα';

  @override
  String get placesUserUnmutedNote => 'Ορατό με δική σου επιλογή';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ημέρες',
      one: '$days ημέρα',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Ονόματα μερών';

  @override
  String get settingsPlaceNamesBody =>
      'Ζητά από το σύστημα να μετατρέψει τις συντεταγμένες ενός μέρους σε όνομα. Η συντεταγμένη αυτή πηγαίνει στην Apple ή στην Google — είναι το μόνο πράγμα σε αυτήν την εφαρμογή που φεύγει από το τηλέφωνό σου. Κλειστό από προεπιλογή· αν το ξανακλείσεις, ξεχνιούνται όλα τα ονόματα.';

  @override
  String get settingsAutoMuteTitle => 'Σίγαση καθημερινών μερών μετά από';

  @override
  String get settingsAutoMuteBody =>
      'Ένα μέρος με φωτογραφίες από τόσες διαφορετικές μέρες είναι μέρος όπου ζεις, όχι μέρος που επισκέπτεσαι.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ημέρες',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Ευρετήριο φωτογραφιών';

  @override
  String get settingsReindex => 'Ευρετηρίαση ξανά από την αρχή';

  @override
  String get settingsPrivacyTitle => 'Τι μένει σε αυτό το τηλέφωνο';

  @override
  String get settingsPrivacyBody =>
      'Οι φωτογραφίες σου, πού τραβήχτηκαν και ό,τι συμπεραίνει η εφαρμογή από αυτές. Δεν υπάρχει λογαριασμός, διακομιστής ούτε αναλύσεις.';

  @override
  String get placesName => 'Δώσε όνομα σε αυτό το μέρος';

  @override
  String get placesRename => 'Μετονομασία';

  @override
  String get placesNameDialogTitle => 'Όνομα μέρους';

  @override
  String get placesNameHint => 'Της γιαγιάς, η λίμνη, το γραφείο…';

  @override
  String get placesNameSave => 'Αποθήκευση';

  @override
  String get placesNameClear => 'Αφαίρεση ονόματος';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Έχεις ξαναβρεθεί εδώ';

  @override
  String notificationBody(String age, String photos) {
    return 'Τελευταία φορά εδώ: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Άφησε το Been Here να προσέχει για σένα';

  @override
  String get alwaysLocationBody =>
      'Με την τοποθεσία στο παρασκήνιο, το τηλέφωνό σου μπορεί να ειδοποιεί το Been Here όταν φτάνεις κάπου που έχεις ξαναφωτογραφίσει — και η εφαρμογή μπορεί να σου το πει μία φορά, χωρίς να ανοίξεις τίποτα.\n\nΗ εφαρμογή δεν σε παρακολουθεί ποτέ. Το τηλέφωνό σου επιβλέπει λίγους κύκλους και ξυπνά την εφαρμογή μόνο όταν μπαίνεις σε κάποιον. Τίποτα για το πού βρίσκεσαι δεν φεύγει από αυτήν τη συσκευή.';

  @override
  String get alwaysLocationAction => 'Ενεργοποίηση αφίξεων';

  @override
  String get alwaysLocationLater => 'Όχι τώρα';

  @override
  String get alwaysLocationDeniedBody =>
      'Η τοποθεσία στο παρασκήνιο είναι κλειστή, οπότε οι αφίξεις μένουν σιωπηλές. Όλα τα άλλα λειτουργούν όπως πριν· μπορείς να την ενεργοποιήσεις στις ρυθμίσεις του συστήματος όποτε θέλεις.';

  @override
  String get settingsArrivalsTitle => 'Αφίξεις';

  @override
  String get settingsArrivalsOn =>
      'Το Been Here θα σου λέει όταν φτάνεις κάπου που δεν έχεις φωτογραφίσει εδώ και καιρό.';

  @override
  String get settingsArrivalsOff =>
      'Το Been Here μένει σιωπηλό. Η ενεργοποίηση ζητά τοποθεσία στο παρασκήνιο.';

  @override
  String get settingsMemoryAgeTitle => 'Αναφορά μόνο σε μέρη παλαιότερα από';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ημέρες',
      one: '$days ημέρα',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle =>
      'Μετά ησυχία για εκείνο το μέρος για';

  @override
  String get settingsDailyLimitTitle => 'Και καμία ειδοποίηση για';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ώρες',
      one: '$hours ώρα',
      zero: 'καθόλου',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Μείωσε αυτές τις τιμές για να δοκιμάσεις τις αφίξεις χωρίς να περιμένεις έξι μήνες.';

  @override
  String get placesTestArrival => 'Δοκιμή άφιξης εδώ';

  @override
  String get arrivalTestNotified => 'Η ειδοποίηση στάλθηκε';

  @override
  String get arrivalTestMuted => 'Τίποτα: το μέρος είναι σε σίγαση';

  @override
  String get arrivalTestTooFewPhotos => 'Τίποτα: πολύ λίγες φωτογραφίες εδώ';

  @override
  String get arrivalTestTooRecent => 'Τίποτα: φωτογράφισες εδώ πολύ πρόσφατα';

  @override
  String get arrivalTestPlaceCooldown =>
      'Τίποτα: αυτό το μέρος μίλησε πρόσφατα';

  @override
  String get arrivalTestDailyLimit => 'Τίποτα: κάτι άλλο μίλησε ήδη σήμερα';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Το τηλέφωνό σου κράτησε την τοποθεσία σε «Κατά τη χρήση». Το iOS δεν ξαναπροσφέρει την επιλογή μέσα από μια εφαρμογή, οπότε η τοποθεσία στο παρασκήνιο πρέπει να αλλάξει σε «Πάντα» στις ρυθμίσεις του συστήματος — τότε οι αφίξεις αρχίζουν να λειτουργούν.';

  @override
  String get commonOpenSettings => 'Άνοιγμα ρυθμίσεων';

  @override
  String get settingsArrivalsPending =>
      'Σχεδόν: η τοποθεσία είναι ακόμα σε «Κατά τη χρήση». Άλλαξέ τη σε «Πάντα» στις ρυθμίσεις του συστήματος.';

  @override
  String get placesSortVisits => 'Περισσότερες επισκέψεις';

  @override
  String get placesSortAscending => 'Αντίστροφη σειρά';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count επισκέψεις',
      one: '$count επίσκεψη',
      zero: 'ποτέ',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Εμφάνιση μερών σε χάρτη';

  @override
  String get settingsMapBody =>
      'Τα πλακίδια του χάρτη κατεβαίνουν από το OpenStreetMap καθώς μετακινείς και μεγεθύνεις, οπότε ο διακομιστής βλέπει συνεχώς πού κοιτάς. Σε αντίθεση με το όνομα ενός μέρους, που ζητείται μία φορά, αυτό συνεχίζεται όσο ο χάρτης είναι ανοιχτός. Κλειστό από προεπιλογή.';

  @override
  String get placesShowMap => 'Χάρτης';

  @override
  String get placesShowList => 'Λίστα';

  @override
  String get placesMapAttribution => '© Συντελεστές του OpenStreetMap';

  @override
  String get rephotoOverlay => 'Σβήσιμο';

  @override
  String get rephotoEdges => 'Περίγραμμα';

  @override
  String get rephotoCapture => 'Τράβηξέ τη';

  @override
  String get rephotoSaved => 'Αποθηκεύτηκε στις φωτογραφίες σου';

  @override
  String get rephotoNotSaved =>
      'Δεν ήταν δυνατή η αποθήκευση. Η προσθήκη φωτογραφιών ίσως είναι απενεργοποιημένη.';

  @override
  String get rephotoNoCamera =>
      'Δεν υπάρχει διαθέσιμη κάμερα. Το Been Here χρειάζεται την κάμερα για να τραβήξει μια φωτογραφία που απαντά σε μια παλιά.';

  @override
  String get rephotoThenAndNow => 'Τότε και τώρα';

  @override
  String get rephotoShare => 'Κοινοποίηση';

  @override
  String get rephotoThen => 'Τότε';

  @override
  String get rephotoNow => 'Τώρα';

  @override
  String get rephotoShareFailed =>
      'Δεν ήταν δυνατή η δημιουργία της εικόνας για κοινοποίηση.';

  @override
  String get onboardingSkip => 'Παράλειψη';

  @override
  String get onboardingNext => 'Επόμενο';

  @override
  String get onboardingWhatTitle => 'Φωτογραφίες από το σημείο όπου στέκεσαι';

  @override
  String get onboardingWhatBody =>
      'Φτάσε κάπου που έχεις ξαναφωτογραφίσει και το Been Here σου δείχνει τι τράβηξες εκεί — επίσκεψη προς επίσκεψη, από την πιο παλιά.';

  @override
  String get onboardingPrivacyTitle => 'Τίποτα δεν φεύγει από το τηλέφωνό σου';

  @override
  String get onboardingPrivacyBody =>
      'Χωρίς λογαριασμό, χωρίς διακομιστή, χωρίς αναλύσεις. Το Been Here διαβάζει τη βιβλιοθήκη φωτογραφιών σου στη συσκευή και κρατά δίπλα ένα μικρό ευρετήριο. Οι φωτογραφίες σου, και πού τραβήχτηκαν, μένουν εκεί που είναι.';

  @override
  String get onboardingPrivacyFootnote =>
      'Δύο πράγματα μπορούν να φτάσουν στο δίκτυο, και τα δύο είναι κλειστά μέχρι να τα ενεργοποιήσεις: τα ονόματα των μερών και ο χάρτης.';

  @override
  String get onboardingPhotosTitle => 'Χρειάζεται τις φωτογραφίες σου';

  @override
  String get onboardingPhotosBody =>
      'Το Been Here σημειώνει ποια φωτογραφία τραβήχτηκε πού. Δεν αντιγράφει και δεν μετακινεί ποτέ τίποτα — θυμάται αναγνωριστικά και συντεταγμένες και διαβάζει τις ίδιες τις εικόνες μόνο όταν σου τις δείχνει.';

  @override
  String get onboardingPhotosAction => 'Να επιτρέπονται οι φωτογραφίες';

  @override
  String get onboardingDone => 'Έναρξη';

  @override
  String get settingsAboutTitle => 'Σχετικά';

  @override
  String settingsVersion(String version, String build) {
    return 'Έκδοση $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Πηγαίος κώδικας';

  @override
  String get settingsShowIntro => 'Εμφάνιση της εισαγωγής ξανά';

  @override
  String photoSemanticLabel(String date) {
    return 'Φωτογραφία από $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Φωτογραφία $index από $total, $date';
  }

  @override
  String get placesActionsLabel => 'Τι να γίνει με αυτό το μέρος';

  @override
  String get radiusSemanticLabel => 'Ακτίνα αναζήτησης';

  @override
  String get hereMapTitle => 'Εδώ γύρω';

  @override
  String get hereOpenInMaps => 'Άνοιγμα στους Χάρτες';

  @override
  String get hereBackToMe => 'Πίσω εκεί που είμαι';

  @override
  String get herePlaceFallbackTitle => 'Ένα μέρος που ξέρεις';

  @override
  String get arrivalTestNearHome => 'Πολύ κοντά στο σπίτι για να είναι είδηση.';

  @override
  String get settingsHomeRadiusTitle => 'Σιωπή σε ακτίνα';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km χλμ. από το σπίτι',
      one: '$km χλμ. από το σπίτι',
      zero: 'καμία απόσταση — ποτέ σιωπή',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'Η καθημερινότητα συμβαίνει κοντά στο σπίτι, κι εκεί ένα τηλέφωνο που τη σχολιάζει είναι το λιγότερο ευπρόσδεκτο. Μέρη πιο κοντά από αυτό δεν παρακολουθούνται ποτέ.';

  @override
  String get settingsQuietTitle => 'Γιατί υπάρχει σιωπή';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Παρακολουθούνται $count μέρη',
      one: 'Παρακολουθείται $count μέρος',
      zero: 'Δεν παρακολουθείται κανένα μέρος',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Πλησιέστερο παρακολουθούμενο μέρος: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Δεν παρακολουθείται τίποτα, οπότε δεν μπορεί να υπάρξει άφιξη.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Τελευταία ειδοποίηση: $when';
  }

  @override
  String get settingsQuietNever => 'ποτέ';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'Από $total μέρη: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count σε σίγαση';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count κοντά στο σπίτι';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count με πολύ λίγες φωτογραφίες';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count φωτογραφήθηκαν πρόσφατα';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count ακόμα σε παύση';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count αξίζουν παρακολούθηση';
  }

  @override
  String get ageSemanticLabel => 'Ηλικία φωτογραφιών';

  @override
  String get ageStopNow => 'τώρα';

  @override
  String get ageStopDay => '1 ημέρα';

  @override
  String get ageStop3Days => '3 ημέρες';

  @override
  String get ageStopWeek => '1 εβδομάδα';

  @override
  String get ageStop2Weeks => '2 εβδομάδες';

  @override
  String get ageStopMonth => '1 μήνας';

  @override
  String get ageStop3Months => '3 μήνες';

  @override
  String get ageStop6Months => '6 μήνες';

  @override
  String get ageStopYear => '1 χρόνος';

  @override
  String get ageStop2Years => '2 χρόνια';

  @override
  String get ageStop5Years => '5 χρόνια';

  @override
  String get ageStop10Years => '10 χρόνια';

  @override
  String get ageStopAll => 'όλες';

  @override
  String get ageWindowAll => 'Όλες οι φωτογραφίες';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Έως $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Πάνω από $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return 'Από $newest έως $oldest';
  }

  @override
  String get ageWindowReset => 'Επαναφορά';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ φωτογραφίες';
  }
}
