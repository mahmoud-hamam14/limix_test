import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  // final String subtitle;
  final IconData leftIcon;
  final Color beginColor;
  final Color endColor;
  final Gradient? backgroundGradient;
  final VoidCallback? onLeftIconTap;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    // required this.subtitle,
    required this.leftIcon,
    this.onLeftIconTap,
    this.actions,
    this.backgroundGradient,
    required this.beginColor,
    required this.endColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient:
              backgroundGradient ??
              LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [beginColor, endColor],
              ),
        ),
      ),
      elevation: 1,
      leading: GestureDetector(
        onTap: onLeftIconTap,
        child: Icon(leftIcon, color: Colors.white, size: 23),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 21,
              // fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Real-time monitoring',
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
