import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/auth_repository.dart';
import 'auth_usecases.dart';

class VerifyOtpUseCase {
  final AuthRepository _repository;

  VerifyOtpUseCase(this._repository);

  Future<Either<Failure, bool>> call(VerifyOtpParams params) {
    return _repository.verifyOtp(
      verificationId: params.verificationId,
      smsCode: params.smsCode,
    );
  }
}
