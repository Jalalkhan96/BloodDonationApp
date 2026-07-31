// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReportModel _$ReportModelFromJson(Map<String, dynamic> json) {
  return _ReportModel.fromJson(json);
}

/// @nodoc
mixin _$ReportModel {
  String get reportId => throw _privateConstructorUsedError;
  String get reporterId => throw _privateConstructorUsedError;
  String get reportedUserId => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  ReportStatus get status => throw _privateConstructorUsedError;
  String? get adminNotes => throw _privateConstructorUsedError;
  String? get reviewedBy => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get reviewedAt => throw _privateConstructorUsedError;

  /// Serializes this ReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportModelCopyWith<ReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportModelCopyWith<$Res> {
  factory $ReportModelCopyWith(
    ReportModel value,
    $Res Function(ReportModel) then,
  ) = _$ReportModelCopyWithImpl<$Res, ReportModel>;
  @useResult
  $Res call({
    String reportId,
    String reporterId,
    String reportedUserId,
    String? requestId,
    String reason,
    String? description,
    ReportStatus status,
    String? adminNotes,
    String? reviewedBy,
    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? reviewedAt,
  });
}

/// @nodoc
class _$ReportModelCopyWithImpl<$Res, $Val extends ReportModel>
    implements $ReportModelCopyWith<$Res> {
  _$ReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportId = null,
    Object? reporterId = null,
    Object? reportedUserId = null,
    Object? requestId = freezed,
    Object? reason = null,
    Object? description = freezed,
    Object? status = null,
    Object? adminNotes = freezed,
    Object? reviewedBy = freezed,
    Object? createdAt = freezed,
    Object? reviewedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            reportId: null == reportId
                ? _value.reportId
                : reportId // ignore: cast_nullable_to_non_nullable
                      as String,
            reporterId: null == reporterId
                ? _value.reporterId
                : reporterId // ignore: cast_nullable_to_non_nullable
                      as String,
            reportedUserId: null == reportedUserId
                ? _value.reportedUserId
                : reportedUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
            reason: null == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ReportStatus,
            adminNotes: freezed == adminNotes
                ? _value.adminNotes
                : adminNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
            reviewedBy: freezed == reviewedBy
                ? _value.reviewedBy
                : reviewedBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as Timestamp?,
            reviewedAt: freezed == reviewedAt
                ? _value.reviewedAt
                : reviewedAt // ignore: cast_nullable_to_non_nullable
                      as Timestamp?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReportModelImplCopyWith<$Res>
    implements $ReportModelCopyWith<$Res> {
  factory _$$ReportModelImplCopyWith(
    _$ReportModelImpl value,
    $Res Function(_$ReportModelImpl) then,
  ) = __$$ReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String reportId,
    String reporterId,
    String reportedUserId,
    String? requestId,
    String reason,
    String? description,
    ReportStatus status,
    String? adminNotes,
    String? reviewedBy,
    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? reviewedAt,
  });
}

