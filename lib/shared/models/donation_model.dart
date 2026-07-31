import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'timestamp_converter.dart';

part 'donation_model.freezed.dart';
part 'donation_model.g.dart';

@freezed
class DonationModel with _$DonationModel {
  const factory DonationModel({
    required String donationId,
    required String donorId,
    String? requestId,
    String? hospitalId,
    String? bloodBankId,
    @Default(1) int unitsDonated,
    @TimestampConverter() Timestamp? date,
    String? certificateUrl,
    String? qrCode,
    @Default(false) bool verified,
    String? verifiedBy,
    @TimestampConverter() Timestamp? verifiedAt,
    String? notes,
    @Default(false) bool certificateGenerated,
  }) = _DonationModel;

  factory DonationModel.fromJson(Map<String, dynamic> json) =>
      _$DonationModelFromJson(json);

  factory DonationModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return DonationModel.fromJson({
      'donationId': doc.id,
      ...data,
    });
  }
}
