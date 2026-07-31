// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'donation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DonationModel _$DonationModelFromJson(Map<String, dynamic> json) {
  return _DonationModel.fromJson(json);
}

/// @nodoc
mixin _$DonationModel {
  String get donationId => throw _privateConstructorUsedError;
  String get donorId => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;
  String? get hospitalId => throw _privateConstructorUsedError;
  String? get bloodBankId => throw _privateConstructorUsedError;
  int get unitsDonated => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get date => throw _privateConstructorUsedError;
  String? get certificateUrl => throw _privateConstructorUsedError;
  String? get qrCode => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  String? get verifiedBy => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get verifiedAt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  bool get certificateGenerated => throw _privateConstructorUsedError;

  /// Serializes this DonationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DonationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DonationModelCopyWith<DonationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DonationModelCopyWith<$Res> {
  factory $DonationModelCopyWith(
    DonationModel value,
    $Res Function(DonationModel) then,
  ) = _$DonationModelCopyWithImpl<$Res, DonationModel>;
  @useResult
  $Res call({
    String donationId,
    String donorId,
    String? requestId,
    String? hospitalId,
    String? bloodBankId,
    int unitsDonated,
    @TimestampConverter() Timestamp? date,
    String? certificateUrl,
    String? qrCode,
    bool verified,
    String? verifiedBy,
    @TimestampConverter() Timestamp? verifiedAt,
    String? notes,
    bool certificateGenerated,
  });
}

