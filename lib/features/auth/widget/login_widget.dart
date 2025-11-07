
import 'package:flutter/material.dart';
import 'package:limix_test/features/auth/view/forget_screen.dart';
import 'package:limix_test/features/auth/view/signup_view.dart';
import 'package:limix_test/features/home/view/home_screen.dart';
import 'package:limix_test/features/auth/widget/custom_text_field.dart';


class LoginWidget extends StatelessWidget {
   LoginWidget({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            //title: const Text('Login'),
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                const Text(
                  'Limix',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0891B2),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Manage your aquaculture farm',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  controller: emailController,
                  label: "Email",
                  prefixIcon: Icons.email_outlined,
                  hint: 'Enter your email',
                ),
                const SizedBox(height: 20),

                /// Password Field
                CustomTextField(
                  controller: passwordController,
                  label: "Password",
                  prefixIcon: Icons.lock_outline,
                  hint: 'Enter your password',
                  isPassword: true,
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetScreen(),));
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

                /// Login Button
                GestureDetector(
                  onTap: () {
                      Navigator.push(
                     context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
                   );       
                    },
                  child: Container(
                    width: 375,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                        colors: [Color(0xff0E7490), Color(0xff0891B2)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x1A000000),
                          offset: Offset(0, 4),
                          blurRadius: 6,
                          spreadRadius: -4,
                        ),
                        BoxShadow(
                          color: const Color(0x1A000000),
                          offset: const Offset(0, 10),
                          blurRadius: 15,
                          spreadRadius: -3,
                        ),
                      ],
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
                Row(
                  children: const [
                    Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Or continue with",
                        style: TextStyle(
                          color: Color(0xff6A7282),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(thickness: 1, color: Color(0xff6A7282)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // هنا بعدين هتحطي تسجيل الدخول بجوجل
                  },
                  child: Container(
                    width: 375,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera, color: Colors.black),
                        const SizedBox(width: 10),
                        const Text(
                          'Continue with Google',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account? "),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder:(context) => SignupView(),)
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
        );
  }
}