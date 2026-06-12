import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.icon,
    required this.iconBgColor,
    required this.title,
    required this.titleColor,
    required this.message,
    required this.timeAgo,
    required this.borderColor,
  });

  final IconData icon;
  final Color iconBgColor;
  final String title;
  final Color titleColor;
  final String message;
  final String timeAgo;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.height),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.radius),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        padding: EdgeInsets.all(15.radius),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10.radius),
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(25.radius),
              ),
              child: Icon(icon, color: Colors.white, size: 20.radius),
            ),
            SizedBox(width: 10.width),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15.font,
                      fontWeight: FontWeight.w500,
                      color: titleColor,
                    ),
                  ),

                  Text(
                    timeAgo,
                    style: TextStyle(
                      fontSize: 10.font,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6A7282),
                    ),
                  ),
                  SizedBox(height: 10.height),

                  Text(
                    message,

                    style: TextStyle(
                      fontSize: 13.font,
                      color: Color(0xFF364153),
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
