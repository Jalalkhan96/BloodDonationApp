import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/constants/enums.dart';
import 'timestamp_converter.dart';

part 'report_model.freezed.dart';
part 'report_model.g.dart';

@freezed
class ReportModel with _$ReportModel {
  const factory ReportModel({
    required String reportId,
    required String reporterId,
    required String reportedUserId,
    String? requestId,
    required String reason,
    String? description,
    @Default(ReportStatus.pending) ReportStatus status,
    String? adminNotes,
    String? reviewedBy,
    @TimestampConverter() Timestamp? createdAt,
    @TimestampConverter() Timestamp? reviewedAt,
  }) = _ReportModel;

  factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);

  factory ReportModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return ReportModel.fromJson({
      'reportId': doc.id,
      ...data,
    });
  }
}
