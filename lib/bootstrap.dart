import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/di/injection.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';

export 'core/theme/app_theme.dart';
export 'core/router/app_router.dart';

Future<void> bootstrap({
  required String environment,
  required String firebaseProjectId,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // Initialize Hive for local caching
  await Hive.initFlutter();

  // Configure dependency injection
  await configureDependencies();

  // Set up error handling
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runZonedGuarded(
    () {
      // App is now started from main.dart with ProviderScope + LifeLinkApp
    },
    (error, stackTrace) {
      FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
    },
  );
}
