import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/constants/enums.dart';

part 'auth_entity.freezed.dart';

@freezed
class AuthUser with _$AuthUser {
  const factory AuthUser({
    required String uid,
    required String email,
    String? displayName,
    String? photoUrl,
    String? phone,
    UserRole? role,
    int? onboardingStep,
    VerificationStatus? verificationStatus,
  }) = _AuthUser;
}
