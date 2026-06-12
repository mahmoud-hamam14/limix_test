import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

class CustomPasswordField extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  const CustomPasswordField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 12.font,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 12.height),

        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(30.radius),
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          child: TextField(
            controller: widget.controller,
            obscureText: obscure,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.width,
                vertical: 16.height,
              ),
              prefixIcon: Icon(Icons.lock_outline, color: Colors.grey.shade600),
              suffixIcon: IconButton(
                icon: Icon(
                  obscure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey.shade600,
                ),
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
              ),
            ),
          ),
        ),

        SizedBox(height: 12.height),
      ],
    );
  }
}
