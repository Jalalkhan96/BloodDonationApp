import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../../../shared/models/notification_model.dart';
import '../../domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final FirebaseFirestore _firestore;
  final FirebaseMessaging _messaging;

  NotificationRepositoryImpl({
    required FirebaseFirestore firestore,
    required FirebaseMessaging messaging,
  })  : _firestore = firestore,
        _messaging = messaging;

  @override
  Future<Either<Failure, List<AppNotification>>> getNotifications(
    String userId,
  ) async {
    try {
      final snapshot = await _firestore
          .collection('notifications')
          .doc(userId)
          .collection('items')
          .orderBy('createdAt', descending: true)
          .limit(50)
          .get();

      final notifications = snapshot.docs
          .map((doc) => AppNotification.fromFirestore(doc))
          .toList();
      return right(notifications);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> markAsRead(String notificationId) async {
    try {
      await _firestore
          .collectionGroup('items')
          .where('id', isEqualTo: notificationId)
          .get()
          .then((snapshot) {
        for (final doc in snapshot.docs) {
          doc.reference.update({'read': true});
        }
      });
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> markAllAsRead(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('notifications')
          .doc(userId)
          .collection('items')
          .where('read', isEqualTo: false)
          .get();

      final batch = _firestore.batch();
      for (final doc in snapshot.docs) {
        batch.update(doc.reference, {'read': true});
      }
      await batch.commit();
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteNotification(String notificationId) async {
    try {
      await _firestore
          .collectionGroup('items')
          .where('id', isEqualTo: notificationId)
          .get()
          .then((snapshot) {
        for (final doc in snapshot.docs) {
          doc.reference.delete();
        }
      });
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendPushNotification({
    required String userId,
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    try {
      await _firestore
          .collection('notifications')
          .doc(userId)
          .collection('items')
          .add({
        'title': title,
        'body': body,
        'data': data,
        'type': data?['type'] ?? 'system',
        'read': false,
        'createdAt': FieldValue.serverTimestamp(),
      });
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
