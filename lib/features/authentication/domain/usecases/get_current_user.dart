import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository _repository;

  GetCurrentUserUseCase(this._repository);

  Option<AuthUser> call() {
    return _repository.currentUser;
  }
}
