import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/auth_repository.dart';

class SendOtpUseCase {
  final AuthRepository _repository;

  SendOtpUseCase(this._repository);

  Future<Either<Failure, void>> call(String phoneNumber) {
    return _repository.sendOtp(phoneNumber: phoneNumber);
  }
}
