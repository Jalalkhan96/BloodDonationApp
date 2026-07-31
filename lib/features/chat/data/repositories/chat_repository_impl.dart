import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../../../shared/models/chat_model.dart';
import '../../domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final FirebaseFirestore _firestore;

  ChatRepositoryImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Future<Either<Failure, ChatModel>> createChat({
    required List<String> participantIds,
    String? requestId,
  }) async {
    try {
      final docRef = _firestore.collection('chats').doc();
      await docRef.set({
        'participantIds': participantIds,
        'requestId': requestId,
        'createdAt': FieldValue.serverTimestamp(),
        'isActive': true,
      });

      return right(ChatModel(
        chatId: docRef.id,
        participantIds: participantIds,
        requestId: requestId,
        createdAt: Timestamp.now(),
      ));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ChatModel>>> getChats(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('chats')
          .where('participantIds', arrayContains: userId)
          .where('isActive', isEqualTo: true)
          .orderBy('lastMessageAt', descending: true)
          .get();

      final chats = snapshot.docs
          .map((doc) => ChatModel.fromFirestore(doc))
          .toList();
      return right(chats);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Stream<List<MessageModel>> getMessages(String chatId) {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('sentAt', descending: true)
        .limit(50)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => MessageModel.fromFirestore(doc))
            .toList());
  }

  @override
  Future<Either<Failure, void>> sendMessage({
    required String chatId,
    required String senderId,
    String? text,
    String? imageUrl,
    double? latitude,
    double? longitude,
  }) async {
    try {
      final docRef = _firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .doc();

      final messageData = <String, dynamic>{
        'senderId': senderId,
        'text': text,
        'imageUrl': imageUrl,
        'sentAt': FieldValue.serverTimestamp(),
        'readBy': [senderId],
      };

      if (latitude != null && longitude != null) {
        messageData['location'] = GeoPoint(latitude, longitude);
      }

      await docRef.set(messageData);

      await _firestore.collection('chats').doc(chatId).update({
        'lastMessage': text ?? 'Image',
        'lastMessageSenderId': senderId,
        'lastMessageAt': FieldValue.serverTimestamp(),
      });

      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