/// @nodoc
class _$DonationModelCopyWithImpl<$Res, $Val extends DonationModel>
    implements $DonationModelCopyWith<$Res> {
  _$DonationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DonationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? donationId = null,
    Object? donorId = null,
    Object? requestId = freezed,
    Object? hospitalId = freezed,
    Object? bloodBankId = freezed,
    Object? unitsDonated = null,
    Object? date = freezed,
    Object? certificateUrl = freezed,
    Object? qrCode = freezed,
    Object? verified = null,
    Object? verifiedBy = freezed,
    Object? verifiedAt = freezed,
    Object? notes = freezed,
    Object? certificateGenerated = null,
  }) {
    return _then(
      _value.copyWith(
            donationId: null == donationId
                ? _value.donationId
                : donationId // ignore: cast_nullable_to_non_nullable
                      as String,
            donorId: null == donorId
                ? _value.donorId
                : donorId // ignore: cast_nullable_to_non_nullable
                      as String,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
            hospitalId: freezed == hospitalId
                ? _value.hospitalId
                : hospitalId // ignore: cast_nullable_to_non_nullable
                      as String?,
            bloodBankId: freezed == bloodBankId
                ? _value.bloodBankId
                : bloodBankId // ignore: cast_nullable_to_non_nullable
                      as String?,
            unitsDonated: null == unitsDonated
                ? _value.unitsDonated
                : unitsDonated // ignore: cast_nullable_to_non_nullable
                      as int,
            date: freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as Timestamp?,
            certificateUrl: freezed == certificateUrl
                ? _value.certificateUrl
                : certificateUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            qrCode: freezed == qrCode
                ? _value.qrCode
                : qrCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            verified: null == verified
                ? _value.verified
                : verified // ignore: cast_nullable_to_non_nullable
                      as bool,
            verifiedBy: freezed == verifiedBy
                ? _value.verifiedBy
                : verifiedBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            verifiedAt: freezed == verifiedAt
                ? _value.verifiedAt
                : verifiedAt // ignore: cast_nullable_to_non_nullable
                      as Timestamp?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            certificateGenerated: null == certificateGenerated
                ? _value.certificateGenerated
                : certificateGenerated // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DonationModelImplCopyWith<$Res>
    implements $DonationModelCopyWith<$Res> {
  factory _$$DonationModelImplCopyWith(
    _$DonationModelImpl value,
    $Res Function(_$DonationModelImpl) then,
  ) = __$$DonationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String donationId,
    String donorId,
    String? requestId,
    String? hospitalId,
    String? bloodBankId,
    int unitsDonated,
    @TimestampConverter() Timestamp? date,
    String? certificateUrl,
    String? qrCode,
    bool verified,
    String? verifiedBy,
    @TimestampConverter() Timestamp? verifiedAt,
    String? notes,
    bool certificateGenerated,
  });
}

/// @nodoc
class __$$DonationModelImplCopyWithImpl<$Res>
    extends _$DonationModelCopyWithImpl<$Res, _$DonationModelImpl>
    implements _$$DonationModelImplCopyWith<$Res> {
  __$$DonationModelImplCopyWithImpl(
    _$DonationModelImpl _value,
    $Res Function(_$DonationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DonationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? donationId = null,
    Object? donorId = null,
    Object? requestId = freezed,
    Object? hospitalId = freezed,
    Object? bloodBankId = freezed,
    Object? unitsDonated = null,
    Object? date = freezed,
    Object? certificateUrl = freezed,
    Object? qrCode = freezed,
    Object? verified = null,
    Object? verifiedBy = freezed,
    Object? verifiedAt = freezed,
    Object? notes = freezed,
    Object? certificateGenerated = null,
  }) {
    return _then(
      _$DonationModelImpl(
        donationId: null == donationId
            ? _value.donationId
            : donationId // ignore: cast_nullable_to_non_nullable
                  as String,
        donorId: null == donorId
            ? _value.donorId
            : donorId // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
        hospitalId: freezed == hospitalId
            ? _value.hospitalId
            : hospitalId // ignore: cast_nullable_to_non_nullable
                  as String?,
        bloodBankId: freezed == bloodBankId
            ? _value.bloodBankId
            : bloodBankId // ignore: cast_nullable_to_non_nullable
                  as String?,
        unitsDonated: null == unitsDonated
            ? _value.unitsDonated
            : unitsDonated // ignore: cast_nullable_to_non_nullable
                  as int,
        date: freezed == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as Timestamp?,
        certificateUrl: freezed == certificateUrl
            ? _value.certificateUrl
            : certificateUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        qrCode: freezed == qrCode
            ? _value.qrCode
            : qrCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        verified: null == verified
            ? _value.verified
            : verified // ignore: cast_nullable_to_non_nullable
                  as bool,
        verifiedBy: freezed == verifiedBy
            ? _value.verifiedBy
            : verifiedBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        verifiedAt: freezed == verifiedAt
            ? _value.verifiedAt
            : verifiedAt // ignore: cast_nullable_to_non_nullable
                  as Timestamp?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        certificateGenerated: null == certificateGenerated
            ? _value.certificateGenerated
            : certificateGenerated // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DonationModelImpl implements _DonationModel {
  const _$DonationModelImpl({
    required this.donationId,
    required this.donorId,
    this.requestId,
    this.hospitalId,
    this.bloodBankId,
    this.unitsDonated = 1,
    @TimestampConverter() this.date,
    this.certificateUrl,
    this.qrCode,
    this.verified = false,
    this.verifiedBy,
    @TimestampConverter() this.verifiedAt,
    this.notes,
    this.certificateGenerated = false,
  });

  factory _$DonationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DonationModelImplFromJson(json);

  @override
  final String donationId;
  @override
  final String donorId;
  @override
  final String? requestId;
  @override
  final String? hospitalId;
  @override
  final String? bloodBankId;
  @override
  @JsonKey()
  final int unitsDonated;
  @override
  @TimestampConverter()
  final Timestamp? date;
  @override
  final String? certificateUrl;
  @override
  final String? qrCode;
  @override
  @JsonKey()
  final bool verified;
  @override
  final String? verifiedBy;
  @override
  @TimestampConverter()
  final Timestamp? verifiedAt;
  @override
  final String? notes;
  @override
  @JsonKey()
  final bool certificateGenerated;

  @override
  String toString() {
    return 'DonationModel(donationId: $donationId, donorId: $donorId, requestId: $requestId, hospitalId: $hospitalId, bloodBankId: $bloodBankId, unitsDonated: $unitsDonated, date: $date, certificateUrl: $certificateUrl, qrCode: $qrCode, verified: $verified, verifiedBy: $verifiedBy, verifiedAt: $verifiedAt, notes: $notes, certificateGenerated: $certificateGenerated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DonationModelImpl &&
            (identical(other.donationId, donationId) ||
                other.donationId == donationId) &&
            (identical(other.donorId, donorId) || other.donorId == donorId) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.hospitalId, hospitalId) ||
                other.hospitalId == hospitalId) &&
            (identical(other.bloodBankId, bloodBankId) ||
                other.bloodBankId == bloodBankId) &&
            (identical(other.unitsDonated, unitsDonated) ||
                other.unitsDonated == unitsDonated) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.certificateUrl, certificateUrl) ||
                other.certificateUrl == certificateUrl) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.verifiedBy, verifiedBy) ||
                other.verifiedBy == verifiedBy) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.certificateGenerated, certificateGenerated) ||
                other.certificateGenerated == certificateGenerated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    donationId,
    donorId,
    requestId,
    hospitalId,
    bloodBankId,
    unitsDonated,
    date,
    certificateUrl,
    qrCode,
    verified,
    verifiedBy,
    verifiedAt,
    notes,
    certificateGenerated,
  );

  /// Create a copy of DonationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DonationModelImplCopyWith<_$DonationModelImpl> get copyWith =>
      __$$DonationModelImplCopyWithImpl<_$DonationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DonationModelImplToJson(this);
  }
}

abstract class _DonationModel implements DonationModel {
  const factory _DonationModel({
    required final String donationId,
    required final String donorId,
    final String? requestId,
    final String? hospitalId,
    final String? bloodBankId,
    final int unitsDonated,
    @TimestampConverter() final Timestamp? date,
    final String? certificateUrl,
    final String? qrCode,
    final bool verified,
    final String? verifiedBy,
    @TimestampConverter() final Timestamp? verifiedAt,
    final String? notes,
    final bool certificateGenerated,
  }) = _$DonationModelImpl;

  factory _DonationModel.fromJson(Map<String, dynamic> json) =
      _$DonationModelImpl.fromJson;

  @override
  String get donationId;
  @override
  String get donorId;
  @override
  String? get requestId;
  @override
  String? get hospitalId;
  @override
  String? get bloodBankId;
  @override
  int get unitsDonated;
  @override
  @TimestampConverter()
  Timestamp? get date;
  @override
  String? get certificateUrl;
  @override
  String? get qrCode;
  @override
  bool get verified;
  @override
  String? get verifiedBy;
  @override
  @TimestampConverter()
  Timestamp? get verifiedAt;
  @override
  String? get notes;
  @override
  bool get certificateGenerated;

  /// Create a copy of DonationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DonationModelImplCopyWith<_$DonationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
