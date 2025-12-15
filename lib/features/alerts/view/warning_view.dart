import 'package:flutter/material.dart';
import 'package:limix_test/features/alerts/widget/notification_card.dart';

class WarningView extends StatelessWidget {
  const WarningView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            NotificationCard(
              title: 'Temperature Rising',
              message: 'Ammonia levels in Pond C-1 have risen above 0.5 mg/L',
              timeAgo: '15 min ago',
              icon: Icons.error_outline,
              iconBgColor: Color(0xFFFFA500),
              titleColor: Color(0xFFCC8400),
              backgroundColor: Color(0xFFFFF8E1),
            ),
            NotificationCard(
              title: 'Temperature Alert',
              message: 'Water temperature in Pond A-3 has exceeded 30°C',
              timeAgo: '3 hours ago',
              icon: Icons.error_outline,
              iconBgColor: Color(0xFFFFA500),
              titleColor: Color(0xFFCC8400),
              backgroundColor: Color(0xFFFFF8E1),
            ),
            NotificationCard(
              title: 'High Ammonia Levels',
              message: 'Ammonia levels in Pond C-1 have risen above 0.5 mg/L',
              timeAgo: '2 hours ago',
              icon: Icons.error_outline,
              iconBgColor: Color(0xFFFFA500),
              titleColor: Color(0xFFCC8400),
              backgroundColor: Color(0xFFFFF8E1),
            ),
            NotificationCard(
              title: 'Temperature Alert',
              message: 'Water temperature in Pond A-3 has exceeded 30°C',
              timeAgo: '3 hours ago',
              icon: Icons.error_outline,
              iconBgColor: Color(0xFFFFA500),
              titleColor: Color(0xFFCC8400),
              backgroundColor: Color(0xFFFFF8E1),
            ),
            NotificationCard(
              title: 'High Ammonia Levels',
              message: 'Ammonia levels in Pond D-2 have risen above 0.6 mg/L',
              timeAgo: '5 hours ago',
              icon: Icons.error_outline,
              iconBgColor: Color(0xFFFFA500),
              titleColor: Color(0xFFCC8400),
              backgroundColor: Color(0xFFFFF8E1),
            ),
          ],
        ),
      ),
    );
  }
}
