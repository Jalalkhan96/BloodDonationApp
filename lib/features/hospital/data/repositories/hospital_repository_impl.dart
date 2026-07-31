import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../../../shared/models/blood_inventory_model.dart';
import '../../domain/repositories/hospital_repository.dart';

class HospitalRepositoryImpl implements HospitalRepository {
  final FirebaseFirestore _firestore;

  HospitalRepositoryImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Future<Either<Failure, void>> updateInventory({
    required String hospitalId,
    required String bloodGroup,
    required int units,
  }) async {
    try {
      await _firestore
          .collection('bloodInventory')
          .doc(hospitalId)
          .collection('stock')
          .doc(bloodGroup)
          .set({
        'units': units,
        'lastUpdated': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BloodInventoryModel>>> getInventory(
    String hospitalId,
  ) async {
    try {
      final snapshot = await _firestore
          .collection('bloodInventory')
          .doc(hospitalId)
          .collection('stock')
          .get();

      final inventory = snapshot.docs.map((doc) {
        return BloodInventoryModel.fromJson({
          'bankId': hospitalId,
          'bloodGroup': doc.id,
          ...doc.data(),
        });
      }).toList();
      return right(inventory);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> issueCertificate({
    required String donationId,
    required String hospitalId,
  }) async {
    try {
      await _firestore.collection('donations').doc(donationId).update({
        'verified': true,
        'verifiedAt': FieldValue.serverTimestamp(),
      });
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
