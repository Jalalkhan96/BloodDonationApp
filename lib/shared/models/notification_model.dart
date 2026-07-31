import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/constants/enums.dart';
import 'timestamp_converter.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class AppNotification with _$AppNotification {
  const factory AppNotification({
    required String id,
    required String userId,
    required NotificationType type,
    required String title,
    required String body,
    Map<String, dynamic>? data,
    @Default(false) bool read,
    @TimestampConverter() Timestamp? createdAt,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);

  factory AppNotification.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return AppNotification.fromJson({
      'id': doc.id,
      ...data,
    });
  }
}
