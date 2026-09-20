// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PlacesTable extends Places with TableInfo<$PlacesTable, PlaceRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlacesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _centerLatMeta = const VerificationMeta(
    'centerLat',
  );
  @override
  late final GeneratedColumn<double> centerLat = GeneratedColumn<double>(
    'center_lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _centerLngMeta = const VerificationMeta(
    'centerLng',
  );
  @override
  late final GeneratedColumn<double> centerLng = GeneratedColumn<double>(
    'center_lng',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _radiusMMeta = const VerificationMeta(
    'radiusM',
  );
  @override
  late final GeneratedColumn<double> radiusM = GeneratedColumn<double>(
    'radius_m',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _photoCountMeta = const VerificationMeta(
    'photoCount',
  );
  @override
  late final GeneratedColumn<int> photoCount = GeneratedColumn<int>(
    'photo_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _distinctDaysMeta = const VerificationMeta(
    'distinctDays',
  );
  @override
  late final GeneratedColumn<int> distinctDays = GeneratedColumn<int>(
    'distinct_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _firstAtMeta = const VerificationMeta(
    'firstAt',
  );
  @override
  late final GeneratedColumn<int> firstAt = GeneratedColumn<int>(
    'first_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastAtMeta = const VerificationMeta('lastAt');
  @override
  late final GeneratedColumn<int> lastAt = GeneratedColumn<int>(
    'last_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userLabelMeta = const VerificationMeta(
    'userLabel',
  );
  @override
  late final GeneratedColumn<String> userLabel = GeneratedColumn<String>(
    'user_label',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<MuteState, String> mute =
      GeneratedColumn<String>(
        'mute',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('none'),
      ).withConverter<MuteState>($PlacesTable.$convertermute);
  static const VerificationMeta _lastNotifiedAtMeta = const VerificationMeta(
    'lastNotifiedAt',
  );
  @override
  late final GeneratedColumn<int> lastNotifiedAt = GeneratedColumn<int>(
    'last_notified_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    centerLat,
    centerLng,
    radiusM,
    photoCount,
    distinctDays,
    firstAt,
    lastAt,
    label,
    userLabel,
    mute,
    lastNotifiedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'places';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlaceRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('center_lat')) {
      context.handle(
        _centerLatMeta,
        centerLat.isAcceptableOrUnknown(data['center_lat']!, _centerLatMeta),
      );
    } else if (isInserting) {
      context.missing(_centerLatMeta);
    }
    if (data.containsKey('center_lng')) {
      context.handle(
        _centerLngMeta,
        centerLng.isAcceptableOrUnknown(data['center_lng']!, _centerLngMeta),
      );
    } else if (isInserting) {
      context.missing(_centerLngMeta);
    }
    if (data.containsKey('radius_m')) {
      context.handle(
        _radiusMMeta,
        radiusM.isAcceptableOrUnknown(data['radius_m']!, _radiusMMeta),
      );
    } else if (isInserting) {
      context.missing(_radiusMMeta);
    }
    if (data.containsKey('photo_count')) {
      context.handle(
        _photoCountMeta,
        photoCount.isAcceptableOrUnknown(data['photo_count']!, _photoCountMeta),
      );
    }
    if (data.containsKey('distinct_days')) {
      context.handle(
        _distinctDaysMeta,
        distinctDays.isAcceptableOrUnknown(
          data['distinct_days']!,
          _distinctDaysMeta,
        ),
      );
    }
    if (data.containsKey('first_at')) {
      context.handle(
        _firstAtMeta,
        firstAt.isAcceptableOrUnknown(data['first_at']!, _firstAtMeta),
      );
    } else if (isInserting) {
      context.missing(_firstAtMeta);
    }
    if (data.containsKey('last_at')) {
      context.handle(
        _lastAtMeta,
        lastAt.isAcceptableOrUnknown(data['last_at']!, _lastAtMeta),
      );
    } else if (isInserting) {
      context.missing(_lastAtMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    }
    if (data.containsKey('user_label')) {
      context.handle(
        _userLabelMeta,
        userLabel.isAcceptableOrUnknown(data['user_label']!, _userLabelMeta),
      );
    }
    if (data.containsKey('last_notified_at')) {
      context.handle(
        _lastNotifiedAtMeta,
        lastNotifiedAt.isAcceptableOrUnknown(
          data['last_notified_at']!,
          _lastNotifiedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlaceRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaceRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      centerLat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}center_lat'],
      )!,
      centerLng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}center_lng'],
      )!,
      radiusM: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}radius_m'],
      )!,
      photoCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}photo_count'],
      )!,
      distinctDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}distinct_days'],
      )!,
      firstAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}first_at'],
      )!,
      lastAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_at'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      ),
      userLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_label'],
      ),
      mute: $PlacesTable.$convertermute.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}mute'],
        )!,
      ),
      lastNotifiedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_notified_at'],
      ),
    );
  }

  @override
  $PlacesTable createAlias(String alias) {
    return $PlacesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MuteState, String, String> $convertermute =
      const EnumNameConverter<MuteState>(MuteState.values);
}

class PlaceRow extends DataClass implements Insertable<PlaceRow> {
  final int id;
  final double centerLat;
  final double centerLng;
  final double radiusM;
  final int photoCount;

  /// Number of distinct local calendar days with a photo here. Drives the
  /// auto-mute rule.
  final int distinctDays;
  final int firstAt;
  final int lastAt;

  /// Reverse-geocoded name, filled in lazily and only if the user allows it.
  ///
  /// Wiped when the user turns place naming off — it came from a service,
  /// and turning the service off should forget its answers.
  final String? label;

  /// A name the user typed. Takes precedence over [label], and survives
  /// everything: recomputes, and turning geocoding off. It never came from
  /// anywhere but this phone.
  final String? userLabel;
  final MuteState mute;
  final int? lastNotifiedAt;
  const PlaceRow({
    required this.id,
    required this.centerLat,
    required this.centerLng,
    required this.radiusM,
    required this.photoCount,
    required this.distinctDays,
    required this.firstAt,
    required this.lastAt,
    this.label,
    this.userLabel,
    required this.mute,
    this.lastNotifiedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['center_lat'] = Variable<double>(centerLat);
    map['center_lng'] = Variable<double>(centerLng);
    map['radius_m'] = Variable<double>(radiusM);
    map['photo_count'] = Variable<int>(photoCount);
    map['distinct_days'] = Variable<int>(distinctDays);
    map['first_at'] = Variable<int>(firstAt);
    map['last_at'] = Variable<int>(lastAt);
    if (!nullToAbsent || label != null) {
      map['label'] = Variable<String>(label);
    }
    if (!nullToAbsent || userLabel != null) {
      map['user_label'] = Variable<String>(userLabel);
    }
    {
      map['mute'] = Variable<String>($PlacesTable.$convertermute.toSql(mute));
    }
    if (!nullToAbsent || lastNotifiedAt != null) {
      map['last_notified_at'] = Variable<int>(lastNotifiedAt);
    }
    return map;
  }

  PlacesCompanion toCompanion(bool nullToAbsent) {
    return PlacesCompanion(
      id: Value(id),
      centerLat: Value(centerLat),
      centerLng: Value(centerLng),
      radiusM: Value(radiusM),
      photoCount: Value(photoCount),
      distinctDays: Value(distinctDays),
      firstAt: Value(firstAt),
      lastAt: Value(lastAt),
      label: label == null && nullToAbsent
          ? const Value.absent()
          : Value(label),
      userLabel: userLabel == null && nullToAbsent
          ? const Value.absent()
          : Value(userLabel),
      mute: Value(mute),
      lastNotifiedAt: lastNotifiedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastNotifiedAt),
    );
  }

