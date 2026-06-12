import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';
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
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xff0891B2),
            size: 23.radius,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Forgot Password?",
          style: TextStyle(
            fontSize: 20.font,
            color: Color(0xff01378E),
            fontWeight: FontWeight.w500,
          ),
        ),
        // centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.width),
        child: Column(
          children: [
            SizedBox(height: 20.height),
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
              'Reset your password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.font),
            ),
            SizedBox(height: 25.height),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Enter your email address and we well send you a link to reset your password.',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(fontSize: 16.font, color: Color(0xff4A5565)),
              ),
            ),
            SizedBox(height: 25.height),

            CustomTextField(
              controller: emailController,
              label: "Email",
              prefixIcon: Icons.email_outlined,
              hint: 'Enter your email',
            ),

            SizedBox(height: 25.height),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckEmailScreen()),
                );
              },
              child: Container(
                width: double.infinity,
                height: 40.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.radius),
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
                    'Send Reset Link',
                    style: TextStyle(
                      fontSize: 18.font,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.height),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text(
                "Back to Login",
                style: TextStyle(
                  fontSize: 18.font,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff2563EB),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
