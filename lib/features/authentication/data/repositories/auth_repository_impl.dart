import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final fb.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;
  final Box<String> _authBox;

  final _authStateController = StreamController<Option<AuthUser>>.broadcast();
  fb.User? _currentFirebaseUser;

  AuthRepositoryImpl({
    required fb.FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore,
    required FirebaseStorage storage,
    required Box<String> authBox,
  })  : _firebaseAuth = firebaseAuth,
        _firestore = firestore,
        _storage = storage,
        _authBox = authBox {
    _firebaseAuth.authStateChanges().listen(_onAuthStateChanged);
  }

  void _onAuthStateChanged(fb.User? user) {
    _currentFirebaseUser = user;
    if (user == null) {
      _authStateController.add(const None());
    } else {
      _authStateController.add(Some(AuthUser(
        uid: user.uid,
        email: user.email ?? '',
        displayName: user.displayName,
        photoUrl: user.photoURL,
        phone: user.phoneNumber,
      )));
    }
  }

  @override
  Stream<Option<AuthUser>> get authStateChanges => _authStateController.stream;

  @override
  Option<AuthUser> get currentUser {
    final user = _firebaseAuth.currentUser;
    if (user == null) return const None();
    return Some(AuthUser(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
      photoUrl: user.photoURL,
      phone: user.phoneNumber,
    ));
  }

  @override
  Future<Either<Failure, AuthUser>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      if (user == null) {
        return left(const AuthFailure(message: 'Sign in failed'));
      }
      final userData = await _getUserData(user.uid);
      return right(AuthUser(
        uid: user.uid,
        email: user.email ?? email,
        displayName: user.displayName ?? userData?['name'],
        photoUrl: user.photoURL,
        phone: user.phoneNumber ?? userData?['phone'],
        role: _parseRole(userData?['role']),
        onboardingStep: userData?['onboardingStep'],
      ));
    } on fb.FirebaseAuthException catch (e) {
      return left(AuthFailure(message: _mapAuthError(e.code)));
    }
  }

  @override
  Future<Either<Failure, AuthUser>> signUpWithEmail({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      if (user == null) {
        return left(const AuthFailure(message: 'Sign up failed'));
      }
      await user.updateDisplayName(name);
      await _firestore.collection('users').doc(user.uid).set({
        'email': email,
        'name': name,
        'phone': phone,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
        'onboardingStep': 0,
        'verificationStatus': 'pending',
      });
      return right(AuthUser(
        uid: user.uid,
        email: email,
        displayName: name,
        phone: phone,
        onboardingStep: 0,
      ));
    } on fb.FirebaseAuthException catch (e) {
      return left(AuthFailure(message: _mapAuthError(e.code)));
    }
  }

  @override
  Future<Either<Failure, AuthUser>> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return left(const AuthFailure(message: 'Google sign in cancelled'));
      }
      final googleAuth = await googleUser.authentication;
      final credential = fb.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await _firebaseAuth.signInWithCredential(credential);
      final user = userCredential.user;
      if (user == null) {
        return left(const AuthFailure(message: 'Google sign in failed'));
      }
      final doc = _firestore.collection('users').doc(user.uid);
      final snapshot = await doc.get();
      if (!snapshot.exists) {
        await doc.set({
          'email': user.email,
          'name': user.displayName,
          'photoUrl': user.photoURL,
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
          'onboardingStep': 0,
          'verificationStatus': 'pending',
        });
      }
      final userData = await _getUserData(user.uid);
      return right(AuthUser(
        uid: user.uid,
        email: user.email ?? '',
        displayName: user.displayName,
        photoUrl: user.photoURL,
        role: _parseRole(userData?['role']),
        onboardingStep: userData?['onboardingStep'],
      ));
    } catch (e) {
      return left(AuthFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthUser>> signInWithPhone({
    required String phoneNumber,
  }) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credential) async {
          await _firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (e) {},
        codeSent: (verificationId, resendToken) {
          _authBox.put('verificationId', verificationId);
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
      return right(AuthUser(
        uid: '',
        email: '',
        phone: phoneNumber,
      ));
    } catch (e) {
      return left(AuthFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      final credential = fb.PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      final result = await _firebaseAuth.signInWithCredential(credential);
      return right(result.user != null);
    } catch (e) {
      return left(const AuthFailure(message: 'Invalid OTP'));
    }
  }

  @override
  Future<Either<Failure, void>> sendOtp({
    required String phoneNumber,
  }) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (_) {},
        verificationFailed: (e) {},
        codeSent: (verificationId, _) {
          _authBox.put('verificationId', verificationId);
        },
        codeAutoRetrievalTimeout: (_) {},
      );
      return right(null);
    } catch (e) {
      return left(AuthFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await GoogleSignIn().signOut();
      await _authBox.clear();
      return right(null);
    } catch (e) {
      return left(AuthFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return left(const AuthFailure(message: 'No user signed in'));
      }
      await _firestore.collection('users').doc(user.uid).delete();
      await user.delete();
      return right(null);
    } catch (e) {
      return left(AuthFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return right(null);
    } catch (e) {
      return left(AuthFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile({
    String? name,
    String? photoUrl,
    Map<String, dynamic>? profileData,
  }) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return left(const AuthFailure(message: 'No user signed in'));
      }
      if (name != null) await user.updateDisplayName(name);
      if (photoUrl != null) await user.updatePhotoURL(photoUrl);
      final updateData = <String, dynamic>{
        'updatedAt': FieldValue.serverTimestamp(),
      };
      if (name != null) updateData['name'] = name;
      if (photoUrl != null) updateData['photoUrl'] = photoUrl;
      if (profileData != null) updateData.addAll(profileData);
      await _firestore.collection('users').doc(user.uid).update(updateData);
      return right(null);
    } catch (e) {
      return left(AuthFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveFcmToken({required String token}) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) return left(const AuthFailure(message: 'No user'));
      await _firestore.collection('users').doc(user.uid).update({
        'fcmTokens': FieldValue.arrayUnion([token]),
      });
      return right(null);
    } catch (e) {
      return left(AuthFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateOnboardingStep({required int step}) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) return left(const AuthFailure(message: 'No user'));
      await _firestore.collection('users').doc(user.uid).update({
        'onboardingStep': step,
        'updatedAt': FieldValue.serverTimestamp(),
      });
      return right(null);
    } catch (e) {
      return left(AuthFailure(message: e.toString()));
    }
  }

  Future<Map<String, dynamic>?> _getUserData(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    return doc.data();
  }

  UserRole? _parseRole(String? role) {
    if (role == null) return null;
    return UserRole.values.firstWhere(
      (e) => e.name == role,
      orElse: () => UserRole.patient,
    );
  }

  String _mapAuthError(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No account found with this email';
      case 'wrong-password':
        return 'Incorrect password';
      case 'email-already-in-use':
        return 'An account already exists with this email';
      case 'invalid-email':
        return 'Invalid email address';
      case 'weak-password':
        return 'Password is too weak';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later';
      default:
        return 'Authentication failed: $code';
    }
  }
}
