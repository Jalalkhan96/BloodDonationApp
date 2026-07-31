import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../entities/matching_entity.dart';
import '../repositories/matching_repository.dart';

class FindNearbyDonorsUseCase {
  final MatchingRepository _repository;

  FindNearbyDonorsUseCase(this._repository);

  Future<Either<Failure, MatchingResult>> call(FindNearbyDonorsParams params) {
    return _repository.findMatchingDonors(
      requestId: params.requestId,
      bloodGroup: params.bloodGroup,
      location: params.location,
      waveSize: params.waveSize,
      maxRadiusKm: params.maxRadiusKm,
    );
  }
}

class FindNearbyDonorsParams {
  final String requestId;
  final dynamic bloodGroup;
  final GeoPoint location;
  final int waveSize;
  final double maxRadiusKm;

  const FindNearbyDonorsParams({
    required this.requestId,
    required this.bloodGroup,
    required this.location,
    this.waveSize = 10,
    this.maxRadiusKm = 50.0,
  });
}
