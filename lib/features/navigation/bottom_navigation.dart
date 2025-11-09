import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// دي الصفحات اللي هتتنقل بينها (كمثال)
const List<Widget> _widgetOptions = <Widget>[
  Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  Text('Analytics Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  Text('Alerts Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  Text('AI Models Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  Text('Settings Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
];

class MyCustomNavBarScreen extends StatefulWidget {
  @override
  _MyCustomNavBarScreenState createState() => _MyCustomNavBarScreenState();
}

class _MyCustomNavBarScreenState extends State<MyCustomNavBarScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // اللون الأخضر اللي في الصورة
    Color selectedColor = Colors.green; 
    // اللون الرمادي للأيقونات غير المحددة
    Color unselectedColor = Colors.grey.shade600;
    // لون الخلفية (التظليل)
    Color tabBackgroundColor = Colors.green.withOpacity(0.1); 

    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Nav Bar Example'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: tabBackgroundColor,
              hoverColor: tabBackgroundColor,
              gap: 8, // المسافة بين الأيقونة والاسم
              activeColor: selectedColor, // لون الأيقونة والاسم المحددين
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: tabBackgroundColor, // لون التظليل
              color: unselectedColor, // لون الأيقونات غير المحددة
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.bar_chart_outlined,
                  text: 'Analytics',
                ),
                GButton(
                  icon: Icons.notifications_none,
                  text: 'Alerts',
                ),
                GButton(
                  icon: Icons.brain, // أو أيقونة مناسبة لـ AI
                  text: 'AI Models',
                ),
                GButton(
                  icon: Icons.settings_outlined,
                  text: 'Settings',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}