import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final String valueName;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color borderColor;
  final Color backgroundColor;
  final Color buttonColor;
  final Color valueColor;
  final VoidCallback onTap;

  const CustomContainer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.borderColor,
    required this.buttonColor,
    required this.onTap,
    required this.backgroundColor,
    required this.valueName,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.radius),
        border: Border(
          top: BorderSide(color: borderColor, width: 1.27),
          bottom: BorderSide(color: borderColor, width: 1.27),
          right: BorderSide(color: borderColor, width: 1.27),
          left: BorderSide(color: borderColor, width: 2.55),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 2),
            blurRadius: 4,
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
      child: Padding(
        padding: EdgeInsets.all(18.radius),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 120.height,
              width: 60.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.radius),
                color: backgroundColor,
              ),
              child: Icon(icon, color: iconColor, size: 28.radius),
            ),

            SizedBox(width: 15.width),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xff224B8F),
                      fontSize: 16.font,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                    ),
                  ),

                  SizedBox(height: 10.height),

                  Text(
                    subTitle,
                    style: TextStyle(
                      color: Color(0xff4A5565),
                      fontSize: 15.font,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                    ),
                  ),

                  SizedBox(height: 15.height),

                  Row(
                    children: [
                      Text(
                        valueName,
                        style: TextStyle(
                          color: Color(0xff6A7282),
                          fontSize: 14.font,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                        ),
                      ),

                      SizedBox(width: 15.width),

                      Text(
                        value,
                        style: TextStyle(
                          color: valueColor,
                          fontSize: 14.font,

                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.height),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(94.radius, 45.radius),
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.radius),
                      ),
                    ),
                    onPressed: () {
                      onTap();
                    },
                    child: Text(
                      'View Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.font,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
