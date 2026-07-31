import 'package:fpdart/fpdart.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/donor_repository.dart';

class UpdateDonorAvailabilityUseCase {
  final DonorRepository _repository;

  UpdateDonorAvailabilityUseCase(this._repository);

  Future<Either<Failure, void>> call(UpdateAvailabilityParams params) {
    return _repository.updateAvailability(
      donorId: params.donorId,
      availability: params.availability,
    );
  }
}

class UpdateAvailabilityParams {
  final String donorId;
  final Availability availability;

  const UpdateAvailabilityParams({
    required this.donorId,
    required this.availability,
  });
}
