import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:limix_test/features/auth/core/errors/chech_erroe.dart';
import 'package:limix_test/features/auth/core/function/firebase_auth_service.dart';
import 'package:limix_test/features/auth/core/show_snack_bar.dart';
import 'package:limix_test/features/auth/widget/custom_button.dart';
import 'package:limix_test/features/auth/widget/custom_text_field.dart';
import 'package:limix_test/features/home/view/home_view.dart';
import 'package:limix_test/features/auth/view/forget_screen.dart';
import 'package:limix_test/features/auth/view/signup_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _animate = false;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        _animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFEFF6FF), Color(0xFFFFFFFF), Color(0xFFDBEAFE)],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
          child: AnimatedSlide(
            offset: _animate ? Offset.zero : const Offset(0, 0.25),
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOut,
            child: AnimatedOpacity(
              opacity: _animate ? 1 : 0,
              duration: const Duration(milliseconds: 700),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 200),

                      /// LOGO (Hero)
                      const Hero(
                        tag: 'logo',
                        child: Text(
                          'Limix',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff01378E),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),
                      const Text(
                        'Manage your aquaculture farm',
                        style: TextStyle(fontSize: 16),
                      ),

                      const SizedBox(height: 40),

                      /// Login EMAIL
                      CustomTextField(
                        controller: emailController,
                        label: "Email",
                        prefixIcon: Icons.email_outlined,
                        hint: 'Enter your email',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email cannot be empty';
                          } else if (value != emailController.text.trim()) {
                            return 'Invalid email';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      /// LOGIN PASSWORD
                      CustomTextField(
                        controller: passwordController,
                        label: "Password",
                        prefixIcon: Icons.lock_outline,
                        hint: 'Enter your password',
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password cannot be empty';
                          } else if (value != passwordController.text.trim()) {
                            return 'Wrong password';
                          }
                          return null;
                        },
                      ),

                      /// FORGOT PASSWORD
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => ForgetScreen()),
                            );
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Color(0xff01378E),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// * LOGIN BUTTON
                      CustomButton(
                        text: 'Login',
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() => isLoading = true);

                            try {
                              await loginUser(
                                emailController,
                                passwordController,
                              );

                              showSnackBar(
                                context,
                                'Welcome sweetheart',
                                isError: false,
                              );

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeView(),
                                ),
                              );
                            } on FirebaseAuthException catch (e) {
                              final message = checkErrorForLogin(e);
                              showSnackBar(context, message, isError: true);
                            } catch (e) {
                              showSnackBar(
                                context,
                                'Something went wrong, please try again later 1',
                                isError: true,
                              );
                            } finally {
                              setState(() => isLoading = false);
                            }
                          }
                        },
                      ),

                      const SizedBox(height: 30),

                      /// DIVIDER
                      Row(
                        children: const [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("Or continue with"),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),

                      const SizedBox(height: 20),

                      /// GOOGLE BUTTON
                      Container(
                        width: 375,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              // decoration: BoxDecoration(color: Colors.blue),
                              child: Image.network(
                                'http://pngimg.com/uploads/google/google_PNG19635.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Continue with Google',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      /// SIGN UP
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don’t have an account? "),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => SignupView()),
                              );
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2563EB),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
