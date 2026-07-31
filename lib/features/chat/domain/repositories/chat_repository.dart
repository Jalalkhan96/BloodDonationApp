import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../../../shared/models/chat_model.dart';

abstract class ChatRepository {
  Future<Either<Failure, ChatModel>> createChat({
    required List<String> participantIds,
    String? requestId,
  });
  Future<Either<Failure, List<ChatModel>>> getChats(String userId);
  Stream<List<MessageModel>> getMessages(String chatId);
  Future<Either<Failure, void>> sendMessage({
    required String chatId,
    required String senderId,
    String? text,
    String? imageUrl,
    double? latitude,
    double? longitude,
  });
}
