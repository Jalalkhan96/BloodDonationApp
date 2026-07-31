import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FcmService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) return;

    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
      criticalAlert: true,
    );

    debugPrint('FCM Authorization status: ${settings.authorizationStatus}');

    await _initializeLocalNotifications();

    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);

    final token = await _messaging.getToken();
    debugPrint('FCM Token: $token');

    _messaging.onTokenRefresh.listen((newToken) {
      debugPrint('FCM Token Refreshed: $newToken');
    });

    _initialized = true;
  }

  Future<void> _initializeLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );

    const emergencyChannel = AndroidNotificationChannel(
      'emergency_alerts',
      'Emergency Alerts',
      description: 'Critical blood donation emergency alerts',
      importance: Importance.max,
      enableVibration: true,
      playSound: true,
    );

    const generalChannel = AndroidNotificationChannel(
      'general_notifications',
      'General Notifications',
      description: 'General app notifications',
      importance: Importance.high,
    );

    const chatChannel = AndroidNotificationChannel(
      'chat_messages',
      'Chat Messages',
      description: 'Chat message notifications',
      importance: Importance.high,
    );

    final androidPlugin = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await androidPlugin?.createNotificationChannel(emergencyChannel);
    await androidPlugin?.createNotificationChannel(generalChannel);
    await androidPlugin?.createNotificationChannel(chatChannel);
  }

  void _handleForegroundMessage(RemoteMessage message) {
    debugPrint('Foreground message: ${message.messageId}');
    _showLocalNotification(message);
  }

  void _handleMessageOpenedApp(RemoteMessage message) {
    debugPrint('Message opened app: ${message.messageId}');
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    final isEmergency = message.data['type'] == 'emergency_request';
    final channelId = isEmergency ? 'emergency_alerts' : 'general_notifications';

    await _localNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channelId,
          channelId == 'emergency_alerts' ? 'Emergency Alerts' : 'General Notifications',
          importance: isEmergency ? Importance.max : Importance.high,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: jsonEncode(message.data),
    );
  }

  void _onNotificationTap(NotificationResponse response) {
    if (response.payload == null) return;
    final data = jsonDecode(response.payload!);
    debugPrint('Notification tapped: $data');
  }

  Future<String?> getToken() async {
    return _messaging.getToken();
  }

  Future<void> deleteToken() async {
    await _messaging.deleteToken();
  }

  Future<void> subscribeToTopic(String topic) async {
    await _messaging.subscribeToTopic(topic);
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await _messaging.unsubscribeFromTopic(topic);
  }
}
