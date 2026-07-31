import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/errors/failures.dart';
import '../../../../shared/models/user_model.dart';
import '../../../../shared/services/location_service.dart';
import '../../domain/repositories/donor_repository.dart';

class DonorRepositoryImpl implements DonorRepository {
  final FirebaseFirestore _firestore;
  final LocationService _locationService;

  DonorRepositoryImpl({
    required FirebaseFirestore firestore,
    required LocationService locationService,
  })  : _firestore = firestore,
        _locationService = locationService;

  @override
  Future<Either<Failure, UserModel>> getDonorProfile(String donorId) async {
    try {
      final doc = await _firestore.collection('users').doc(donorId).get();
      if (!doc.exists) return left(const NotFoundFailure());
      return right(UserModel.fromFirestore(doc));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UserModel>>> getNearbyDonors({
    required GeoPoint location,
    double radiusKm = 50.0,
    BloodGroup? bloodGroup,
  }) async {
    try {
      var query = _firestore
          .collection('users')
          .where('role', isEqualTo: 'donor')
          .where('profile.availability', isEqualTo: 'available')
          .where('profile.isEligible', isEqualTo: true);

      if (bloodGroup != null) {
        query = query.where(
          'profile.bloodGroup',
          isEqualTo: bloodGroup.name,
        );
      }

      final snapshot = await query.limit(100).get();

      final donors = snapshot.docs
          .map((doc) => UserModel.fromFirestore(doc))
          .where((user) {
        if (user.profile?.geopoint == null) return false;
        final distance = _locationService.calculateDistance(
          lat1: location.latitude,
          lon1: location.longitude,
          lat2: user.profile!.geopoint!.latitude,
          lon2: user.profile!.geopoint!.longitude,
        );
        return distance <= radiusKm;
      }).toList();

      return right(donors);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateAvailability({
    required String donorId,
    required Availability availability,
  }) async {
    try {
      await _firestore.collection('users').doc(donorId).update({
        'profile.availability': availability.name,
        'updatedAt': FieldValue.serverTimestamp(),
      });
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateLocation({
    required String donorId,
    required GeoPoint geopoint,
  }) async {
    try {
      final geohash = _locationService.encodeGeohash(
        geopoint.latitude,
        geopoint.longitude,
      );
      await _firestore.collection('users').doc(donorId).update({
        'profile.geopoint': geopoint,
        'profile.geohash': geohash,
        'updatedAt': FieldValue.serverTimestamp(),
      });
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getDonationHistory(String donorId) async {
    try {
      final snapshot = await _firestore
          .collection('donations')
          .where('donorId', isEqualTo: donorId)
          .orderBy('date', descending: true)
          .get();

      return right(snapshot.docs.map((doc) => doc.id).toList());
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
