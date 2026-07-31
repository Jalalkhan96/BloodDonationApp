import 'enums.dart';
abstract class AppConstants {
  static const String appName = 'LifeLink';
  static const String appTagline = 'Smart Blood Donation Platform';

  // Firebase Collections
  static const String usersCollection = 'users';
  static const String requestsCollection = 'requests';
  static const String donationsCollection = 'donations';
  static const String bloodInventoryCollection = 'bloodInventory';
  static const String chatsCollection = 'chats';
  static const String messagesSubCollection = 'messages';
  static const String notificationsCollection = 'notifications';
  static const String reportsCollection = 'reports';
  static const String badgesCollection = 'badges';
  static const String campsCollection = 'camps';

  // Blood Compatibility Matrix
  static const Map<BloodGroup, List<BloodGroup>> bloodCompatibility = {
    BloodGroup.oNegative: BloodGroup.values,
    BloodGroup.oPositive: [
      BloodGroup.oPositive,
      BloodGroup.aPositive,
      BloodGroup.bPositive,
      BloodGroup.abPositive,
    ],
    BloodGroup.aNegative: [
      BloodGroup.aNegative,
      BloodGroup.aPositive,
      BloodGroup.abNegative,
      BloodGroup.abPositive,
    ],
    BloodGroup.aPositive: [BloodGroup.aPositive, BloodGroup.abPositive],
    BloodGroup.bNegative: [
      BloodGroup.bNegative,
      BloodGroup.bPositive,
      BloodGroup.abNegative,
      BloodGroup.abPositive,
    ],
    BloodGroup.bPositive: [BloodGroup.bPositive, BloodGroup.abPositive],
    BloodGroup.abNegative: [BloodGroup.abNegative, BloodGroup.abPositive],
    BloodGroup.abPositive: [BloodGroup.abPositive],
  };

  // Eligibility Constants (defaults, overridden by Remote Config)
  static const int minAge = 18;
  static const int maxAge = 65;
  static const double minWeightKg = 50.0;
  static const int donationCooldownDays = 90;
  static const int healthQuestionnaireValidityDays = 30;
  static const int recentSurgeryMonths = 6;
  static const int recentTattooMonths = 6;

  // Matching Algorithm Defaults
  static const double weightDistance = 0.35;
  static const double weightAvailability = 0.20;
  static const double weightAcceptanceRate = 0.15;
  static const double weightDonationHistory = 0.10;
  static const double weightRating = 0.10;
  static const double weightRecency = 0.10;

  // Emergency Request
  static const int emergencyWaveSize = 10;
  static const Duration emergencyWaveTimeout = Duration(minutes: 3);
  static const Duration emergencyRequestTtl = Duration(hours: 24);

  // Geohash
  static const int geohashPrecision = 9;
  static const double maxSearchRadiusKm = 50.0;

  // Notification Channels
  static const String emergencyChannelId = 'emergency_alerts';
  static const String generalChannelId = 'general_notifications';
  static const String chatChannelId = 'chat_messages';
}
