import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/patient_repository.dart';

class CancelRequestUseCase {
  final PatientRepository _repository;

  CancelRequestUseCase(this._repository);

  Future<Either<Failure, void>> call(CancelRequestParams params) {
    return _repository.cancelRequest(
      requestId: params.requestId,
      reason: params.reason,
    );
  }
}

class CancelRequestParams {
  final String requestId;
  final String? reason;

  const CancelRequestParams({
    required this.requestId,
    this.reason,
  });
}