  factory PlaceRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaceRow(
      id: serializer.fromJson<int>(json['id']),
      centerLat: serializer.fromJson<double>(json['centerLat']),
      centerLng: serializer.fromJson<double>(json['centerLng']),
      radiusM: serializer.fromJson<double>(json['radiusM']),
      photoCount: serializer.fromJson<int>(json['photoCount']),
      distinctDays: serializer.fromJson<int>(json['distinctDays']),
      firstAt: serializer.fromJson<int>(json['firstAt']),
      lastAt: serializer.fromJson<int>(json['lastAt']),
      label: serializer.fromJson<String?>(json['label']),
      userLabel: serializer.fromJson<String?>(json['userLabel']),
      mute: $PlacesTable.$convertermute.fromJson(
        serializer.fromJson<String>(json['mute']),
      ),
      lastNotifiedAt: serializer.fromJson<int?>(json['lastNotifiedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'centerLat': serializer.toJson<double>(centerLat),
      'centerLng': serializer.toJson<double>(centerLng),
      'radiusM': serializer.toJson<double>(radiusM),
      'photoCount': serializer.toJson<int>(photoCount),
      'distinctDays': serializer.toJson<int>(distinctDays),
      'firstAt': serializer.toJson<int>(firstAt),
      'lastAt': serializer.toJson<int>(lastAt),
      'label': serializer.toJson<String?>(label),
      'userLabel': serializer.toJson<String?>(userLabel),
      'mute': serializer.toJson<String>(
        $PlacesTable.$convertermute.toJson(mute),
      ),
      'lastNotifiedAt': serializer.toJson<int?>(lastNotifiedAt),
    };
  }

  PlaceRow copyWith({
    int? id,
    double? centerLat,
    double? centerLng,
    double? radiusM,
    int? photoCount,
    int? distinctDays,
    int? firstAt,
    int? lastAt,
    Value<String?> label = const Value.absent(),
    Value<String?> userLabel = const Value.absent(),
    MuteState? mute,
    Value<int?> lastNotifiedAt = const Value.absent(),
  }) => PlaceRow(
    id: id ?? this.id,
    centerLat: centerLat ?? this.centerLat,
    centerLng: centerLng ?? this.centerLng,
    radiusM: radiusM ?? this.radiusM,
    photoCount: photoCount ?? this.photoCount,
    distinctDays: distinctDays ?? this.distinctDays,
    firstAt: firstAt ?? this.firstAt,
    lastAt: lastAt ?? this.lastAt,
    label: label.present ? label.value : this.label,
    userLabel: userLabel.present ? userLabel.value : this.userLabel,
    mute: mute ?? this.mute,
    lastNotifiedAt: lastNotifiedAt.present
        ? lastNotifiedAt.value
        : this.lastNotifiedAt,
  );
  PlaceRow copyWithCompanion(PlacesCompanion data) {
    return PlaceRow(
      id: data.id.present ? data.id.value : this.id,
      centerLat: data.centerLat.present ? data.centerLat.value : this.centerLat,
      centerLng: data.centerLng.present ? data.centerLng.value : this.centerLng,
      radiusM: data.radiusM.present ? data.radiusM.value : this.radiusM,
      photoCount: data.photoCount.present
          ? data.photoCount.value
          : this.photoCount,
      distinctDays: data.distinctDays.present
          ? data.distinctDays.value
          : this.distinctDays,
      firstAt: data.firstAt.present ? data.firstAt.value : this.firstAt,
      lastAt: data.lastAt.present ? data.lastAt.value : this.lastAt,
      label: data.label.present ? data.label.value : this.label,
      userLabel: data.userLabel.present ? data.userLabel.value : this.userLabel,
      mute: data.mute.present ? data.mute.value : this.mute,
      lastNotifiedAt: data.lastNotifiedAt.present
          ? data.lastNotifiedAt.value
          : this.lastNotifiedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlaceRow(')
          ..write('id: $id, ')
          ..write('centerLat: $centerLat, ')
          ..write('centerLng: $centerLng, ')
          ..write('radiusM: $radiusM, ')
          ..write('photoCount: $photoCount, ')
          ..write('distinctDays: $distinctDays, ')
          ..write('firstAt: $firstAt, ')
          ..write('lastAt: $lastAt, ')
          ..write('label: $label, ')
          ..write('userLabel: $userLabel, ')
          ..write('mute: $mute, ')
          ..write('lastNotifiedAt: $lastNotifiedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    centerLat,
    centerLng,
    radiusM,
    photoCount,
    distinctDays,
    firstAt,
    lastAt,
    label,
    userLabel,
    mute,
    lastNotifiedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaceRow &&
          other.id == this.id &&
          other.centerLat == this.centerLat &&
          other.centerLng == this.centerLng &&
          other.radiusM == this.radiusM &&
          other.photoCount == this.photoCount &&
          other.distinctDays == this.distinctDays &&
          other.firstAt == this.firstAt &&
          other.lastAt == this.lastAt &&
          other.label == this.label &&
          other.userLabel == this.userLabel &&
          other.mute == this.mute &&
          other.lastNotifiedAt == this.lastNotifiedAt);
}

class PlacesCompanion extends UpdateCompanion<PlaceRow> {
  final Value<int> id;
  final Value<double> centerLat;
  final Value<double> centerLng;
  final Value<double> radiusM;
  final Value<int> photoCount;
  final Value<int> distinctDays;
  final Value<int> firstAt;
  final Value<int> lastAt;
  final Value<String?> label;
  final Value<String?> userLabel;
  final Value<MuteState> mute;
  final Value<int?> lastNotifiedAt;
  const PlacesCompanion({
    this.id = const Value.absent(),
    this.centerLat = const Value.absent(),
    this.centerLng = const Value.absent(),
    this.radiusM = const Value.absent(),
    this.photoCount = const Value.absent(),
    this.distinctDays = const Value.absent(),
    this.firstAt = const Value.absent(),
    this.lastAt = const Value.absent(),
    this.label = const Value.absent(),
    this.userLabel = const Value.absent(),
    this.mute = const Value.absent(),
    this.lastNotifiedAt = const Value.absent(),
  });
  PlacesCompanion.insert({
    this.id = const Value.absent(),
    required double centerLat,
    required double centerLng,
    required double radiusM,
    this.photoCount = const Value.absent(),
    this.distinctDays = const Value.absent(),
    required int firstAt,
    required int lastAt,
    this.label = const Value.absent(),
    this.userLabel = const Value.absent(),
    this.mute = const Value.absent(),
    this.lastNotifiedAt = const Value.absent(),
  }) : centerLat = Value(centerLat),
       centerLng = Value(centerLng),
       radiusM = Value(radiusM),
       firstAt = Value(firstAt),
       lastAt = Value(lastAt);
  static Insertable<PlaceRow> custom({
    Expression<int>? id,
    Expression<double>? centerLat,
    Expression<double>? centerLng,
    Expression<double>? radiusM,
    Expression<int>? photoCount,
    Expression<int>? distinctDays,
    Expression<int>? firstAt,
    Expression<int>? lastAt,
    Expression<String>? label,
    Expression<String>? userLabel,
    Expression<String>? mute,
    Expression<int>? lastNotifiedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (centerLat != null) 'center_lat': centerLat,
      if (centerLng != null) 'center_lng': centerLng,
      if (radiusM != null) 'radius_m': radiusM,
      if (photoCount != null) 'photo_count': photoCount,
      if (distinctDays != null) 'distinct_days': distinctDays,
      if (firstAt != null) 'first_at': firstAt,
      if (lastAt != null) 'last_at': lastAt,
      if (label != null) 'label': label,
      if (userLabel != null) 'user_label': userLabel,
      if (mute != null) 'mute': mute,
      if (lastNotifiedAt != null) 'last_notified_at': lastNotifiedAt,
    });
  }

  PlacesCompanion copyWith({
    Value<int>? id,
    Value<double>? centerLat,
    Value<double>? centerLng,
    Value<double>? radiusM,
    Value<int>? photoCount,
    Value<int>? distinctDays,
    Value<int>? firstAt,
    Value<int>? lastAt,
    Value<String?>? label,
    Value<String?>? userLabel,
    Value<MuteState>? mute,
    Value<int?>? lastNotifiedAt,
  }) {
    return PlacesCompanion(
      id: id ?? this.id,
      centerLat: centerLat ?? this.centerLat,
      centerLng: centerLng ?? this.centerLng,
      radiusM: radiusM ?? this.radiusM,
      photoCount: photoCount ?? this.photoCount,
      distinctDays: distinctDays ?? this.distinctDays,
      firstAt: firstAt ?? this.firstAt,
      lastAt: lastAt ?? this.lastAt,
      label: label ?? this.label,
      userLabel: userLabel ?? this.userLabel,
      mute: mute ?? this.mute,
      lastNotifiedAt: lastNotifiedAt ?? this.lastNotifiedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (centerLat.present) {
      map['center_lat'] = Variable<double>(centerLat.value);
    }
    if (centerLng.present) {
      map['center_lng'] = Variable<double>(centerLng.value);
    }
    if (radiusM.present) {
      map['radius_m'] = Variable<double>(radiusM.value);
    }
    if (photoCount.present) {
      map['photo_count'] = Variable<int>(photoCount.value);
    }
    if (distinctDays.present) {
      map['distinct_days'] = Variable<int>(distinctDays.value);
    }
    if (firstAt.present) {
      map['first_at'] = Variable<int>(firstAt.value);
    }
    if (lastAt.present) {
      map['last_at'] = Variable<int>(lastAt.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (userLabel.present) {
      map['user_label'] = Variable<String>(userLabel.value);
    }
    if (mute.present) {
      map['mute'] = Variable<String>(
        $PlacesTable.$convertermute.toSql(mute.value),
      );
    }
    if (lastNotifiedAt.present) {
      map['last_notified_at'] = Variable<int>(lastNotifiedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlacesCompanion(')
          ..write('id: $id, ')
          ..write('centerLat: $centerLat, ')
          ..write('centerLng: $centerLng, ')
          ..write('radiusM: $radiusM, ')
          ..write('photoCount: $photoCount, ')
          ..write('distinctDays: $distinctDays, ')
          ..write('firstAt: $firstAt, ')
          ..write('lastAt: $lastAt, ')
          ..write('label: $label, ')
          ..write('userLabel: $userLabel, ')
          ..write('mute: $mute, ')
          ..write('lastNotifiedAt: $lastNotifiedAt')
          ..write(')'))
        .toString();
  }
}

class $PhotosTable extends Photos with TableInfo<$PhotosTable, PhotoRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhotosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _assetIdMeta = const VerificationMeta(
    'assetId',
  );
  @override
  late final GeneratedColumn<String> assetId = GeneratedColumn<String>(
    'asset_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
    'lng',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _takenAtMeta = const VerificationMeta(
    'takenAt',
  );
  @override
  late final GeneratedColumn<int> takenAt = GeneratedColumn<int>(
    'taken_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _geohashMeta = const VerificationMeta(
    'geohash',
  );
  @override
  late final GeneratedColumn<String> geohash = GeneratedColumn<String>(
    'geohash',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _xMeta = const VerificationMeta('x');
  @override
  late final GeneratedColumn<double> x = GeneratedColumn<double>(
    'x',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _yMeta = const VerificationMeta('y');
  @override
  late final GeneratedColumn<double> y = GeneratedColumn<double>(
    'y',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _zMeta = const VerificationMeta('z');
  @override
  late final GeneratedColumn<double> z = GeneratedColumn<double>(
    'z',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _placeIdMeta = const VerificationMeta(
    'placeId',
  );
  @override
  late final GeneratedColumn<int> placeId = GeneratedColumn<int>(
    'place_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES places (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _isVideoMeta = const VerificationMeta(
    'isVideo',
  );
  @override
  late final GeneratedColumn<bool> isVideo = GeneratedColumn<bool>(
    'is_video',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_video" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<int> width = GeneratedColumn<int>(
    'width',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
    'height',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _indexedAtMeta = const VerificationMeta(
    'indexedAt',
  );
  @override
  late final GeneratedColumn<int> indexedAt = GeneratedColumn<int>(
    'indexed_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    assetId,
    lat,
    lng,
    takenAt,
    geohash,
    x,
    y,
    z,
    placeId,
    isVideo,
    width,
    height,
    indexedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'photos';
  @override
  VerificationContext validateIntegrity(
    Insertable<PhotoRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('asset_id')) {
      context.handle(
        _assetIdMeta,
        assetId.isAcceptableOrUnknown(data['asset_id']!, _assetIdMeta),
      );
    } else if (isInserting) {
      context.missing(_assetIdMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    }
    if (data.containsKey('lng')) {
      context.handle(
        _lngMeta,
        lng.isAcceptableOrUnknown(data['lng']!, _lngMeta),
      );
    }
    if (data.containsKey('taken_at')) {
      context.handle(
        _takenAtMeta,
        takenAt.isAcceptableOrUnknown(data['taken_at']!, _takenAtMeta),
      );
    } else if (isInserting) {
      context.missing(_takenAtMeta);
    }
    if (data.containsKey('geohash')) {
      context.handle(
        _geohashMeta,
        geohash.isAcceptableOrUnknown(data['geohash']!, _geohashMeta),
      );
    }
    if (data.containsKey('x')) {
      context.handle(_xMeta, x.isAcceptableOrUnknown(data['x']!, _xMeta));
    }
    if (data.containsKey('y')) {
      context.handle(_yMeta, y.isAcceptableOrUnknown(data['y']!, _yMeta));
    }
    if (data.containsKey('z')) {
      context.handle(_zMeta, z.isAcceptableOrUnknown(data['z']!, _zMeta));
    }
    if (data.containsKey('place_id')) {
      context.handle(
        _placeIdMeta,
        placeId.isAcceptableOrUnknown(data['place_id']!, _placeIdMeta),
      );
    }
    if (data.containsKey('is_video')) {
      context.handle(
        _isVideoMeta,
        isVideo.isAcceptableOrUnknown(data['is_video']!, _isVideoMeta),
      );
    }
    if (data.containsKey('width')) {
      context.handle(
        _widthMeta,
        width.isAcceptableOrUnknown(data['width']!, _widthMeta),
      );
    } else if (isInserting) {
      context.missing(_widthMeta);
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('indexed_at')) {
      context.handle(
        _indexedAtMeta,
        indexedAt.isAcceptableOrUnknown(data['indexed_at']!, _indexedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_indexedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {assetId};
  @override
  PhotoRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PhotoRow(
      assetId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}asset_id'],
      )!,
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      ),
      lng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lng'],
      ),
      takenAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}taken_at'],
      )!,
      geohash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}geohash'],
      ),
      x: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}x'],
      ),
      y: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}y'],
      ),
      z: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}z'],
      ),
      placeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}place_id'],
      ),
      isVideo: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_video'],
      )!,
      width: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}width'],
      )!,
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}height'],
      )!,
      indexedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}indexed_at'],
      )!,
    );
  }

  @override
  $PhotosTable createAlias(String alias) {
    return $PhotosTable(attachedDatabase, alias);
  }
}

