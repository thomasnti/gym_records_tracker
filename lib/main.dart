import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'common/bottom_tab_bar.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Synchronous errors
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.log("Higgs-Boson detected! Bailing out");
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.log("Higgs-Boson detected! Bailing out");
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const GymRecords());
}

class GymRecords extends StatelessWidget {
  const GymRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomTabBar(),
    );
  }
}
// Test for github actions