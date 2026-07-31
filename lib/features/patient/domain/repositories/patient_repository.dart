import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../../../shared/models/request_model.dart';

abstract class PatientRepository {
  Future<Either<Failure, RequestModel>> createRequest({
    required String requesterId,
    required String bloodGroup,
    required int unitsRequired,
    required String urgency,
    required String patientName,
    int? patientAge,
    String? doctorName,
    String? contactPhone,
    String? notes,
    required GeoPoint geopoint,
    String? hospitalId,
  });
  Future<Either<Failure, List<RequestModel>>> getMyRequests(String requesterId);
  Future<Either<Failure, void>> cancelRequest({
    required String requestId,
    String? reason,
  });
  Future<Either<Failure, RequestModel>> getRequestDetail(String requestId);
}
