import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.width),
                child: Column(
                  children: [
                    SizedBox(height: 50.height),

                    /// LOGO (Hero)
                    Hero(
                      tag: 'logo',
                      child: Text(
                        'Limix',
                        style: TextStyle(
                          fontSize: 33.font,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff01378E),
                        ),
                      ),
                    ),

                    SizedBox(height: 10.height),
                    Text(
                      'Manage your aquaculture farm',
                      style: TextStyle(
                        fontSize: 18.font,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 40.height),

                    /// EMAIL
                    CustomTextField(
                      controller: emailController,
                      label: "Email",
                      prefixIcon: Icons.email_outlined,
                      hint: 'Enter your email',
                    ),

                    SizedBox(height: 20.height),

                    /// PASSWORD
                    CustomTextField(
                      controller: passwordController,
                      label: "Password",
                      prefixIcon: Icons.lock_outline,
                      hint: 'Enter your password',
                      isPassword: true,
                    ),

                    SizedBox(height: 10.height),

                    /// FORGOT PASSWORD
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
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

                    SizedBox(height: 20.height),

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
                        width: double.infinity,
                        height: 40.height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.radius),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x1A000000),
                              offset: Offset(0, 4),
                              blurRadius: 6,
                              spreadRadius: -4,
                            ),
                            BoxShadow(
                              color: Color(0x1A000000),
                              offset: Offset(0, 10),
                              blurRadius: 15,
                              spreadRadius: -3,
                            ),
                          ],
                          gradient: const LinearGradient(
                            colors: [Color(0xff01378E), Color(0xff2563EB)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18.font,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30.height),

                    /// DIVIDER
                    // Row(
                    //   children: const [
                    //     Expanded(child: Divider()),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(horizontal: 8.0),
                    //       child: Text("Or continue with"),
                    //     ),
                    //     Expanded(child: Divider()),
                    //   ],
                    // ),

                    // SizedBox(height: 30.height),

                    // /// GOOGLE BUTTON
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: Container(
                    //     width: double.infinity,
                    //     height: 40.height,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(30),
                    //       border: Border.all(color: Colors.grey.shade300),
                    //     ),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Image.network(
                    //           'http://pngimg.com/uploads/google/google_PNG19635.png',
                    //           fit: BoxFit.cover,
                    //         ),
                    //         SizedBox(width: 10.width),
                    //         Text(
                    //           'Continue with Google',
                    //           style: TextStyle(
                    //             fontSize: 18.font,
                    //             fontWeight: FontWeight.w500,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 30.height),

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
    );
  }
}
