
import 'package:flutter/material.dart';
import 'package:limix_test/features/auth/view/login_view.dart';
import 'package:limix_test/features/auth/widget/custom_text_field.dart';

class SignupView extends StatelessWidget {
   SignupView({super.key});
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(

        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xff01378E)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Sign Up",
          style: TextStyle(
            color: Color(0xff01378E),
            fontWeight: FontWeight.bold,
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
    colors: [
    Color(0xFFEFF6FF),
    Color(0xFFFFFFFF),
    Color(0xFFDBEAFE),
    ],
    stops: [0.0, 0.5, 1.0],

    ),
    ),
   child:    SafeArea(
     child: SingleChildScrollView(
           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
                      color: Color(0xff01378E),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Manage your aquaculture farm',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: fullNameController,
                    label: "Full Name",
                    prefixIcon: Icons.person_outline,
                    hint: 'Enter your full name',
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: emailController,
                    label: "Email",
                    prefixIcon: Icons.email_outlined,
                    hint: 'Enter your email',
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: phoneController,
                    label: "Phone Number",
                    prefixIcon: Icons.phone_outlined,
                    hint: 'Enter your phone number',
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: locationController,
                    label: "Location",
                    prefixIcon: Icons.location_on_outlined,
                    hint: 'Enter your location',
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: passwordController,
                    label: "Password",
                    prefixIcon: Icons.lock_outline,
                    hint: 'Enter your password',
                    isPassword: true,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: confirmPasswordController,
                    label: "Confirm Password",
                    prefixIcon: Icons.lock_outline,
                    hint: 'Re-enter your password',
                    isPassword: true,
                  ),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {
                     Navigator.pushReplacement(
                        context,MaterialPageRoute(builder:(context) => LoginScreen(),));
                           
                      },
                    child: Container(
                      width: 375,
                      height: 50,
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
                      child: const Center(
                        child: Text(
                          'Sign Up',
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
                          Container(
                            // decoration: BoxDecoration(color: Colors.blue),
                              child:
                              Image.network(
                                  'http://pngimg.com/uploads/google/google_PNG19635.png',
                                  fit:BoxFit.cover
                              )
                          ),
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
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, 
                          MaterialPageRoute(builder:(context) => LoginScreen(),)
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
                  
            ],
           ),
        ),
   ),
      ),
    );

  }
}