// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportModelImpl _$$ReportModelImplFromJson(Map<String, dynamic> json) =>
    _$ReportModelImpl(
      reportId: json['reportId'] as String,
      reporterId: json['reporterId'] as String,
      reportedUserId: json['reportedUserId'] as String,
      requestId: json['requestId'] as String?,
      reason: json['reason'] as String,
      description: json['description'] as String?,
      status:
          $enumDecodeNullable(_$ReportStatusEnumMap, json['status']) ??
          ReportStatus.pending,
      adminNotes: json['adminNotes'] as String?,
      reviewedBy: json['reviewedBy'] as String?,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      reviewedAt: const TimestampConverter().fromJson(json['reviewedAt']),
    );

Map<String, dynamic> _$$ReportModelImplToJson(_$ReportModelImpl instance) =>
    <String, dynamic>{
      'reportId': instance.reportId,
      'reporterId': instance.reporterId,
      'reportedUserId': instance.reportedUserId,
      'requestId': instance.requestId,
      'reason': instance.reason,
      'description': instance.description,
      'status': _$ReportStatusEnumMap[instance.status]!,
      'adminNotes': instance.adminNotes,
      'reviewedBy': instance.reviewedBy,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'reviewedAt': const TimestampConverter().toJson(instance.reviewedAt),
    };

const _$ReportStatusEnumMap = {
  ReportStatus.pending: 'pending',
  ReportStatus.reviewed: 'reviewed',
  ReportStatus.resolved: 'resolved',
  ReportStatus.dismissed: 'dismissed',
};
