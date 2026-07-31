import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart';
import 'auth_usecases.dart';

class SignInWithEmailUseCase {
  final AuthRepository _repository;

  SignInWithEmailUseCase(this._repository);

  Future<Either<Failure, AuthUser>> call(SignInWithEmailParams params) {
    return _repository.signInWithEmail(
      email: params.email,
      password: params.password,
    );
  }
}
