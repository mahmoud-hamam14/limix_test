import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limix_test/features/settings/data/cubit/profile_cubit/profile_cubit.dart';
import 'package:limix_test/firebase_options.dart';
import 'package:limix_test/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Firebase initialized successfully');
  } catch (e) {
    print('Firebase initialization error: $e');
    print('Stack trace: $e');
  }

  runZonedGuarded(
    () {
      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.dumpErrorToConsole(details);
      };

      ErrorWidget.builder = (FlutterErrorDetails details) {
        return Material(
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SelectableText(
                'An error occurred:\n${details.exceptionAsString()}',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ),
        );
      };

      runApp(
        BlocProvider(create: (_) => ProfileCubit(), child: const LimixApp()),
      );
    },
    (error, stack) {
      print('Uncaught zone error: $error');
      print('Stack trace: $stack');
    },
  );
}

class LimixApp extends StatelessWidget {
  const LimixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
    // }
    // );
  }
}
