# LifeLink

LifeLink is a Flutter-based smart blood donation platform built to connect donors, patients, hospitals, blood banks, and NGOs in one real-time ecosystem.

## Overview

This app helps users:

- register as donors or patients
- track blood donation eligibility and requests
- manage hospital and blood bank workflows
- find nearby donors and blood availability
- communicate through in-app chat and notifications
- receive matching recommendations and certificate workflows

## Tech Stack

- Flutter
- Dart
- Firebase Authentication
- Cloud Firestore
- Firebase Storage
- Firebase Messaging
- Firebase Remote Config
- Firebase Analytics and Crashlytics
- Riverpod for state management
- GoRouter for navigation
- Google Maps and Geolocation support

## Project Structure

Key areas in the codebase include:

- `lib/features/authentication/` — sign-up, login, OTP, and profile setup
- `lib/features/donor/` — donor dashboard, eligibility, and profile logic
- `lib/features/patient/` — patient request and support workflows
- `lib/features/blood_bank/` — inventory and blood availability management
- `lib/features/chat/` — communications between users
- `lib/features/maps/` — location-based donor and hospital discovery
- `lib/features/matching/` — intelligent donor-to-patient matching support
- `functions/` — Firebase Cloud Functions backend logic

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Firebase project access
- Android/iOS emulator or physical device

### Install dependencies

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

### Firebase setup

This repository uses Firebase services. Add your own Firebase configuration files locally for Android and iOS, such as:

- `android/app/google-services.json`
- `ios/Runner/GoogleService-Info.plist`

These credential files are already excluded from version control using the repository ignore rules, so they will not be uploaded to GitHub.

## Development Notes

- Use `flutter pub run build_runner build` when regenerating generated files.
- The app is organized around feature-first folders under `lib/features`.
- Firebase functions live under `functions/src`.

## License

This project is intended for educational and internal app-development use unless a separate license is supplied by the repository owner.
