import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart';

class SignInWithPhoneUseCase {
  final AuthRepository _repository;

  SignInWithPhoneUseCase(this._repository);

  Future<Either<Failure, AuthUser>> call(String phoneNumber) {
    return _repository.signInWithPhone(phoneNumber: phoneNumber);
  }
}
