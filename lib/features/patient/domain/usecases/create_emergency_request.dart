import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../../../shared/models/request_model.dart';
import '../repositories/patient_repository.dart';

class CreateEmergencyRequestUseCase {
  final PatientRepository _repository;

  CreateEmergencyRequestUseCase(this._repository);

  Future<Either<Failure, RequestModel>> call(CreateRequestParams params) {
    return _repository.createRequest(
      requesterId: params.requesterId,
      bloodGroup: params.bloodGroup,
      unitsRequired: params.unitsRequired,
      urgency: params.urgency,
      patientName: params.patientName,
      patientAge: params.patientAge,
      doctorName: params.doctorName,
      contactPhone: params.contactPhone,
      notes: params.notes,
      geopoint: params.geopoint,
      hospitalId: params.hospitalId,
    );
  }
}

class CreateRequestParams {
  final String requesterId;
  final String bloodGroup;
  final int unitsRequired;
  final String urgency;
  final String patientName;
  final int? patientAge;
  final String? doctorName;
  final String? contactPhone;
  final String? notes;
  final dynamic geopoint;
  final String? hospitalId;

  const CreateRequestParams({
    required this.requesterId,
    required this.bloodGroup,
    required this.unitsRequired,
    required this.urgency,
    required this.patientName,
    this.patientAge,
    this.doctorName,
    this.contactPhone,
    this.notes,
    required this.geopoint,
    this.hospitalId,
  });
}
