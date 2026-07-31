import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/constants/enums.dart';
import 'timestamp_converter.dart';

part 'blood_inventory_model.freezed.dart';
part 'blood_inventory_model.g.dart';

@freezed
class BloodInventoryModel with _$BloodInventoryModel {
  const factory BloodInventoryModel({
    required String bankId,
    required BloodGroup bloodGroup,
    @Default(0) int totalUnits,
    @Default([]) List<BloodBatch> batches,
    @TimestampConverter() Timestamp? lastUpdated,
  }) = _BloodInventoryModel;

  factory BloodInventoryModel.fromJson(Map<String, dynamic> json) =>
      _$BloodInventoryModelFromJson(json);
}

@freezed
class BloodBatch with _$BloodBatch {
  const factory BloodBatch({
    required String batchId,
    required int units,
    @NonNullTimestampConverter() required Timestamp expiryDate,
    String? donorId,
    String? donationId,
    @Default(true) bool isActive,
  }) = _BloodBatch;

  factory BloodBatch.fromJson(Map<String, dynamic> json) =>
      _$BloodBatchFromJson(json);
}
