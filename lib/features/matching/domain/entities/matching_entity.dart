import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/enums.dart';

part 'matching_entity.freezed.dart';

@freezed
class MatchingCandidate with _$MatchingCandidate {
  const factory MatchingCandidate({
    required String donorId,
    required BloodGroup bloodGroup,
    required double distanceKm,
    required double score,
    @Default(0.0) double acceptanceRate,
    @Default(0) int donationCount,
    @Default(0.0) double rating,
    @Default(0.0) double recencyScore,
    @Default(false) bool isExactMatch,
  }) = _MatchingCandidate;
}

@freezed
class MatchingResult with _$MatchingResult {
  const factory MatchingResult({
    required String requestId,
    required List<MatchingCandidate> candidates,
    @Default(false) bool usedCompatibleMatch,
    BloodGroup? originalBloodGroup,
    BloodGroup? matchedBloodGroup,
  }) = _MatchingResult;
}

@freezed
class MatchingWeights with _$MatchingWeights {
  const factory MatchingWeights({
    @Default(0.35) double distance,
    @Default(0.20) double availability,
    @Default(0.15) double acceptanceRate,
    @Default(0.10) double donationHistory,
    @Default(0.10) double rating,
    @Default(0.10) double recency,
  }) = _MatchingWeights;
}
