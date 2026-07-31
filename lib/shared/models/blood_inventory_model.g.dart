// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_inventory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BloodInventoryModelImpl _$$BloodInventoryModelImplFromJson(
  Map<String, dynamic> json,
) => _$BloodInventoryModelImpl(
  bankId: json['bankId'] as String,
  bloodGroup: $enumDecode(_$BloodGroupEnumMap, json['bloodGroup']),
  totalUnits: (json['totalUnits'] as num?)?.toInt() ?? 0,
  batches:
      (json['batches'] as List<dynamic>?)
          ?.map((e) => BloodBatch.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  lastUpdated: const TimestampConverter().fromJson(json['lastUpdated']),
);

Map<String, dynamic> _$$BloodInventoryModelImplToJson(
  _$BloodInventoryModelImpl instance,
) => <String, dynamic>{
  'bankId': instance.bankId,
  'bloodGroup': _$BloodGroupEnumMap[instance.bloodGroup]!,
  'totalUnits': instance.totalUnits,
  'batches': instance.batches,
  'lastUpdated': const TimestampConverter().toJson(instance.lastUpdated),
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

_$BloodBatchImpl _$$BloodBatchImplFromJson(Map<String, dynamic> json) =>
    _$BloodBatchImpl(
      batchId: json['batchId'] as String,
      units: (json['units'] as num).toInt(),
      expiryDate: const NonNullTimestampConverter().fromJson(
        json['expiryDate'],
      ),
      donorId: json['donorId'] as String?,
      donationId: json['donationId'] as String?,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$BloodBatchImplToJson(
  _$BloodBatchImpl instance,
) => <String, dynamic>{
  'batchId': instance.batchId,
  'units': instance.units,
  'expiryDate': const NonNullTimestampConverter().toJson(instance.expiryDate),
  'donorId': instance.donorId,
  'donationId': instance.donationId,
  'isActive': instance.isActive,
};
