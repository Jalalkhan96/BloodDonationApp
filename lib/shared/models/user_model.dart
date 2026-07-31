import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/constants/enums.dart';
import 'timestamp_converter.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String uid,
    required UserRole role,
    required String name,
    required String email,
    required String phone,
    String? photoUrl,
    String? idDocumentUrl,
    UserProfile? profile,
    @Default([]) List<String> fcmTokens,
    @Default(0) int onboardingStep,
    @Default(VerificationStatus.pending) VerificationStatus verificationStatus,
    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return UserModel.fromJson({
      'uid': doc.id,
      ...data,
    });
  }
}

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    int? age,
    String? gender,
    BloodGroup? bloodGroup,
    double? weight,
    double? height,
    @Default([]) List<String> medicalConditions,
    @TimestampConverter() Timestamp? lastDonationDate,
    @Default(false) bool isEligible,
    @TimestampConverter() Timestamp? nextEligibleDate,
    String? ineligibilityReason,
    @GeoPointConverter() GeoPoint? geopoint,
    String? geohash,
    @Default(Availability.available) Availability availability,
    @Default(0) int donationCount,
    @Default(0.0) double rating,
    @Default(0) int totalRatings,
    @Default([]) List<String> badges,
    @Default(50.0) double donationRadiusKm,
    @Default(true) bool leaderboardOptIn,
    @Default(true) bool chatEnabled,
    @Default(true) bool locationSharingEnabled,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
