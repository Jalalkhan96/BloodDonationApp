// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RequestModel _$RequestModelFromJson(Map<String, dynamic> json) {
  return _RequestModel.fromJson(json);
}

/// @nodoc
mixin _$RequestModel {
  String get requestId => throw _privateConstructorUsedError;
  String get requesterId => throw _privateConstructorUsedError;
  String? get hospitalId => throw _privateConstructorUsedError;
  String? get bloodBankId => throw _privateConstructorUsedError;
  BloodGroup get bloodGroup => throw _privateConstructorUsedError;
  int get unitsRequired => throw _privateConstructorUsedError;
  UrgencyLevel get urgency => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get requiredBefore => throw _privateConstructorUsedError;
  String get patientName => throw _privateConstructorUsedError;
  int? get patientAge => throw _privateConstructorUsedError;
  String? get doctorName => throw _privateConstructorUsedError;
  String? get contactPhone => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @NonNullGeoPointConverter()
  GeoPoint get geopoint => throw _privateConstructorUsedError;
  String? get geohash => throw _privateConstructorUsedError;
  RequestStatus get status => throw _privateConstructorUsedError;
  String? get matchedDonorId => throw _privateConstructorUsedError;
  int get candidateWave => throw _privateConstructorUsedError;
  bool get compatibleMatchNotified => throw _privateConstructorUsedError;
  int get totalCandidatesNotified => throw _privateConstructorUsedError;
  int get totalResponsesReceived => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get matchedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get closedAt => throw _privateConstructorUsedError;
  String? get cancellationReason => throw _privateConstructorUsedError;
  String? get fulfillmentNotes => throw _privateConstructorUsedError;

  /// Serializes this RequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestModelCopyWith<RequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestModelCopyWith<$Res> {
  factory $RequestModelCopyWith(
    RequestModel value,
    $Res Function(RequestModel) then,
  ) = _$RequestModelCopyWithImpl<$Res, RequestModel>;
  @useResult
  $Res call({
    String requestId,
    String requesterId,
    String? hospitalId,
    String? bloodBankId,
    BloodGroup bloodGroup,
    int unitsRequired,
    UrgencyLevel urgency,
    @TimestampConverter() Timestamp? requiredBefore,
    String patientName,
    int? patientAge,
    String? doctorName,
    String? contactPhone,
    String? notes,
    @NonNullGeoPointConverter() GeoPoint geopoint,
    String? geohash,
    RequestStatus status,
    String? matchedDonorId,
    int candidateWave,
    bool compatibleMatchNotified,
    int totalCandidatesNotified,
    int totalResponsesReceived,
    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? matchedAt,
    @TimestampConverter() Timestamp? closedAt,
    String? cancellationReason,
    String? fulfillmentNotes,
  });
}

