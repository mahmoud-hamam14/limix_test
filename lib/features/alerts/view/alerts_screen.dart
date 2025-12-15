import 'package:flutter/material.dart';
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
      appBar: AppBar(
        backgroundColor: Color(0xFF224B8F),
        automaticallyImplyLeading: false,
        leading: SizedBox(),
        leadingWidth: 30,

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notifications',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                // fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Stay updated on farm alerts',
              style: const TextStyle(color: Colors.white70, fontSize: 17),
            ),
          ],
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
                                ? Colors.red
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
