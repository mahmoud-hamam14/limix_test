import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

class BottomNavItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final Color activeColor;

  const BottomNavItem({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return SizedBox(
        width: 80.width,
        height: 60.height,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.radius),
            gradient: const LinearGradient(
              colors: [Color(0xFFEFF6FF), Color(0xFFF0FDFA)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 26.radius, color: activeColor),
              SizedBox(height: 5.height),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.font,
                  fontWeight: FontWeight.w500,
                  color: activeColor,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return SizedBox(
        width: 70.width,
        height: 60.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 23.radius, color: const Color(0xff9CA3AF)),
            SizedBox(height: 5.height),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.font,
                fontWeight: FontWeight.w500,
                color: Color(0xff9CA3AF),
              ),
            ),
          ],
        ),
      );
    }
  }
}
