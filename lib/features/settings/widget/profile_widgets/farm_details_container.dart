import 'package:flutter/material.dart';

import 'custom_input_field.dart';
class FarmDetailsContainer extends StatelessWidget {
  const FarmDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
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
            "Farm Details",
            style: TextStyle(
              color: Color(0xff0891B2),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            )
          ),
          SizedBox(height: 30,),
        CustomInputField(
          label: "Farm Name",
          hint: "Farm Name",
          icon: Icons.home_outlined,
          controller: TextEditingController(),
        ),
        CustomInputField(
          label: "Farm Size",
          hint: "ex:2.5 hectares",
            icon: Icons.crop_square_outlined,
          controller: TextEditingController(),
        ),

        ]
      )

    );
  }
}
