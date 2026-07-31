// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get uid => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get idDocumentUrl => throw _privateConstructorUsedError;
  UserProfile? get profile => throw _privateConstructorUsedError;
  List<String> get fcmTokens => throw _privateConstructorUsedError;
  int get onboardingStep => throw _privateConstructorUsedError;
  VerificationStatus get verificationStatus =>
      throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({
    String uid,
    UserRole role,
    String name,
    String email,
    String phone,
    String? photoUrl,
    String? idDocumentUrl,
    UserProfile? profile,
    List<String> fcmTokens,
    int onboardingStep,
    VerificationStatus verificationStatus,
    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? updatedAt,
  });

  $UserProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? role = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? photoUrl = freezed,
    Object? idDocumentUrl = freezed,
    Object? profile = freezed,
    Object? fcmTokens = null,
    Object? onboardingStep = null,
    Object? verificationStatus = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            uid: null == uid
                ? _value.uid
                : uid // ignore: cast_nullable_to_non_nullable
                      as String,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as UserRole,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            photoUrl: freezed == photoUrl
                ? _value.photoUrl
                : photoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            idDocumentUrl: freezed == idDocumentUrl
                ? _value.idDocumentUrl
                : idDocumentUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            profile: freezed == profile
                ? _value.profile
                : profile // ignore: cast_nullable_to_non_nullable
                      as UserProfile?,
            fcmTokens: null == fcmTokens
                ? _value.fcmTokens
                : fcmTokens // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            onboardingStep: null == onboardingStep
                ? _value.onboardingStep
                : onboardingStep // ignore: cast_nullable_to_non_nullable
                      as int,
            verificationStatus: null == verificationStatus
                ? _value.verificationStatus
                : verificationStatus // ignore: cast_nullable_to_non_nullable
                      as VerificationStatus,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as Timestamp?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as Timestamp?,
          )
          as $Val,
    );
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
    _$UserModelImpl value,
    $Res Function(_$UserModelImpl) then,
  ) = __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String uid,
    UserRole role,
    String name,
    String email,
    String phone,
    String? photoUrl,
    String? idDocumentUrl,
    UserProfile? profile,
    List<String> fcmTokens,
    int onboardingStep,
    VerificationStatus verificationStatus,
    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? updatedAt,
  });

  @override
  $UserProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
    _$UserModelImpl _value,
    $Res Function(_$UserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? role = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? photoUrl = freezed,
    Object? idDocumentUrl = freezed,
    Object? profile = freezed,
    Object? fcmTokens = null,
    Object? onboardingStep = null,
    Object? verificationStatus = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$UserModelImpl(
        uid: null == uid
            ? _value.uid
            : uid // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as UserRole,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        photoUrl: freezed == photoUrl
            ? _value.photoUrl
            : photoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        idDocumentUrl: freezed == idDocumentUrl
            ? _value.idDocumentUrl
            : idDocumentUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        profile: freezed == profile
            ? _value.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as UserProfile?,
        fcmTokens: null == fcmTokens
            ? _value._fcmTokens
            : fcmTokens // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        onboardingStep: null == onboardingStep
            ? _value.onboardingStep
            : onboardingStep // ignore: cast_nullable_to_non_nullable
                  as int,
        verificationStatus: null == verificationStatus
            ? _value.verificationStatus
            : verificationStatus // ignore: cast_nullable_to_non_nullable
                  as VerificationStatus,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as Timestamp?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as Timestamp?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl({
    required this.uid,
    required this.role,
    required this.name,
    required this.email,
    required this.phone,
    this.photoUrl,
    this.idDocumentUrl,
    this.profile,
    final List<String> fcmTokens = const [],
    this.onboardingStep = 0,
    this.verificationStatus = VerificationStatus.pending,
    @TimestampConverter() this.createdAt,
    @TimestampConverter() this.updatedAt,
  }) : _fcmTokens = fcmTokens;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String uid;
  @override
  final UserRole role;
  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String? photoUrl;
  @override
  final String? idDocumentUrl;
  @override
  final UserProfile? profile;
  final List<String> _fcmTokens;
  @override
  @JsonKey()
  List<String> get fcmTokens {
    if (_fcmTokens is EqualUnmodifiableListView) return _fcmTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fcmTokens);
  }

  @override
  @JsonKey()
  final int onboardingStep;
  @override
  @JsonKey()
  final VerificationStatus verificationStatus;
  @override
  @TimestampConverter()
  final Timestamp? createdAt;
  @override
  @TimestampConverter()
  final Timestamp? updatedAt;

  @override
  String toString() {
    return 'UserModel(uid: $uid, role: $role, name: $name, email: $email, phone: $phone, photoUrl: $photoUrl, idDocumentUrl: $idDocumentUrl, profile: $profile, fcmTokens: $fcmTokens, onboardingStep: $onboardingStep, verificationStatus: $verificationStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.idDocumentUrl, idDocumentUrl) ||
                other.idDocumentUrl == idDocumentUrl) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            const DeepCollectionEquality().equals(
              other._fcmTokens,
              _fcmTokens,
            ) &&
            (identical(other.onboardingStep, onboardingStep) ||
                other.onboardingStep == onboardingStep) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    uid,
    role,
    name,
    email,
    phone,
    photoUrl,
    idDocumentUrl,
    profile,
    const DeepCollectionEquality().hash(_fcmTokens),
    onboardingStep,
    verificationStatus,
    createdAt,
    updatedAt,
  );

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(this);
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel({
    required final String uid,
    required final UserRole role,
    required final String name,
    required final String email,
    required final String phone,
    final String? photoUrl,
    final String? idDocumentUrl,
    final UserProfile? profile,
    final List<String> fcmTokens,
    final int onboardingStep,
    final VerificationStatus verificationStatus,
    @TimestampConverter() final Timestamp? createdAt,
    @TimestampConverter() final Timestamp? updatedAt,
  }) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get uid;
  @override
  UserRole get role;
  @override
  String get name;
  @override
  String get email;
  @override
  String get phone;
  @override
  String? get photoUrl;
  @override
  String? get idDocumentUrl;
  @override
  UserProfile? get profile;
  @override
  List<String> get fcmTokens;
  @override
  int get onboardingStep;
  @override
  VerificationStatus get verificationStatus;
  @override
  @TimestampConverter()
  Timestamp? get createdAt;
  @override
  @TimestampConverter()
  Timestamp? get updatedAt;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  int? get age => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  BloodGroup? get bloodGroup => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  List<String> get medicalConditions => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get lastDonationDate => throw _privateConstructorUsedError;
  bool get isEligible => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get nextEligibleDate => throw _privateConstructorUsedError;
  String? get ineligibilityReason => throw _privateConstructorUsedError;
  @GeoPointConverter()
  GeoPoint? get geopoint => throw _privateConstructorUsedError;
  String? get geohash => throw _privateConstructorUsedError;
  Availability get availability => throw _privateConstructorUsedError;
  int get donationCount => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get totalRatings => throw _privateConstructorUsedError;
  List<String> get badges => throw _privateConstructorUsedError;
  double get donationRadiusKm => throw _privateConstructorUsedError;
  bool get leaderboardOptIn => throw _privateConstructorUsedError;
  bool get chatEnabled => throw _privateConstructorUsedError;
  bool get locationSharingEnabled => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
    UserProfile value,
    $Res Function(UserProfile) then,
  ) = _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call({
    int? age,
    String? gender,
    BloodGroup? bloodGroup,
    double? weight,
    double? height,
    List<String> medicalConditions,
    @TimestampConverter() Timestamp? lastDonationDate,
    bool isEligible,
    @TimestampConverter() Timestamp? nextEligibleDate,
    String? ineligibilityReason,
    @GeoPointConverter() GeoPoint? geopoint,
    String? geohash,
    Availability availability,
    int donationCount,
    double rating,
    int totalRatings,
    List<String> badges,
    double donationRadiusKm,
    bool leaderboardOptIn,
    bool chatEnabled,
    bool locationSharingEnabled,
  });
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? age = freezed,
    Object? gender = freezed,
    Object? bloodGroup = freezed,
    Object? weight = freezed,
    Object? height = freezed,
    Object? medicalConditions = null,
    Object? lastDonationDate = freezed,
    Object? isEligible = null,
    Object? nextEligibleDate = freezed,
    Object? ineligibilityReason = freezed,
    Object? geopoint = freezed,
    Object? geohash = freezed,
    Object? availability = null,
    Object? donationCount = null,
    Object? rating = null,
    Object? totalRatings = null,
    Object? badges = null,
    Object? donationRadiusKm = null,
    Object? leaderboardOptIn = null,
    Object? chatEnabled = null,
    Object? locationSharingEnabled = null,
  }) {
    return _then(
      _value.copyWith(
            age: freezed == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
            bloodGroup: freezed == bloodGroup
                ? _value.bloodGroup
                : bloodGroup // ignore: cast_nullable_to_non_nullable
                      as BloodGroup?,
            weight: freezed == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as double?,
            height: freezed == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as double?,
            medicalConditions: null == medicalConditions
                ? _value.medicalConditions
                : medicalConditions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            lastDonationDate: freezed == lastDonationDate
                ? _value.lastDonationDate
                : lastDonationDate // ignore: cast_nullable_to_non_nullable
                      as Timestamp?,
            isEligible: null == isEligible
                ? _value.isEligible
                : isEligible // ignore: cast_nullable_to_non_nullable
                      as bool,
            nextEligibleDate: freezed == nextEligibleDate
                ? _value.nextEligibleDate
                : nextEligibleDate // ignore: cast_nullable_to_non_nullable
                      as Timestamp?,
            ineligibilityReason: freezed == ineligibilityReason
                ? _value.ineligibilityReason
                : ineligibilityReason // ignore: cast_nullable_to_non_nullable
                      as String?,
            geopoint: freezed == geopoint
                ? _value.geopoint
                : geopoint // ignore: cast_nullable_to_non_nullable
                      as GeoPoint?,
            geohash: freezed == geohash
                ? _value.geohash
                : geohash // ignore: cast_nullable_to_non_nullable
                      as String?,
            availability: null == availability
                ? _value.availability
                : availability // ignore: cast_nullable_to_non_nullable
                      as Availability,
            donationCount: null == donationCount
                ? _value.donationCount
                : donationCount // ignore: cast_nullable_to_non_nullable
                      as int,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
            totalRatings: null == totalRatings
                ? _value.totalRatings
                : totalRatings // ignore: cast_nullable_to_non_nullable
                      as int,
            badges: null == badges
                ? _value.badges
                : badges // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            donationRadiusKm: null == donationRadiusKm
                ? _value.donationRadiusKm
                : donationRadiusKm // ignore: cast_nullable_to_non_nullable
                      as double,
            leaderboardOptIn: null == leaderboardOptIn
                ? _value.leaderboardOptIn
                : leaderboardOptIn // ignore: cast_nullable_to_non_nullable
                      as bool,
            chatEnabled: null == chatEnabled
                ? _value.chatEnabled
                : chatEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            locationSharingEnabled: null == locationSharingEnabled
                ? _value.locationSharingEnabled
                : locationSharingEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
    _$UserProfileImpl value,
    $Res Function(_$UserProfileImpl) then,
  ) = __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? age,
    String? gender,
    BloodGroup? bloodGroup,
    double? weight,
    double? height,
    List<String> medicalConditions,
    @TimestampConverter() Timestamp? lastDonationDate,
    bool isEligible,
    @TimestampConverter() Timestamp? nextEligibleDate,
    String? ineligibilityReason,
    @GeoPointConverter() GeoPoint? geopoint,
    String? geohash,
    Availability availability,
    int donationCount,
    double rating,
    int totalRatings,
    List<String> badges,
    double donationRadiusKm,
    bool leaderboardOptIn,
    bool chatEnabled,
    bool locationSharingEnabled,
  });
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
    _$UserProfileImpl _value,
    $Res Function(_$UserProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? age = freezed,
    Object? gender = freezed,
    Object? bloodGroup = freezed,
    Object? weight = freezed,
    Object? height = freezed,
    Object? medicalConditions = null,
    Object? lastDonationDate = freezed,
    Object? isEligible = null,
    Object? nextEligibleDate = freezed,
    Object? ineligibilityReason = freezed,
    Object? geopoint = freezed,
    Object? geohash = freezed,
    Object? availability = null,
    Object? donationCount = null,
    Object? rating = null,
    Object? totalRatings = null,
    Object? badges = null,
    Object? donationRadiusKm = null,
    Object? leaderboardOptIn = null,
    Object? chatEnabled = null,
    Object? locationSharingEnabled = null,
  }) {
    return _then(
      _$UserProfileImpl(
        age: freezed == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        bloodGroup: freezed == bloodGroup
            ? _value.bloodGroup
            : bloodGroup // ignore: cast_nullable_to_non_nullable
                  as BloodGroup?,
        weight: freezed == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as double?,
        height: freezed == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as double?,
        medicalConditions: null == medicalConditions
            ? _value._medicalConditions
            : medicalConditions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        lastDonationDate: freezed == lastDonationDate
            ? _value.lastDonationDate
            : lastDonationDate // ignore: cast_nullable_to_non_nullable
                  as Timestamp?,
        isEligible: null == isEligible
            ? _value.isEligible
            : isEligible // ignore: cast_nullable_to_non_nullable
                  as bool,
        nextEligibleDate: freezed == nextEligibleDate
            ? _value.nextEligibleDate
            : nextEligibleDate // ignore: cast_nullable_to_non_nullable
                  as Timestamp?,
        ineligibilityReason: freezed == ineligibilityReason
            ? _value.ineligibilityReason
            : ineligibilityReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        geopoint: freezed == geopoint
            ? _value.geopoint
            : geopoint // ignore: cast_nullable_to_non_nullable
                  as GeoPoint?,
        geohash: freezed == geohash
            ? _value.geohash
            : geohash // ignore: cast_nullable_to_non_nullable
                  as String?,
        availability: null == availability
            ? _value.availability
            : availability // ignore: cast_nullable_to_non_nullable
                  as Availability,
        donationCount: null == donationCount
            ? _value.donationCount
            : donationCount // ignore: cast_nullable_to_non_nullable
                  as int,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        totalRatings: null == totalRatings
            ? _value.totalRatings
            : totalRatings // ignore: cast_nullable_to_non_nullable
                  as int,
        badges: null == badges
            ? _value._badges
            : badges // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        donationRadiusKm: null == donationRadiusKm
            ? _value.donationRadiusKm
            : donationRadiusKm // ignore: cast_nullable_to_non_nullable
                  as double,
        leaderboardOptIn: null == leaderboardOptIn
            ? _value.leaderboardOptIn
            : leaderboardOptIn // ignore: cast_nullable_to_non_nullable
                  as bool,
        chatEnabled: null == chatEnabled
            ? _value.chatEnabled
            : chatEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        locationSharingEnabled: null == locationSharingEnabled
            ? _value.locationSharingEnabled
            : locationSharingEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl({
    this.age,
    this.gender,
    this.bloodGroup,
    this.weight,
    this.height,
    final List<String> medicalConditions = const [],
    @TimestampConverter() this.lastDonationDate,
    this.isEligible = false,
    @TimestampConverter() this.nextEligibleDate,
    this.ineligibilityReason,
    @GeoPointConverter() this.geopoint,
    this.geohash,
    this.availability = Availability.available,
    this.donationCount = 0,
    this.rating = 0.0,
    this.totalRatings = 0,
    final List<String> badges = const [],
    this.donationRadiusKm = 50.0,
    this.leaderboardOptIn = true,
    this.chatEnabled = true,
    this.locationSharingEnabled = true,
  }) : _medicalConditions = medicalConditions,
       _badges = badges;

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  final int? age;
  @override
  final String? gender;
  @override
  final BloodGroup? bloodGroup;
  @override
  final double? weight;
  @override
  final double? height;
  final List<String> _medicalConditions;
  @override
  @JsonKey()
  List<String> get medicalConditions {
    if (_medicalConditions is EqualUnmodifiableListView)
      return _medicalConditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicalConditions);
  }

  @override
  @TimestampConverter()
  final Timestamp? lastDonationDate;
  @override
  @JsonKey()
  final bool isEligible;
  @override
  @TimestampConverter()
  final Timestamp? nextEligibleDate;
  @override
  final String? ineligibilityReason;
  @override
  @GeoPointConverter()
  final GeoPoint? geopoint;
  @override
  final String? geohash;
  @override
  @JsonKey()
  final Availability availability;
  @override
  @JsonKey()
  final int donationCount;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final int totalRatings;
  final List<String> _badges;
  @override
  @JsonKey()
  List<String> get badges {
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_badges);
  }

  @override
  @JsonKey()
  final double donationRadiusKm;
  @override
  @JsonKey()
  final bool leaderboardOptIn;
  @override
  @JsonKey()
  final bool chatEnabled;
  @override
  @JsonKey()
  final bool locationSharingEnabled;

  @override
  String toString() {
    return 'UserProfile(age: $age, gender: $gender, bloodGroup: $bloodGroup, weight: $weight, height: $height, medicalConditions: $medicalConditions, lastDonationDate: $lastDonationDate, isEligible: $isEligible, nextEligibleDate: $nextEligibleDate, ineligibilityReason: $ineligibilityReason, geopoint: $geopoint, geohash: $geohash, availability: $availability, donationCount: $donationCount, rating: $rating, totalRatings: $totalRatings, badges: $badges, donationRadiusKm: $donationRadiusKm, leaderboardOptIn: $leaderboardOptIn, chatEnabled: $chatEnabled, locationSharingEnabled: $locationSharingEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.bloodGroup, bloodGroup) ||
                other.bloodGroup == bloodGroup) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.height, height) || other.height == height) &&
            const DeepCollectionEquality().equals(
              other._medicalConditions,
              _medicalConditions,
            ) &&
            (identical(other.lastDonationDate, lastDonationDate) ||
                other.lastDonationDate == lastDonationDate) &&
            (identical(other.isEligible, isEligible) ||
                other.isEligible == isEligible) &&
            (identical(other.nextEligibleDate, nextEligibleDate) ||
                other.nextEligibleDate == nextEligibleDate) &&
            (identical(other.ineligibilityReason, ineligibilityReason) ||
                other.ineligibilityReason == ineligibilityReason) &&
            (identical(other.geopoint, geopoint) ||
                other.geopoint == geopoint) &&
            (identical(other.geohash, geohash) || other.geohash == geohash) &&
            (identical(other.availability, availability) ||
                other.availability == availability) &&
            (identical(other.donationCount, donationCount) ||
                other.donationCount == donationCount) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.totalRatings, totalRatings) ||
                other.totalRatings == totalRatings) &&
            const DeepCollectionEquality().equals(other._badges, _badges) &&
            (identical(other.donationRadiusKm, donationRadiusKm) ||
                other.donationRadiusKm == donationRadiusKm) &&
            (identical(other.leaderboardOptIn, leaderboardOptIn) ||
                other.leaderboardOptIn == leaderboardOptIn) &&
            (identical(other.chatEnabled, chatEnabled) ||
                other.chatEnabled == chatEnabled) &&
            (identical(other.locationSharingEnabled, locationSharingEnabled) ||
                other.locationSharingEnabled == locationSharingEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    age,
    gender,
    bloodGroup,
    weight,
    height,
    const DeepCollectionEquality().hash(_medicalConditions),
    lastDonationDate,
    isEligible,
    nextEligibleDate,
    ineligibilityReason,
    geopoint,
    geohash,
    availability,
    donationCount,
    rating,
    totalRatings,
    const DeepCollectionEquality().hash(_badges),
    donationRadiusKm,
    leaderboardOptIn,
    chatEnabled,
    locationSharingEnabled,
  ]);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(this);
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile({
    final int? age,
    final String? gender,
    final BloodGroup? bloodGroup,
    final double? weight,
    final double? height,
    final List<String> medicalConditions,
    @TimestampConverter() final Timestamp? lastDonationDate,
    final bool isEligible,
    @TimestampConverter() final Timestamp? nextEligibleDate,
    final String? ineligibilityReason,
    @GeoPointConverter() final GeoPoint? geopoint,
    final String? geohash,
    final Availability availability,
    final int donationCount,
    final double rating,
    final int totalRatings,
    final List<String> badges,
    final double donationRadiusKm,
    final bool leaderboardOptIn,
    final bool chatEnabled,
    final bool locationSharingEnabled,
  }) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  int? get age;
  @override
  String? get gender;
  @override
  BloodGroup? get bloodGroup;
  @override
  double? get weight;
  @override
  double? get height;
  @override
  List<String> get medicalConditions;
  @override
  @TimestampConverter()
  Timestamp? get lastDonationDate;
  @override
  bool get isEligible;
  @override
  @TimestampConverter()
  Timestamp? get nextEligibleDate;
  @override
  String? get ineligibilityReason;
  @override
  @GeoPointConverter()
  GeoPoint? get geopoint;
  @override
  String? get geohash;
  @override
  Availability get availability;
  @override
  int get donationCount;
  @override
  double get rating;
  @override
  int get totalRatings;
  @override
  List<String> get badges;
  @override
  double get donationRadiusKm;
  @override
  bool get leaderboardOptIn;
  @override
  bool get chatEnabled;
  @override
  bool get locationSharingEnabled;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
