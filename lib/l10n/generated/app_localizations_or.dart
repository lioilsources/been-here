// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Oriya (`or`).
class AppLocalizationsOr extends AppLocalizations {
  AppLocalizationsOr([String locale = 'or']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'ଏଠାରେ';

  @override
  String get placesTabLabel => 'ସ୍ଥାନ';

  @override
  String get settingsTabLabel => 'ସେଟିଂସ';

  @override
  String get hereEmptyTitle => 'ଆପଣ ଏଠାରେ ଫଟୋ ଉଠାଇନାହାଁନ୍ତି';

  @override
  String get hereEmptyBody =>
      'ସନ୍ଧାନ ପରିସର ବଢ଼ାନ୍ତୁ, କିମ୍ବା ପୂର୍ବରୁ ଯାଇଥିବା କୌଣସି ସ୍ଥାନକୁ ଫେରି ଆସନ୍ତୁ।';

  @override
  String get hereNotIndexedTitle => 'ଏପର୍ଯ୍ୟନ୍ତ କିଛି ଇଣ୍ଡେକ୍ସ ହୋଇନାହିଁ';

  @override
  String get hereNotIndexedBody =>
      'ଆପଣ କେଉଁଠି ଥିଲେ ଜାଣିବାକୁ Been Here କୁ ଆପଣଙ୍କ ଫଟୋ ଲାଇବ୍ରେରୀ ଥରେ ପଢ଼ିବାକୁ ହେବ। କିଛି ଆପଣଙ୍କ ଫୋନ୍ ବାହାରକୁ ଯାଏ ନାହିଁ।';

  @override
  String get indexStartAction => 'ମୋ ଫଟୋ ଇଣ୍ଡେକ୍ସ କରନ୍ତୁ';

  @override
  String get indexPermissionTitle => 'Been Here କୁ ଆପଣଙ୍କ ଫଟୋ ଦରକାର';

  @override
  String get indexPermissionBody =>
      'ପ୍ରତ୍ୟେକ ଫଟୋ କେଉଁଠି ଓ କେବେ ଉଠାଯାଇଥିଲା କେବଳ ତାହା ପଢ଼େ, ଏବଂ ଏହି ଫୋନ୍‌ରେ ହିଁ ରଖେ।';

  @override
  String get indexPermissionAction => 'ପ୍ରବେଶ ଅନୁମତି ଦିଅନ୍ତୁ';

  @override
  String get indexPermissionDeniedTitle => 'ଫଟୋ ପ୍ରବେଶ ବନ୍ଦ ଅଛି';

  @override
  String get indexPermissionDeniedBody =>
      'ଏହା ବିନା Been Here ଆପଣଙ୍କୁ କିଛି ଦେଖାଇପାରିବ ନାହିଁ। ସିଷ୍ଟମ ସେଟିଂସରେ ଏହାକୁ ଚାଲୁ କରିପାରିବେ।';

  @override
  String get indexLimitedAccessNotice =>
      'ଆପଣ କେବଳ ବଛା ଫଟୋ ସେୟାର କରିଛନ୍ତି, ତେଣୁ Been Here କେବଳ ସେଗୁଡ଼ିକୁ ଦେଖିପାରିବ। ପୂର୍ଣ୍ଣ ପ୍ରବେଶ ଦେଲେ ଆପଣ ଯାଇଥିବା ପ୍ରତ୍ୟେକ ସ୍ଥାନ ଖୋଜିପାରିବ।';

  @override
  String get indexRunningTitle => 'ଆପଣଙ୍କ ଫଟୋ ଲାଇବ୍ରେରୀ ପଢ଼ାଯାଉଛି';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$total ମଧ୍ୟରୁ $processed';
  }

  @override
  String get indexFailedTitle => 'ଇଣ୍ଡେକ୍ସିଂ ବନ୍ଦ ହେଲା';

