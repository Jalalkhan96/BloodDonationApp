import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../entities/auth_entity.dart';

abstract class AuthRepository {
  Stream<Option<AuthUser>> get authStateChanges;
  Option<AuthUser> get currentUser;

  Future<Either<Failure, AuthUser>> signInWithEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthUser>> signUpWithEmail({
    required String email,
    required String password,
    required String name,
    required String phone,
  });

  Future<Either<Failure, AuthUser>> signInWithGoogle();

  Future<Either<Failure, AuthUser>> signInWithPhone({
    required String phoneNumber,
  });

  Future<Either<Failure, bool>> verifyOtp({
    required String verificationId,
    required String smsCode,
  });

  Future<Either<Failure, void>> sendOtp({
    required String phoneNumber,
  });

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, void>> deleteAccount();

  Future<Either<Failure, void>> resetPassword({required String email});

  Future<Either<Failure, void>> updateProfile({
    String? name,
    String? photoUrl,
    Map<String, dynamic>? profileData,
  });

  Future<Either<Failure, void>> saveFcmToken({required String token});

  Future<Either<Failure, void>> updateOnboardingStep({required int step});
}
