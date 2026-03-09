Kigali City Services

A cross-platform Flutter application for managing and browsing city listings, with real-time Firebase backend integration.

Table of Contents

Features

Screenshots / Demo

Getting Started

Firebase Setup

Firestore Database Structure

State Management

Dependencies

Author

Features

Anonymous user authentication using Firebase

Create, edit, and delete listings

Search and filter listings in real-time

Listing details page

Embedded map view with location display

Cross-platform support: Android, Windows, macOS

Screenshots / Demo

Replace these placeholders with actual images or GIFs from your demo video.

Home screen with listings

Creating a new listing

Editing and deleting a listing

Listing detail page

Embedded map view

Getting Started

Clone the repository:

git clone https://github.com/Hakim-morsal2244/kigali_city_services.git
cd kigali_city_services

Install dependencies:

flutter pub get

Run the app on your platform:

flutter run -d chrome   # For web
flutter run -d windows  # For Windows
flutter run -d macos    # For macOS
Firebase Setup

Create a Firebase project and register your app for Android, Windows, and macOS.

Download google-services.json (Android) and ensure firebase_options.dart is generated via FlutterFire CLI.

Place firebase_options.dart in the lib/ folder.

Initialize Firebase in main.dart:

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
Firestore Database Structure
listings (collection)
  -> documentId
      - title: String
      - description: String
      - createdBy: String (User UID)
      - createdAt: Timestamp

Real-time updates via StreamBuilder

Each document represents a listing

State Management

Used setState for simple UI updates

StreamBuilder listens to Firestore collection changes for real-time UI updates

Lightweight and straightforward for this small-scale project

Dependencies

firebase_core: ^3.15.2

cloud_firestore: ^5.0.0

firebase_auth: ^6.2.0

Flutter SDK (>=3.0.0)

Author

Morsal Hakim

GitHub: Hakim-morsal2244
Email: m.hakim@alustudent.com
