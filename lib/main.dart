import 'dart:async';

import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:limix_test/features/home/view/home_view.dart';
=======
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limix_test/features/analytics/farm_overview/view/analytics_screen.dart';
import 'package:limix_test/features/auth/cubit/cubit/login_cubit.dart';
import 'package:limix_test/features/auth/view/login_view.dart';
import 'package:limix_test/features/navigation/view/main_nav_screen.dart';

>>>>>>> develop

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();

      // Catch framework errors and print them to the browser console
      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.dumpErrorToConsole(details);
      };

<<<<<<< HEAD
      // Replace the default red error screen with a readable widget (helps debugging on web)
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

      runApp(const LimixApp());
    },
    (error, stack) {
      // Will appear in browser console for Flutter web / device logs
      print('Uncaught zone error: $error');
      print(stack);
    },
  );
}

class LimixApp extends StatelessWidget {
  const LimixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
=======
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginScreen() ,
>>>>>>> develop
    );
  }
}