/// @nodoc
class __$$ReportModelImplCopyWithImpl<$Res>
    extends _$ReportModelCopyWithImpl<$Res, _$ReportModelImpl>
    implements _$$ReportModelImplCopyWith<$Res> {
  __$$ReportModelImplCopyWithImpl(
    _$ReportModelImpl _value,
    $Res Function(_$ReportModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportId = null,
    Object? reporterId = null,
    Object? reportedUserId = null,
    Object? requestId = freezed,
    Object? reason = null,
    Object? description = freezed,
    Object? status = null,
    Object? adminNotes = freezed,
    Object? reviewedBy = freezed,
    Object? createdAt = freezed,
    Object? reviewedAt = freezed,
  }) {
    return _then(
      _$ReportModelImpl(
        reportId: null == reportId
            ? _value.reportId
            : reportId // ignore: cast_nullable_to_non_nullable
                  as String,
        reporterId: null == reporterId
            ? _value.reporterId
            : reporterId // ignore: cast_nullable_to_non_nullable
                  as String,
        reportedUserId: null == reportedUserId
            ? _value.reportedUserId
            : reportedUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
        reason: null == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ReportStatus,
        adminNotes: freezed == adminNotes
            ? _value.adminNotes
            : adminNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
        reviewedBy: freezed == reviewedBy
            ? _value.reviewedBy
            : reviewedBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as Timestamp?,
        reviewedAt: freezed == reviewedAt
            ? _value.reviewedAt
            : reviewedAt // ignore: cast_nullable_to_non_nullable
                  as Timestamp?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportModelImpl implements _ReportModel {
  const _$ReportModelImpl({
    required this.reportId,
    required this.reporterId,
    required this.reportedUserId,
    this.requestId,
    required this.reason,
    this.description,
    this.status = ReportStatus.pending,
    this.adminNotes,
    this.reviewedBy,
    @TimestampConverter() this.createdAt,
    @TimestampConverter() this.reviewedAt,
  });

  factory _$ReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportModelImplFromJson(json);

  @override
  final String reportId;
  @override
  final String reporterId;
  @override
  final String reportedUserId;
  @override
  final String? requestId;
  @override
  final String reason;
  @override
  final String? description;
  @override
  @JsonKey()
  final ReportStatus status;
  @override
  final String? adminNotes;
  @override
  final String? reviewedBy;
  @override
  @TimestampConverter()
  final Timestamp? createdAt;
  @override
  @TimestampConverter()
  final Timestamp? reviewedAt;

  @override
  String toString() {
    return 'ReportModel(reportId: $reportId, reporterId: $reporterId, reportedUserId: $reportedUserId, requestId: $requestId, reason: $reason, description: $description, status: $status, adminNotes: $adminNotes, reviewedBy: $reviewedBy, createdAt: $createdAt, reviewedAt: $reviewedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportModelImpl &&
            (identical(other.reportId, reportId) ||
                other.reportId == reportId) &&
            (identical(other.reporterId, reporterId) ||
                other.reporterId == reporterId) &&
            (identical(other.reportedUserId, reportedUserId) ||
                other.reportedUserId == reportedUserId) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.adminNotes, adminNotes) ||
                other.adminNotes == adminNotes) &&
            (identical(other.reviewedBy, reviewedBy) ||
                other.reviewedBy == reviewedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.reviewedAt, reviewedAt) ||
                other.reviewedAt == reviewedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    reportId,
    reporterId,
    reportedUserId,
    requestId,
    reason,
    description,
    status,
    adminNotes,
    reviewedBy,
    createdAt,
    reviewedAt,
  );

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportModelImplCopyWith<_$ReportModelImpl> get copyWith =>
      __$$ReportModelImplCopyWithImpl<_$ReportModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportModelImplToJson(this);
  }
}

abstract class _ReportModel implements ReportModel {
  const factory _ReportModel({
    required final String reportId,
    required final String reporterId,
    required final String reportedUserId,
    final String? requestId,
    required final String reason,
    final String? description,
    final ReportStatus status,
    final String? adminNotes,
    final String? reviewedBy,
    @TimestampConverter() final Timestamp? createdAt,
    @TimestampConverter() final Timestamp? reviewedAt,
  }) = _$ReportModelImpl;

  factory _ReportModel.fromJson(Map<String, dynamic> json) =
      _$ReportModelImpl.fromJson;

  @override
  String get reportId;
  @override
  String get reporterId;
  @override
  String get reportedUserId;
  @override
  String? get requestId;
  @override
  String get reason;
  @override
  String? get description;
  @override
  ReportStatus get status;
  @override
  String? get adminNotes;
  @override
  String? get reviewedBy;
  @override
  @TimestampConverter()
  Timestamp? get createdAt;
  @override
  @TimestampConverter()
  Timestamp? get reviewedAt;

  /// Create a copy of ReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportModelImplCopyWith<_$ReportModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
