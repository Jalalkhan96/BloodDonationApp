import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../../../shared/models/blood_inventory_model.dart';
import '../../domain/repositories/blood_bank_repository.dart';

class BloodBankRepositoryImpl implements BloodBankRepository {
  final FirebaseFirestore _firestore;

  BloodBankRepositoryImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Future<Either<Failure, void>> addBatch({
    required String bankId,
    required String bloodGroup,
    required int units,
    required DateTime expiryDate,
  }) async {
    try {
      final batchRef = _firestore
          .collection('bloodInventory')
          .doc(bankId)
          .collection('stock')
          .doc(bloodGroup);

      await batchRef.set({
        'totalUnits': FieldValue.increment(units),
        'batches': FieldValue.arrayUnion([
          {
            'batchId': DateTime.now().millisecondsSinceEpoch.toString(),
            'units': units,
            'expiryDate': Timestamp.fromDate(expiryDate),
            'isActive': true,
          }
        ]),
        'lastUpdated': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BloodInventoryModel>>> getInventory(
    String bankId,
  ) async {
    try {
      final snapshot = await _firestore
          .collection('bloodInventory')
          .doc(bankId)
          .collection('stock')
          .get();

      final inventory = snapshot.docs.map((doc) {
        return BloodInventoryModel.fromJson({
          'bankId': bankId,
          ...doc.data(),
        });
      }).toList();
      return right(inventory);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> transferStock({
    required String fromBankId,
    required String toBankId,
    required String bloodGroup,
    required int units,
  }) async {
    try {
      await _firestore.runTransaction((transaction) async {
        final fromRef = _firestore
            .collection('bloodInventory')
            .doc(fromBankId)
            .collection('stock')
            .doc(bloodGroup);
        final toRef = _firestore
            .collection('bloodInventory')
            .doc(toBankId)
            .collection('stock')
            .doc(bloodGroup);

        final fromDoc = await transaction.get(fromRef);
        final toDoc = await transaction.get(toRef);

        final fromUnits = (fromDoc.data()?['totalUnits'] as int?) ?? 0;
        if (fromUnits < units) throw Exception('Insufficient stock');

        transaction.update(fromRef, {
          'totalUnits': FieldValue.increment(-units),
          'lastUpdated': FieldValue.serverTimestamp(),
        });
        transaction.set(toRef, {
          'totalUnits': FieldValue.increment(units),
          'lastUpdated': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
      });
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BloodInventoryModel>>> getExpiringStock({
    required String bankId,
    required int withinDays,
  }) async {
    try {
      final snapshot = await _firestore
          .collection('bloodInventory')
          .doc(bankId)
          .collection('stock')
          .get();

      final inventory = snapshot.docs
          .map((doc) => BloodInventoryModel.fromJson({
                'bankId': bankId,
                ...doc.data(),
              }))
          .where((item) {
        final expiryThreshold =
            DateTime.now().add(Duration(days: withinDays));
        return item.batches.any(
          (batch) => batch.expiryDate.toDate().isBefore(expiryThreshold),
        );
      }).toList();

      return right(inventory);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
