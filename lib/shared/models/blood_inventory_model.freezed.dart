// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blood_inventory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BloodInventoryModel _$BloodInventoryModelFromJson(Map<String, dynamic> json) {
  return _BloodInventoryModel.fromJson(json);
}

/// @nodoc
mixin _$BloodInventoryModel {
  String get bankId => throw _privateConstructorUsedError;
  BloodGroup get bloodGroup => throw _privateConstructorUsedError;
  int get totalUnits => throw _privateConstructorUsedError;
  List<BloodBatch> get batches => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this BloodInventoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BloodInventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BloodInventoryModelCopyWith<BloodInventoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BloodInventoryModelCopyWith<$Res> {
  factory $BloodInventoryModelCopyWith(
    BloodInventoryModel value,
    $Res Function(BloodInventoryModel) then,
  ) = _$BloodInventoryModelCopyWithImpl<$Res, BloodInventoryModel>;
  @useResult
  $Res call({
    String bankId,
    BloodGroup bloodGroup,
    int totalUnits,
    List<BloodBatch> batches,
    @TimestampConverter() Timestamp? lastUpdated,
  });
}

/// @nodoc
class _$BloodInventoryModelCopyWithImpl<$Res, $Val extends BloodInventoryModel>
    implements $BloodInventoryModelCopyWith<$Res> {
  _$BloodInventoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BloodInventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankId = null,
    Object? bloodGroup = null,
    Object? totalUnits = null,
    Object? batches = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(
      _value.copyWith(
            bankId: null == bankId
                ? _value.bankId
                : bankId // ignore: cast_nullable_to_non_nullable
                      as String,
            bloodGroup: null == bloodGroup
                ? _value.bloodGroup
                : bloodGroup // ignore: cast_nullable_to_non_nullable
                      as BloodGroup,
            totalUnits: null == totalUnits
                ? _value.totalUnits
                : totalUnits // ignore: cast_nullable_to_non_nullable
                      as int,
            batches: null == batches
                ? _value.batches
                : batches // ignore: cast_nullable_to_non_nullable
                      as List<BloodBatch>,
            lastUpdated: freezed == lastUpdated
                ? _value.lastUpdated
                : lastUpdated // ignore: cast_nullable_to_non_nullable
                      as Timestamp?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BloodInventoryModelImplCopyWith<$Res>
    implements $BloodInventoryModelCopyWith<$Res> {
  factory _$$BloodInventoryModelImplCopyWith(
    _$BloodInventoryModelImpl value,
    $Res Function(_$BloodInventoryModelImpl) then,
  ) = __$$BloodInventoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String bankId,
    BloodGroup bloodGroup,
    int totalUnits,
    List<BloodBatch> batches,
    @TimestampConverter() Timestamp? lastUpdated,
  });
}

/// @nodoc
class __$$BloodInventoryModelImplCopyWithImpl<$Res>
    extends _$BloodInventoryModelCopyWithImpl<$Res, _$BloodInventoryModelImpl>
    implements _$$BloodInventoryModelImplCopyWith<$Res> {
  __$$BloodInventoryModelImplCopyWithImpl(
    _$BloodInventoryModelImpl _value,
    $Res Function(_$BloodInventoryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BloodInventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankId = null,
    Object? bloodGroup = null,
    Object? totalUnits = null,
    Object? batches = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(
      _$BloodInventoryModelImpl(
        bankId: null == bankId
            ? _value.bankId
            : bankId // ignore: cast_nullable_to_non_nullable
                  as String,
        bloodGroup: null == bloodGroup
            ? _value.bloodGroup
            : bloodGroup // ignore: cast_nullable_to_non_nullable
                  as BloodGroup,
        totalUnits: null == totalUnits
            ? _value.totalUnits
            : totalUnits // ignore: cast_nullable_to_non_nullable
                  as int,
        batches: null == batches
            ? _value._batches
            : batches // ignore: cast_nullable_to_non_nullable
                  as List<BloodBatch>,
        lastUpdated: freezed == lastUpdated
            ? _value.lastUpdated
            : lastUpdated // ignore: cast_nullable_to_non_nullable
                  as Timestamp?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BloodInventoryModelImpl implements _BloodInventoryModel {
  const _$BloodInventoryModelImpl({
    required this.bankId,
    required this.bloodGroup,
    this.totalUnits = 0,
    final List<BloodBatch> batches = const [],
    @TimestampConverter() this.lastUpdated,
  }) : _batches = batches;

  factory _$BloodInventoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BloodInventoryModelImplFromJson(json);

  @override
  final String bankId;
  @override
  final BloodGroup bloodGroup;
  @override
  @JsonKey()
  final int totalUnits;
  final List<BloodBatch> _batches;
  @override
  @JsonKey()
  List<BloodBatch> get batches {
    if (_batches is EqualUnmodifiableListView) return _batches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_batches);
  }

  @override
  @TimestampConverter()
  final Timestamp? lastUpdated;

  @override
  String toString() {
    return 'BloodInventoryModel(bankId: $bankId, bloodGroup: $bloodGroup, totalUnits: $totalUnits, batches: $batches, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BloodInventoryModelImpl &&
            (identical(other.bankId, bankId) || other.bankId == bankId) &&
            (identical(other.bloodGroup, bloodGroup) ||
                other.bloodGroup == bloodGroup) &&
            (identical(other.totalUnits, totalUnits) ||
                other.totalUnits == totalUnits) &&
            const DeepCollectionEquality().equals(other._batches, _batches) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    bankId,
    bloodGroup,
    totalUnits,
    const DeepCollectionEquality().hash(_batches),
    lastUpdated,
  );

  /// Create a copy of BloodInventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BloodInventoryModelImplCopyWith<_$BloodInventoryModelImpl> get copyWith =>
      __$$BloodInventoryModelImplCopyWithImpl<_$BloodInventoryModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BloodInventoryModelImplToJson(this);
  }
}

abstract class _BloodInventoryModel implements BloodInventoryModel {
  const factory _BloodInventoryModel({
    required final String bankId,
    required final BloodGroup bloodGroup,
    final int totalUnits,
    final List<BloodBatch> batches,
    @TimestampConverter() final Timestamp? lastUpdated,
  }) = _$BloodInventoryModelImpl;

  factory _BloodInventoryModel.fromJson(Map<String, dynamic> json) =
      _$BloodInventoryModelImpl.fromJson;

  @override
  String get bankId;
  @override
  BloodGroup get bloodGroup;
  @override
  int get totalUnits;
  @override
  List<BloodBatch> get batches;
  @override
  @TimestampConverter()
  Timestamp? get lastUpdated;

  /// Create a copy of BloodInventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BloodInventoryModelImplCopyWith<_$BloodInventoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BloodBatch _$BloodBatchFromJson(Map<String, dynamic> json) {
  return _BloodBatch.fromJson(json);
}

/// @nodoc
mixin _$BloodBatch {
  String get batchId => throw _privateConstructorUsedError;
  int get units => throw _privateConstructorUsedError;
  @NonNullTimestampConverter()
  Timestamp get expiryDate => throw _privateConstructorUsedError;
  String? get donorId => throw _privateConstructorUsedError;
  String? get donationId => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this BloodBatch to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BloodBatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BloodBatchCopyWith<BloodBatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BloodBatchCopyWith<$Res> {
  factory $BloodBatchCopyWith(
    BloodBatch value,
    $Res Function(BloodBatch) then,
  ) = _$BloodBatchCopyWithImpl<$Res, BloodBatch>;
  @useResult
  $Res call({
    String batchId,
    int units,
    @NonNullTimestampConverter() Timestamp expiryDate,
    String? donorId,
    String? donationId,
    bool isActive,
  });
}

/// @nodoc
class _$BloodBatchCopyWithImpl<$Res, $Val extends BloodBatch>
    implements $BloodBatchCopyWith<$Res> {
  _$BloodBatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BloodBatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? batchId = null,
    Object? units = null,
    Object? expiryDate = null,
    Object? donorId = freezed,
    Object? donationId = freezed,
    Object? isActive = null,
  }) {
    return _then(
      _value.copyWith(
            batchId: null == batchId
                ? _value.batchId
                : batchId // ignore: cast_nullable_to_non_nullable
                      as String,
            units: null == units
                ? _value.units
                : units // ignore: cast_nullable_to_non_nullable
                      as int,
            expiryDate: null == expiryDate
                ? _value.expiryDate
                : expiryDate // ignore: cast_nullable_to_non_nullable
                      as Timestamp,
            donorId: freezed == donorId
                ? _value.donorId
                : donorId // ignore: cast_nullable_to_non_nullable
                      as String?,
            donationId: freezed == donationId
                ? _value.donationId
                : donationId // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BloodBatchImplCopyWith<$Res>
    implements $BloodBatchCopyWith<$Res> {
  factory _$$BloodBatchImplCopyWith(
    _$BloodBatchImpl value,
    $Res Function(_$BloodBatchImpl) then,
  ) = __$$BloodBatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String batchId,
    int units,
    @NonNullTimestampConverter() Timestamp expiryDate,
    String? donorId,
    String? donationId,
    bool isActive,
  });
}

/// @nodoc
class __$$BloodBatchImplCopyWithImpl<$Res>
    extends _$BloodBatchCopyWithImpl<$Res, _$BloodBatchImpl>
    implements _$$BloodBatchImplCopyWith<$Res> {
  __$$BloodBatchImplCopyWithImpl(
    _$BloodBatchImpl _value,
    $Res Function(_$BloodBatchImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BloodBatch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? batchId = null,
    Object? units = null,
    Object? expiryDate = null,
    Object? donorId = freezed,
    Object? donationId = freezed,
    Object? isActive = null,
  }) {
    return _then(
      _$BloodBatchImpl(
        batchId: null == batchId
            ? _value.batchId
            : batchId // ignore: cast_nullable_to_non_nullable
                  as String,
        units: null == units
            ? _value.units
            : units // ignore: cast_nullable_to_non_nullable
                  as int,
        expiryDate: null == expiryDate
            ? _value.expiryDate
            : expiryDate // ignore: cast_nullable_to_non_nullable
                  as Timestamp,
        donorId: freezed == donorId
            ? _value.donorId
            : donorId // ignore: cast_nullable_to_non_nullable
                  as String?,
        donationId: freezed == donationId
            ? _value.donationId
            : donationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BloodBatchImpl implements _BloodBatch {
  const _$BloodBatchImpl({
    required this.batchId,
    required this.units,
    @NonNullTimestampConverter() required this.expiryDate,
    this.donorId,
    this.donationId,
    this.isActive = true,
  });

  factory _$BloodBatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$BloodBatchImplFromJson(json);

  @override
  final String batchId;
  @override
  final int units;
  @override
  @NonNullTimestampConverter()
  final Timestamp expiryDate;
  @override
  final String? donorId;
  @override
  final String? donationId;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'BloodBatch(batchId: $batchId, units: $units, expiryDate: $expiryDate, donorId: $donorId, donationId: $donationId, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BloodBatchImpl &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.units, units) || other.units == units) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.donorId, donorId) || other.donorId == donorId) &&
            (identical(other.donationId, donationId) ||
                other.donationId == donationId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    batchId,
    units,
    expiryDate,
    donorId,
    donationId,
    isActive,
  );

  /// Create a copy of BloodBatch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BloodBatchImplCopyWith<_$BloodBatchImpl> get copyWith =>
      __$$BloodBatchImplCopyWithImpl<_$BloodBatchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BloodBatchImplToJson(this);
  }
}

abstract class _BloodBatch implements BloodBatch {
  const factory _BloodBatch({
    required final String batchId,
    required final int units,
    @NonNullTimestampConverter() required final Timestamp expiryDate,
    final String? donorId,
    final String? donationId,
    final bool isActive,
  }) = _$BloodBatchImpl;

  factory _BloodBatch.fromJson(Map<String, dynamic> json) =
      _$BloodBatchImpl.fromJson;

  @override
  String get batchId;
  @override
  int get units;
  @override
  @NonNullTimestampConverter()
  Timestamp get expiryDate;
  @override
  String? get donorId;
  @override
  String? get donationId;
  @override
  bool get isActive;

  /// Create a copy of BloodBatch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BloodBatchImplCopyWith<_$BloodBatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
