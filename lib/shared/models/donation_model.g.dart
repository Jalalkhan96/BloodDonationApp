// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DonationModelImpl _$$DonationModelImplFromJson(Map<String, dynamic> json) =>
    _$DonationModelImpl(
      donationId: json['donationId'] as String,
      donorId: json['donorId'] as String,
      requestId: json['requestId'] as String?,
      hospitalId: json['hospitalId'] as String?,
      bloodBankId: json['bloodBankId'] as String?,
      unitsDonated: (json['unitsDonated'] as num?)?.toInt() ?? 1,
      date: const TimestampConverter().fromJson(json['date']),
      certificateUrl: json['certificateUrl'] as String?,
      qrCode: json['qrCode'] as String?,
      verified: json['verified'] as bool? ?? false,
      verifiedBy: json['verifiedBy'] as String?,
      verifiedAt: const TimestampConverter().fromJson(json['verifiedAt']),
      notes: json['notes'] as String?,
      certificateGenerated: json['certificateGenerated'] as bool? ?? false,
    );

Map<String, dynamic> _$$DonationModelImplToJson(_$DonationModelImpl instance) =>
    <String, dynamic>{
      'donationId': instance.donationId,
      'donorId': instance.donorId,
      'requestId': instance.requestId,
      'hospitalId': instance.hospitalId,
      'bloodBankId': instance.bloodBankId,
      'unitsDonated': instance.unitsDonated,
      'date': const TimestampConverter().toJson(instance.date),
      'certificateUrl': instance.certificateUrl,
      'qrCode': instance.qrCode,
      'verified': instance.verified,
      'verifiedBy': instance.verifiedBy,
      'verifiedAt': const TimestampConverter().toJson(instance.verifiedAt),
      'notes': instance.notes,
      'certificateGenerated': instance.certificateGenerated,
    };
