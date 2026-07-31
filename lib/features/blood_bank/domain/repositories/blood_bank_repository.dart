import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../../../shared/models/blood_inventory_model.dart';

abstract class BloodBankRepository {
  Future<Either<Failure, void>> addBatch({
    required String bankId,
    required String bloodGroup,
    required int units,
    required DateTime expiryDate,
  });
  Future<Either<Failure, List<BloodInventoryModel>>> getInventory(
    String bankId,
  );
  Future<Either<Failure, void>> transferStock({
    required String fromBankId,
    required String toBankId,
    required String bloodGroup,
    required int units,
  });
  Future<Either<Failure, List<BloodInventoryModel>>> getExpiringStock({
    required String bankId,
    required int withinDays,
  });
}
