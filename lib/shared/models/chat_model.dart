import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'timestamp_converter.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    required String chatId,
    required List<String> participantIds,
    String? requestId,
    String? lastMessage,
    String? lastMessageSenderId,
    @TimestampConverter() Timestamp? lastMessageAt,
    @Default(false) bool lastMessageRead,
    @Default(0) int unreadCount,
    @Default(true) bool isActive,
    @TimestampConverter() Timestamp? createdAt,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  factory ChatModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return ChatModel.fromJson({
      'chatId': doc.id,
      ...data,
    });
  }
}

@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    required String messageId,
    required String senderId,
    String? text,
    String? imageUrl,
    @GeoPointConverter() GeoPoint? location,
    @Default([]) List<String> readBy,
    @TimestampConverter() Timestamp? sentAt,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  factory MessageModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return MessageModel.fromJson({
      'messageId': doc.id,
      ...data,
    });
  }
}