class PhotoRow extends DataClass implements Insertable<PhotoRow> {
  final String assetId;
  final double? lat;
  final double? lng;

  /// Capture time, unix seconds UTC.
  final int takenAt;

  /// Precision-7 geohash of lat/lng (~150 m cell). Null without GPS.
  final String? geohash;

  /// The same position as a point on the unit sphere. Null without GPS.
  ///
  /// Lets SQLite answer "within r metres" exactly, with arithmetic only —
  /// see `UnitVector` in core/geo. Denormalised on purpose: shipping the
  /// coordinates to Dart to do it there is what made the query slow.
  final double? x;
  final double? y;
  final double? z;
  final int? placeId;

  /// Always false today: videos are not indexed (product decision). The
  /// column exists so turning them on later is a query change, not a
  /// migration plus full reindex.
  final bool isVideo;
  final int width;
  final int height;

  /// When this row was last written, unix seconds UTC.
  final int indexedAt;
  const PhotoRow({
    required this.assetId,
    this.lat,
    this.lng,
    required this.takenAt,
    this.geohash,
    this.x,
    this.y,
    this.z,
    this.placeId,
    required this.isVideo,
    required this.width,
    required this.height,
    required this.indexedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['asset_id'] = Variable<String>(assetId);
    if (!nullToAbsent || lat != null) {
      map['lat'] = Variable<double>(lat);
    }
    if (!nullToAbsent || lng != null) {
      map['lng'] = Variable<double>(lng);
    }
    map['taken_at'] = Variable<int>(takenAt);
    if (!nullToAbsent || geohash != null) {
      map['geohash'] = Variable<String>(geohash);
    }
    if (!nullToAbsent || x != null) {
      map['x'] = Variable<double>(x);
    }
    if (!nullToAbsent || y != null) {
      map['y'] = Variable<double>(y);
    }
    if (!nullToAbsent || z != null) {
      map['z'] = Variable<double>(z);
    }
    if (!nullToAbsent || placeId != null) {
      map['place_id'] = Variable<int>(placeId);
    }
    map['is_video'] = Variable<bool>(isVideo);
    map['width'] = Variable<int>(width);
    map['height'] = Variable<int>(height);
    map['indexed_at'] = Variable<int>(indexedAt);
    return map;
  }

  PhotosCompanion toCompanion(bool nullToAbsent) {
    return PhotosCompanion(
      assetId: Value(assetId),
      lat: lat == null && nullToAbsent ? const Value.absent() : Value(lat),
      lng: lng == null && nullToAbsent ? const Value.absent() : Value(lng),
      takenAt: Value(takenAt),
      geohash: geohash == null && nullToAbsent
          ? const Value.absent()
          : Value(geohash),
      x: x == null && nullToAbsent ? const Value.absent() : Value(x),
      y: y == null && nullToAbsent ? const Value.absent() : Value(y),
      z: z == null && nullToAbsent ? const Value.absent() : Value(z),
      placeId: placeId == null && nullToAbsent
          ? const Value.absent()
          : Value(placeId),
      isVideo: Value(isVideo),
      width: Value(width),
      height: Value(height),
      indexedAt: Value(indexedAt),
    );
  }

  factory PhotoRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PhotoRow(
      assetId: serializer.fromJson<String>(json['assetId']),
      lat: serializer.fromJson<double?>(json['lat']),
      lng: serializer.fromJson<double?>(json['lng']),
      takenAt: serializer.fromJson<int>(json['takenAt']),
      geohash: serializer.fromJson<String?>(json['geohash']),
      x: serializer.fromJson<double?>(json['x']),
      y: serializer.fromJson<double?>(json['y']),
      z: serializer.fromJson<double?>(json['z']),
      placeId: serializer.fromJson<int?>(json['placeId']),
      isVideo: serializer.fromJson<bool>(json['isVideo']),
      width: serializer.fromJson<int>(json['width']),
      height: serializer.fromJson<int>(json['height']),
      indexedAt: serializer.fromJson<int>(json['indexedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'assetId': serializer.toJson<String>(assetId),
      'lat': serializer.toJson<double?>(lat),
      'lng': serializer.toJson<double?>(lng),
      'takenAt': serializer.toJson<int>(takenAt),
      'geohash': serializer.toJson<String?>(geohash),
      'x': serializer.toJson<double?>(x),
      'y': serializer.toJson<double?>(y),
      'z': serializer.toJson<double?>(z),
      'placeId': serializer.toJson<int?>(placeId),
      'isVideo': serializer.toJson<bool>(isVideo),
      'width': serializer.toJson<int>(width),
      'height': serializer.toJson<int>(height),
      'indexedAt': serializer.toJson<int>(indexedAt),
    };
  }

  PhotoRow copyWith({
    String? assetId,
    Value<double?> lat = const Value.absent(),
    Value<double?> lng = const Value.absent(),
    int? takenAt,
    Value<String?> geohash = const Value.absent(),
    Value<double?> x = const Value.absent(),
    Value<double?> y = const Value.absent(),
    Value<double?> z = const Value.absent(),
    Value<int?> placeId = const Value.absent(),
    bool? isVideo,
    int? width,
    int? height,
    int? indexedAt,
  }) => PhotoRow(
    assetId: assetId ?? this.assetId,
    lat: lat.present ? lat.value : this.lat,
    lng: lng.present ? lng.value : this.lng,
    takenAt: takenAt ?? this.takenAt,
    geohash: geohash.present ? geohash.value : this.geohash,
    x: x.present ? x.value : this.x,
    y: y.present ? y.value : this.y,
    z: z.present ? z.value : this.z,
    placeId: placeId.present ? placeId.value : this.placeId,
    isVideo: isVideo ?? this.isVideo,
    width: width ?? this.width,
    height: height ?? this.height,
    indexedAt: indexedAt ?? this.indexedAt,
  );
  PhotoRow copyWithCompanion(PhotosCompanion data) {
    return PhotoRow(
      assetId: data.assetId.present ? data.assetId.value : this.assetId,
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
      takenAt: data.takenAt.present ? data.takenAt.value : this.takenAt,
      geohash: data.geohash.present ? data.geohash.value : this.geohash,
      x: data.x.present ? data.x.value : this.x,
      y: data.y.present ? data.y.value : this.y,
      z: data.z.present ? data.z.value : this.z,
      placeId: data.placeId.present ? data.placeId.value : this.placeId,
      isVideo: data.isVideo.present ? data.isVideo.value : this.isVideo,
      width: data.width.present ? data.width.value : this.width,
      height: data.height.present ? data.height.value : this.height,
      indexedAt: data.indexedAt.present ? data.indexedAt.value : this.indexedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PhotoRow(')
          ..write('assetId: $assetId, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('takenAt: $takenAt, ')
          ..write('geohash: $geohash, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('z: $z, ')
          ..write('placeId: $placeId, ')
          ..write('isVideo: $isVideo, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('indexedAt: $indexedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    assetId,
    lat,
    lng,
    takenAt,
    geohash,
    x,
    y,
    z,
    placeId,
    isVideo,
    width,
    height,
    indexedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PhotoRow &&
          other.assetId == this.assetId &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.takenAt == this.takenAt &&
          other.geohash == this.geohash &&
          other.x == this.x &&
          other.y == this.y &&
          other.z == this.z &&
          other.placeId == this.placeId &&
          other.isVideo == this.isVideo &&
          other.width == this.width &&
          other.height == this.height &&
          other.indexedAt == this.indexedAt);
}

class PhotosCompanion extends UpdateCompanion<PhotoRow> {
  final Value<String> assetId;
  final Value<double?> lat;
  final Value<double?> lng;
  final Value<int> takenAt;
  final Value<String?> geohash;
  final Value<double?> x;
  final Value<double?> y;
  final Value<double?> z;
  final Value<int?> placeId;
  final Value<bool> isVideo;
  final Value<int> width;
  final Value<int> height;
  final Value<int> indexedAt;
  final Value<int> rowid;
  const PhotosCompanion({
    this.assetId = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.takenAt = const Value.absent(),
    this.geohash = const Value.absent(),
    this.x = const Value.absent(),
    this.y = const Value.absent(),
    this.z = const Value.absent(),
    this.placeId = const Value.absent(),
    this.isVideo = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.indexedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PhotosCompanion.insert({
    required String assetId,
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    required int takenAt,
    this.geohash = const Value.absent(),
    this.x = const Value.absent(),
    this.y = const Value.absent(),
    this.z = const Value.absent(),
    this.placeId = const Value.absent(),
    this.isVideo = const Value.absent(),
    required int width,
    required int height,
    required int indexedAt,
    this.rowid = const Value.absent(),
  }) : assetId = Value(assetId),
       takenAt = Value(takenAt),
       width = Value(width),
       height = Value(height),
       indexedAt = Value(indexedAt);
  static Insertable<PhotoRow> custom({
    Expression<String>? assetId,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<int>? takenAt,
    Expression<String>? geohash,
    Expression<double>? x,
    Expression<double>? y,
    Expression<double>? z,
    Expression<int>? placeId,
    Expression<bool>? isVideo,
    Expression<int>? width,
    Expression<int>? height,
    Expression<int>? indexedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (assetId != null) 'asset_id': assetId,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (takenAt != null) 'taken_at': takenAt,
      if (geohash != null) 'geohash': geohash,
      if (x != null) 'x': x,
      if (y != null) 'y': y,
      if (z != null) 'z': z,
      if (placeId != null) 'place_id': placeId,
      if (isVideo != null) 'is_video': isVideo,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (indexedAt != null) 'indexed_at': indexedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PhotosCompanion copyWith({
    Value<String>? assetId,
    Value<double?>? lat,
    Value<double?>? lng,
    Value<int>? takenAt,
    Value<String?>? geohash,
    Value<double?>? x,
    Value<double?>? y,
    Value<double?>? z,
    Value<int?>? placeId,
    Value<bool>? isVideo,
    Value<int>? width,
    Value<int>? height,
    Value<int>? indexedAt,
    Value<int>? rowid,
  }) {
    return PhotosCompanion(
      assetId: assetId ?? this.assetId,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      takenAt: takenAt ?? this.takenAt,
      geohash: geohash ?? this.geohash,
      x: x ?? this.x,
      y: y ?? this.y,
      z: z ?? this.z,
      placeId: placeId ?? this.placeId,
      isVideo: isVideo ?? this.isVideo,
      width: width ?? this.width,
      height: height ?? this.height,
      indexedAt: indexedAt ?? this.indexedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (assetId.present) {
      map['asset_id'] = Variable<String>(assetId.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (takenAt.present) {
      map['taken_at'] = Variable<int>(takenAt.value);
    }
    if (geohash.present) {
      map['geohash'] = Variable<String>(geohash.value);
    }
    if (x.present) {
      map['x'] = Variable<double>(x.value);
    }
    if (y.present) {
      map['y'] = Variable<double>(y.value);
    }
    if (z.present) {
      map['z'] = Variable<double>(z.value);
    }
    if (placeId.present) {
      map['place_id'] = Variable<int>(placeId.value);
    }
    if (isVideo.present) {
      map['is_video'] = Variable<bool>(isVideo.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (indexedAt.present) {
      map['indexed_at'] = Variable<int>(indexedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhotosCompanion(')
          ..write('assetId: $assetId, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('takenAt: $takenAt, ')
          ..write('geohash: $geohash, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('z: $z, ')
          ..write('placeId: $placeId, ')
          ..write('isVideo: $isVideo, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('indexedAt: $indexedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlaceCellsTable extends PlaceCells
    with TableInfo<$PlaceCellsTable, PlaceCellRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlaceCellsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _geohashMeta = const VerificationMeta(
    'geohash',
  );
  @override
  late final GeneratedColumn<String> geohash = GeneratedColumn<String>(
    'geohash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _placeIdMeta = const VerificationMeta(
    'placeId',
  );
  @override
  late final GeneratedColumn<int> placeId = GeneratedColumn<int>(
    'place_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES places (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [geohash, placeId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'place_cells';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlaceCellRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('geohash')) {
      context.handle(
        _geohashMeta,
        geohash.isAcceptableOrUnknown(data['geohash']!, _geohashMeta),
      );
    } else if (isInserting) {
      context.missing(_geohashMeta);
    }
    if (data.containsKey('place_id')) {
      context.handle(
        _placeIdMeta,
        placeId.isAcceptableOrUnknown(data['place_id']!, _placeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_placeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {geohash};
  @override
  PlaceCellRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaceCellRow(
      geohash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}geohash'],
      )!,
      placeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}place_id'],
      )!,
    );
  }

  @override
  $PlaceCellsTable createAlias(String alias) {
    return $PlaceCellsTable(attachedDatabase, alias);
  }
}

class PlaceCellRow extends DataClass implements Insertable<PlaceCellRow> {
  final String geohash;
  final int placeId;
  const PlaceCellRow({required this.geohash, required this.placeId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['geohash'] = Variable<String>(geohash);
    map['place_id'] = Variable<int>(placeId);
    return map;
  }

  PlaceCellsCompanion toCompanion(bool nullToAbsent) {
    return PlaceCellsCompanion(
      geohash: Value(geohash),
      placeId: Value(placeId),
    );
  }

  factory PlaceCellRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaceCellRow(
      geohash: serializer.fromJson<String>(json['geohash']),
      placeId: serializer.fromJson<int>(json['placeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'geohash': serializer.toJson<String>(geohash),
      'placeId': serializer.toJson<int>(placeId),
    };
  }

  PlaceCellRow copyWith({String? geohash, int? placeId}) => PlaceCellRow(
    geohash: geohash ?? this.geohash,
    placeId: placeId ?? this.placeId,
  );
  PlaceCellRow copyWithCompanion(PlaceCellsCompanion data) {
    return PlaceCellRow(
      geohash: data.geohash.present ? data.geohash.value : this.geohash,
      placeId: data.placeId.present ? data.placeId.value : this.placeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlaceCellRow(')
          ..write('geohash: $geohash, ')
          ..write('placeId: $placeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(geohash, placeId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaceCellRow &&
          other.geohash == this.geohash &&
          other.placeId == this.placeId);
}

class PlaceCellsCompanion extends UpdateCompanion<PlaceCellRow> {
  final Value<String> geohash;
  final Value<int> placeId;
  final Value<int> rowid;
  const PlaceCellsCompanion({
    this.geohash = const Value.absent(),
    this.placeId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlaceCellsCompanion.insert({
    required String geohash,
    required int placeId,
    this.rowid = const Value.absent(),
  }) : geohash = Value(geohash),
       placeId = Value(placeId);
  static Insertable<PlaceCellRow> custom({
    Expression<String>? geohash,
    Expression<int>? placeId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (geohash != null) 'geohash': geohash,
      if (placeId != null) 'place_id': placeId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlaceCellsCompanion copyWith({
    Value<String>? geohash,
    Value<int>? placeId,
    Value<int>? rowid,
  }) {
    return PlaceCellsCompanion(
      geohash: geohash ?? this.geohash,
      placeId: placeId ?? this.placeId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (geohash.present) {
      map['geohash'] = Variable<String>(geohash.value);
    }
    if (placeId.present) {
      map['place_id'] = Variable<int>(placeId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaceCellsCompanion(')
          ..write('geohash: $geohash, ')
          ..write('placeId: $placeId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RephotosTable extends Rephotos
    with TableInfo<$RephotosTable, RephotoRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RephotosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _originalAssetIdMeta = const VerificationMeta(
    'originalAssetId',
  );
  @override
  late final GeneratedColumn<String> originalAssetId = GeneratedColumn<String>(
    'original_asset_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _newAssetIdMeta = const VerificationMeta(
    'newAssetId',
  );
  @override
  late final GeneratedColumn<String> newAssetId = GeneratedColumn<String>(
    'new_asset_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _placeIdMeta = const VerificationMeta(
    'placeId',
  );
  @override
  late final GeneratedColumn<int> placeId = GeneratedColumn<int>(
    'place_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES places (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    originalAssetId,
    newAssetId,
    placeId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rephotos';
  @override
  VerificationContext validateIntegrity(
    Insertable<RephotoRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('original_asset_id')) {
      context.handle(
        _originalAssetIdMeta,
        originalAssetId.isAcceptableOrUnknown(
          data['original_asset_id']!,
          _originalAssetIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_originalAssetIdMeta);
    }
    if (data.containsKey('new_asset_id')) {
      context.handle(
        _newAssetIdMeta,
        newAssetId.isAcceptableOrUnknown(
          data['new_asset_id']!,
          _newAssetIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_newAssetIdMeta);
    }
    if (data.containsKey('place_id')) {
      context.handle(
        _placeIdMeta,
        placeId.isAcceptableOrUnknown(data['place_id']!, _placeIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RephotoRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RephotoRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      originalAssetId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}original_asset_id'],
      )!,
      newAssetId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}new_asset_id'],
      )!,
      placeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}place_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RephotosTable createAlias(String alias) {
    return $RephotosTable(attachedDatabase, alias);
  }
}

class RephotoRow extends DataClass implements Insertable<RephotoRow> {
  final int id;
  final String originalAssetId;
  final String newAssetId;
  final int? placeId;
  final int createdAt;
  const RephotoRow({
    required this.id,
    required this.originalAssetId,
    required this.newAssetId,
    this.placeId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['original_asset_id'] = Variable<String>(originalAssetId);
    map['new_asset_id'] = Variable<String>(newAssetId);
    if (!nullToAbsent || placeId != null) {
      map['place_id'] = Variable<int>(placeId);
    }
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  RephotosCompanion toCompanion(bool nullToAbsent) {
    return RephotosCompanion(
      id: Value(id),
      originalAssetId: Value(originalAssetId),
      newAssetId: Value(newAssetId),
      placeId: placeId == null && nullToAbsent
          ? const Value.absent()
          : Value(placeId),
      createdAt: Value(createdAt),
    );
  }

  factory RephotoRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RephotoRow(
      id: serializer.fromJson<int>(json['id']),
      originalAssetId: serializer.fromJson<String>(json['originalAssetId']),
      newAssetId: serializer.fromJson<String>(json['newAssetId']),
      placeId: serializer.fromJson<int?>(json['placeId']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'originalAssetId': serializer.toJson<String>(originalAssetId),
      'newAssetId': serializer.toJson<String>(newAssetId),
      'placeId': serializer.toJson<int?>(placeId),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  RephotoRow copyWith({
    int? id,
    String? originalAssetId,
    String? newAssetId,
    Value<int?> placeId = const Value.absent(),
    int? createdAt,
  }) => RephotoRow(
    id: id ?? this.id,
    originalAssetId: originalAssetId ?? this.originalAssetId,
    newAssetId: newAssetId ?? this.newAssetId,
    placeId: placeId.present ? placeId.value : this.placeId,
    createdAt: createdAt ?? this.createdAt,
  );
  RephotoRow copyWithCompanion(RephotosCompanion data) {
    return RephotoRow(
      id: data.id.present ? data.id.value : this.id,
      originalAssetId: data.originalAssetId.present
          ? data.originalAssetId.value
          : this.originalAssetId,
      newAssetId: data.newAssetId.present
          ? data.newAssetId.value
          : this.newAssetId,
      placeId: data.placeId.present ? data.placeId.value : this.placeId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RephotoRow(')
          ..write('id: $id, ')
          ..write('originalAssetId: $originalAssetId, ')
          ..write('newAssetId: $newAssetId, ')
          ..write('placeId: $placeId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, originalAssetId, newAssetId, placeId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RephotoRow &&
          other.id == this.id &&
          other.originalAssetId == this.originalAssetId &&
          other.newAssetId == this.newAssetId &&
          other.placeId == this.placeId &&
          other.createdAt == this.createdAt);
}

class RephotosCompanion extends UpdateCompanion<RephotoRow> {
  final Value<int> id;
  final Value<String> originalAssetId;
  final Value<String> newAssetId;
  final Value<int?> placeId;
  final Value<int> createdAt;
  const RephotosCompanion({
    this.id = const Value.absent(),
    this.originalAssetId = const Value.absent(),
    this.newAssetId = const Value.absent(),
    this.placeId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RephotosCompanion.insert({
    this.id = const Value.absent(),
    required String originalAssetId,
    required String newAssetId,
    this.placeId = const Value.absent(),
    required int createdAt,
  }) : originalAssetId = Value(originalAssetId),
       newAssetId = Value(newAssetId),
       createdAt = Value(createdAt);
  static Insertable<RephotoRow> custom({
    Expression<int>? id,
    Expression<String>? originalAssetId,
    Expression<String>? newAssetId,
    Expression<int>? placeId,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (originalAssetId != null) 'original_asset_id': originalAssetId,
      if (newAssetId != null) 'new_asset_id': newAssetId,
      if (placeId != null) 'place_id': placeId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RephotosCompanion copyWith({
    Value<int>? id,
    Value<String>? originalAssetId,
    Value<String>? newAssetId,
    Value<int?>? placeId,
    Value<int>? createdAt,
  }) {
    return RephotosCompanion(
      id: id ?? this.id,
      originalAssetId: originalAssetId ?? this.originalAssetId,
      newAssetId: newAssetId ?? this.newAssetId,
      placeId: placeId ?? this.placeId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (originalAssetId.present) {
      map['original_asset_id'] = Variable<String>(originalAssetId.value);
    }
    if (newAssetId.present) {
      map['new_asset_id'] = Variable<String>(newAssetId.value);
    }
    if (placeId.present) {
      map['place_id'] = Variable<int>(placeId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RephotosCompanion(')
          ..write('id: $id, ')
          ..write('originalAssetId: $originalAssetId, ')
          ..write('newAssetId: $newAssetId, ')
          ..write('placeId: $placeId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $IndexStateTable extends IndexState
    with TableInfo<$IndexStateTable, IndexStateRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IndexStateTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'index_state';
  @override
  VerificationContext validateIntegrity(
    Insertable<IndexStateRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  IndexStateRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IndexStateRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $IndexStateTable createAlias(String alias) {
    return $IndexStateTable(attachedDatabase, alias);
  }
}

class IndexStateRow extends DataClass implements Insertable<IndexStateRow> {
  final String key;
  final String value;
  const IndexStateRow({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  IndexStateCompanion toCompanion(bool nullToAbsent) {
    return IndexStateCompanion(key: Value(key), value: Value(value));
  }

  factory IndexStateRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IndexStateRow(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  IndexStateRow copyWith({String? key, String? value}) =>
      IndexStateRow(key: key ?? this.key, value: value ?? this.value);
  IndexStateRow copyWithCompanion(IndexStateCompanion data) {
    return IndexStateRow(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IndexStateRow(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IndexStateRow &&
          other.key == this.key &&
          other.value == this.value);
}

class IndexStateCompanion extends UpdateCompanion<IndexStateRow> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const IndexStateCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IndexStateCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<IndexStateRow> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IndexStateCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return IndexStateCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IndexStateCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ScanSeenTable extends ScanSeen
    with TableInfo<$ScanSeenTable, ScanSeenRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScanSeenTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _assetIdMeta = const VerificationMeta(
    'assetId',
  );
  @override
  late final GeneratedColumn<String> assetId = GeneratedColumn<String>(
    'asset_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [assetId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'scan_seen';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScanSeenRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('asset_id')) {
      context.handle(
        _assetIdMeta,
        assetId.isAcceptableOrUnknown(data['asset_id']!, _assetIdMeta),
      );
    } else if (isInserting) {
      context.missing(_assetIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {assetId};
  @override
  ScanSeenRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScanSeenRow(
      assetId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}asset_id'],
      )!,
    );
  }

  @override
  $ScanSeenTable createAlias(String alias) {
    return $ScanSeenTable(attachedDatabase, alias);
  }
}

class ScanSeenRow extends DataClass implements Insertable<ScanSeenRow> {
  final String assetId;
  const ScanSeenRow({required this.assetId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['asset_id'] = Variable<String>(assetId);
    return map;
  }

  ScanSeenCompanion toCompanion(bool nullToAbsent) {
    return ScanSeenCompanion(assetId: Value(assetId));
  }

  factory ScanSeenRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScanSeenRow(assetId: serializer.fromJson<String>(json['assetId']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'assetId': serializer.toJson<String>(assetId)};
  }

  ScanSeenRow copyWith({String? assetId}) =>
      ScanSeenRow(assetId: assetId ?? this.assetId);
  ScanSeenRow copyWithCompanion(ScanSeenCompanion data) {
    return ScanSeenRow(
      assetId: data.assetId.present ? data.assetId.value : this.assetId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScanSeenRow(')
          ..write('assetId: $assetId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => assetId.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScanSeenRow && other.assetId == this.assetId);
}

class ScanSeenCompanion extends UpdateCompanion<ScanSeenRow> {
  final Value<String> assetId;
  final Value<int> rowid;
  const ScanSeenCompanion({
    this.assetId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScanSeenCompanion.insert({
    required String assetId,
    this.rowid = const Value.absent(),
  }) : assetId = Value(assetId);
  static Insertable<ScanSeenRow> custom({
    Expression<String>? assetId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (assetId != null) 'asset_id': assetId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScanSeenCompanion copyWith({Value<String>? assetId, Value<int>? rowid}) {
    return ScanSeenCompanion(
      assetId: assetId ?? this.assetId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (assetId.present) {
      map['asset_id'] = Variable<String>(assetId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScanSeenCompanion(')
          ..write('assetId: $assetId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PreferencesTable extends Preferences
    with TableInfo<$PreferencesTable, PreferenceRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreferencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'preferences';
  @override
  VerificationContext validateIntegrity(
    Insertable<PreferenceRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  PreferenceRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PreferenceRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $PreferencesTable createAlias(String alias) {
    return $PreferencesTable(attachedDatabase, alias);
  }
}

class PreferenceRow extends DataClass implements Insertable<PreferenceRow> {
  final String key;
  final String value;
  const PreferenceRow({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  PreferencesCompanion toCompanion(bool nullToAbsent) {
    return PreferencesCompanion(key: Value(key), value: Value(value));
  }

  factory PreferenceRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PreferenceRow(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  PreferenceRow copyWith({String? key, String? value}) =>
      PreferenceRow(key: key ?? this.key, value: value ?? this.value);
  PreferenceRow copyWithCompanion(PreferencesCompanion data) {
    return PreferenceRow(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PreferenceRow(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PreferenceRow &&
          other.key == this.key &&
          other.value == this.value);
}

class PreferencesCompanion extends UpdateCompanion<PreferenceRow> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const PreferencesCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PreferencesCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<PreferenceRow> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PreferencesCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return PreferencesCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreferencesCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlacesTable places = $PlacesTable(this);
  late final $PhotosTable photos = $PhotosTable(this);
  late final $PlaceCellsTable placeCells = $PlaceCellsTable(this);
  late final $RephotosTable rephotos = $RephotosTable(this);
  late final $IndexStateTable indexState = $IndexStateTable(this);
  late final $ScanSeenTable scanSeen = $ScanSeenTable(this);
  late final $PreferencesTable preferences = $PreferencesTable(this);
  late final Index photosLatLng = Index(
    'photos_lat_lng',
    'CREATE INDEX photos_lat_lng ON photos (lat, lng)',
  );
  late final Index photosGeohash = Index(
    'photos_geohash',
    'CREATE INDEX photos_geohash ON photos (geohash)',
  );
  late final Index photosPlaceTaken = Index(
    'photos_place_taken',
    'CREATE INDEX photos_place_taken ON photos (place_id, taken_at)',
  );
  late final Index photosTakenAt = Index(
    'photos_taken_at',
    'CREATE INDEX photos_taken_at ON photos (taken_at)',
  );
  late final Index placesCenter = Index(
    'places_center',
    'CREATE INDEX places_center ON places (center_lat, center_lng)',
  );
  late final Index placeCellsPlace = Index(
    'place_cells_place',
    'CREATE INDEX place_cells_place ON place_cells (place_id)',
  );
  late final Index rephotosOriginal = Index(
    'rephotos_original',
    'CREATE INDEX rephotos_original ON rephotos (original_asset_id)',
  );
  late final PhotosDao photosDao = PhotosDao(this as AppDatabase);
  late final IndexStateDao indexStateDao = IndexStateDao(this as AppDatabase);
  late final MemoriesDao memoriesDao = MemoriesDao(this as AppDatabase);
  late final PlacesDao placesDao = PlacesDao(this as AppDatabase);
  late final PreferencesDao preferencesDao = PreferencesDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    places,
    photos,
    placeCells,
    rephotos,
    indexState,
    scanSeen,
    preferences,
    photosLatLng,
    photosGeohash,
    photosPlaceTaken,
    photosTakenAt,
    placesCenter,
    placeCellsPlace,
    rephotosOriginal,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'places',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('photos', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'places',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('place_cells', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'places',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('rephotos', kind: UpdateKind.update)],
    ),
  ]);
}

typedef $$PlacesTableCreateCompanionBuilder =
    PlacesCompanion Function({
      Value<int> id,
      required double centerLat,
      required double centerLng,
      required double radiusM,
      Value<int> photoCount,
      Value<int> distinctDays,
      required int firstAt,
      required int lastAt,
      Value<String?> label,
      Value<String?> userLabel,
      Value<MuteState> mute,
      Value<int?> lastNotifiedAt,
    });
typedef $$PlacesTableUpdateCompanionBuilder =
    PlacesCompanion Function({
      Value<int> id,
      Value<double> centerLat,
      Value<double> centerLng,
      Value<double> radiusM,
      Value<int> photoCount,
      Value<int> distinctDays,
      Value<int> firstAt,
      Value<int> lastAt,
      Value<String?> label,
      Value<String?> userLabel,
      Value<MuteState> mute,
      Value<int?> lastNotifiedAt,
    });

final class $$PlacesTableReferences
    extends BaseReferences<_$AppDatabase, $PlacesTable, PlaceRow> {
  $$PlacesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PhotosTable, List<PhotoRow>> _photosRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.photos,
    aliasName: 'places__id__photos__place_id',
  );

  $$PhotosTableProcessedTableManager get photosRefs {
    final manager = $$PhotosTableTableManager(
      $_db,
      $_db.photos,
    ).filter((f) => f.placeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_photosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PlaceCellsTable, List<PlaceCellRow>>
  _placeCellsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.placeCells,
    aliasName: 'places__id__place_cells__place_id',
  );

  $$PlaceCellsTableProcessedTableManager get placeCellsRefs {
    final manager = $$PlaceCellsTableTableManager(
      $_db,
      $_db.placeCells,
    ).filter((f) => f.placeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_placeCellsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RephotosTable, List<RephotoRow>>
  _rephotosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.rephotos,
    aliasName: 'places__id__rephotos__place_id',
  );

  $$RephotosTableProcessedTableManager get rephotosRefs {
    final manager = $$RephotosTableTableManager(
      $_db,
      $_db.rephotos,
    ).filter((f) => f.placeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_rephotosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PlacesTableFilterComposer
    extends Composer<_$AppDatabase, $PlacesTable> {
  $$PlacesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get centerLat => $composableBuilder(
    column: $table.centerLat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get centerLng => $composableBuilder(
    column: $table.centerLng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get radiusM => $composableBuilder(
    column: $table.radiusM,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get photoCount => $composableBuilder(
    column: $table.photoCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get distinctDays => $composableBuilder(
    column: $table.distinctDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get firstAt => $composableBuilder(
    column: $table.firstAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastAt => $composableBuilder(
    column: $table.lastAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userLabel => $composableBuilder(
    column: $table.userLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<MuteState, MuteState, String> get mute =>
      $composableBuilder(
        column: $table.mute,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get lastNotifiedAt => $composableBuilder(
    column: $table.lastNotifiedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> photosRefs(
    Expression<bool> Function($$PhotosTableFilterComposer f) f,
  ) {
    final $$PhotosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.photos,
      getReferencedColumn: (t) => t.placeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhotosTableFilterComposer(
            $db: $db,
            $table: $db.photos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> placeCellsRefs(
    Expression<bool> Function($$PlaceCellsTableFilterComposer f) f,
  ) {
    final $$PlaceCellsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.placeCells,
      getReferencedColumn: (t) => t.placeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaceCellsTableFilterComposer(
            $db: $db,
            $table: $db.placeCells,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> rephotosRefs(
    Expression<bool> Function($$RephotosTableFilterComposer f) f,
  ) {
    final $$RephotosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rephotos,
      getReferencedColumn: (t) => t.placeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RephotosTableFilterComposer(
            $db: $db,
            $table: $db.rephotos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlacesTableOrderingComposer
    extends Composer<_$AppDatabase, $PlacesTable> {
  $$PlacesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get centerLat => $composableBuilder(
    column: $table.centerLat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get centerLng => $composableBuilder(
    column: $table.centerLng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get radiusM => $composableBuilder(
    column: $table.radiusM,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get photoCount => $composableBuilder(
    column: $table.photoCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get distinctDays => $composableBuilder(
    column: $table.distinctDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get firstAt => $composableBuilder(
    column: $table.firstAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastAt => $composableBuilder(
    column: $table.lastAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userLabel => $composableBuilder(
    column: $table.userLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mute => $composableBuilder(
    column: $table.mute,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastNotifiedAt => $composableBuilder(
    column: $table.lastNotifiedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlacesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlacesTable> {
  $$PlacesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get centerLat =>
      $composableBuilder(column: $table.centerLat, builder: (column) => column);

  GeneratedColumn<double> get centerLng =>
      $composableBuilder(column: $table.centerLng, builder: (column) => column);

  GeneratedColumn<double> get radiusM =>
      $composableBuilder(column: $table.radiusM, builder: (column) => column);

  GeneratedColumn<int> get photoCount => $composableBuilder(
    column: $table.photoCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get distinctDays => $composableBuilder(
    column: $table.distinctDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get firstAt =>
      $composableBuilder(column: $table.firstAt, builder: (column) => column);

  GeneratedColumn<int> get lastAt =>
      $composableBuilder(column: $table.lastAt, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get userLabel =>
      $composableBuilder(column: $table.userLabel, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MuteState, String> get mute =>
      $composableBuilder(column: $table.mute, builder: (column) => column);

  GeneratedColumn<int> get lastNotifiedAt => $composableBuilder(
    column: $table.lastNotifiedAt,
    builder: (column) => column,
  );

  Expression<T> photosRefs<T extends Object>(
    Expression<T> Function($$PhotosTableAnnotationComposer a) f,
  ) {
    final $$PhotosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.photos,
      getReferencedColumn: (t) => t.placeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhotosTableAnnotationComposer(
            $db: $db,
            $table: $db.photos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> placeCellsRefs<T extends Object>(
    Expression<T> Function($$PlaceCellsTableAnnotationComposer a) f,
  ) {
    final $$PlaceCellsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.placeCells,
      getReferencedColumn: (t) => t.placeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlaceCellsTableAnnotationComposer(
            $db: $db,
            $table: $db.placeCells,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> rephotosRefs<T extends Object>(
    Expression<T> Function($$RephotosTableAnnotationComposer a) f,
  ) {
    final $$RephotosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rephotos,
      getReferencedColumn: (t) => t.placeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RephotosTableAnnotationComposer(
            $db: $db,
            $table: $db.rephotos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlacesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlacesTable,
          PlaceRow,
          $$PlacesTableFilterComposer,
          $$PlacesTableOrderingComposer,
          $$PlacesTableAnnotationComposer,
          $$PlacesTableCreateCompanionBuilder,
          $$PlacesTableUpdateCompanionBuilder,
          (PlaceRow, $$PlacesTableReferences),
          PlaceRow,
          PrefetchHooks Function({
            bool photosRefs,
            bool placeCellsRefs,
            bool rephotosRefs,
          })
        > {
  $$PlacesTableTableManager(_$AppDatabase db, $PlacesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlacesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlacesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlacesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> centerLat = const Value.absent(),
                Value<double> centerLng = const Value.absent(),
                Value<double> radiusM = const Value.absent(),
                Value<int> photoCount = const Value.absent(),
                Value<int> distinctDays = const Value.absent(),
                Value<int> firstAt = const Value.absent(),
                Value<int> lastAt = const Value.absent(),
                Value<String?> label = const Value.absent(),
                Value<String?> userLabel = const Value.absent(),
                Value<MuteState> mute = const Value.absent(),
                Value<int?> lastNotifiedAt = const Value.absent(),
              }) => PlacesCompanion(
                id: id,
                centerLat: centerLat,
                centerLng: centerLng,
                radiusM: radiusM,
                photoCount: photoCount,
                distinctDays: distinctDays,
                firstAt: firstAt,
                lastAt: lastAt,
                label: label,
                userLabel: userLabel,
                mute: mute,
                lastNotifiedAt: lastNotifiedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double centerLat,
                required double centerLng,
                required double radiusM,
                Value<int> photoCount = const Value.absent(),
                Value<int> distinctDays = const Value.absent(),
                required int firstAt,
                required int lastAt,
                Value<String?> label = const Value.absent(),
                Value<String?> userLabel = const Value.absent(),
                Value<MuteState> mute = const Value.absent(),
                Value<int?> lastNotifiedAt = const Value.absent(),
              }) => PlacesCompanion.insert(
                id: id,
                centerLat: centerLat,
                centerLng: centerLng,
                radiusM: radiusM,
                photoCount: photoCount,
                distinctDays: distinctDays,
                firstAt: firstAt,
                lastAt: lastAt,
                label: label,
                userLabel: userLabel,
                mute: mute,
                lastNotifiedAt: lastNotifiedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PlacesTable, PlaceRow>(table),
                  $$PlacesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                photosRefs = false,
                placeCellsRefs = false,
                rephotosRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (photosRefs) db.photos,
                    if (placeCellsRefs) db.placeCells,
                    if (rephotosRefs) db.rephotos,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (photosRefs)
                        await $_getPrefetchedData<
                          PlaceRow,
                          $PlacesTable,
                          PhotoRow
                        >(
                          currentTable: table,
                          referencedTable: $$PlacesTableReferences
                              ._photosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlacesTableReferences(db, table, p0).photosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.placeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (placeCellsRefs)
                        await $_getPrefetchedData<
                          PlaceRow,
                          $PlacesTable,
                          PlaceCellRow
                        >(
                          currentTable: table,
                          referencedTable: $$PlacesTableReferences
                              ._placeCellsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlacesTableReferences(
                                db,
                                table,
                                p0,
                              ).placeCellsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.placeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (rephotosRefs)
                        await $_getPrefetchedData<
                          PlaceRow,
                          $PlacesTable,
                          RephotoRow
                        >(
                          currentTable: table,
                          referencedTable: $$PlacesTableReferences
                              ._rephotosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlacesTableReferences(
                                db,
                                table,
                                p0,
                              ).rephotosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.placeId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PlacesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlacesTable,
      PlaceRow,
      $$PlacesTableFilterComposer,
      $$PlacesTableOrderingComposer,
      $$PlacesTableAnnotationComposer,
      $$PlacesTableCreateCompanionBuilder,
      $$PlacesTableUpdateCompanionBuilder,
      (PlaceRow, $$PlacesTableReferences),
      PlaceRow,
      PrefetchHooks Function({
        bool photosRefs,
        bool placeCellsRefs,
        bool rephotosRefs,
      })
    >;
typedef $$PhotosTableCreateCompanionBuilder =
    PhotosCompanion Function({
      required String assetId,
      Value<double?> lat,
      Value<double?> lng,
      required int takenAt,
      Value<String?> geohash,
      Value<double?> x,
      Value<double?> y,
      Value<double?> z,
      Value<int?> placeId,
      Value<bool> isVideo,
      required int width,
      required int height,
      required int indexedAt,
      Value<int> rowid,
    });
typedef $$PhotosTableUpdateCompanionBuilder =
    PhotosCompanion Function({
      Value<String> assetId,
      Value<double?> lat,
      Value<double?> lng,
      Value<int> takenAt,
      Value<String?> geohash,
      Value<double?> x,
      Value<double?> y,
      Value<double?> z,
      Value<int?> placeId,
      Value<bool> isVideo,
      Value<int> width,
      Value<int> height,
      Value<int> indexedAt,
      Value<int> rowid,
    });

final class $$PhotosTableReferences
    extends BaseReferences<_$AppDatabase, $PhotosTable, PhotoRow> {
  $$PhotosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlacesTable _placeIdTable(_$AppDatabase db) =>
      db.places.createAlias('photos__place_id__places__id');

  $$PlacesTableProcessedTableManager? get placeId {
    final $_column = $_itemColumn<int>('place_id');
    if ($_column == null) return null;
    final manager = $$PlacesTableTableManager(
      $_db,
      $_db.places,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_placeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PhotosTableFilterComposer
    extends Composer<_$AppDatabase, $PhotosTable> {
  $$PhotosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get assetId => $composableBuilder(
    column: $table.assetId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get takenAt => $composableBuilder(
    column: $table.takenAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get geohash => $composableBuilder(
    column: $table.geohash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get x => $composableBuilder(
    column: $table.x,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get y => $composableBuilder(
    column: $table.y,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get z => $composableBuilder(
    column: $table.z,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isVideo => $composableBuilder(
    column: $table.isVideo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get indexedAt => $composableBuilder(
    column: $table.indexedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PlacesTableFilterComposer get placeId {
    final $$PlacesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeId,
      referencedTable: $db.places,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacesTableFilterComposer(
            $db: $db,
            $table: $db.places,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PhotosTableOrderingComposer
    extends Composer<_$AppDatabase, $PhotosTable> {
  $$PhotosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get assetId => $composableBuilder(
    column: $table.assetId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get takenAt => $composableBuilder(
    column: $table.takenAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get geohash => $composableBuilder(
    column: $table.geohash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get x => $composableBuilder(
    column: $table.x,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get y => $composableBuilder(
    column: $table.y,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get z => $composableBuilder(
    column: $table.z,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isVideo => $composableBuilder(
    column: $table.isVideo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get indexedAt => $composableBuilder(
    column: $table.indexedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlacesTableOrderingComposer get placeId {
    final $$PlacesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeId,
      referencedTable: $db.places,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacesTableOrderingComposer(
            $db: $db,
            $table: $db.places,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PhotosTableAnnotationComposer
    extends Composer<_$AppDatabase, $PhotosTable> {
  $$PhotosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get assetId =>
      $composableBuilder(column: $table.assetId, builder: (column) => column);

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);

  GeneratedColumn<int> get takenAt =>
      $composableBuilder(column: $table.takenAt, builder: (column) => column);

  GeneratedColumn<String> get geohash =>
      $composableBuilder(column: $table.geohash, builder: (column) => column);

  GeneratedColumn<double> get x =>
      $composableBuilder(column: $table.x, builder: (column) => column);

  GeneratedColumn<double> get y =>
      $composableBuilder(column: $table.y, builder: (column) => column);

  GeneratedColumn<double> get z =>
      $composableBuilder(column: $table.z, builder: (column) => column);

  GeneratedColumn<bool> get isVideo =>
      $composableBuilder(column: $table.isVideo, builder: (column) => column);

  GeneratedColumn<int> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<int> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<int> get indexedAt =>
      $composableBuilder(column: $table.indexedAt, builder: (column) => column);

  $$PlacesTableAnnotationComposer get placeId {
    final $$PlacesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeId,
      referencedTable: $db.places,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacesTableAnnotationComposer(
            $db: $db,
            $table: $db.places,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PhotosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PhotosTable,
          PhotoRow,
          $$PhotosTableFilterComposer,
          $$PhotosTableOrderingComposer,
          $$PhotosTableAnnotationComposer,
          $$PhotosTableCreateCompanionBuilder,
          $$PhotosTableUpdateCompanionBuilder,
          (PhotoRow, $$PhotosTableReferences),
          PhotoRow,
          PrefetchHooks Function({bool placeId})
        > {
  $$PhotosTableTableManager(_$AppDatabase db, $PhotosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PhotosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PhotosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PhotosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> assetId = const Value.absent(),
                Value<double?> lat = const Value.absent(),
                Value<double?> lng = const Value.absent(),
                Value<int> takenAt = const Value.absent(),
                Value<String?> geohash = const Value.absent(),
                Value<double?> x = const Value.absent(),
                Value<double?> y = const Value.absent(),
                Value<double?> z = const Value.absent(),
                Value<int?> placeId = const Value.absent(),
                Value<bool> isVideo = const Value.absent(),
                Value<int> width = const Value.absent(),
                Value<int> height = const Value.absent(),
                Value<int> indexedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhotosCompanion(
                assetId: assetId,
                lat: lat,
                lng: lng,
                takenAt: takenAt,
                geohash: geohash,
                x: x,
                y: y,
                z: z,
                placeId: placeId,
                isVideo: isVideo,
                width: width,
                height: height,
                indexedAt: indexedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String assetId,
                Value<double?> lat = const Value.absent(),
                Value<double?> lng = const Value.absent(),
                required int takenAt,
                Value<String?> geohash = const Value.absent(),
                Value<double?> x = const Value.absent(),
                Value<double?> y = const Value.absent(),
                Value<double?> z = const Value.absent(),
                Value<int?> placeId = const Value.absent(),
                Value<bool> isVideo = const Value.absent(),
                required int width,
                required int height,
                required int indexedAt,
                Value<int> rowid = const Value.absent(),
              }) => PhotosCompanion.insert(
                assetId: assetId,
                lat: lat,
                lng: lng,
                takenAt: takenAt,
                geohash: geohash,
                x: x,
                y: y,
                z: z,
                placeId: placeId,
                isVideo: isVideo,
                width: width,
                height: height,
                indexedAt: indexedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PhotosTable, PhotoRow>(table),
                  $$PhotosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({placeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (placeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.placeId,
                                referencedTable: $$PhotosTableReferences
                                    ._placeIdTable(db),
                                referencedColumn: $$PhotosTableReferences
                                    ._placeIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PhotosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PhotosTable,
      PhotoRow,
      $$PhotosTableFilterComposer,
      $$PhotosTableOrderingComposer,
      $$PhotosTableAnnotationComposer,
      $$PhotosTableCreateCompanionBuilder,
      $$PhotosTableUpdateCompanionBuilder,
      (PhotoRow, $$PhotosTableReferences),
      PhotoRow,
      PrefetchHooks Function({bool placeId})
    >;
typedef $$PlaceCellsTableCreateCompanionBuilder =
    PlaceCellsCompanion Function({
      required String geohash,
      required int placeId,
      Value<int> rowid,
    });
typedef $$PlaceCellsTableUpdateCompanionBuilder =
    PlaceCellsCompanion Function({
      Value<String> geohash,
      Value<int> placeId,
      Value<int> rowid,
    });

final class $$PlaceCellsTableReferences
    extends BaseReferences<_$AppDatabase, $PlaceCellsTable, PlaceCellRow> {
  $$PlaceCellsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlacesTable _placeIdTable(_$AppDatabase db) =>
      db.places.createAlias('place_cells__place_id__places__id');

  $$PlacesTableProcessedTableManager get placeId {
    final $_column = $_itemColumn<int>('place_id')!;

    final manager = $$PlacesTableTableManager(
      $_db,
      $_db.places,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_placeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PlaceCellsTableFilterComposer
    extends Composer<_$AppDatabase, $PlaceCellsTable> {
  $$PlaceCellsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get geohash => $composableBuilder(
    column: $table.geohash,
    builder: (column) => ColumnFilters(column),
  );

  $$PlacesTableFilterComposer get placeId {
    final $$PlacesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeId,
      referencedTable: $db.places,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacesTableFilterComposer(
            $db: $db,
            $table: $db.places,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlaceCellsTableOrderingComposer
    extends Composer<_$AppDatabase, $PlaceCellsTable> {
  $$PlaceCellsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get geohash => $composableBuilder(
    column: $table.geohash,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlacesTableOrderingComposer get placeId {
    final $$PlacesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeId,
      referencedTable: $db.places,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacesTableOrderingComposer(
            $db: $db,
            $table: $db.places,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlaceCellsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlaceCellsTable> {
  $$PlaceCellsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get geohash =>
      $composableBuilder(column: $table.geohash, builder: (column) => column);

  $$PlacesTableAnnotationComposer get placeId {
    final $$PlacesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeId,
      referencedTable: $db.places,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacesTableAnnotationComposer(
            $db: $db,
            $table: $db.places,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlaceCellsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlaceCellsTable,
          PlaceCellRow,
          $$PlaceCellsTableFilterComposer,
          $$PlaceCellsTableOrderingComposer,
          $$PlaceCellsTableAnnotationComposer,
          $$PlaceCellsTableCreateCompanionBuilder,
          $$PlaceCellsTableUpdateCompanionBuilder,
          (PlaceCellRow, $$PlaceCellsTableReferences),
          PlaceCellRow,
          PrefetchHooks Function({bool placeId})
        > {
  $$PlaceCellsTableTableManager(_$AppDatabase db, $PlaceCellsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlaceCellsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlaceCellsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlaceCellsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> geohash = const Value.absent(),
                Value<int> placeId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlaceCellsCompanion(
                geohash: geohash,
                placeId: placeId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String geohash,
                required int placeId,
                Value<int> rowid = const Value.absent(),
              }) => PlaceCellsCompanion.insert(
                geohash: geohash,
                placeId: placeId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PlaceCellsTable, PlaceCellRow>(table),
                  $$PlaceCellsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({placeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (placeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.placeId,
                                referencedTable: $$PlaceCellsTableReferences
                                    ._placeIdTable(db),
                                referencedColumn: $$PlaceCellsTableReferences
                                    ._placeIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PlaceCellsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlaceCellsTable,
      PlaceCellRow,
      $$PlaceCellsTableFilterComposer,
      $$PlaceCellsTableOrderingComposer,
      $$PlaceCellsTableAnnotationComposer,
      $$PlaceCellsTableCreateCompanionBuilder,
      $$PlaceCellsTableUpdateCompanionBuilder,
      (PlaceCellRow, $$PlaceCellsTableReferences),
      PlaceCellRow,
      PrefetchHooks Function({bool placeId})
    >;
typedef $$RephotosTableCreateCompanionBuilder =
    RephotosCompanion Function({
      Value<int> id,
      required String originalAssetId,
      required String newAssetId,
      Value<int?> placeId,
      required int createdAt,
    });
typedef $$RephotosTableUpdateCompanionBuilder =
    RephotosCompanion Function({
      Value<int> id,
      Value<String> originalAssetId,
      Value<String> newAssetId,
      Value<int?> placeId,
      Value<int> createdAt,
    });

final class $$RephotosTableReferences
    extends BaseReferences<_$AppDatabase, $RephotosTable, RephotoRow> {
  $$RephotosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlacesTable _placeIdTable(_$AppDatabase db) =>
      db.places.createAlias('rephotos__place_id__places__id');

  $$PlacesTableProcessedTableManager? get placeId {
    final $_column = $_itemColumn<int>('place_id');
    if ($_column == null) return null;
    final manager = $$PlacesTableTableManager(
      $_db,
      $_db.places,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_placeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RephotosTableFilterComposer
    extends Composer<_$AppDatabase, $RephotosTable> {
  $$RephotosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originalAssetId => $composableBuilder(
    column: $table.originalAssetId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get newAssetId => $composableBuilder(
    column: $table.newAssetId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PlacesTableFilterComposer get placeId {
    final $$PlacesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeId,
      referencedTable: $db.places,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacesTableFilterComposer(
            $db: $db,
            $table: $db.places,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RephotosTableOrderingComposer
    extends Composer<_$AppDatabase, $RephotosTable> {
  $$RephotosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originalAssetId => $composableBuilder(
    column: $table.originalAssetId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get newAssetId => $composableBuilder(
    column: $table.newAssetId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlacesTableOrderingComposer get placeId {
    final $$PlacesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeId,
      referencedTable: $db.places,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacesTableOrderingComposer(
            $db: $db,
            $table: $db.places,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RephotosTableAnnotationComposer
    extends Composer<_$AppDatabase, $RephotosTable> {
  $$RephotosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get originalAssetId => $composableBuilder(
    column: $table.originalAssetId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get newAssetId => $composableBuilder(
    column: $table.newAssetId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$PlacesTableAnnotationComposer get placeId {
    final $$PlacesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.placeId,
      referencedTable: $db.places,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlacesTableAnnotationComposer(
            $db: $db,
            $table: $db.places,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RephotosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RephotosTable,
          RephotoRow,
          $$RephotosTableFilterComposer,
          $$RephotosTableOrderingComposer,
          $$RephotosTableAnnotationComposer,
          $$RephotosTableCreateCompanionBuilder,
          $$RephotosTableUpdateCompanionBuilder,
          (RephotoRow, $$RephotosTableReferences),
          RephotoRow,
          PrefetchHooks Function({bool placeId})
        > {
  $$RephotosTableTableManager(_$AppDatabase db, $RephotosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RephotosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RephotosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RephotosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> originalAssetId = const Value.absent(),
                Value<String> newAssetId = const Value.absent(),
                Value<int?> placeId = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
              }) => RephotosCompanion(
                id: id,
                originalAssetId: originalAssetId,
                newAssetId: newAssetId,
                placeId: placeId,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String originalAssetId,
                required String newAssetId,
                Value<int?> placeId = const Value.absent(),
                required int createdAt,
              }) => RephotosCompanion.insert(
                id: id,
                originalAssetId: originalAssetId,
                newAssetId: newAssetId,
                placeId: placeId,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RephotosTable, RephotoRow>(table),
                  $$RephotosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({placeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (placeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.placeId,
                                referencedTable: $$RephotosTableReferences
                                    ._placeIdTable(db),
                                referencedColumn: $$RephotosTableReferences
                                    ._placeIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RephotosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RephotosTable,
      RephotoRow,
      $$RephotosTableFilterComposer,
      $$RephotosTableOrderingComposer,
      $$RephotosTableAnnotationComposer,
      $$RephotosTableCreateCompanionBuilder,
      $$RephotosTableUpdateCompanionBuilder,
      (RephotoRow, $$RephotosTableReferences),
      RephotoRow,
      PrefetchHooks Function({bool placeId})
    >;
typedef $$IndexStateTableCreateCompanionBuilder =
    IndexStateCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$IndexStateTableUpdateCompanionBuilder =
    IndexStateCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$IndexStateTableFilterComposer
    extends Composer<_$AppDatabase, $IndexStateTable> {
  $$IndexStateTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$IndexStateTableOrderingComposer
    extends Composer<_$AppDatabase, $IndexStateTable> {
  $$IndexStateTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$IndexStateTableAnnotationComposer
    extends Composer<_$AppDatabase, $IndexStateTable> {
  $$IndexStateTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$IndexStateTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IndexStateTable,
          IndexStateRow,
          $$IndexStateTableFilterComposer,
          $$IndexStateTableOrderingComposer,
          $$IndexStateTableAnnotationComposer,
          $$IndexStateTableCreateCompanionBuilder,
          $$IndexStateTableUpdateCompanionBuilder,
          (
            IndexStateRow,
            BaseReferences<_$AppDatabase, $IndexStateTable, IndexStateRow>,
          ),
          IndexStateRow,
          PrefetchHooks Function()
        > {
  $$IndexStateTableTableManager(_$AppDatabase db, $IndexStateTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IndexStateTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IndexStateTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IndexStateTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IndexStateCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => IndexStateCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$IndexStateTable, IndexStateRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $IndexStateTable,
                    IndexStateRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$IndexStateTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IndexStateTable,
      IndexStateRow,
      $$IndexStateTableFilterComposer,
      $$IndexStateTableOrderingComposer,
      $$IndexStateTableAnnotationComposer,
      $$IndexStateTableCreateCompanionBuilder,
      $$IndexStateTableUpdateCompanionBuilder,
      (
        IndexStateRow,
        BaseReferences<_$AppDatabase, $IndexStateTable, IndexStateRow>,
      ),
      IndexStateRow,
      PrefetchHooks Function()
    >;
typedef $$ScanSeenTableCreateCompanionBuilder =
    ScanSeenCompanion Function({required String assetId, Value<int> rowid});
typedef $$ScanSeenTableUpdateCompanionBuilder =
    ScanSeenCompanion Function({Value<String> assetId, Value<int> rowid});

class $$ScanSeenTableFilterComposer
    extends Composer<_$AppDatabase, $ScanSeenTable> {
  $$ScanSeenTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get assetId => $composableBuilder(
    column: $table.assetId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ScanSeenTableOrderingComposer
    extends Composer<_$AppDatabase, $ScanSeenTable> {
  $$ScanSeenTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get assetId => $composableBuilder(
    column: $table.assetId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ScanSeenTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScanSeenTable> {
  $$ScanSeenTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get assetId =>
      $composableBuilder(column: $table.assetId, builder: (column) => column);
}

class $$ScanSeenTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScanSeenTable,
          ScanSeenRow,
          $$ScanSeenTableFilterComposer,
          $$ScanSeenTableOrderingComposer,
          $$ScanSeenTableAnnotationComposer,
          $$ScanSeenTableCreateCompanionBuilder,
          $$ScanSeenTableUpdateCompanionBuilder,
          (
            ScanSeenRow,
            BaseReferences<_$AppDatabase, $ScanSeenTable, ScanSeenRow>,
          ),
          ScanSeenRow,
          PrefetchHooks Function()
        > {
  $$ScanSeenTableTableManager(_$AppDatabase db, $ScanSeenTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScanSeenTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScanSeenTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScanSeenTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> assetId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ScanSeenCompanion(assetId: assetId, rowid: rowid),
          createCompanionCallback:
              ({
                required String assetId,
                Value<int> rowid = const Value.absent(),
              }) => ScanSeenCompanion.insert(assetId: assetId, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ScanSeenTable, ScanSeenRow>(table),
                  BaseReferences<_$AppDatabase, $ScanSeenTable, ScanSeenRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ScanSeenTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScanSeenTable,
      ScanSeenRow,
      $$ScanSeenTableFilterComposer,
      $$ScanSeenTableOrderingComposer,
      $$ScanSeenTableAnnotationComposer,
      $$ScanSeenTableCreateCompanionBuilder,
      $$ScanSeenTableUpdateCompanionBuilder,
      (ScanSeenRow, BaseReferences<_$AppDatabase, $ScanSeenTable, ScanSeenRow>),
      ScanSeenRow,
      PrefetchHooks Function()
    >;
typedef $$PreferencesTableCreateCompanionBuilder =
    PreferencesCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$PreferencesTableUpdateCompanionBuilder =
    PreferencesCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$PreferencesTableFilterComposer
    extends Composer<_$AppDatabase, $PreferencesTable> {
  $$PreferencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PreferencesTableOrderingComposer
    extends Composer<_$AppDatabase, $PreferencesTable> {
  $$PreferencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PreferencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PreferencesTable> {
  $$PreferencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$PreferencesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PreferencesTable,
          PreferenceRow,
          $$PreferencesTableFilterComposer,
          $$PreferencesTableOrderingComposer,
          $$PreferencesTableAnnotationComposer,
          $$PreferencesTableCreateCompanionBuilder,
          $$PreferencesTableUpdateCompanionBuilder,
          (
            PreferenceRow,
            BaseReferences<_$AppDatabase, $PreferencesTable, PreferenceRow>,
          ),
          PreferenceRow,
          PrefetchHooks Function()
        > {
  $$PreferencesTableTableManager(_$AppDatabase db, $PreferencesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PreferencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PreferencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PreferencesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PreferencesCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => PreferencesCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PreferencesTable, PreferenceRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $PreferencesTable,
                    PreferenceRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PreferencesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PreferencesTable,
      PreferenceRow,
      $$PreferencesTableFilterComposer,
      $$PreferencesTableOrderingComposer,
      $$PreferencesTableAnnotationComposer,
      $$PreferencesTableCreateCompanionBuilder,
      $$PreferencesTableUpdateCompanionBuilder,
      (
        PreferenceRow,
        BaseReferences<_$AppDatabase, $PreferencesTable, PreferenceRow>,
      ),
      PreferenceRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlacesTableTableManager get places =>
      $$PlacesTableTableManager(_db, _db.places);
  $$PhotosTableTableManager get photos =>
      $$PhotosTableTableManager(_db, _db.photos);
  $$PlaceCellsTableTableManager get placeCells =>
      $$PlaceCellsTableTableManager(_db, _db.placeCells);
  $$RephotosTableTableManager get rephotos =>
      $$RephotosTableTableManager(_db, _db.rephotos);
  $$IndexStateTableTableManager get indexState =>
      $$IndexStateTableTableManager(_db, _db.indexState);
  $$ScanSeenTableTableManager get scanSeen =>
      $$ScanSeenTableTableManager(_db, _db.scanSeen);
  $$PreferencesTableTableManager get preferences =>
      $$PreferencesTableTableManager(_db, _db.preferences);
}
