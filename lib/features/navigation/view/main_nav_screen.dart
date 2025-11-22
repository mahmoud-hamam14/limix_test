import 'package:flutter/material.dart';
import 'package:limix_test/features/ai_models/view/ai_model_screen.dart';
import 'package:limix_test/features/alerts/view/alerts_screen.dart';
import 'package:limix_test/features/analytics/farm_overview/view/analytics_screen.dart';
import 'package:limix_test/features/home/view/home_screen.dart';
import 'package:limix_test/features/navigation/view/widget/custom_bottom_nav_bar.dart';
import 'package:limix_test/features/settings/view/settings_screen.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavStateState();
}

class _MainNavStateState extends State<MainNavScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    AnalyticsScreen(),
    AlertsScreen(),
    AiModelScreen(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
      ),
    );
  }
}