import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/enums.dart';
import '../../../../shared/models/user_model.dart';

class CheckEligibilityUseCase {
  EligibilityResult call(UserProfile profile) {
    final now = DateTime.now();

    if (profile.age != null && (profile.age! < AppConstants.minAge || profile.age! > AppConstants.maxAge)) {
      return const EligibilityResult(
        isEligible: false,
        reason: 'Age must be between 18 and 65',
      );
    }

    if (profile.weight != null && profile.weight! < AppConstants.minWeightKg) {
      return const EligibilityResult(
        isEligible: false,
        reason: 'Minimum weight is 50 kg',
      );
    }

    if (profile.lastDonationDate != null) {
      final lastDonation = profile.lastDonationDate!.toDate();
      final daysSince = now.difference(lastDonation).inDays;
      if (daysSince < AppConstants.donationCooldownDays) {
        final daysRemaining = AppConstants.donationCooldownDays - daysSince;
        return EligibilityResult(
          isEligible: false,
          reason: 'Must wait $daysRemaining more days after last donation',
          nextEligibleDate: lastDonation.add(Duration(days: AppConstants.donationCooldownDays)),
        );
      }
    }

    for (final condition in profile.medicalConditions) {
      if (condition.toLowerCase().contains('pregnant') ||
          condition.toLowerCase().contains('surgery')) {
        return EligibilityResult(
          isEligible: false,
          reason: 'Medical condition: $condition',
        );
      }
    }

    final nextEligible = profile.lastDonationDate != null
        ? profile.lastDonationDate!.toDate().add(
            Duration(days: AppConstants.donationCooldownDays))
        : now;

    return EligibilityResult(
      isEligible: true,
      nextEligibleDate: nextEligible,
    );
  }
}

class EligibilityResult {
  final bool isEligible;
  final String? reason;
  final DateTime? nextEligibleDate;

  const EligibilityResult({
    required this.isEligible,
    this.reason,
    this.nextEligibleDate,
  });
}
