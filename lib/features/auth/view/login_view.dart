
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limix_test/features/auth/cubit/cubit/login_cubit.dart';
import 'package:limix_test/features/auth/cubit/cubit/login_state.dart';
import 'package:limix_test/features/auth/widget/login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Welcome! You are successfully logged in."),
                backgroundColor: Colors.green,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Login failed"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return LoginWidget();
        },
      ),
    );
  }
}