/// @nodoc
class _$RequestModelCopyWithImpl<$Res, $Val extends RequestModel>
    implements $RequestModelCopyWith<$Res> {
  _$RequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? requesterId = null,
    Object? hospitalId = freezed,
    Object? bloodBankId = freezed,
    Object? bloodGroup = null,
    Object? unitsRequired = null,
    Object? urgency = null,
    Object? requiredBefore = freezed,
    Object? patientName = null,
    Object? patientAge = freezed,
    Object? doctorName = freezed,
    Object? contactPhone = freezed,
    Object? notes = freezed,
    Object? geopoint = null,
    Object? geohash = freezed,
    Object? status = null,
    Object? matchedDonorId = freezed,
    Object? candidateWave = null,
    Object? compatibleMatchNotified = null,
    Object? totalCandidatesNotified = null,
    Object? totalResponsesReceived = null,
    Object? createdAt = freezed,
    Object? matchedAt = freezed,
    Object? closedAt = freezed,
    Object? cancellationReason = freezed,
    Object? fulfillmentNotes = freezed,
  }) {
    return _then(
      _value.copyWith(
            requestId: null == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String,
            requesterId: null == requesterId
                ? _value.requesterId
                : requesterId // ignore: cast_nullable_to_non_nullable
                      as String,
            hospitalId: freezed == hospitalId
                ? _value.hospitalId
                : hospitalId // ignore: cast_nullable_to_non_nullable
                      as String?,
            bloodBankId: freezed == bloodBankId
                ? _value.bloodBankId
                : bloodBankId // ignore: cast_nullable_to_non_nullable
                      as String?,
            bloodGroup: null == bloodGroup
                ? _value.bloodGroup
                : bloodGroup // ignore: cast_nullable_to_non_nullable
                      as BloodGroup,
            unitsRequired: null == unitsRequired
                ? _value.unitsRequired
                : unitsRequired // ignore: cast_nullable_to_non_nullable
                      as int,
            urgency: null == urgency
                ? _value.urgency
                : urgency // ignore: cast_nullable_to_non_nullable
                      as UrgencyLevel,
            requiredBefore: freezed == requiredBefore
                ? _value.requiredBefore
                : requiredBefore // ignore: cast_nullable_to_non_nullable
                      as Timestamp?,
            patientName: null == patientName
                ? _value.patientName
                : patientName // ignore: cast_nullable_to_non_nullable
                      as String,
            patientAge: freezed == patientAge
                ? _value.patientAge
                : patientAge // ignore: cast_nullable_to_non_nullable
                      as int?,
            doctorName: freezed == doctorName
                ? _value.doctorName
                : doctorName // ignore: cast_nullable_to_non_nullable
                      as String?,
            contactPhone: freezed == contactPhone
                ? _value.contactPhone
                : contactPhone // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            geopoint: null == geopoint
                ? _value.geopoint
                : geopoint // ignore: cast_nullable_to_non_nullable
                      as GeoPoint,
            geohash: freezed == geohash
                ? _value.geohash
                : geohash // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as RequestStatus,
            matchedDonorId: freezed == matchedDonorId
                ? _value.matchedDonorId
                : matchedDonorId // ignore: cast_nullable_to_non_nullable
                      as String?,
            candidateWave: null == candidateWave
                ? _value.candidateWave
                : candidateWave // ignore: cast_nullable_to_non_nullable
                      as int,
            compatibleMatchNotified: null == compatibleMatchNotified
                ? _value.compatibleMatchNotified
                : compatibleMatchNotified // ignore: cast_nullable_to_non_nullable
                      as bool,
            totalCandidatesNotified: null == totalCandidatesNotified
                ? _value.totalCandidatesNotified
                : totalCandidatesNotified // ignore: cast_nullable_to_non_nullable
                      as int,
            totalResponsesReceived: null == totalResponsesReceived
                ? _value.totalResponsesReceived
                : totalResponsesReceived // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as Timestamp?,
            matchedAt: freezed == matchedAt
                ? _value.matchedAt
                : matchedAt // ignore: cast_nullable_to_non_nullable
                      as Timestamp?,
            closedAt: freezed == closedAt
                ? _value.closedAt
                : closedAt // ignore: cast_nullable_to_non_nullable
                      as Timestamp?,
            cancellationReason: freezed == cancellationReason
                ? _value.cancellationReason
                : cancellationReason // ignore: cast_nullable_to_non_nullable
                      as String?,
            fulfillmentNotes: freezed == fulfillmentNotes
                ? _value.fulfillmentNotes
                : fulfillmentNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RequestModelImplCopyWith<$Res>
    implements $RequestModelCopyWith<$Res> {
  factory _$$RequestModelImplCopyWith(
    _$RequestModelImpl value,
    $Res Function(_$RequestModelImpl) then,
  ) = __$$RequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String requestId,
    String requesterId,
    String? hospitalId,
    String? bloodBankId,
    BloodGroup bloodGroup,
    int unitsRequired,
    UrgencyLevel urgency,
    @TimestampConverter() Timestamp? requiredBefore,
    String patientName,
    int? patientAge,
    String? doctorName,
    String? contactPhone,
    String? notes,
    @NonNullGeoPointConverter() GeoPoint geopoint,
    String? geohash,
    RequestStatus status,
    String? matchedDonorId,
    int candidateWave,
    bool compatibleMatchNotified,
    int totalCandidatesNotified,
    int totalResponsesReceived,
    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? matchedAt,
    @TimestampConverter() Timestamp? closedAt,
    String? cancellationReason,
    String? fulfillmentNotes,
  });
}

/// @nodoc
class __$$RequestModelImplCopyWithImpl<$Res>
    extends _$RequestModelCopyWithImpl<$Res, _$RequestModelImpl>
    implements _$$RequestModelImplCopyWith<$Res> {
  __$$RequestModelImplCopyWithImpl(
    _$RequestModelImpl _value,
    $Res Function(_$RequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? requesterId = null,
    Object? hospitalId = freezed,
    Object? bloodBankId = freezed,
    Object? bloodGroup = null,
    Object? unitsRequired = null,
    Object? urgency = null,
    Object? requiredBefore = freezed,
    Object? patientName = null,
    Object? patientAge = freezed,
    Object? doctorName = freezed,
    Object? contactPhone = freezed,
    Object? notes = freezed,
    Object? geopoint = null,
    Object? geohash = freezed,
    Object? status = null,
    Object? matchedDonorId = freezed,
    Object? candidateWave = null,
    Object? compatibleMatchNotified = null,
    Object? totalCandidatesNotified = null,
    Object? totalResponsesReceived = null,
    Object? createdAt = freezed,
    Object? matchedAt = freezed,
    Object? closedAt = freezed,
    Object? cancellationReason = freezed,
    Object? fulfillmentNotes = freezed,
  }) {
    return _then(
      _$RequestModelImpl(
        requestId: null == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String,
        requesterId: null == requesterId
            ? _value.requesterId
            : requesterId // ignore: cast_nullable_to_non_nullable
                  as String,
        hospitalId: freezed == hospitalId
            ? _value.hospitalId
            : hospitalId // ignore: cast_nullable_to_non_nullable
                  as String?,
        bloodBankId: freezed == bloodBankId
            ? _value.bloodBankId
            : bloodBankId // ignore: cast_nullable_to_non_nullable
                  as String?,
        bloodGroup: null == bloodGroup
            ? _value.bloodGroup
            : bloodGroup // ignore: cast_nullable_to_non_nullable
                  as BloodGroup,
        unitsRequired: null == unitsRequired
            ? _value.unitsRequired
            : unitsRequired // ignore: cast_nullable_to_non_nullable
                  as int,
        urgency: null == urgency
            ? _value.urgency
            : urgency // ignore: cast_nullable_to_non_nullable
                  as UrgencyLevel,
        requiredBefore: freezed == requiredBefore
            ? _value.requiredBefore
            : requiredBefore // ignore: cast_nullable_to_non_nullable
                  as Timestamp?,
        patientName: null == patientName
            ? _value.patientName
            : patientName // ignore: cast_nullable_to_non_nullable
                  as String,
        patientAge: freezed == patientAge
            ? _value.patientAge
            : patientAge // ignore: cast_nullable_to_non_nullable
                  as int?,
        doctorName: freezed == doctorName
            ? _value.doctorName
            : doctorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        contactPhone: freezed == contactPhone
            ? _value.contactPhone
            : contactPhone // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        geopoint: null == geopoint
            ? _value.geopoint
            : geopoint // ignore: cast_nullable_to_non_nullable
                  as GeoPoint,
        geohash: freezed == geohash
            ? _value.geohash
            : geohash // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RequestStatus,
        matchedDonorId: freezed == matchedDonorId
            ? _value.matchedDonorId
            : matchedDonorId // ignore: cast_nullable_to_non_nullable
                  as String?,
        candidateWave: null == candidateWave
            ? _value.candidateWave
            : candidateWave // ignore: cast_nullable_to_non_nullable
                  as int,
        compatibleMatchNotified: null == compatibleMatchNotified
            ? _value.compatibleMatchNotified
            : compatibleMatchNotified // ignore: cast_nullable_to_non_nullable
                  as bool,
        totalCandidatesNotified: null == totalCandidatesNotified
            ? _value.totalCandidatesNotified
            : totalCandidatesNotified // ignore: cast_nullable_to_non_nullable
                  as int,
        totalResponsesReceived: null == totalResponsesReceived
            ? _value.totalResponsesReceived
            : totalResponsesReceived // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as Timestamp?,
        matchedAt: freezed == matchedAt
            ? _value.matchedAt
            : matchedAt // ignore: cast_nullable_to_non_nullable
                  as Timestamp?,
        closedAt: freezed == closedAt
            ? _value.closedAt
            : closedAt // ignore: cast_nullable_to_non_nullable
                  as Timestamp?,
        cancellationReason: freezed == cancellationReason
            ? _value.cancellationReason
            : cancellationReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        fulfillmentNotes: freezed == fulfillmentNotes
            ? _value.fulfillmentNotes
            : fulfillmentNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestModelImpl implements _RequestModel {
  const _$RequestModelImpl({
    required this.requestId,
    required this.requesterId,
    this.hospitalId,
    this.bloodBankId,
    required this.bloodGroup,
    this.unitsRequired = 1,
    required this.urgency,
    @TimestampConverter() this.requiredBefore,
    required this.patientName,
    this.patientAge,
    this.doctorName,
    this.contactPhone,
    this.notes,
    @NonNullGeoPointConverter() required this.geopoint,
    this.geohash,
    this.status = RequestStatus.pending,
    this.matchedDonorId,
    this.candidateWave = 0,
    this.compatibleMatchNotified = false,
    this.totalCandidatesNotified = 0,
    this.totalResponsesReceived = 0,
    @TimestampConverter() this.createdAt,
    @TimestampConverter() this.matchedAt,
    @TimestampConverter() this.closedAt,
    this.cancellationReason,
    this.fulfillmentNotes,
  });

  factory _$RequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestModelImplFromJson(json);

  @override
  final String requestId;
  @override
  final String requesterId;
  @override
  final String? hospitalId;
  @override
  final String? bloodBankId;
  @override
  final BloodGroup bloodGroup;
  @override
  @JsonKey()
  final int unitsRequired;
  @override
  final UrgencyLevel urgency;
  @override
  @TimestampConverter()
  final Timestamp? requiredBefore;
  @override
  final String patientName;
  @override
  final int? patientAge;
  @override
  final String? doctorName;
  @override
  final String? contactPhone;
  @override
  final String? notes;
  @override
  @NonNullGeoPointConverter()
  final GeoPoint geopoint;
  @override
  final String? geohash;
  @override
  @JsonKey()
  final RequestStatus status;
  @override
  final String? matchedDonorId;
  @override
  @JsonKey()
  final int candidateWave;
  @override
  @JsonKey()
  final bool compatibleMatchNotified;
  @override
  @JsonKey()
  final int totalCandidatesNotified;
  @override
  @JsonKey()
  final int totalResponsesReceived;
  @override
  @TimestampConverter()
  final Timestamp? createdAt;
  @override
  @TimestampConverter()
  final Timestamp? matchedAt;
  @override
  @TimestampConverter()
  final Timestamp? closedAt;
  @override
  final String? cancellationReason;
  @override
  final String? fulfillmentNotes;

  @override
  String toString() {
    return 'RequestModel(requestId: $requestId, requesterId: $requesterId, hospitalId: $hospitalId, bloodBankId: $bloodBankId, bloodGroup: $bloodGroup, unitsRequired: $unitsRequired, urgency: $urgency, requiredBefore: $requiredBefore, patientName: $patientName, patientAge: $patientAge, doctorName: $doctorName, contactPhone: $contactPhone, notes: $notes, geopoint: $geopoint, geohash: $geohash, status: $status, matchedDonorId: $matchedDonorId, candidateWave: $candidateWave, compatibleMatchNotified: $compatibleMatchNotified, totalCandidatesNotified: $totalCandidatesNotified, totalResponsesReceived: $totalResponsesReceived, createdAt: $createdAt, matchedAt: $matchedAt, closedAt: $closedAt, cancellationReason: $cancellationReason, fulfillmentNotes: $fulfillmentNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestModelImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.requesterId, requesterId) ||
                other.requesterId == requesterId) &&
            (identical(other.hospitalId, hospitalId) ||
                other.hospitalId == hospitalId) &&
            (identical(other.bloodBankId, bloodBankId) ||
                other.bloodBankId == bloodBankId) &&
            (identical(other.bloodGroup, bloodGroup) ||
                other.bloodGroup == bloodGroup) &&
            (identical(other.unitsRequired, unitsRequired) ||
                other.unitsRequired == unitsRequired) &&
            (identical(other.urgency, urgency) || other.urgency == urgency) &&
            (identical(other.requiredBefore, requiredBefore) ||
                other.requiredBefore == requiredBefore) &&
            (identical(other.patientName, patientName) ||
                other.patientName == patientName) &&
            (identical(other.patientAge, patientAge) ||
                other.patientAge == patientAge) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.geopoint, geopoint) ||
                other.geopoint == geopoint) &&
            (identical(other.geohash, geohash) || other.geohash == geohash) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.matchedDonorId, matchedDonorId) ||
                other.matchedDonorId == matchedDonorId) &&
            (identical(other.candidateWave, candidateWave) ||
                other.candidateWave == candidateWave) &&
            (identical(
                  other.compatibleMatchNotified,
                  compatibleMatchNotified,
                ) ||
                other.compatibleMatchNotified == compatibleMatchNotified) &&
            (identical(
                  other.totalCandidatesNotified,
                  totalCandidatesNotified,
                ) ||
                other.totalCandidatesNotified == totalCandidatesNotified) &&
            (identical(other.totalResponsesReceived, totalResponsesReceived) ||
                other.totalResponsesReceived == totalResponsesReceived) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.matchedAt, matchedAt) ||
                other.matchedAt == matchedAt) &&
            (identical(other.closedAt, closedAt) ||
                other.closedAt == closedAt) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            (identical(other.fulfillmentNotes, fulfillmentNotes) ||
                other.fulfillmentNotes == fulfillmentNotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    requestId,
    requesterId,
    hospitalId,
    bloodBankId,
    bloodGroup,
    unitsRequired,
    urgency,
    requiredBefore,
    patientName,
    patientAge,
    doctorName,
    contactPhone,
    notes,
    geopoint,
    geohash,
    status,
    matchedDonorId,
    candidateWave,
    compatibleMatchNotified,
    totalCandidatesNotified,
    totalResponsesReceived,
    createdAt,
    matchedAt,
    closedAt,
    cancellationReason,
    fulfillmentNotes,
  ]);

  /// Create a copy of RequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestModelImplCopyWith<_$RequestModelImpl> get copyWith =>
      __$$RequestModelImplCopyWithImpl<_$RequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestModelImplToJson(this);
  }
}

