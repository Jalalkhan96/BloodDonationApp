import 'package:intl/intl.dart';

class Formatters {
  static String formatDate(DateTime date) {
    return DateFormat('MMM d, yyyy').format(date);
  }

  static String formatDateTime(DateTime date) {
    return DateFormat('MMM d, yyyy • h:mm a').format(date);
  }

  static String formatTime(DateTime date) {
    return DateFormat('h:mm a').format(date);
  }

  static String formatRelative(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inSeconds < 60) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return formatDate(date);
  }

  static String formatDistance(double km) {
    if (km < 1) return '${(km * 1000).round()}m';
    if (km < 10) return '${km.toStringAsFixed(1)}km';
    return '${km.round()}km';
  }

  static String formatBloodGroup(String group) {
    return group
        .replaceAll('oNegative', 'O-')
        .replaceAll('oPositive', 'O+')
        .replaceAll('aNegative', 'A-')
        .replaceAll('aPositive', 'A+')
        .replaceAll('bNegative', 'B-')
        .replaceAll('bPositive', 'B+')
        .replaceAll('abNegative', 'AB-')
        .replaceAll('abPositive', 'AB+');
  }

  static String formatPhoneNumber(String phone) {
    if (phone.length == 10) {
      return '(${phone.substring(0, 3)}) ${phone.substring(3, 6)}-${phone.substring(6)}';
    }
    return phone;
  }

  static String formatUnits(int units) {
    return '$units unit${units == 1 ? '' : 's'}';
  }

  static String formatPercentage(double value) {
    return '${(value * 100).toStringAsFixed(1)}%';
  }

  static String formatCompactNumber(int number) {
    if (number >= 1000000) return '${(number / 1000000).toStringAsFixed(1)}M';
    if (number >= 1000) return '${(number / 1000).toStringAsFixed(1)}K';
    return number.toString();
  }
}
