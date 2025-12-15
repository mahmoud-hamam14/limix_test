import 'package:flutter/material.dart';
class CustomInputField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;

  const CustomInputField({
    super.key, required this.label,
    required this.hint,
    required this.icon,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Color(0xff364153),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffF3F3F5),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Color(0xffE5E7EB),
              ),
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
               border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
               horizontal: 16,
               vertical: 10,
              ),
                prefixIcon: Icon(icon, color: Color(0xff99A1AF)),
              ),
            ),
    ),
            const SizedBox(height: 5),
      ],
    );
  }
}