abstract class _RequestModel implements RequestModel {
  const factory _RequestModel({
    required final String requestId,
    required final String requesterId,
    final String? hospitalId,
    final String? bloodBankId,
    required final BloodGroup bloodGroup,
    final int unitsRequired,
    required final UrgencyLevel urgency,
    @TimestampConverter() final Timestamp? requiredBefore,
    required final String patientName,
    final int? patientAge,
    final String? doctorName,
    final String? contactPhone,
    final String? notes,
    @NonNullGeoPointConverter() required final GeoPoint geopoint,
    final String? geohash,
    final RequestStatus status,
    final String? matchedDonorId,
    final int candidateWave,
    final bool compatibleMatchNotified,
    final int totalCandidatesNotified,
    final int totalResponsesReceived,
    @TimestampConverter() final Timestamp? createdAt,
    @TimestampConverter() final Timestamp? matchedAt,
    @TimestampConverter() final Timestamp? closedAt,
    final String? cancellationReason,
    final String? fulfillmentNotes,
  }) = _$RequestModelImpl;

  factory _RequestModel.fromJson(Map<String, dynamic> json) =
      _$RequestModelImpl.fromJson;

  @override
  String get requestId;
  @override
  String get requesterId;
  @override
  String? get hospitalId;
  @override
  String? get bloodBankId;
  @override
  BloodGroup get bloodGroup;
  @override
  int get unitsRequired;
  @override
  UrgencyLevel get urgency;
  @override
  @TimestampConverter()
  Timestamp? get requiredBefore;
  @override
  String get patientName;
  @override
  int? get patientAge;
  @override
  String? get doctorName;
  @override
  String? get contactPhone;
  @override
  String? get notes;
  @override
  @NonNullGeoPointConverter()
  GeoPoint get geopoint;
  @override
  String? get geohash;
  @override
  RequestStatus get status;
  @override
  String? get matchedDonorId;
  @override
  int get candidateWave;
  @override
  bool get compatibleMatchNotified;
  @override
  int get totalCandidatesNotified;
  @override
  int get totalResponsesReceived;
  @override
  @TimestampConverter()
  Timestamp? get createdAt;
  @override
  @TimestampConverter()
  Timestamp? get matchedAt;
  @override
  @TimestampConverter()
  Timestamp? get closedAt;
  @override
  String? get cancellationReason;
  @override
  String? get fulfillmentNotes;

  /// Create a copy of RequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestModelImplCopyWith<_$RequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
