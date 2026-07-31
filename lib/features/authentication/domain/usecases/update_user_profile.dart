import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/auth_repository.dart';
import 'auth_usecases.dart';

class UpdateUserProfileUseCase {
  final AuthRepository _repository;

  UpdateUserProfileUseCase(this._repository);

  Future<Either<Failure, void>> call(UpdateProfileParams params) {
    return _repository.updateProfile(
      name: params.name,
      photoUrl: params.photoUrl,
      profileData: params.profileData,
    );
  }
}
