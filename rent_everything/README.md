# Rent Everything

A cross-platform rental marketplace built with Flutter. Users can list items for rent, browse available products, manage bookings, and receive push notifications. The app supports Android, iOS, Web, and Windows with a fully responsive UI.

---

## Table of Contents

- [Project Setup](#project-setup)
- [Flutter & Dart Versions](#flutter--dart-versions)
- [Firebase Configuration](#firebase-configuration)
- [Platform Setup](#platform-setup)
  - [Android](#android)
  - [iOS](#ios)
  - [Web](#web)
  - [Windows](#windows)
- [Architecture](#architecture)
- [State Management](#state-management)
- [Packages & Purpose](#packages--purpose)
- [Project Structure](#project-structure)
- [Screens & Routes](#screens--routes)
- [Services](#services)
- [Firebase Cloud Functions](#firebase-cloud-functions)
- [Run & Build](#run--build)

---

## Project Setup

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (>= 3.11.5)
- [Dart SDK](https://dart.dev/get-dart) (>= 3.11.5, bundled with Flutter)
- [Firebase CLI](https://firebase.google.com/docs/cli) (`npm install -g firebase-tools`)
- [FlutterFire CLI](https://firebase.flutter.dev/docs/cli) (`dart pub global activate flutterfire_cli`)
- Android Studio / VS Code with Flutter & Dart plugins
- Xcode (for iOS builds, macOS only)
- Visual Studio 2022 with C++ Desktop Development workload (for Windows builds)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-org>/rent-everything.git
   cd rent-everything
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Configure Firebase (if starting from scratch or switching Firebase projects):
   ```bash
   flutterfire configure
   ```
   This regenerates `lib/firebase_options.dart` with your project's Firebase configuration.

4. Deploy Firebase Cloud Functions (for push notifications):
   ```bash
   cd functions
   npm install
   cd ..
   firebase deploy --only functions
   ```

5. Deploy Firestore rules:
   ```bash
   firebase deploy --only firestore:rules
   ```

---

## Flutter & Dart Versions

| Tool  | Version |
| ----- | ------- |
| Dart  | ^3.11.5 |
| Flutter | Latest stable (3.x) |

> **Note:** For Windows desktop builds, Visual Studio 2022 **17.8+** is required due to Firebase native library dependencies.

---

## Firebase Configuration

This project uses **Firebase** for backend services. The Firebase project is configured via the FlutterFire CLI.

### Firebase Services Used

| Service              | Package                  | Purpose                                    |
| -------------------- | ------------------------ | ------------------------------------------ |
| Firebase Core        | `firebase_core`          | SDK initialization                         |
| Cloud Firestore      | `cloud_firestore`        | Database (products, bookings, users, notifications) |
| Firebase Auth        | `firebase_auth`          | Authentication support                     |
| Firebase Storage     | `firebase_storage`       | File storage                               |
| Firebase Messaging   | `firebase_messaging`     | Push notifications (FCM)                   |

### Firestore Collections

| Collection       | Description                                                            |
| ---------------- | ---------------------------------------------------------------------- |
| `products`       | Product listings with name, category, price, images (base64), dates, and owner info |
| `bookings`       | Rental bookings with product details, date range, pricing, and status  |
| `users`          | User records with FCM tokens for push notifications                    |
| `notifications`  | In-app notification records with title, body, type, and read status    |

### Firebase Config Files

| File                                    | Platform | Description                        |
| --------------------------------------- | -------- | ---------------------------------- |
| `lib/firebase_options.dart`             | All      | FlutterFire-generated config       |
| `android/app/google-services.json`      | Android  | Google Services config             |
| `ios/Runner/GoogleService-Info.plist`   | iOS      | Google Services config             |
| `firebase.json`                         | All      | Firebase CLI project config        |
| `firestore.rules`                       | All      | Firestore security rules           |
| `storage.rules`                         | All      | Firebase Storage security rules    |

### Firestore Rules

> **Warning:** The current rules allow unrestricted read/write access. Tighten these before production deployment.

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /products/{document=**}  { allow read, write: if true; }
    match /bookings/{document=**}  { allow read, write: if true; }
    match /users/{document=**}     { allow read, write: if true; }
    match /notifications/{document=**} { allow read, write: if true; }
  }
}
```

---

## Platform Setup

### Android

- **Min SDK:** Flutter default
- **Target SDK:** Flutter default
- **Compile SDK:** Flutter default
- **Kotlin compatibility:** 17
- **Package name:** `com.example.rent_everything`
- **Google Services plugin:** Applied via `com.google.gms.google-services`

Ensure `android/app/google-services.json` is present (already included).

### iOS

- **Minimum iOS version:** 15.0
- **Bundle ID:** `com.example.rentEverything`
- **Podfile** uses frameworks and modular headers

Ensure `ios/Runner/GoogleService-Info.plist` is present (already included).

After cloning, run:
```bash
cd ios && pod install && cd ..
```

### Web

- Configured in `web/index.html` with custom splash screen (light/dark mode aware)
- Firebase Web config is included in `firebase_options.dart`

### Windows

- **Binary name:** `rent_everything`
- **C++ standard:** C++17
- **Visual Studio requirement:** 2022 **17.8+** (for Firebase C++ SDK compatibility)

---

## Architecture

The project follows a **Feature-First** architecture with a **Responsive Layout** pattern.

### Key Principles

1. **Feature-Based Organization** -- Each screen/feature is a self-contained folder under `lib/` with its own UI files and controller.
2. **Responsive Delegation** -- Every feature has a `*_responsive.dart` widget that delegates to `*_mobile.dart`, `*_tablet.dart`, or `*_desktop.dart` based on screen width.
3. **Centralized Routing** -- All routes are defined in `lib/my_routes.dart` using GetX `GetPage` definitions.
4. **Service Layer** -- Cross-cutting concerns (auth, FCM, notifications) live in `lib/services/`.

### Responsive Breakpoints

Defined in `MyResponsive` (`lib/my_responsive.dart`):

| Layout  | Width            |
| ------- | ---------------- |
| Mobile  | < 500px          |
| Tablet  | 500px - 1099px   |
| Desktop | >= 1100px        |

### Architecture Diagram

```
lib/
├── main.dart                  # Entry point, Firebase init, service registration
├── firebase_options.dart      # FlutterFire CLI generated config
├── my_routes.dart             # Centralized GetX route definitions
├── my_responsive.dart         # Responsive breakpoint widget
│
├── services/                  # Cross-cutting services (GetxController-based)
│   ├── auth_service.dart
│   ├── fcm_service.dart
│   └── notification_service.dart
│
├── common_widgets/            # Shared reusable UI components
│   ├── desktop_drawer.dart
│   ├── product_details.dart
│   └── rental_cards.dart
│
├── <feature>/                 # Feature folders (one per screen)
│   ├── <feature>_controller.dart   # GetxController (business logic)
│   ├── <feature>_responsive.dart   # Responsive layout delegate
│   ├── <feature>_mobile.dart       # Mobile UI
│   ├── <feature>_tablet.dart       # Tablet UI
│   └── <feature>_desktop.dart      # Desktop UI
│
└── home_page/                 # Home with bottom navigation
    └── screens/               # Sub-screens (Home, Dashboard, Add, Booking, Products)
        ├── home/
        ├── dashboard/
        ├── add/
        ├── booking/
        └── product/
```

---

## State Management

**GetX** (`get: ^4.7.3`)

| Pattern                | Usage                                                  |
| ---------------------- | ------------------------------------------------------ |
| `GetMaterialApp`       | App root with built-in navigation and DI               |
| `GetxController`       | Business logic controllers for each feature            |
| `.obs` (Reactive)      | `RxBool`, `RxList`, `Rxn`, `RxInt`, `RxString` observables |
| `Obx(() => ...)`       | Reactive UI rebuilds                                   |
| `Get.put()` / `Get.put(..., permanent: true)` | Dependency injection / service registration |
| `Get.toNamed()`        | Named navigation                                       |
| `Get.offAllNamed()`    | Stack replacement navigation                           |
| `Get.snackbar()`       | In-app notifications                                  |

### Controllers

| Controller                | Feature           |
| ------------------------- | ----------------- |
| `AuthService`             | User identity     |
| `FcmService`              | Push notifications|
| `HomeController`          | Home feed         |
| `ProductsController`      | Product list      |
| `BookingController`       | Bookings          |
| `AddController`           | Add product       |
| `CarDetailsController`    | Product details   |
| `WishlistController`      | Wishlist          |
| `BookingSummaryController`| Booking summary   |
| `CheckoutController`      | Checkout/payment  |
| `NotificationController`  | Notifications     |
| `SettingsController`      | App settings      |

---

## Packages & Purpose

### Dependencies

| Package                | Version  | Purpose                                            |
| ---------------------- | -------- | -------------------------------------------------- |
| `cloud_firestore`      | ^6.8.0   | Cloud Firestore database operations                |
| `firebase_auth`        | ^6.5.7   | Firebase Authentication                           |
| `firebase_core`        | ^4.13.0  | Firebase SDK initialization                        |
| `firebase_messaging`   | ^16.5.0  | Firebase Cloud Messaging (push notifications)      |
| `firebase_storage`     | ^13.4.6  | Firebase Cloud Storage                             |
| `get`                  | ^4.7.3   | State management, routing, and dependency injection|
| `googleapis_auth`      | ^2.3.3   | Google API OAuth2 for FCM HTTP v1 API              |
| `http`                 | ^1.2.0   | HTTP requests for notification API calls            |
| `image_picker`         | ^1.2.3   | Camera/gallery image selection for product listings |
| `intl`                 | ^0.20.3  | Date formatting and localization                    |
| `shared_preferences`   | ^2.5.0   | Local key-value storage (user ID persistence)      |

### Dev Dependencies

| Package                 | Version  | Purpose                                    |
| ----------------------- | -------- | ------------------------------------------ |
| `flutter_test`          | SDK      | Widget and unit testing                    |
| `flutter_lints`         | ^6.0.0   | Lint rules for code quality                |
| `flutter_native_splash` | ^2.4.3   | Native splash screen generation            |

---

## Project Structure

```
rent_everything/
├── android/                  # Android platform files
├── assets/
│   └── images/               # App images (logo, banners, icons)
├── build/                    # Build output
├── functions/                # Firebase Cloud Functions (Node.js)
│   ├── src/index.js          # sendBookingNotification trigger
│   ├── package.json
│   └── ...
├── ios/                      # iOS platform files
├── lib/                      # Dart source code (see Architecture section)
├── web/                      # Web platform files
├── windows/                  # Windows platform files
├── firebase.json             # Firebase CLI configuration
├── firestore.rules           # Firestore security rules
├── storage.rules             # Storage security rules
├── pubspec.yaml              # Flutter dependencies & project config
└── analysis_options.yaml     # Dart analysis options
```

---

## Screens & Routes

| Route                | Screen                    | Description                                    |
| -------------------- | ------------------------- | ---------------------------------------------- |
| `/`                  | Login                     | User login (default landing page)              |
| `/register`          | Register                  | New user registration                          |
| `/otp`               | Verify OTP                | OTP verification                               |
| `/home`              | Home Page                 | Main app with bottom navigation                |
| `/profile`           | Profile                   | User profile                                   |
| `/wishlist`          | Wishlist                  | Saved/favorited items                          |
| `/notifications`     | Notifications             | Notification history                           |
| `/earnings`          | Earnings                  | Revenue and earnings overview                  |
| `/review`            | Reviews                   | User reviews                                   |
| `/settings`          | Settings                  | App settings (dark mode, notifications)        |
| `/categories`        | Categories                | Browse products by category                    |
| `/details`           | Product Details           | Detailed product view                          |
| `/booking-summary`   | Booking Summary           | Booking summary with date picker               |
| `/checkout`          | Checkout                  | Payment method selection and checkout           |
| `/booking-conform`   | Booking Confirmation      | Post-booking confirmation                      |

### Home Page Bottom Navigation Tabs

1. **Home** -- Product feed with banner carousel, category list, and recommended rentals
2. **Dashboard** -- Active products, pending requests, earnings overview, and recent activity
3. **Add** -- Form to list a new product for rent
4. **Booking** -- My Bookings and Booking Requests tabs
5. **Products** -- Searchable product catalog

---

## Services

| Service              | Type            | Description                                                        |
| -------------------- | --------------- | ------------------------------------------------------------------ |
| `AuthService`        | `GetxController`| Generates and persists a device-level user ID via `shared_preferences` |
| `FcmService`         | `GetxController`| Manages FCM token registration, foreground/background message handling |
| `NotificationService`| Plain class     | Sends push notifications via FCM HTTP v1 API with OAuth2 tokens, saves notifications to Firestore |

---

## Firebase Cloud Functions

A single Cloud Function is deployed from the `functions/` directory:

- **`sendBookingNotification`** -- Triggered on Firestore `bookings` document creation. Looks up the product owner's FCM token from the `users` collection and sends a push notification with booking details.

### Deploy Cloud Functions

```bash
cd functions
npm install
cd ..
firebase deploy --only functions
```

---

## Run & Build

### Run in Development

```bash
# Android
flutter run -d android

# iOS (macOS only)
flutter run -d ios

# Web
flutter run -d chrome

# Windows
flutter run -d windows
```

### Build Release

```bash
# Android APK
flutter build apk

# iOS (macOS only)
flutter build ios

# Web
flutter build web

# Windows
flutter build windows
```

### Run Tests

```bash
flutter test
```

### Lint

```bash
flutter analyze
```

### Deploy Firebase Resources

```bash
# Deploy everything
firebase deploy

# Deploy specific services
firebase deploy --only firestore:rules
firebase deploy --only storage
firebase deploy --only functions
```

---

## Environment Variables & Secrets

- **Google Service Account JSON** (`assets/google-service-account.json`) -- Required by `NotificationService` for FCM HTTP v1 API access. This file should not be committed to version control.
- **`google-services.json`** (Android) and **`GoogleService-Info.plist`** (iOS) -- Platform-specific Firebase config files already included.
