import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/errors/failures.dart';
import '../../../../shared/models/user_model.dart';
import '../../../../shared/services/location_service.dart';

abstract class DonorRepository {
  Future<Either<Failure, UserModel>> getDonorProfile(String donorId);
  Future<Either<Failure, List<UserModel>>> getNearbyDonors({
    required GeoPoint location,
    double radiusKm = 50.0,
    BloodGroup? bloodGroup,
  });
  Future<Either<Failure, void>> updateAvailability({
    required String donorId,
    required Availability availability,
  });
  Future<Either<Failure, void>> updateLocation({
    required String donorId,
    required GeoPoint geopoint,
  });
  Future<Either<Failure, List<String>>> getDonationHistory(String donorId);
}
