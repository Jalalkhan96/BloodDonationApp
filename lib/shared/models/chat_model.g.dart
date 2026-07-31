// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatModelImpl _$$ChatModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatModelImpl(
      chatId: json['chatId'] as String,
      participantIds: (json['participantIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      requestId: json['requestId'] as String?,
      lastMessage: json['lastMessage'] as String?,
      lastMessageSenderId: json['lastMessageSenderId'] as String?,
      lastMessageAt: const TimestampConverter().fromJson(json['lastMessageAt']),
      lastMessageRead: json['lastMessageRead'] as bool? ?? false,
      unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
      isActive: json['isActive'] as bool? ?? true,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$ChatModelImplToJson(
  _$ChatModelImpl instance,
) => <String, dynamic>{
  'chatId': instance.chatId,
  'participantIds': instance.participantIds,
  'requestId': instance.requestId,
  'lastMessage': instance.lastMessage,
  'lastMessageSenderId': instance.lastMessageSenderId,
  'lastMessageAt': const TimestampConverter().toJson(instance.lastMessageAt),
  'lastMessageRead': instance.lastMessageRead,
  'unreadCount': instance.unreadCount,
  'isActive': instance.isActive,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
};

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      messageId: json['messageId'] as String,
      senderId: json['senderId'] as String,
      text: json['text'] as String?,
      imageUrl: json['imageUrl'] as String?,
      location: const GeoPointConverter().fromJson(json['location']),
      readBy:
          (json['readBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      sentAt: const TimestampConverter().fromJson(json['sentAt']),
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'senderId': instance.senderId,
      'text': instance.text,
      'imageUrl': instance.imageUrl,
      'location': const GeoPointConverter().toJson(instance.location),
      'readBy': instance.readBy,
      'sentAt': const TimestampConverter().toJson(instance.sentAt),
    };
