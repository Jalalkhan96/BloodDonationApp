export 'enums.dart';

enum UserRole {
  donor,
  patient,
  hospital,
  bloodBank,
  ngo,
  admin,
}

enum BloodGroup {
  oNegative,
  oPositive,
  aNegative,
  aPositive,
  bNegative,
  bPositive,
  abNegative,
  abPositive;

  List<BloodGroup> get compatibleRecipients {
    switch (this) {
      case BloodGroup.oNegative:
        return BloodGroup.values;
      case BloodGroup.oPositive:
        return [oPositive, aPositive, bPositive, abPositive];
      case BloodGroup.aNegative:
        return [aNegative, aPositive, abNegative, abPositive];
      case BloodGroup.aPositive:
        return [aPositive, abPositive];
      case BloodGroup.bNegative:
        return [bNegative, bPositive, abNegative, abPositive];
      case BloodGroup.bPositive:
        return [bPositive, abPositive];
      case BloodGroup.abNegative:
        return [abNegative, abPositive];
      case BloodGroup.abPositive:
        return [abPositive];
    }
  }

  List<BloodGroup> get compatibleDonors {
    switch (this) {
      case BloodGroup.oNegative:
        return [oNegative];
      case BloodGroup.oPositive:
        return [oNegative, oPositive];
      case BloodGroup.aNegative:
        return [oNegative, aNegative];
      case BloodGroup.aPositive:
        return [oNegative, oPositive, aNegative, aPositive];
      case BloodGroup.bNegative:
        return [oNegative, bNegative];
      case BloodGroup.bPositive:
        return [oNegative, oPositive, bNegative, bPositive];
      case BloodGroup.abNegative:
        return [oNegative, aNegative, bNegative, abNegative];
      case BloodGroup.abPositive:
        return BloodGroup.values;
    }
  }
}

enum RequestStatus {
  pending,
  matched,
  enRoute,
  fulfilled,
  expired,
  cancelled,
}

enum UrgencyLevel {
  critical,
  urgent,
  scheduled,
}

enum Availability {
  available,
  unavailable,
  busy,
}

enum OnboardingStep {
  roleSelection(0),
  personalInfo(1),
  medicalProfile(2),
  documentUpload(3),
  locationPermission(4),
  notificationPermission(5),
  complete(6);

  const OnboardingStep(this.value);
  final int value;

  static OnboardingStep fromValue(int value) {
    return OnboardingStep.values.firstWhere(
      (e) => e.value == value,
      orElse: () => OnboardingStep.roleSelection,
    );
  }
}

enum VerificationStatus {
  pending,
  approved,
  rejected,
}

enum ReportStatus {
  pending,
  reviewed,
  resolved,
  dismissed,
}

enum NotificationType {
  emergencyRequest,
  requestAccepted,
  requestExpired,
  requestCancelled,
  donationReminder,
  eligibilityUpdate,
  certificateReady,
  chatMessage,
  system,
}

enum BadgeType {
  firstDonation,
  tenDonations,
  fiftyDonations,
  hundredDonations,
  quickResponder,
  lifesaver,
  consistentDonor,
  emergencyHero,
}

enum DonationType {
  wholeBlood,
  platelets,
  plasma,
  doubleRedCells,
}
