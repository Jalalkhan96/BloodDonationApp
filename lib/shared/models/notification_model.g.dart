// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppNotificationImpl _$$AppNotificationImplFromJson(
  Map<String, dynamic> json,
) => _$AppNotificationImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
  title: json['title'] as String,
  body: json['body'] as String,
  data: json['data'] as Map<String, dynamic>?,
  read: json['read'] as bool? ?? false,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
);

Map<String, dynamic> _$$AppNotificationImplToJson(
  _$AppNotificationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'type': _$NotificationTypeEnumMap[instance.type]!,
  'title': instance.title,
  'body': instance.body,
  'data': instance.data,
  'read': instance.read,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
};

const _$NotificationTypeEnumMap = {
  NotificationType.emergencyRequest: 'emergencyRequest',
  NotificationType.requestAccepted: 'requestAccepted',
  NotificationType.requestExpired: 'requestExpired',
  NotificationType.requestCancelled: 'requestCancelled',
  NotificationType.donationReminder: 'donationReminder',
  NotificationType.eligibilityUpdate: 'eligibilityUpdate',
  NotificationType.certificateReady: 'certificateReady',
  NotificationType.chatMessage: 'chatMessage',
  NotificationType.system: 'system',
};
