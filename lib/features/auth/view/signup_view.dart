import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';
import 'package:limix_test/features/auth/view/login_view.dart';
import 'package:limix_test/features/auth/widget/custom_text_field.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios_new,
        //     color: Color(0xff0891B2),
        //     size: 23.radius,
        //   ),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 24.font,
            color: Color(0xff01378E),
            fontWeight: FontWeight.w500,
          ),
        ),
        // centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 12.width),
            child: Column(
              children: [
                SizedBox(height: 24.height),
                Text(
                  'Limix',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 33.font,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff01378E),
                  ),
                ),
                SizedBox(height: 10.height),
                Text(
                  'Manage your aquaculture farm',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.font),
                ),

                SizedBox(height: 20.height),

                CustomTextField(
                  controller: fullNameController,
                  label: "Full Name",
                  prefixIcon: Icons.person_outline,
                  hint: 'Enter your full name',
                ),

                SizedBox(height: 10.height),

                CustomTextField(
                  controller: emailController,
                  label: "Email",
                  prefixIcon: Icons.email_outlined,
                  hint: 'Enter your email',
                ),
                SizedBox(height: 10.height),
                CustomTextField(
                  controller: phoneController,
                  label: "Phone Number",
                  prefixIcon: Icons.phone_outlined,
                  hint: 'Enter your phone number',
                ),
                SizedBox(height: 10.height),
                CustomTextField(
                  controller: locationController,
                  label: "Location",
                  prefixIcon: Icons.location_on_outlined,
                  hint: 'Enter your location',
                ),
                SizedBox(height: 10.height),
                CustomTextField(
                  controller: passwordController,
                  label: "Password",
                  prefixIcon: Icons.lock_outline,
                  hint: 'Enter your password',
                  isPassword: true,
                ),
                SizedBox(height: 10.height),
                CustomTextField(
                  controller: confirmPasswordController,
                  label: "Confirm Password",
                  prefixIcon: Icons.lock_outline,
                  hint: 'Re-enter your password',
                  isPassword: true,
                ),
                SizedBox(height: 25.height),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 40.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                        colors: [Color(0xff01378E), Color(0xff2563EB)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
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
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 18.font,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.height),

                // Row(
                //   children: [
                //     Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                //     Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 8.width),
                //       child: Text(
                //         "Or continue with",
                //         style: TextStyle(
                //           color: Color(0xff6A7282),
                //           fontSize: 16.font,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Divider(thickness: 1, color: Color(0xff6A7282)),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 25.height),

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
                // SizedBox(height: 25.height),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff01378E),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.height),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
