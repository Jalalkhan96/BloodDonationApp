import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../../../shared/models/request_model.dart';
import '../repositories/patient_repository.dart';

class GetMyRequestsUseCase {
  final PatientRepository _repository;

  GetMyRequestsUseCase(this._repository);

  Future<Either<Failure, List<RequestModel>>> call(String requesterId) {
    return _repository.getMyRequests(requesterId);
  }
}
