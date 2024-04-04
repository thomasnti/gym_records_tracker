import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakelock/wakelock.dart';

import 'common/presentation/theme/app_theme.dart';
import 'dependency_injection/dependency_injection.dart';
import 'features/main_page/presentation/cubit/main_page_cubit.dart';
import 'features/main_page/presentation/pages/main_page.dart';
import 'features/workout/presentation/bloc/workout/workout_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kDebugMode) {
    await Wakelock.enable();
  }

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Synchronous errors
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.log('Higgs-Boson detected! Bailing out');
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.log('Higgs-Boson detected! Bailing out');
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  configureDependencies();
  runApp(const GymRecords());
}

class GymRecords extends StatelessWidget {
  const GymRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainPageCubit>(
          create: (context) => MainPageCubit(),
        ),
        BlocProvider<WorkoutBloc>(
          create: (context) => getIt<WorkoutBloc>(),
        ),
      ],
      child: BlocBuilder<MainPageCubit, MainPageState>(
        builder: (context, state) {
          final themeMode = state.themeMode == ThemeMode.light ? lightTheme : darkTheme;

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeMode,
            home: const MainPage(),
          );
        },
      ),
    );
  }
}
