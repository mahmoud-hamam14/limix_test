import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limix_test/features/auth/cubit/cubit/login_cubit.dart';
import 'package:limix_test/features/auth/view/login_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => LoginCubit(),
        child: LoginScreen(),
      ),
    );
  }
}
