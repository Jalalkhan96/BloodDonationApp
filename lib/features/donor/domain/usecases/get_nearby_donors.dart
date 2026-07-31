import 'package:fpdart/fpdart.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/errors/failures.dart';
import '../../../../shared/models/user_model.dart';
import '../repositories/donor_repository.dart';

class GetNearbyDonorsUseCase {
  final DonorRepository _repository;

  GetNearbyDonorsUseCase(this._repository);

  Future<Either<Failure, List<UserModel>>> call(GetNearbyDonorsParams params) {
    return _repository.getNearbyDonors(
      location: params.location,
      radiusKm: params.radiusKm,
      bloodGroup: params.bloodGroup,
    );
  }
}

class GetNearbyDonorsParams {
  final dynamic location;
  final double radiusKm;
  final BloodGroup? bloodGroup;

  const GetNearbyDonorsParams({
    required this.location,
    this.radiusKm = 50.0,
    this.bloodGroup,
  });
}
