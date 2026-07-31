import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/errors/failures.dart';
import '../../../../shared/models/request_model.dart';
import '../../domain/repositories/patient_repository.dart';

class PatientRepositoryImpl implements PatientRepository {
  final FirebaseFirestore _firestore;

  PatientRepositoryImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
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
  }) async {
    try {
      final docRef = _firestore.collection('requests').doc();
      final geohash = '${geopoint.latitude},${geopoint.longitude}';
      await docRef.set({
        'requesterId': requesterId,
        'hospitalId': hospitalId,
        'bloodGroup': bloodGroup,
        'unitsRequired': unitsRequired,
        'urgency': urgency,
        'patientName': patientName,
        'patientAge': patientAge,
        'doctorName': doctorName,
        'contactPhone': contactPhone,
        'notes': notes,
        'geopoint': geopoint,
        'geohash': geohash,
        'status': 'pending',
        'createdAt': FieldValue.serverTimestamp(),
      });

      return right(RequestModel(
        requestId: docRef.id,
        requesterId: requesterId,
        hospitalId: hospitalId,
        bloodGroup: BloodGroup.values.firstWhere(
          (g) => g.name == bloodGroup,
          orElse: () => BloodGroup.abPositive,
        ),
        unitsRequired: unitsRequired,
        urgency: UrgencyLevel.values.firstWhere(
          (e) => e.name == urgency,
          orElse: () => UrgencyLevel.urgent,
        ),
        patientName: patientName,
        patientAge: patientAge,
        doctorName: doctorName,
        contactPhone: contactPhone,
        notes: notes,
        geopoint: geopoint,
        geohash: geohash,
        status: RequestStatus.pending,
        createdAt: Timestamp.now(),
      ));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RequestModel>>> getMyRequests(
    String requesterId,
  ) async {
    try {
      final snapshot = await _firestore
          .collection('requests')
          .where('requesterId', isEqualTo: requesterId)
          .orderBy('createdAt', descending: true)
          .limit(50)
          .get();

      final requests = snapshot.docs
          .map((doc) => RequestModel.fromFirestore(doc))
          .toList();
      return right(requests);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cancelRequest({
    required String requestId,
    String? reason,
  }) async {
    try {
      await _firestore.collection('requests').doc(requestId).update({
        'status': 'cancelled',
        'cancellationReason': reason,
        'closedAt': FieldValue.serverTimestamp(),
      });
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RequestModel>> getRequestDetail(String requestId) async {
    try {
      final doc = await _firestore.collection('requests').doc(requestId).get();
      if (!doc.exists) return left(const NotFoundFailure());
      return right(RequestModel.fromFirestore(doc));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
