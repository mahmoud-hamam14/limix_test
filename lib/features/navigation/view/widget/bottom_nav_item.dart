import 'package:flutter/material.dart';

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
        width: 71,
          height: 56,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [
                Color(0xFFEFF6FF),
                Color(0xFFF0FDFA),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 25,
                color: activeColor,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
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
        width: 71,
        height: 56,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 22,
              color: const Color(0xff9CA3AF),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
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
