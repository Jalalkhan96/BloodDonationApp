import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../../../shared/models/user_model.dart';
import '../repositories/donor_repository.dart';

class GetDonorProfileUseCase {
  final DonorRepository _repository;

  GetDonorProfileUseCase(this._repository);

  Future<Either<Failure, UserModel>> call(String donorId) {
    return _repository.getDonorProfile(donorId);
  }
}
