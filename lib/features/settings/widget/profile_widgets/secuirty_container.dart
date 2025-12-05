import 'package:flutter/material.dart';

import 'costum_password_field.dart';
import 'custom_input_field.dart';
class SecuirtyContainer extends StatelessWidget {
  const SecuirtyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        width: 329,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1A000000),
                offset: Offset(0, 4),
                blurRadius: 10,
              ),
            ]
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18,),
              Text(
                  "Security",
                  style: TextStyle(
                    color: Color(0xff0891B2),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )
              ),
              SizedBox(height: 30,),
              CustomPasswordField(
                label: "Current Password",
                controller: TextEditingController(),
              ),
              CustomPasswordField(
                label: "New Password",
                controller: TextEditingController(),
              ),
              CustomPasswordField(
                label: "Confirm New Password",
                controller: TextEditingController(),
              ),

            ]
        )

    );
  }
}
