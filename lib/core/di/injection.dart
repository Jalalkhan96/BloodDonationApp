import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../features/authentication/data/repositories/auth_repository_impl.dart';
import '../../features/authentication/domain/repositories/auth_repository.dart';
import '../../features/authentication/domain/usecases/sign_in_with_email.dart';
import '../../features/authentication/domain/usecases/sign_in_with_phone.dart';
import '../../features/authentication/domain/usecases/sign_in_with_google.dart';
import '../../features/authentication/domain/usecases/sign_up_with_email.dart';
import '../../features/authentication/domain/usecases/sign_out.dart';
import '../../features/authentication/domain/usecases/get_current_user.dart';
import '../../features/authentication/domain/usecases/update_user_profile.dart';
import '../../features/authentication/domain/usecases/verify_otp.dart';
import '../../features/authentication/domain/usecases/send_otp.dart';
import '../../features/donor/data/repositories/donor_repository_impl.dart';
import '../../features/donor/domain/repositories/donor_repository.dart';
import '../../features/donor/domain/usecases/get_nearby_donors.dart';
import '../../features/donor/domain/usecases/update_donor_availability.dart';
import '../../features/donor/domain/usecases/get_donor_profile.dart';
import '../../features/donor/domain/usecases/check_eligibility.dart';
import '../../features/patient/data/repositories/patient_repository_impl.dart';
import '../../features/patient/domain/repositories/patient_repository.dart';
import '../../features/patient/domain/usecases/create_emergency_request.dart';
import '../../features/patient/domain/usecases/get_my_requests.dart';
import '../../features/patient/domain/usecases/cancel_request.dart';
import '../../features/hospital/data/repositories/hospital_repository_impl.dart';
import '../../features/hospital/domain/repositories/hospital_repository.dart';
import '../../features/blood_bank/data/repositories/blood_bank_repository_impl.dart';
import '../../features/blood_bank/domain/repositories/blood_bank_repository.dart';
import '../../features/matching/data/repositories/matching_repository_impl.dart';
import '../../features/matching/domain/repositories/matching_repository.dart';
import '../../features/matching/domain/usecases/find_nearby_donors_usecase.dart';
import '../../features/notifications/data/repositories/notification_repository_impl.dart';
import '../../features/notifications/domain/repositories/notification_repository.dart';
import '../../features/chat/data/repositories/chat_repository_impl.dart';
import '../../features/chat/domain/repositories/chat_repository.dart';
import '../../shared/services/location_service.dart';
import '../../shared/services/fcm_service.dart';
import '../../shared/services/qr_service.dart';

final getIt = GetIt.instance;

/// Initialize all dependencies. Must be called before app starts.
Future<void> configureDependencies() async {
  // Firebase singletons
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  final firestore = FirebaseFirestore.instance;
  firestore.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );
  getIt.registerLazySingleton<FirebaseFirestore>(() => firestore);
  getIt.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);
  getIt.registerLazySingleton<FirebaseMessaging>(() => FirebaseMessaging.instance);
  getIt.registerLazySingleton<FirebaseRemoteConfig>(() => FirebaseRemoteConfig.instance);
  getIt.registerLazySingleton<FirebaseAnalytics>(() => FirebaseAnalytics.instance);
  getIt.registerLazySingleton<FirebaseCrashlytics>(() => FirebaseCrashlytics.instance);

  // Hive
  await Hive.initFlutter();
  final authBox = await Hive.openBox<String>('auth_cache');
  final settingsBox = await Hive.openBox<String>('settings_cache');
  getIt.registerLazySingleton<Box<String>>(() => authBox, instanceName: 'auth');
  getIt.registerLazySingleton<Box<String>>(() => settingsBox, instanceName: 'settings');

  // Services
  getIt.registerLazySingleton<LocationService>(() => LocationService());
  getIt.registerLazySingleton<FcmService>(() => FcmService());
  getIt.registerLazySingleton<QrService>(() => QrService());

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      firebaseAuth: getIt(),
      firestore: getIt(),
      storage: getIt(),
      authBox: getIt(instanceName: 'auth'),
    ),
  );
  getIt.registerLazySingleton<DonorRepository>(
    () => DonorRepositoryImpl(firestore: getIt(), locationService: getIt()),
  );
  getIt.registerLazySingleton<PatientRepository>(
    () => PatientRepositoryImpl(firestore: getIt()),
  );
  getIt.registerLazySingleton<HospitalRepository>(
    () => HospitalRepositoryImpl(firestore: getIt()),
  );
  getIt.registerLazySingleton<BloodBankRepository>(
    () => BloodBankRepositoryImpl(firestore: getIt()),
  );
  getIt.registerLazySingleton<MatchingRepository>(
    () => MatchingRepositoryImpl(firestore: getIt(), locationService: getIt()),
  );
  getIt.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(firestore: getIt(), messaging: getIt()),
  );
  getIt.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(firestore: getIt()),
  );

  // UseCases
  getIt.registerFactory(() => SignInWithEmailUseCase(getIt()));
  getIt.registerFactory(() => SignInWithPhoneUseCase(getIt()));
  getIt.registerFactory(() => SignInWithGoogleUseCase(getIt()));
  getIt.registerFactory(() => SignUpWithEmailUseCase(getIt()));
  getIt.registerFactory(() => SignOutUseCase(getIt()));
  getIt.registerFactory(() => GetCurrentUserUseCase(getIt()));
  getIt.registerFactory(() => UpdateUserProfileUseCase(getIt()));
  getIt.registerFactory(() => VerifyOtpUseCase(getIt()));
  getIt.registerFactory(() => SendOtpUseCase(getIt()));
  getIt.registerFactory(() => GetNearbyDonorsUseCase(getIt()));
  getIt.registerFactory(() => UpdateDonorAvailabilityUseCase(getIt()));
  getIt.registerFactory(() => GetDonorProfileUseCase(getIt()));
  getIt.registerFactory(() => CheckEligibilityUseCase());
  getIt.registerFactory(() => CreateEmergencyRequestUseCase(getIt()));
  getIt.registerFactory(() => GetMyRequestsUseCase(getIt()));
  getIt.registerFactory(() => CancelRequestUseCase(getIt()));
  getIt.registerFactory(() => FindNearbyDonorsUseCase(getIt()));
}
