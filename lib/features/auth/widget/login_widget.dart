import 'package:flutter/material.dart';
import 'package:limix_test/features/auth/widget/custom_text_field.dart';
import 'package:limix_test/features/navigation/view/main_nav_screen.dart';
import 'package:limix_test/features/auth/view/forget_screen.dart';
import 'package:limix_test/features/auth/view/signup_view.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _animate = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedSlide(
        offset: _animate ? Offset.zero : const Offset(0, 0.25),
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOut,
        child: AnimatedOpacity(
          opacity: _animate ? 1 : 0,
          duration: const Duration(milliseconds: 700),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 80),

                /// LOGO (Hero)
                const Hero(
                  tag: 'logo',
                  child: Text(
                    'Limix',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0891B2),
                    ),
                  ),
                ),

                const SizedBox(height: 8),
                const Text(
                  'Manage your aquaculture farm',
                  style: TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 40),

                /// EMAIL
                CustomTextField(
                  controller: emailController,
                  label: "Email",
                  prefixIcon: Icons.email_outlined,
                  hint: 'Enter your email',
                ),

                const SizedBox(height: 20),

                /// PASSWORD
                CustomTextField(
                  controller: passwordController,
                  label: "Password",
                  prefixIcon: Icons.lock_outline,
                  hint: 'Enter your password',
                  isPassword: true,
                ),

                /// FORGOT PASSWORD
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>  ForgetScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Color(0xff06B6D4),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// LOGIN BUTTON
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MainNavScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 375,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                        colors: [Color(0xff0E7490), Color(0xff0891B2)],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
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
                            child:
                            Image.network(
                                'http://pngimg.com/uploads/google/google_PNG19635.png',
                                fit:BoxFit.cover
                            )
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
                          MaterialPageRoute(
                            builder: (_) => SignupView(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0891B2),
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
    );
  }
}