  @override
  String get indexFailedBody =>
      'ମଝିରେ କିଛି ଭୁଲ ହୋଇଗଲା। ପୁଣି ଚେଷ୍ଟା କଲେ ଯେଉଁଠି ବନ୍ଦ ହୋଇଥିଲା ସେଠାରୁ ଚାଲିବ।';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ଫଟୋ ଇଣ୍ଡେକ୍ସ ହେଲା',
      one: '1 ଫଟୋ ଇଣ୍ଡେକ୍ସ ହେଲା',
      zero: 'କୌଣସି ଫଟୋ ଇଣ୍ଡେକ୍ସ ହୋଇନାହିଁ',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return 'ସେଗୁଡ଼ିକର $percent% ରେ ସ୍ଥାନ ଅଛି';
  }

  @override
  String get commonLoading => 'ଲୋଡ୍ ହେଉଛି…';

  @override
  String get commonRetry => 'ପୁଣି ଚେଷ୍ଟା କରନ୍ତୁ';

  @override
  String get commonCancel => 'ବାତିଲ';

  @override
  String hereRadiusLabel(String radius) {
    return '$radius ଭିତରେ';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ଫଟୋ',
      one: '1 ଫଟୋ',
      zero: 'ଫଟୋ ନାହିଁ',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ଭ୍ରମଣ',
      one: '1 ଭ୍ରମଣ',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters ମି';
  }

  @override
  String distanceKilometers(String km) {
    return '$km କିମି';
  }

  @override
  String get ageToday => 'ଆଜି';

  @override
  String get ageYesterday => 'ଗତକାଲି';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ଦିନ ପୂର୍ବେ',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months ମାସ ପୂର୍ବେ',
      one: 'ଏକ ମାସ ପୂର୍ବେ',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years ବର୍ଷ ପୂର୍ବେ',
      one: 'ଏକ ବର୍ଷ ପୂର୍ବେ',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'ଆପଣ କେଉଁଠି?';

  @override
  String get locationPermissionBody =>
      'Been Here ଆପଣଙ୍କ ସ୍ଥିତିକୁ ଆପଣଙ୍କ ଫଟୋ ଉଠାଯାଇଥିବା ସ୍ଥାନ ସହ ତୁଳନା କରେ। ତୁଳନା ଏହି ଫୋନ୍‌ରେ ହିଁ ହୁଏ।';

  @override
  String get locationPermissionAction => 'ମୋ ଅବସ୍ଥିତି ବ୍ୟବହାର କରନ୍ତୁ';

  @override
  String get locationDeniedTitle => 'ଅବସ୍ଥିତି ବନ୍ଦ ଅଛି';

  @override
  String get locationDeniedBody =>
      'ଏହା ବିନା ଆପଣଙ୍କର ଏଠାରେ କ\'ଣ ଅଛି ଆପ୍ ଜାଣିପାରିବ ନାହିଁ। ସିଷ୍ଟମ ସେଟିଂସରେ ଏହାକୁ ଚାଲୁ କରିପାରିବେ।';

  @override
  String get locationUnavailableTitle => 'ଏପର୍ଯ୍ୟନ୍ତ ସ୍ଥିତି ମିଳିନାହିଁ';

  @override
  String get locationUnavailableBody =>
      'ଆପଣଙ୍କ ଫୋନ୍ ଏପର୍ଯ୍ୟନ୍ତ ନିଜେ କେଉଁଠି ଅଛି ଜାଣିପାରିନାହିଁ। ଘର ଭିତରେ ଏଥିରେ ଟିକେ ସମୟ ଲାଗିପାରେ।';

  @override
  String get locationServicesDisabledTitle => 'ଅବସ୍ଥିତି ସେବା ବନ୍ଦ ଅଛି';

  @override
  String get locationServicesDisabledBody =>
      'ସିଷ୍ଟମ ସେଟିଂସରେ ସେଗୁଡ଼ିକୁ ଚାଲୁ କରି ଫେରି ଆସନ୍ତୁ।';

  @override
  String get hereNothingTitle => 'ଆପଣ ଏଠାରେ ଫଟୋ ଉଠାଇନାହାଁନ୍ତି';

  @override
  String get hereNothingBody =>
      'ବଡ଼ ପରିସର ଚେଷ୍ଟା କରନ୍ତୁ, କିମ୍ବା ପୂର୍ବରୁ ଯାଇଥିବା କୌଣସି ସ୍ଥାନକୁ ଫେରି ଆସନ୍ତୁ।';

  @override
  String hereNearestHint(String distance) {
    return 'ଆପଣଙ୍କ ସବୁଠୁ ନିକଟ ସ୍ମୃତି $distance ଦୂରରେ ଅଛି।';
  }

  @override
  String get photoDetailRephoto => 'ପୁନଃଫଟୋ';

  @override
  String get photoDetailRephotoSoon => 'ପୁନଃଫଟୋ ପରବର୍ତ୍ତୀ ସଂସ୍କରଣରେ ଆସିବ।';

  @override
  String photoDetailOf(int index, int total) {
    return '$total ମଧ୍ୟରୁ $index';
  }

  @override
  String get debugLocationTitle => 'ଡିବଗ୍ ଅବସ୍ଥିତି';

  @override
  String get debugLocationBody =>
      'ଅନ୍ୟ କେଉଁଠି ଥିବାର ଅଭିନୟ କରନ୍ତୁ, ଯାହାଦ୍ୱାରା ସୋଫାରୁ ହିଁ ଏଠାରେ ସ୍କ୍ରିନ୍ ପରୀକ୍ଷା କରିହେବ।';

  @override
  String get debugLocationLatitude => 'ଅକ୍ଷାଂଶ';

  @override
  String get debugLocationLongitude => 'ଦ୍ରାଘିମା';

  @override
  String get debugLocationApply => 'ସେଠାକୁ ଯାଅ';

  @override
  String get debugLocationClear => 'ପ୍ରକୃତ ଅବସ୍ଥିତି ବ୍ୟବହାର କରନ୍ତୁ';

  @override
  String get debugLocationActive => 'ଡିବଗ୍ ଅବସ୍ଥିତି ସକ୍ରିୟ';

  @override
  String get commonClose => 'ବନ୍ଦ କରନ୍ତୁ';

  @override
  String get placesEmptyTitle => 'ଏପର୍ଯ୍ୟନ୍ତ ସ୍ଥାନ ନାହିଁ';

  @override
  String get placesEmptyBody => 'ଆପଣଙ୍କ ଫଟୋ ଇଣ୍ଡେକ୍ସ ହେଲେ ସ୍ଥାନ ଦେଖାଯିବ।';

  @override
  String get placesSortLabel => 'ଏହିପରି ସଜାନ୍ତୁ';

  @override
  String get placesSortLongestAgo => 'ସବୁଠୁ ପୁରୁଣା';

  @override
  String get placesSortMostPhotos => 'ସବୁଠୁ ଅଧିକ ଫଟୋ';

  @override
  String get placesSortNearest => 'ସବୁଠୁ ନିକଟ';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ମ୍ୟୁଟ୍ ସ୍ଥାନ',
      one: '1 ମ୍ୟୁଟ୍ ସ୍ଥାନ',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'ମ୍ୟୁଟ୍';

  @override
  String get placesUnmute => 'ଅନ୍‌ମ୍ୟୁଟ୍';

  @override
  String get placesUseAutoRule => 'ସ୍ୱୟଂ ସ୍ଥିର କରନ୍ତୁ';

  @override
  String get placesAutoMutedNote =>
      'ସ୍ୱୟଂ ମ୍ୟୁଟ୍ ହୋଇଛି — ଆପଣ ପ୍ରାୟ ପ୍ରତିଦିନ ଏଠାରେ ଥାଆନ୍ତି';

  @override
  String get placesUserMutedNote => 'ଆପଣ ମ୍ୟୁଟ୍ କରିଛନ୍ତି';

  @override
  String get placesUserUnmutedNote => 'ଆପଣ ଦୃଶ୍ୟମାନ ରଖିଛନ୍ତି';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ଦିନ',
      one: '1 ଦିନ',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'ସ୍ଥାନକୁ ନାମ ଦିଅନ୍ତୁ';

  @override
  String get settingsPlaceNamesBody =>
      'ଗୋଟିଏ ସ୍ଥାନର ସ୍ଥାନାଙ୍କକୁ ନାମରେ ବଦଳାଇବାକୁ ସିଷ୍ଟମକୁ କହେ। ସେହି ସ୍ଥାନାଙ୍କ Apple କିମ୍ବା Google କୁ ଯାଏ — ଏହି ଆପ୍‌ରେ ଆପଣଙ୍କ ଫୋନ୍ ବାହାରକୁ ଯାଉଥିବା ଏକମାତ୍ର ଜିନିଷ ଏହା। ଡିଫଲ୍ଟ ଭାବେ ବନ୍ଦ; ପୁଣି ବନ୍ଦ କଲେ ସବୁ ନାମ ଭୁଲିଯାଏ।';

  @override
  String get settingsAutoMuteTitle => 'ଏହା ପରେ ଦୈନନ୍ଦିନ ସ୍ଥାନକୁ ମ୍ୟୁଟ୍ କରନ୍ତୁ';

  @override
  String get settingsAutoMuteBody =>
      'ଏତେ ଭିନ୍ନ ଦିନରେ ଫଟୋ ଥିବା ସ୍ଥାନ ଆପଣ ଭ୍ରମଣ କରୁଥିବା ସ୍ଥାନ ନୁହେଁ, ଆପଣ ରହୁଥିବା ସ୍ଥାନ।';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ଦିନ',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'ଫଟୋ ଇଣ୍ଡେକ୍ସ';

  @override
  String get settingsReindex => 'ଆରମ୍ଭରୁ ପୁଣି ଇଣ୍ଡେକ୍ସ କରନ୍ତୁ';

  @override
  String get settingsPrivacyTitle => 'ଏହି ଫୋନ୍‌ରେ କ\'ଣ ରହେ';

  @override
  String get settingsPrivacyBody =>
      'ଆପଣଙ୍କ ଫଟୋ, ସେଗୁଡ଼ିକ ଉଠାଯାଇଥିବା ସ୍ଥାନ, ଏବଂ ଏହି ଆପ୍ ସେଗୁଡ଼ିକରୁ ଯାହା ବାହାର କରେ ସବୁ। ଖାତା ନାହିଁ, ସର୍ଭର ନାହିଁ, ଆନାଲିଟିକ୍ସ ନାହିଁ।';

  @override
  String get placesName => 'ଏହି ସ୍ଥାନକୁ ନାମ ଦିଅନ୍ତୁ';

  @override
  String get placesRename => 'ନାମ ବଦଳାନ୍ତୁ';

  @override
  String get placesNameDialogTitle => 'ସ୍ଥାନର ନାମ';

  @override
  String get placesNameHint => 'ଜେଜେମା\'ଙ୍କ ଘର, ହ୍ରଦ, ଅଫିସ୍…';

  @override
  String get placesNameSave => 'ସଞ୍ଚୟ';

  @override
  String get placesNameClear => 'ନାମ ହଟାନ୍ତୁ';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'ଆପଣ ପୂର୍ବରୁ ଏଠାରେ ଥିଲେ';

  @override
  String notificationBody(String age, String photos) {
    return 'ଆପଣ ଶେଷଥର ଏଠାରେ ଥିଲେ $age। $photos।';
  }

  @override
  String get alwaysLocationTitle =>
      'Been Here କୁ ଆପଣଙ୍କ ପାଇଁ ଲକ୍ଷ୍ୟ ରଖିବାକୁ ଦିଅନ୍ତୁ';

  @override
  String get alwaysLocationBody =>
      'ପୃଷ୍ଠଭୂମି ଅବସ୍ଥିତି ଥିଲେ, ଆପଣ ପୂର୍ବରୁ ଫଟୋ ଉଠାଇଥିବା କୌଣସି ସ୍ଥାନରେ ପହଞ୍ଚିଲେ ଆପଣଙ୍କ ଫୋନ୍ Been Here କୁ ଜଣାଇପାରେ — ଆଉ ଆପଣ କିଛି ନଖୋଲି ସେ ଥରେ କହିପାରେ।\n\nଆପ୍ ଆପଣଙ୍କୁ କେବେ ଅନୁସରଣ କରେ ନାହିଁ। ଆପଣଙ୍କ ଫୋନ୍ କେତେକ ବୃତ୍ତ ଉପରେ ନଜର ରଖେ ଏବଂ ଆପଣ ଗୋଟିଏରେ ପ୍ରବେଶ କଲେ ହିଁ ଆପ୍‌କୁ ଜଗାଏ। ଆପଣ କେଉଁଠି ଅଛନ୍ତି ସେ ବିଷୟରେ କିଛି ଏହି ଡିଭାଇସ୍ ବାହାରକୁ ଯାଏ ନାହିଁ।';

  @override
  String get alwaysLocationAction => 'ଆଗମନ ଚାଲୁ କରନ୍ତୁ';

  @override
  String get alwaysLocationLater => 'ଏବେ ନୁହେଁ';

  @override
  String get alwaysLocationDeniedBody =>
      'ପୃଷ୍ଠଭୂମି ଅବସ୍ଥିତି ବନ୍ଦ ଅଛି, ତେଣୁ ଆଗମନ ନୀରବ ରହିବ। ବାକି ସବୁ ପୂର୍ବ ପରି କାମ କରେ; ଯେକୌଣସି ବେଳେ ସିଷ୍ଟମ ସେଟିଂସରେ ଚାଲୁ କରିପାରିବେ।';

  @override
  String get settingsArrivalsTitle => 'ଆଗମନ';

  @override
  String get settingsArrivalsOn =>
      'ଆପଣ କିଛି ସମୟ ଧରି ଫଟୋ ଉଠାଇନଥିବା ସ୍ଥାନରେ ପହଞ୍ଚିଲେ Been Here ଆପଣଙ୍କୁ କହିବ।';

  @override
  String get settingsArrivalsOff =>
      'Been Here ନୀରବ ରହେ। ଏହାକୁ ଚାଲୁ କଲେ ପୃଷ୍ଠଭୂମି ଅବସ୍ଥିତି ମାଗେ।';

  @override
  String get settingsMemoryAgeTitle =>
      'ଏହାଠାରୁ ପୁରୁଣା ସ୍ଥାନ ମାତ୍ର ଉଲ୍ଲେଖ କରନ୍ତୁ';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ଦିନ',
      one: '1 ଦିନ',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle =>
      'ତା\'ପରେ ସେହି ସ୍ଥାନକୁ ଏତିକି ସମୟ ନୀରବ ରଖନ୍ତୁ';

  @override
  String get settingsDailyLimitTitle => 'ଆଉ ଏତିକି ସମୟ କିଛି ହିଁ କୁହନ୍ତୁ ନାହିଁ';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ଘଣ୍ଟା',
      one: '1 ଘଣ୍ଟା',
      zero: 'ସମୟ ନାହିଁ',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'ଅଧା ବର୍ଷ ଅପେକ୍ଷା ନକରି ଆଗମନ ପରୀକ୍ଷା କରିବାକୁ ଏଗୁଡ଼ିକ କମାନ୍ତୁ।';

  @override
  String get placesTestArrival => 'ଏଠାରେ ଏକ ଆଗମନ ପରୀକ୍ଷା କରନ୍ତୁ';

  @override
  String get arrivalTestNotified => 'ବିଜ୍ଞପ୍ତି ପଠାଗଲା';

  @override
  String get arrivalTestMuted => 'କିଛି ନାହିଁ: ସ୍ଥାନ ମ୍ୟୁଟ୍ ଅଛି';

  @override
  String get arrivalTestTooFewPhotos => 'କିଛି ନାହିଁ: ଏଠାରେ ଫଟୋ ଅତି କମ୍';

  @override
  String get arrivalTestTooRecent =>
      'କିଛି ନାହିଁ: ଆପଣ ଏଠାରେ ବହୁତ ନିକଟରେ ଫଟୋ ଉଠାଇଛନ୍ତି';

  @override
  String get arrivalTestPlaceCooldown => 'କିଛି ନାହିଁ: ଏହି ସ୍ଥାନ ନିକଟରେ କହିଛି';

  @override
  String get arrivalTestDailyLimit => 'କିଛି ନାହିଁ: ଆଜି ଅନ୍ୟ କିଛି କହିଛି';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'ଆପଣଙ୍କ ଫୋନ୍ ଅବସ୍ଥିତିକୁ \"ବ୍ୟବହାର ସମୟରେ\" ହିଁ ରଖିଛି। ଆପ୍ ଭିତରୁ iOS ଏହି ବିକଳ୍ପ ପୁଣି ଦିଏ ନାହିଁ, ତେଣୁ ପୃଷ୍ଠଭୂମି ଅବସ୍ଥିତିକୁ ସିଷ୍ଟମ ସେଟିଂସରେ \"ସର୍ବଦା\" କରିବାକୁ ପଡ଼ିବ — ତା\'ପରେ ଆଗମନ କାମ କରିବ।';

  @override
  String get commonOpenSettings => 'ସେଟିଂସ ଖୋଲନ୍ତୁ';

  @override
  String get settingsArrivalsPending =>
      'ପ୍ରାୟ ହେଲା: ଅବସ୍ଥିତି ଏବେ ବି \"ବ୍ୟବହାର ସମୟରେ\" ଅଛି। ସିଷ୍ଟମ ସେଟିଂସରେ \"ସର୍ବଦା\" କରନ୍ତୁ।';

  @override
  String get placesSortVisits => 'ସବୁଠୁ ଅଧିକ ଭ୍ରମଣ';

  @override
  String get placesSortAscending => 'କ୍ରମ ଓଲଟାନ୍ତୁ';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ଭ୍ରମଣ',
      one: '1 ଭ୍ରମଣ',
      zero: 'କେବେ ନୁହେଁ',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'ସ୍ଥାନକୁ ମାନଚିତ୍ରରେ ଦେଖାନ୍ତୁ';

  @override
  String get settingsMapBody =>
      'ଆପଣ ପ୍ୟାନ୍ ଓ ଜୁମ୍ କଲାବେଳେ ମାନଚିତ୍ର ଟାଇଲ୍ OpenStreetMap ରୁ ଡାଉନଲୋଡ୍ ହୁଏ, ତେଣୁ ସେହି ସର୍ଭର ଆପଣ କେଉଁଠି ଦେଖୁଛନ୍ତି ତାହାର ଲଗାତାର ହିସାବ ଦେଖେ। ଥରେ ମାଗାଯାଉଥିବା ସ୍ଥାନ ନାମ ପରି ନୁହେଁ, ମାନଚିତ୍ର ଖୋଲା ଥିବା ପର୍ଯ୍ୟନ୍ତ ଏହା ଚାଲେ। ଡିଫଲ୍ଟ ଭାବେ ବନ୍ଦ।';

  @override
  String get placesShowMap => 'ମାନଚିତ୍ର';

  @override
  String get placesShowList => 'ତାଲିକା';

  @override
  String get placesMapAttribution => '© OpenStreetMap ଯୋଗଦାନକାରୀ';

  @override
  String get rephotoOverlay => 'ମଳିନ';

  @override
  String get rephotoEdges => 'ରୂପରେଖ';

  @override
  String get rephotoCapture => 'ଉଠାନ୍ତୁ';

  @override
  String get rephotoSaved => 'ଆପଣଙ୍କ ଫଟୋରେ ସଞ୍ଚୟ ହେଲା';

  @override
  String get rephotoNotSaved => 'ସଞ୍ଚୟ ହେଲା ନାହିଁ। ଫଟୋ ଯୋଡ଼ିବା ବନ୍ଦ ଥାଇପାରେ।';

  @override
  String get rephotoNoCamera =>
      'କ୍ୟାମେରା ଉପଲବ୍ଧ ନାହିଁ। ପୁରୁଣା ଫଟୋର ଉତ୍ତର ଭାବେ ଫଟୋ ଉଠାଇବାକୁ Been Here କୁ କ୍ୟାମେରା ଦରକାର।';

  @override
  String get rephotoThenAndNow => 'ସେତେବେଳେ ଓ ଏବେ';

  @override
  String get rephotoShare => 'ସେୟାର';

  @override
  String get rephotoThen => 'ସେତେବେଳେ';

  @override
  String get rephotoNow => 'ଏବେ';

  @override
  String get rephotoShareFailed => 'ସେୟାର ପାଇଁ ଛବି ତିଆରି ହେଲା ନାହିଁ।';

  @override
  String get onboardingSkip => 'ଛାଡ଼ନ୍ତୁ';

  @override
  String get onboardingNext => 'ପରବର୍ତ୍ତୀ';

  @override
  String get onboardingWhatTitle => 'ଆପଣ ଠିଆ ହୋଇଥିବା ସ୍ଥାନର ଫଟୋ';

  @override
  String get onboardingWhatBody =>
      'ଆପଣ ପୂର୍ବରୁ ଫଟୋ ଉଠାଇଥିବା କୌଣସି ସ୍ଥାନରେ ପହଞ୍ଚିଲେ, Been Here ସେଠାରେ ଆପଣ ଯାହା ଉଠାଇଥିଲେ ଦେଖାଇବ — ଭ୍ରମଣ ପରେ ଭ୍ରମଣ, ସବୁଠୁ ପୁରୁଣା ପ୍ରଥମେ।';

  @override
  String get onboardingPrivacyTitle => 'କିଛି ଆପଣଙ୍କ ଫୋନ୍ ବାହାରକୁ ଯାଏ ନାହିଁ';

  @override
  String get onboardingPrivacyBody =>
      'ଖାତା ନାହିଁ, ସର୍ଭର ନାହିଁ, ଆନାଲିଟିକ୍ସ ନାହିଁ। Been Here ଆପଣଙ୍କ ଫଟୋ ଲାଇବ୍ରେରୀକୁ ଡିଭାଇସ୍‌ରେ ପଢ଼େ ଏବଂ ତା\' ପାଖରେ ଏକ ଛୋଟ ଇଣ୍ଡେକ୍ସ ରଖେ। ଆପଣଙ୍କ ଫଟୋ ଓ ସେଗୁଡ଼ିକ ଉଠାଯାଇଥିବା ସ୍ଥାନ ଯେଉଁଠି ଅଛି ସେଠି ହିଁ ରହେ।';

  @override
  String get onboardingPrivacyFootnote =>
      'ଦୁଇଟି ଜିନିଷ ନେଟୱାର୍କ ପହଞ୍ଚିପାରେ, ଏବଂ ଆପଣ ଚାଲୁ କରିବା ପର୍ଯ୍ୟନ୍ତ ଦୁଇଟିଯାକ ବନ୍ଦ: ସ୍ଥାନ ନାମ ଓ ମାନଚିତ୍ର।';

  @override
  String get onboardingPhotosTitle => 'ଏହାକୁ ଆପଣଙ୍କ ଫଟୋ ଦରକାର';

  @override
  String get onboardingPhotosBody =>
      'କେଉଁ ଫଟୋ କେଉଁଠି ଉଠାଯାଇଥିଲା Been Here ତାହା ଟିପି ରଖେ। ଏହା କିଛି ନକଲ କରେ ନାହିଁ କି ସରାଏ ନାହିଁ — ଆଇଡି ଓ ସ୍ଥାନାଙ୍କ ମନେ ରଖେ, ଏବଂ ଛବିଗୁଡ଼ିକ ଆପଣଙ୍କୁ ଦେଖାଇବା ସମୟରେ ହିଁ ପଢ଼େ।';

  @override
  String get onboardingPhotosAction => 'ଫଟୋ ଅନୁମତି ଦିଅନ୍ତୁ';

  @override
  String get onboardingDone => 'ଆରମ୍ଭ';

  @override
  String get settingsAboutTitle => 'ବିଷୟରେ';

  @override
  String settingsVersion(String version, String build) {
    return 'ସଂସ୍କରଣ $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'ସୋର୍ସ କୋଡ୍';

  @override
  String get settingsShowIntro => 'ପରିଚୟ ପୁଣି ଦେଖାନ୍ତୁ';

  @override
  String photoSemanticLabel(String date) {
    return '$date ର ଫଟୋ';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return '$total ମଧ୍ୟରୁ $index ନମ୍ବର ଫଟୋ, $date';
  }

  @override
  String get placesActionsLabel => 'ଏହି ସ୍ଥାନ ସହ କ\'ଣ କରିବେ';

  @override
  String get radiusSemanticLabel => 'ସନ୍ଧାନ ପରିସର';

  @override
  String get hereMapTitle => 'ଏଠାର ଚାରିପାଖରେ';

  @override
  String get hereOpenInMaps => 'ମ୍ୟାପ୍ସରେ ଖୋଲନ୍ତୁ';

  @override
  String get hereBackToMe => 'ମୁଁ ଥିବା ସ୍ଥାନକୁ ଫେରନ୍ତୁ';

  @override
  String get herePlaceFallbackTitle => 'ଆପଣ ଜାଣିଥିବା ଏକ ସ୍ଥାନ';

  @override
  String get arrivalTestNearHome => 'ଖବର ହେବାକୁ ଘରର ବହୁତ ପାଖରେ।';

  @override
  String get settingsHomeRadiusTitle => 'ଏହି ଭିତରେ ନୀରବ ରୁହନ୍ତୁ';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: 'ଘରଠାରୁ $km କିମି',
      one: 'ଘରଠାରୁ 1 କିମି',
      zero: 'ଦୂରତା ନାହିଁ — କେବେ ନୀରବ ନୁହେଁ',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'ଦୈନନ୍ଦିନ ଜୀବନ ଘର ପାଖରେ ଚାଲେ, ଏବଂ ସେଠାରେ ହିଁ ଫୋନ୍ ତାହା ଉପରେ ମନ୍ତବ୍ୟ ଦେବା ସବୁଠୁ ଅପ୍ରିୟ। ଏହାଠାରୁ ପାଖ ସ୍ଥାନ କେବେ ଲକ୍ଷ୍ୟ ରଖାଯାଏ ନାହିଁ।';

  @override
  String get settingsQuietTitle => 'କାହିଁକି ନୀରବ';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ସ୍ଥାନ ଲକ୍ଷ୍ୟ ରଖୁଛି',
      one: '1 ସ୍ଥାନ ଲକ୍ଷ୍ୟ ରଖୁଛି',
      zero: 'କୌଣସି ସ୍ଥାନ ଲକ୍ଷ୍ୟ ରଖୁନାହିଁ',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'ସବୁଠୁ ପାଖ ଲକ୍ଷିତ ସ୍ଥାନ: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'କିଛି ଲକ୍ଷ୍ୟ ରଖାଯାଉନାହିଁ, ତେଣୁ କିଛି ଆସିପାରିବ ନାହିଁ।';

  @override
  String settingsQuietLastNotified(String when) {
    return 'ଶେଷ ବିଜ୍ଞପ୍ତି: $when';
  }

  @override
  String get settingsQuietNever => 'କେବେ ନୁହେଁ';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return '$total ସ୍ଥାନ ମଧ୍ୟରୁ: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count ମ୍ୟୁଟ୍';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count ଘର ପାଖରେ';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count ରେ ଫଟୋ ଅତି କମ୍';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count ନିକଟରେ ଫଟୋ ଉଠାଯାଇଛି';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count ଏବେ ବି ଥଣ୍ଡା ହେଉଛି';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count ଲକ୍ଷ୍ୟ ରଖିବାକୁ ଯୋଗ୍ୟ';
  }

  @override
  String get ageSemanticLabel => 'ଫଟୋର ବୟସ';

  @override
  String get ageStopNow => 'ଏବେ';

  @override
  String get ageStopDay => '1 ଦିନ';

  @override
  String get ageStop3Days => '3 ଦିନ';

  @override
  String get ageStopWeek => '1 ସପ୍ତାହ';

  @override
  String get ageStop2Weeks => '2 ସପ୍ତାହ';

  @override
  String get ageStopMonth => '1 ମାସ';

  @override
  String get ageStop3Months => '3 ମାସ';

  @override
  String get ageStop6Months => '6 ମାସ';

  @override
  String get ageStopYear => '1 ବର୍ଷ';

  @override
  String get ageStop2Years => '2 ବର୍ଷ';

  @override
  String get ageStop5Years => '5 ବର୍ଷ';

  @override
  String get ageStop10Years => '10 ବର୍ଷ';

  @override
  String get ageStopAll => 'ସବୁ';

  @override
  String get ageWindowAll => 'ସବୁ ଫଟୋ';

  @override
  String ageWindowNewerThan(String stop) {
    return '$stop ପର୍ଯ୍ୟନ୍ତ ପୁରୁଣା';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return '$stop ଠାରୁ ପୁରୁଣା';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest ରୁ $oldest ପୁରୁଣା';
  }

  @override
  String get ageWindowReset => 'ରିସେଟ୍';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ ଫଟୋ';
  }
}
