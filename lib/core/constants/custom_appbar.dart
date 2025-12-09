import 'package:flutter/material.dart';
class CustomAppbar extends StatelessWidget implements PreferredSizeWidget  {
  final String title;
  final String subtitle;
  final List<Color> gradientColors;
  final VoidCallback? onBack;
  final IconButton? iconButton;

  const CustomAppbar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.gradientColors,
     this.onBack,
    this.iconButton,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: gradientColors
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 6,
              spreadRadius: -4,
              color: Color(0x1A000000),
            ),
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 15,
              spreadRadius: -3,
              color: Color(0x1A000000),
            )
          ]
          )
        ),
      title: Row(
        children: [
          iconButton!,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white
                )
              ),
              Text(subtitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.7)
                )
              )
            ]
          ),
        ],
      ),

    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(80);
}
