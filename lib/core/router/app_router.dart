import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/authentication/presentation/screens/splash_screen.dart';
import '../../features/authentication/presentation/screens/onboarding_screen.dart';
import '../../features/authentication/presentation/screens/login_screen.dart';
import '../../features/authentication/presentation/screens/signup_screen.dart';
import '../../features/authentication/presentation/screens/otp_verification_screen.dart';
import '../../features/authentication/presentation/screens/role_selection_screen.dart';
import '../../features/authentication/presentation/screens/profile_setup_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/donor/presentation/screens/donor_dashboard_screen.dart';
import '../../features/donor/presentation/screens/donor_profile_screen.dart';
import '../../features/patient/presentation/screens/patient_dashboard_screen.dart';
import '../../features/patient/presentation/screens/create_request_screen.dart';
import '../../features/patient/presentation/screens/request_detail_screen.dart';
import '../../features/hospital/presentation/screens/hospital_dashboard_screen.dart';
import '../../features/blood_bank/presentation/screens/blood_bank_dashboard_screen.dart';
import '../../features/admin/presentation/screens/admin_dashboard_screen.dart';
import '../../features/maps/presentation/screens/maps_screen.dart';
import '../../features/notifications/presentation/screens/notifications_screen.dart';
import '../../features/chat/presentation/screens/chat_list_screen.dart';
import '../../features/chat/presentation/screens/chat_detail_screen.dart';
import '../../features/certificates/presentation/screens/certificates_screen.dart';
import '../../features/rewards/presentation/screens/rewards_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/analytics/presentation/screens/analytics_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/otp-verification',
        name: 'otpVerification',
        builder: (context, state) => const OtpVerificationScreen(),
      ),
      GoRoute(
        path: '/role-selection',
        name: 'roleSelection',
        builder: (context, state) => const RoleSelectionScreen(),
      ),
      GoRoute(
        path: '/profile-setup',
        name: 'profileSetup',
        builder: (context, state) => const ProfileSetupScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => HomeScreen(child: child),
        routes: [
          GoRoute(
            path: '/donor',
            name: 'donorDashboard',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: DonorDashboardScreen(),
            ),
          ),
          GoRoute(
            path: '/patient',
            name: 'patientDashboard',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: PatientDashboardScreen(),
            ),
          ),
          GoRoute(
            path: '/hospital',
            name: 'hospitalDashboard',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HospitalDashboardScreen(),
            ),
          ),
          GoRoute(
            path: '/blood-bank',
            name: 'bloodBankDashboard',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: BloodBankDashboardScreen(),
            ),
          ),
          GoRoute(
            path: '/admin',
            name: 'adminDashboard',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: AdminDashboardScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/maps',
        name: 'maps',
        builder: (context, state) => const MapsScreen(),
      ),
      GoRoute(
        path: '/notifications',
        name: 'notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: '/chat',
        name: 'chatList',
        builder: (context, state) => const ChatListScreen(),
      ),
      GoRoute(
        path: '/chat/:chatId',
        name: 'chatDetail',
        builder: (context, state) => ChatDetailScreen(
          chatId: state.pathParameters['chatId']!,
        ),
      ),
      GoRoute(
        path: '/certificates',
        name: 'certificates',
        builder: (context, state) => const CertificatesScreen(),
      ),
      GoRoute(
        path: '/rewards',
        name: 'rewards',
        builder: (context, state) => const RewardsScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/analytics',
        name: 'analytics',
        builder: (context, state) => const AnalyticsScreen(),
      ),
      GoRoute(
        path: '/donor-profile/:donorId',
        name: 'donorProfile',
        builder: (context, state) => DonorProfileScreen(
          donorId: state.pathParameters['donorId']!,
        ),
      ),
      GoRoute(
        path: '/create-request',
        name: 'createRequest',
        builder: (context, state) => const CreateRequestScreen(),
      ),
      GoRoute(
        path: '/request/:requestId',
        name: 'requestDetail',
        builder: (context, state) => RequestDetailScreen(
          requestId: state.pathParameters['requestId']!,
        ),
      ),
    ],
  );
});
