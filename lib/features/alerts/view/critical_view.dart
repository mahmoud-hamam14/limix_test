import 'package:flutter/material.dart';
import 'package:limix_test/features/alerts/widget/notification_card.dart';

class CriticalView extends StatelessWidget {
  const CriticalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            NotificationCard(
              title: 'Critical Oxygen Level',
              message: 'Oxygen levels in Pond B-4 have dropped below 5 mg/L',
              timeAgo: '4 hours ago',
              icon: Icons.warning_amber_rounded,
              iconBgColor: Color(0xffD32F2F),
              titleColor: Color(0xffC10007),
              borderColor: Color(0xffD32F2F),
            ),
            NotificationCard(
              title: 'Pump Failure',
              message:
                  'Main circulation pump has stopped. Backup system activated',
              timeAgo: '6 hours ago',
              icon: Icons.warning_amber_rounded,
              iconBgColor: Color(0xffD32F2F),
              titleColor: Color(0xffC10007),
              borderColor: Color(0xffD32F2F),
            ),
            NotificationCard(
              title: 'Critical Oxygen Level',
              message: 'Oxygen levels in Pond B-4 have dropped below 5 mg/L',
              timeAgo: '4 hours ago',
              icon: Icons.warning_amber_rounded,
              iconBgColor: Color(0xffD32F2F),
              titleColor: Color(0xffC10007),
              borderColor: Color(0xffD32F2F),
            ),
            NotificationCard(
              title: 'Pump Failure',
              message:
                  'Main circulation pump has stopped. Backup system activated',
              timeAgo: '6 hours ago',
              icon: Icons.warning_amber_rounded,
              iconBgColor: Color(0xffD32F2F),
              titleColor: Color(0xffC10007),
              borderColor: Color(0xffD32F2F),
            ),
            NotificationCard(
              title: 'Critical Oxygen Level',
              message: 'Oxygen levels in Pond A-2 have dropped below 4 mg/L',
              timeAgo: '8 hours ago',
              icon: Icons.warning_amber_rounded,
              iconBgColor: Color(0xffD32F2F),
              titleColor: Color(0xffC10007),
              borderColor: Color(0xffD32F2F),
            ),
          ],
        ),
      ),
    );
  }
}
