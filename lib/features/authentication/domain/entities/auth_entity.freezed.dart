// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthUser {
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  UserRole? get role => throw _privateConstructorUsedError;
  int? get onboardingStep => throw _privateConstructorUsedError;
  VerificationStatus? get verificationStatus =>
      throw _privateConstructorUsedError;

  /// Create a copy of AuthUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthUserCopyWith<AuthUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthUserCopyWith<$Res> {
  factory $AuthUserCopyWith(AuthUser value, $Res Function(AuthUser) then) =
      _$AuthUserCopyWithImpl<$Res, AuthUser>;
  @useResult
  $Res call({
    String uid,
    String email,
    String? displayName,
    String? photoUrl,
    String? phone,
    UserRole? role,
    int? onboardingStep,
    VerificationStatus? verificationStatus,
  });
}

/// @nodoc
class _$AuthUserCopyWithImpl<$Res, $Val extends AuthUser>
    implements $AuthUserCopyWith<$Res> {
  _$AuthUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = freezed,
    Object? photoUrl = freezed,
    Object? phone = freezed,
    Object? role = freezed,
    Object? onboardingStep = freezed,
    Object? verificationStatus = freezed,
  }) {
    return _then(
      _value.copyWith(
            uid: null == uid
                ? _value.uid
                : uid // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            displayName: freezed == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String?,
            photoUrl: freezed == photoUrl
                ? _value.photoUrl
                : photoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            role: freezed == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as UserRole?,
            onboardingStep: freezed == onboardingStep
                ? _value.onboardingStep
                : onboardingStep // ignore: cast_nullable_to_non_nullable
                      as int?,
            verificationStatus: freezed == verificationStatus
                ? _value.verificationStatus
                : verificationStatus // ignore: cast_nullable_to_non_nullable
                      as VerificationStatus?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AuthUserImplCopyWith<$Res>
    implements $AuthUserCopyWith<$Res> {
  factory _$$AuthUserImplCopyWith(
    _$AuthUserImpl value,
    $Res Function(_$AuthUserImpl) then,
  ) = __$$AuthUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String uid,
    String email,
    String? displayName,
    String? photoUrl,
    String? phone,
    UserRole? role,
    int? onboardingStep,
    VerificationStatus? verificationStatus,
  });
}

/// @nodoc
class __$$AuthUserImplCopyWithImpl<$Res>
    extends _$AuthUserCopyWithImpl<$Res, _$AuthUserImpl>
    implements _$$AuthUserImplCopyWith<$Res> {
  __$$AuthUserImplCopyWithImpl(
    _$AuthUserImpl _value,
    $Res Function(_$AuthUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = freezed,
    Object? photoUrl = freezed,
    Object? phone = freezed,
    Object? role = freezed,
    Object? onboardingStep = freezed,
    Object? verificationStatus = freezed,
  }) {
    return _then(
      _$AuthUserImpl(
        uid: null == uid
            ? _value.uid
            : uid // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: freezed == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String?,
        photoUrl: freezed == photoUrl
            ? _value.photoUrl
            : photoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        role: freezed == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as UserRole?,
        onboardingStep: freezed == onboardingStep
            ? _value.onboardingStep
            : onboardingStep // ignore: cast_nullable_to_non_nullable
                  as int?,
        verificationStatus: freezed == verificationStatus
            ? _value.verificationStatus
            : verificationStatus // ignore: cast_nullable_to_non_nullable
                  as VerificationStatus?,
      ),
    );
  }
}

/// @nodoc

class _$AuthUserImpl implements _AuthUser {
  const _$AuthUserImpl({
    required this.uid,
    required this.email,
    this.displayName,
    this.photoUrl,
    this.phone,
    this.role,
    this.onboardingStep,
    this.verificationStatus,
  });

  @override
  final String uid;
  @override
  final String email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? phone;
  @override
  final UserRole? role;
  @override
  final int? onboardingStep;
  @override
  final VerificationStatus? verificationStatus;

  @override
  String toString() {
    return 'AuthUser(uid: $uid, email: $email, displayName: $displayName, photoUrl: $photoUrl, phone: $phone, role: $role, onboardingStep: $onboardingStep, verificationStatus: $verificationStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthUserImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.onboardingStep, onboardingStep) ||
                other.onboardingStep == onboardingStep) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    uid,
    email,
    displayName,
    photoUrl,
    phone,
    role,
    onboardingStep,
    verificationStatus,
  );

  /// Create a copy of AuthUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthUserImplCopyWith<_$AuthUserImpl> get copyWith =>
      __$$AuthUserImplCopyWithImpl<_$AuthUserImpl>(this, _$identity);
}

abstract class _AuthUser implements AuthUser {
  const factory _AuthUser({
    required final String uid,
    required final String email,
    final String? displayName,
    final String? photoUrl,
    final String? phone,
    final UserRole? role,
    final int? onboardingStep,
    final VerificationStatus? verificationStatus,
  }) = _$AuthUserImpl;

  @override
  String get uid;
  @override
  String get email;
  @override
  String? get displayName;
  @override
  String? get photoUrl;
  @override
  String? get phone;
  @override
  UserRole? get role;
  @override
  int? get onboardingStep;
  @override
  VerificationStatus? get verificationStatus;

  /// Create a copy of AuthUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthUserImplCopyWith<_$AuthUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
