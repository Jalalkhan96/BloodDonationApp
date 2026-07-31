import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../../../shared/models/blood_inventory_model.dart';

abstract class HospitalRepository {
  Future<Either<Failure, void>> updateInventory({
    required String hospitalId,
    required String bloodGroup,
    required int units,
  });
  Future<Either<Failure, List<BloodInventoryModel>>> getInventory(
    String hospitalId,
  );
  Future<Either<Failure, void>> issueCertificate({
    required String donationId,
    required String hospitalId,
  });
}
