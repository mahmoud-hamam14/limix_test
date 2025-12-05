import 'package:flutter/material.dart';

import 'custom_input_field.dart';
class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460,
      width: 328.39,
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
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text("Personal Information",
            style: TextStyle(
              color: Color(0xff0891B2),
              fontSize: 16,
              fontWeight: FontWeight.w400,
          )
          ),
          SizedBox(height: 30,),
          CustomInputField(
            label: "Full Name",
            hint: "Ahmed Mohamed",
            icon: Icons.person_outline,
            controller: TextEditingController(),
          ),
          CustomInputField(
            label: "Email",
            hint: "ahmed@limix.eg",
            icon: Icons.email_outlined,
            controller: TextEditingController(),
          ),
          CustomInputField(
            label: "Phone",
            hint: "+20 123 456 7890",
            icon: Icons.phone,
            controller: TextEditingController(),
          ),
          CustomInputField(
            label: "Location",
            hint: "Cairo, Egypt",
            icon: Icons.location_on_outlined,
            controller: TextEditingController(),
          ),

        ],
      ),
    );
  }
}
