import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget? leading;
  final Color? backgroundColor;
  final IconThemeData? iconTheme;
  final bool showBackButton;
  final VoidCallback onTap;
  final IconData? icon;
  final Color? iconColor;
  final Color? iconBgColor;
  final bool showOnlineDot;

  const CustomAppbar({
    super.key,
    required this.title,
    required this.subTitle,
    this.leading,
    this.iconTheme,
    required this.showBackButton,
    required this.onTap,
    this.icon,
    this.backgroundColor,
    this.iconColor,
    this.iconBgColor,
    this.showOnlineDot = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: iconTheme,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff01378E), Color(0xff2563EB)],
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
            ),
          ],
        ),
      ),
      title: Row(
        children: [
          if (icon != null)
            Container(
              height: 40.height,
              width: 40.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.radius),
                color: iconBgColor,
              ),
              child: Icon(icon, color: iconColor, size: 30.radius),
            ),
          SizedBox(width: 10.width),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.font,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  if (showOnlineDot) ...[
                    Container(
                      width: 8.width,
                      height: 8.height,
                      decoration: const BoxDecoration(
                        color: Color(0xff22C55E),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 4.width),
                  ],
                  Text(
                    subTitle,
                    style: TextStyle(
                      fontSize: 12.font,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      leading:
          showBackButton
              ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 18.radius,
                ),
                onPressed: onTap,
              )
              : null,
    );
  }
}
