import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

class CustomSupportContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  const CustomSupportContainer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.iconColor,
    required this.onTap,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.radius),
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 2),
            blurRadius: 1,
            spreadRadius: -2,
          ),
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 10),
            blurRadius: 6,
            spreadRadius: -1,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(12.radius),
            child: Container(
              height: 45.height,
              width: 45.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.radius),
                color: backgroundColor,
              ),
              child: Icon(icon, color: iconColor, size: 25.radius),
            ),
          ),
          SizedBox(width: 10.width),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.font,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                  ),
                ),
                SizedBox(height: 5.height),
                Text(
                  subTitle,
                  style: TextStyle(
                    color: Color(0xff4A5565),
                    fontSize: 12.font,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: IconButton(
              onPressed: onTap,
              icon: Icon(
                Icons.open_in_new,
                color: Color(0xff99A1AF),
                size: 20.radius,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
