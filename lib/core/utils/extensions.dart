import 'package:flutter/material.dart';
import '../constants/enums.dart';

extension DateTimeExtension on DateTime {
  bool get isExpired => isBefore(DateTime.now());
  bool get isNotExpired => !isExpired;
  bool get isToday => year == DateTime.now().year && month == DateTime.now().month && day == DateTime.now().day;

  DateTime get startOfDay => DateTime(year, month, day);
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59);

  DateTime addDays(int days) => add(Duration(days: days));

  bool isAtLeastDaysAgo(int days) {
    return DateTime.now().difference(this).inDays >= days;
  }
}

extension StringExtension on String {
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get titleCase {
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  bool get isValidEmail {
    return RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(this);
  }
}

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get screenHeight => mediaQuery.size.height;
  double get screenWidth => mediaQuery.size.width;
  bool get isDarkMode => theme.brightness == Brightness.dark;

  void showAppSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? colorScheme.error : null,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

extension BloodGroupExtension on BloodGroup {
  String get displayName {
    switch (this) {
      case BloodGroup.oNegative:
        return 'O-';
      case BloodGroup.oPositive:
        return 'O+';
      case BloodGroup.aNegative:
        return 'A-';
      case BloodGroup.aPositive:
        return 'A+';
      case BloodGroup.bNegative:
        return 'B-';
      case BloodGroup.bPositive:
        return 'B+';
      case BloodGroup.abNegative:
        return 'AB-';
      case BloodGroup.abPositive:
        return 'AB+';
    }
  }

  Color get color {
    switch (this) {
      case BloodGroup.oNegative:
      case BloodGroup.oPositive:
        return const Color(0xFFE53935);
      case BloodGroup.aNegative:
      case BloodGroup.aPositive:
        return const Color(0xFF1E88E5);
      case BloodGroup.bNegative:
      case BloodGroup.bPositive:
        return const Color(0xFF43A047);
      case BloodGroup.abNegative:
      case BloodGroup.abPositive:
        return const Color(0xFFFF8F00);
    }
  }

  List<BloodGroup> get compatibleRecipients {
    switch (this) {
      case BloodGroup.oNegative:
        return BloodGroup.values;
      case BloodGroup.oPositive:
        return [BloodGroup.oPositive, BloodGroup.aPositive, BloodGroup.bPositive, BloodGroup.abPositive];
      case BloodGroup.aNegative:
        return [BloodGroup.aNegative, BloodGroup.aPositive, BloodGroup.abNegative, BloodGroup.abPositive];
      case BloodGroup.aPositive:
        return [BloodGroup.aPositive, BloodGroup.abPositive];
      case BloodGroup.bNegative:
        return [BloodGroup.bNegative, BloodGroup.bPositive, BloodGroup.abNegative, BloodGroup.abPositive];
      case BloodGroup.bPositive:
        return [BloodGroup.bPositive, BloodGroup.abPositive];
      case BloodGroup.abNegative:
        return [BloodGroup.abNegative, BloodGroup.abPositive];
      case BloodGroup.abPositive:
        return [BloodGroup.abPositive];
    }
  }
}

extension RequestStatusExtension on RequestStatus {
  String get displayName {
    switch (this) {
      case RequestStatus.pending:
        return 'Pending';
      case RequestStatus.matched:
        return 'Matched';
      case RequestStatus.enRoute:
        return 'En Route';
      case RequestStatus.fulfilled:
        return 'Fulfilled';
      case RequestStatus.expired:
        return 'Expired';
      case RequestStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get color {
    switch (this) {
      case RequestStatus.pending:
        return const Color(0xFFFFA000);
      case RequestStatus.matched:
        return const Color(0xFF1E88E5);
      case RequestStatus.enRoute:
        return const Color(0xFF8E24AA);
      case RequestStatus.fulfilled:
        return const Color(0xFF43A047);
      case RequestStatus.expired:
        return const Color(0xFF757575);
      case RequestStatus.cancelled:
        return const Color(0xFFE53935);
    }
  }

  IconData get icon {
    switch (this) {
      case RequestStatus.pending:
        return Icons.pending_outlined;
      case RequestStatus.matched:
        return Icons.person_add_outlined;
      case RequestStatus.enRoute:
        return Icons.directions_run;
      case RequestStatus.fulfilled:
        return Icons.check_circle_outline;
      case RequestStatus.expired:
        return Icons.access_time;
      case RequestStatus.cancelled:
        return Icons.cancel_outlined;
    }
  }
}
