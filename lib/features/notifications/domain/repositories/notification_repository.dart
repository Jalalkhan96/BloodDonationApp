import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../../../shared/models/notification_model.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<AppNotification>>> getNotifications(String userId);
  Future<Either<Failure, void>> markAsRead(String notificationId);
  Future<Either<Failure, void>> markAllAsRead(String userId);
  Future<Either<Failure, void>> deleteNotification(String notificationId);
  Future<Either<Failure, void>> sendPushNotification({
    required String userId,
    required String title,
    required String body,
    Map<String, dynamic>? data,
  });
}
