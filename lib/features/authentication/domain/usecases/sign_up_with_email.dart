import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart';
import 'auth_usecases.dart';

class SignUpWithEmailUseCase {
  final AuthRepository _repository;

  SignUpWithEmailUseCase(this._repository);

  Future<Either<Failure, AuthUser>> call(SignUpWithEmailParams params) {
    return _repository.signUpWithEmail(
      email: params.email,
      password: params.password,
      name: params.name,
      phone: params.phone,
    );
  }
}
