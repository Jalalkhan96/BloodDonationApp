import '../constants/enums.dart';

class Validators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!regex.hasMatch(value)) return 'Enter a valid email';
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 8) return 'Password must be at least 8 characters';
    if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'(?=.*[0-9])').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) return 'Phone number is required';
    final regex = RegExp(r'^\+?[1-9]\d{6,14}$');
    if (!regex.hasMatch(value.replaceAll(RegExp(r'[\s\-\(\)]'), ''))) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? required(String? value, [String fieldName = 'This field']) {
    if (value == null || value.trim().isEmpty) return '$fieldName is required';
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) return 'Name is required';
    if (value.trim().length < 2) return 'Name must be at least 2 characters';
    if (value.trim().length > 50) return 'Name must be at most 50 characters';
    return null;
  }

  static String? age(String? value) {
    if (value == null || value.isEmpty) return 'Age is required';
    final age = int.tryParse(value);
    if (age == null) return 'Enter a valid age';
    if (age < 18) return 'Must be at least 18 years old';
    if (age > 100) return 'Enter a valid age';
    return null;
  }

  static String? weight(String? value) {
    if (value == null || value.isEmpty) return 'Weight is required';
    final weight = double.tryParse(value);
    if (weight == null) return 'Enter a valid weight';
    if (weight < 50) return 'Minimum weight is 50 kg';
    if (weight > 200) return 'Enter a valid weight';
    return null;
  }

  static String? bloodGroup(String? value) {
    if (value == null || value.isEmpty) return 'Blood group is required';
    final valid = BloodGroup.values.map((e) => e.name).toList();
    if (!valid.contains(value)) return 'Select a valid blood group';
    return null;
  }

  static String? otp(String? value) {
    if (value == null || value.isEmpty) return 'OTP is required';
    if (value.length != 6) return 'OTP must be 6 digits';
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) return 'OTP must be numeric';
    return null;
  }
}
