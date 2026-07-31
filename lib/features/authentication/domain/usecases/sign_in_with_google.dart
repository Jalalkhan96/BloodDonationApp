import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart';

class SignInWithGoogleUseCase {
  final AuthRepository _repository;

  SignInWithGoogleUseCase(this._repository);

  Future<Either<Failure, AuthUser>> call() {
    return _repository.signInWithGoogle();
  }
}
