
import 'package:flutter/material.dart';
import 'package:limix_test/features/auth/view/check_email_screen.dart';
import 'package:limix_test/features/auth/view/login_view.dart';
import 'package:limix_test/features/auth/widget/custom_text_field.dart';

class ForgetScreen extends StatelessWidget {
   ForgetScreen({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xff0891B2)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Forgot Password?",
          style: TextStyle(
            color: Color(0xff0891B2),
            fontWeight: FontWeight.bold,
          ),
        ),
       // centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
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
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Enter your email address and we well send you a link to reset your password.',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(fontSize: 16
                    , color: Color(0xff4A5565)
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: emailController,
                  label: "Email",
                  prefixIcon: Icons.email_outlined,
                  hint: 'Enter your email',
                ),
                 const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                   Navigator.push(
                      context,MaterialPageRoute(builder:(context) => CheckEmailScreen(),));
                         
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
                        'Send Reset Link',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                 const SizedBox(height: 24),
                 TextButton(
                      onPressed: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder:(context) => LoginScreen(),)
                        );
                      },
                      child: const Text(
                        "Back to Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0891B2),
                        ),
                      ),
                    ),

      ],),
    );
  }
}