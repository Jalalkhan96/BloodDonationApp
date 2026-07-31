import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/constants/enums.dart';
import 'timestamp_converter.dart';

part 'request_model.freezed.dart';
part 'request_model.g.dart';

@freezed
class RequestModel with _$RequestModel {
  const factory RequestModel({
    required String requestId,
    required String requesterId,
    String? hospitalId,
    String? bloodBankId,
    required BloodGroup bloodGroup,
    @Default(1) int unitsRequired,
    required UrgencyLevel urgency,
    @TimestampConverter() Timestamp? requiredBefore,
    required String patientName,
    int? patientAge,
    String? doctorName,
    String? contactPhone,
    String? notes,
    @NonNullGeoPointConverter() required GeoPoint geopoint,
    String? geohash,
    @Default(RequestStatus.pending) RequestStatus status,
    String? matchedDonorId,
    @Default(0) int candidateWave,
    @Default(false) bool compatibleMatchNotified,
    @Default(0) int totalCandidatesNotified,
    @Default(0) int totalResponsesReceived,
    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? matchedAt,
    @TimestampConverter() Timestamp? closedAt,
    String? cancellationReason,
    String? fulfillmentNotes,
  }) = _RequestModel;

  factory RequestModel.fromJson(Map<String, dynamic> json) =>
      _$RequestModelFromJson(json);

  factory RequestModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return RequestModel.fromJson({
      'requestId': doc.id,
      ...data,
    });
  }
}
