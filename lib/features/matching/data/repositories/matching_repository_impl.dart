import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/errors/failures.dart';
import '../../../../shared/services/location_service.dart';
import '../../domain/entities/matching_entity.dart';
import '../../domain/repositories/matching_repository.dart';

class MatchingRepositoryImpl implements MatchingRepository {
  final FirebaseFirestore _firestore;
  final LocationService _locationService;

  MatchingRepositoryImpl({
    required FirebaseFirestore firestore,
    required LocationService locationService,
  })  : _firestore = firestore,
        _locationService = locationService;

  @override
  Future<Either<Failure, MatchingResult>> findMatchingDonors({
    required String requestId,
    required BloodGroup bloodGroup,
    required GeoPoint location,
    int waveSize = 10,
    double maxRadiusKm = 50.0,
  }) async {
    try {
      final compatibleGroups = bloodGroup.compatibleRecipients;
      final requestLat = location.latitude;
      final requestLng = location.longitude;

      final querySnapshot = await _firestore
          .collection('users')
          .where('role', isEqualTo: 'donor')
          .where('profile.bloodGroup', whereIn: compatibleGroups.map((g) => g.name).toList())
          .where('profile.availability', isEqualTo: 'available')
          .where('profile.isEligible', isEqualTo: true)
          .get();

      final candidates = <MatchingCandidate>[];

      for (final doc in querySnapshot.docs) {
        final data = doc.data();
        final profile = data['profile'] as Map<String, dynamic>?;
        if (profile == null) continue;

        final geopoint = profile['geopoint'] as GeoPoint?;
        if (geopoint == null) continue;

        final distance = _locationService.calculateDistance(
          lat1: requestLat,
          lon1: requestLng,
          lat2: geopoint.latitude,
          lon2: geopoint.longitude,
        );

        if (distance > maxRadiusKm) continue;

        final donorBloodGroup = BloodGroup.values.firstWhere(
          (g) => g.name == profile['bloodGroup'],
          orElse: () => BloodGroup.abPositive,
        );

        final acceptanceRate = _calculateAcceptanceRate(doc.id);
        final donationCount = profile['donationCount'] as int? ?? 0;
        final rating = (profile['rating'] as num?)?.toDouble() ?? 0.0;

        final distanceScore = max(0, 1 - (distance / maxRadiusKm));
        final availabilityScore = 1.0;
        final acceptanceRateScore = acceptanceRate;
        final donationHistoryScore = min(1.0, donationCount / 20);
        final ratingScore = rating / 5.0;
        final recencyScore = 1.0;

        final score = (distanceScore * 0.35) +
            (availabilityScore * 0.20) +
            (acceptanceRateScore * 0.15) +
            (donationHistoryScore * 0.10) +
            (ratingScore * 0.10) +
            (recencyScore * 0.10);

        candidates.add(MatchingCandidate(
          donorId: doc.id,
          bloodGroup: donorBloodGroup,
          distanceKm: distance,
          score: score,
          acceptanceRate: acceptanceRate,
          donationCount: donationCount,
          rating: rating,
          recencyScore: recencyScore,
          isExactMatch: donorBloodGroup == bloodGroup,
        ));
      }

      candidates.sort((a, b) {
        if (a.isExactMatch && !b.isExactMatch) return -1;
        if (!a.isExactMatch && b.isExactMatch) return 1;
        return b.score.compareTo(a.score);
      });

      final topCandidates = candidates.take(waveSize).toList();
      final usedCompatible = topCandidates.every((c) => !c.isExactMatch);

      return right(MatchingResult(
        requestId: requestId,
        candidates: topCandidates,
        usedCompatibleMatch: usedCompatible,
        originalBloodGroup: bloodGroup,
        matchedBloodGroup: topCandidates.isNotEmpty
            ? topCandidates.first.bloodGroup
            : null,
      ));
    } catch (e) {
      return left(MatchingFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> acceptRequest({
    required String requestId,
    required String donorId,
  }) async {
    try {
      final result = await _firestore.runTransaction((transaction) async {
        final requestRef = _firestore.collection('requests').doc(requestId);
        final requestDoc = await transaction.get(requestRef);

        if (!requestDoc.exists) return false;
        final data = requestDoc.data()!;
        if (data['status'] != 'pending') return false;

        transaction.update(requestRef, {
          'status': 'matched',
          'matchedDonorId': donorId,
          'matchedAt': FieldValue.serverTimestamp(),
        });

        return true;
      });

      return right(result);
    } catch (e) {
      return left(MatchingFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> rejectRequest({
    required String requestId,
    required String donorId,
    String? reason,
  }) async {
    try {
      await _firestore.collection('requests').doc(requestId).update({
        'rejectionReasons': FieldValue.arrayUnion([
          {
            'donorId': donorId,
            'reason': reason ?? 'Declined',
            'timestamp': FieldValue.serverTimestamp(),
          }
        ]),
      });
      return right(null);
    } catch (e) {
      return left(MatchingFailure(message: e.toString()));
    }
  }

  @override
  Stream<MatchingCandidate> getDonorLocationStream({required String donorId}) {
    return _firestore
        .collection('users')
        .doc(donorId)
        .snapshots()
        .map((doc) {
      final data = doc.data();
      if (data == null) throw Exception('Donor not found');
      final profile = data['profile'] as Map<String, dynamic>? ?? {};
      return MatchingCandidate(
        donorId: donorId,
        bloodGroup: BloodGroup.values.firstWhere(
          (g) => g.name == profile['bloodGroup'],
          orElse: () => BloodGroup.abPositive,
        ),
        distanceKm: 0,
        score: 0,
      );
    });
  }

  double _calculateAcceptanceRate(String donorId) {
    // Bayesian smoothed acceptance rate
    // Prior: 0.5 (50% default), smoothed with actual data
    const prior = 0.5;
    const priorWeight = 10;
    // In production, fetch from donor stats
    return prior;
  }
}
