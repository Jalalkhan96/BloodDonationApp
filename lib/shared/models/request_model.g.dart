// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestModelImpl _$$RequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$RequestModelImpl(
  requestId: json['requestId'] as String,
  requesterId: json['requesterId'] as String,
  hospitalId: json['hospitalId'] as String?,
  bloodBankId: json['bloodBankId'] as String?,
  bloodGroup: $enumDecode(_$BloodGroupEnumMap, json['bloodGroup']),
  unitsRequired: (json['unitsRequired'] as num?)?.toInt() ?? 1,
  urgency: $enumDecode(_$UrgencyLevelEnumMap, json['urgency']),
  requiredBefore: const TimestampConverter().fromJson(json['requiredBefore']),
  patientName: json['patientName'] as String,
  patientAge: (json['patientAge'] as num?)?.toInt(),
  doctorName: json['doctorName'] as String?,
  contactPhone: json['contactPhone'] as String?,
  notes: json['notes'] as String?,
  geopoint: const NonNullGeoPointConverter().fromJson(json['geopoint']),
  geohash: json['geohash'] as String?,
  status:
      $enumDecodeNullable(_$RequestStatusEnumMap, json['status']) ??
      RequestStatus.pending,
  matchedDonorId: json['matchedDonorId'] as String?,
  candidateWave: (json['candidateWave'] as num?)?.toInt() ?? 0,
  compatibleMatchNotified: json['compatibleMatchNotified'] as bool? ?? false,
  totalCandidatesNotified:
      (json['totalCandidatesNotified'] as num?)?.toInt() ?? 0,
  totalResponsesReceived:
      (json['totalResponsesReceived'] as num?)?.toInt() ?? 0,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
  matchedAt: const TimestampConverter().fromJson(json['matchedAt']),
  closedAt: const TimestampConverter().fromJson(json['closedAt']),
  cancellationReason: json['cancellationReason'] as String?,
  fulfillmentNotes: json['fulfillmentNotes'] as String?,
);

Map<String, dynamic> _$$RequestModelImplToJson(
  _$RequestModelImpl instance,
) => <String, dynamic>{
  'requestId': instance.requestId,
  'requesterId': instance.requesterId,
  'hospitalId': instance.hospitalId,
  'bloodBankId': instance.bloodBankId,
  'bloodGroup': _$BloodGroupEnumMap[instance.bloodGroup]!,
  'unitsRequired': instance.unitsRequired,
  'urgency': _$UrgencyLevelEnumMap[instance.urgency]!,
  'requiredBefore': const TimestampConverter().toJson(instance.requiredBefore),
  'patientName': instance.patientName,
  'patientAge': instance.patientAge,
  'doctorName': instance.doctorName,
  'contactPhone': instance.contactPhone,
  'notes': instance.notes,
  'geopoint': const NonNullGeoPointConverter().toJson(instance.geopoint),
  'geohash': instance.geohash,
  'status': _$RequestStatusEnumMap[instance.status]!,
  'matchedDonorId': instance.matchedDonorId,
  'candidateWave': instance.candidateWave,
  'compatibleMatchNotified': instance.compatibleMatchNotified,
  'totalCandidatesNotified': instance.totalCandidatesNotified,
  'totalResponsesReceived': instance.totalResponsesReceived,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'matchedAt': const TimestampConverter().toJson(instance.matchedAt),
  'closedAt': const TimestampConverter().toJson(instance.closedAt),
  'cancellationReason': instance.cancellationReason,
  'fulfillmentNotes': instance.fulfillmentNotes,
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

const _$UrgencyLevelEnumMap = {
  UrgencyLevel.critical: 'critical',
  UrgencyLevel.urgent: 'urgent',
  UrgencyLevel.scheduled: 'scheduled',
};

const _$RequestStatusEnumMap = {
  RequestStatus.pending: 'pending',
  RequestStatus.matched: 'matched',
  RequestStatus.enRoute: 'enRoute',
  RequestStatus.fulfilled: 'fulfilled',
  RequestStatus.expired: 'expired',
  RequestStatus.cancelled: 'cancelled',
};
