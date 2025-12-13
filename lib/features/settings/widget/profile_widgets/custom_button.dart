import 'package:flutter/material.dart';

import '../../../auth/view/login_view.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 55,
      width: 328.39,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.redAccent,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xffFFE2E2),
            blurRadius: 4,
            offset: const Offset(0, 2),
            spreadRadius: -2,
          ),
          BoxShadow(
            color: Color(0xffFFE2E2),
            blurRadius: 6,
            offset: const Offset(0, 4),
            spreadRadius: -1,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent, // عشان الـ InkWell يشتغل صح فوق الـ Container
        child: InkWell(
          borderRadius: BorderRadius.circular(24), // عشان التحديد لما تدوس يبقى واخد الكيرف
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
            print("Logout Tapped");
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center, // سنتر الكلام والأيقونة
            children: [
              Icon(
                Icons.logout,
                color: Color(0xffE7000B),
              ),
              SizedBox(width: 10),
              Text(
                "Logout",
                style: TextStyle(
                  color: Color(0xffE7000B),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
