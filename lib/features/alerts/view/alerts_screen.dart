import 'package:flutter/material.dart';
import 'package:limix_test/core/constants/custom_appbar.dart';
import 'package:limix_test/features/alerts/view/critical_view.dart';
import 'package:limix_test/features/alerts/view/warning_view.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppbar(
              title: "Notifications",
              subTitle: "Stay updated on farm alerts",
              showBackButton: true,
              onTap: (){},
            backgroundColor: Color(0xff224B8F),
          ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 16),

          // Buttons
          Container(
            height: 46,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey.shade200,
            ),

            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() => selectedIndex = 0);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color:
                            selectedIndex == 0
                                ? Color(0xffD32F2F)
                                : Colors.grey.shade200,
                      ),
                      child: Center(
                        child: Text(
                          "Critical",
                          style: TextStyle(
                            color:
                                selectedIndex == 0
                                    ? Colors.white
                                    : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() => selectedIndex = 1);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color:
                            selectedIndex == 1
                                ? Color(0xFFFE9A00)
                                : Colors.grey.shade200,
                      ),
                      child: Center(
                        child: Text(
                          "Warning",
                          style: TextStyle(
                            color:
                                selectedIndex == 1
                                    ? Colors.white
                                    : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Screen content based on selectedIndex
          selectedIndex == 0 ?  CriticalView() :  WarningView(),
        ],
      ),
    );
  }
}
