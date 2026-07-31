import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/errors/failures.dart';
import '../entities/matching_entity.dart';

abstract class MatchingRepository {
  Future<Either<Failure, MatchingResult>> findMatchingDonors({
    required String requestId,
    required BloodGroup bloodGroup,
    required GeoPoint location,
    int waveSize = 10,
    double maxRadiusKm = 50.0,
  });

  Future<Either<Failure, bool>> acceptRequest({
    required String requestId,
    required String donorId,
  });

  Future<Either<Failure, void>> rejectRequest({
    required String requestId,
    required String donorId,
    String? reason,
  });

  Stream<MatchingCandidate> getDonorLocationStream({required String donorId});
}
