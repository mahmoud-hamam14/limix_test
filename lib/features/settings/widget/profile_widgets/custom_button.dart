import 'package:flutter/material.dart';

import '../../../auth/view/login_view.dart';
class CustomButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Color titleColor;
  final VoidCallback onTap;
  final Gradient? gradient;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final List<BoxShadow> boxShadow;
  const CustomButton({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.titleColor,
    required this.onTap,
    this.gradient,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1,
    required this.boxShadow,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 55,
      width: 328.39,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
          border: borderColor != null
              ? Border.all(
            color: borderColor!,
            width: borderWidth,
          ): null,
        boxShadow: boxShadow,
        gradient: gradient,
        color: gradient == null ? backgroundColor : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: onTap,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center, // سنتر الكلام والأيقونة
            children: [
              Icon(
                icon,
                color: iconColor
              ),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  color: titleColor,
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
