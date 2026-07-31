import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../entities/auth_entity.dart';

abstract class AuthUseCase<Params, Type> {
  Future<Either<Failure, Type>> call(Params params);
}

class SignInWithEmailParams {
  final String email;
  final String password;

  const SignInWithEmailParams({
    required this.email,
    required this.password,
  });
}

class SignUpWithEmailParams {
  final String email;
  final String password;
  final String name;
  final String phone;

  const SignUpWithEmailParams({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });
}

class SignInWithPhoneParams {
  final String phoneNumber;

  const SignInWithPhoneParams({required this.phoneNumber});
}

class VerifyOtpParams {
  final String verificationId;
  final String smsCode;

  const VerifyOtpParams({
    required this.verificationId,
    required this.smsCode,
  });
}

class ResetPasswordParams {
  final String email;

  const ResetPasswordParams({required this.email});
}

class UpdateProfileParams {
  final String? name;
  final String? photoUrl;
  final Map<String, dynamic>? profileData;

  const UpdateProfileParams({this.name, this.photoUrl, this.profileData});
}
