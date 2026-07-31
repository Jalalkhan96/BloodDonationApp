// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      uid: json['uid'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      photoUrl: json['photoUrl'] as String?,
      idDocumentUrl: json['idDocumentUrl'] as String?,
      profile: json['profile'] == null
          ? null
          : UserProfile.fromJson(json['profile'] as Map<String, dynamic>),
      fcmTokens:
          (json['fcmTokens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      onboardingStep: (json['onboardingStep'] as num?)?.toInt() ?? 0,
      verificationStatus:
          $enumDecodeNullable(
            _$VerificationStatusEnumMap,
            json['verificationStatus'],
          ) ??
          VerificationStatus.pending,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'role': _$UserRoleEnumMap[instance.role]!,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'photoUrl': instance.photoUrl,
      'idDocumentUrl': instance.idDocumentUrl,
      'profile': instance.profile,
      'fcmTokens': instance.fcmTokens,
      'onboardingStep': instance.onboardingStep,
      'verificationStatus':
          _$VerificationStatusEnumMap[instance.verificationStatus]!,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };

const _$UserRoleEnumMap = {
  UserRole.donor: 'donor',
  UserRole.patient: 'patient',
  UserRole.hospital: 'hospital',
  UserRole.bloodBank: 'bloodBank',
  UserRole.ngo: 'ngo',
  UserRole.admin: 'admin',
};

const _$VerificationStatusEnumMap = {
  VerificationStatus.pending: 'pending',
  VerificationStatus.approved: 'approved',
  VerificationStatus.rejected: 'rejected',
};

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      age: (json['age'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      bloodGroup: $enumDecodeNullable(_$BloodGroupEnumMap, json['bloodGroup']),
      weight: (json['weight'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      medicalConditions:
          (json['medicalConditions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      lastDonationDate: const TimestampConverter().fromJson(
        json['lastDonationDate'],
      ),
      isEligible: json['isEligible'] as bool? ?? false,
      nextEligibleDate: const TimestampConverter().fromJson(
        json['nextEligibleDate'],
      ),
      ineligibilityReason: json['ineligibilityReason'] as String?,
      geopoint: const GeoPointConverter().fromJson(json['geopoint']),
      geohash: json['geohash'] as String?,
      availability:
          $enumDecodeNullable(_$AvailabilityEnumMap, json['availability']) ??
          Availability.available,
      donationCount: (json['donationCount'] as num?)?.toInt() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      totalRatings: (json['totalRatings'] as num?)?.toInt() ?? 0,
      badges:
          (json['badges'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      donationRadiusKm: (json['donationRadiusKm'] as num?)?.toDouble() ?? 50.0,
      leaderboardOptIn: json['leaderboardOptIn'] as bool? ?? true,
      chatEnabled: json['chatEnabled'] as bool? ?? true,
      locationSharingEnabled: json['locationSharingEnabled'] as bool? ?? true,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'age': instance.age,
      'gender': instance.gender,
      'bloodGroup': _$BloodGroupEnumMap[instance.bloodGroup],
      'weight': instance.weight,
      'height': instance.height,
      'medicalConditions': instance.medicalConditions,
      'lastDonationDate': const TimestampConverter().toJson(
        instance.lastDonationDate,
      ),
      'isEligible': instance.isEligible,
      'nextEligibleDate': const TimestampConverter().toJson(
        instance.nextEligibleDate,
      ),
      'ineligibilityReason': instance.ineligibilityReason,
      'geopoint': const GeoPointConverter().toJson(instance.geopoint),
      'geohash': instance.geohash,
      'availability': _$AvailabilityEnumMap[instance.availability]!,
      'donationCount': instance.donationCount,
      'rating': instance.rating,
      'totalRatings': instance.totalRatings,
      'badges': instance.badges,
      'donationRadiusKm': instance.donationRadiusKm,
      'leaderboardOptIn': instance.leaderboardOptIn,
      'chatEnabled': instance.chatEnabled,
      'locationSharingEnabled': instance.locationSharingEnabled,
    };

const _$BloodGroupEnumMap = {
  BloodGroup.oNegative: 'oNegative',
  BloodGroup.oPositive: 'oPositive',
  BloodGroup.aNegative: 'aNegative',
  BloodGroup.aPositive: 'aPositive',
  BloodGroup.bNegative: 'bNegative',
  BloodGroup.bPositive: 'bPositive',
  BloodGroup.abNegative: 'abNegative',
  BloodGroup.abPositive: 'abPositive',
};

const _$AvailabilityEnumMap = {
  Availability.available: 'available',
  Availability.unavailable: 'unavailable',
  Availability.busy: 'busy',
};
