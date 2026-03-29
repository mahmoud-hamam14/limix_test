import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:limix_test/features/analytics/farm_overview/view/analytics_screen.dart';
// import 'package:limix_test/features/auth/cubit/cubit/login_cubit.dart';
// import 'package:limix_test/features/auth/view/login_view.dart';
// import 'package:limix_test/features/navigation/view/main_nav_screen.dart';
// import 'package:limix_test/features/home/view/home_view.dart';
// import 'package:limix_test/features/settings/data/cubit/language_cubit/cubit/language_cubit.dart';
// import 'package:limix_test/features/settings/data/cubit/language_cubit/cubit/language_state.dart';
import 'package:limix_test/features/settings/data/cubit/profile_cubit/profile_cubit.dart';
import 'package:limix_test/splash.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();

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
      print(stack);
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
