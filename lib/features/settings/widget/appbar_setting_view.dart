import 'package:flutter/material.dart';
class AppbarSettingView extends StatelessWidget {
  final String title;
  final String subTitle;
  final Gradient? gradient;
  final Widget? leading;
 final Color? backgroundColor;
  final IconThemeData? iconTheme;
  final bool showBackButton;
  final VoidCallback onTap;
  final IconData? icon;
  const AppbarSettingView({
    super.key,
    required this.title,
    required this.subTitle,
    this.gradient,
    this.leading,
    this.iconTheme,
     required this.showBackButton,
    required this.onTap,
    this.icon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: iconTheme,
      flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: gradient,
              color: gradient == null ? backgroundColor : null,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 6,
                    spreadRadius: -4,
                    color: Color(0x1A000000)
                ),
                BoxShadow(
                    offset: Offset(0 ,10),
                    blurRadius:15,
                    spreadRadius: -3,
                    color: Color(0x1A000000)
                )
              ]
          )
      ),
      title: Row(
        children: [
          if (icon != null)
          Container(
            height: 39.972755432128906,
            width: 39.972755432128906,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                shape: BoxShape.rectangle,
                color: Colors.white.withOpacity(0.2)
            ),
            child: Icon(icon,color: Colors.white,size: 30,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ), Text( subTitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ],
      ),
      leading:
      showBackButton
          ? IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed:onTap
      )
          : null,


    );
  }
}
