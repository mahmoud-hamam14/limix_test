import 'package:flutter/material.dart';
import 'package:limix_test/features/auth/view/login_view.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  //color: Color(0xFF22C55E),
                  gradient: LinearGradient(
                      colors: [
                        Color(0xff4E80DE),
                        Color(0xff0064BC),
                      ],
                    begin: Alignment.topCenter
                    ,end: Alignment.bottomCenter
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1A000000),
                      offset: Offset(0, 8),
                      blurRadius: 10,
                      spreadRadius: -6,
                    ),
                    BoxShadow(
                      color:  Color(0x1A000000),
                      offset:  Offset(0, 20),
                      blurRadius: 25,
                      spreadRadius: -5,
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.task_alt,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),

              
              const Text(
                "Check Your Email",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff01378E),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "We've sent a password reset link to your email address. "
                "Please check your inbox and follow the instructions.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  height: 1.4,
                ),
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
                        colors: [
                          Color(0xff01378E),
                          Color(0xff2563EB)],
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
                        'Back to Login',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ]
          ),
        ),
      ),
    );
  }
}