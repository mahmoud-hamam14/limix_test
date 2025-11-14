import 'package:flutter/material.dart';
import 'package:limix_test/features/navigation/view/widget/bottom_nav_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const CustomBottomNavBar({super.key,
   required this.currentIndex, 
   required this.onTap
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => onTap(0),
            child: BottomNavItem(
              label: "Home", 
              icon: Icons.home_outlined, 
              isSelected: currentIndex==0,
               activeColor: Color(0xff10B981)
               ),
          ),
          GestureDetector(
            onTap: () => onTap(1),
            child: BottomNavItem(
              label: "Analytics", 
              icon: Icons.bar_chart_outlined, 
              isSelected: currentIndex==1,
               activeColor: Color(0xff3B82F6)
               ),
          ),
          GestureDetector(
            onTap: () => onTap(2),
            child: BottomNavItem(
              label: "Alerts", 
              icon: Icons.notifications_none, 
              isSelected: currentIndex==2,
               activeColor: Color(0xffF59E0B)
               ),
          ),
          GestureDetector(
            onTap: () => onTap(3),
            child: BottomNavItem(
              label: "AI Models", 
              icon: Icons.psychology, 
              isSelected: currentIndex==3,
               activeColor: Color(0xff8B5CF6)
               ),
          ),
          GestureDetector(
            onTap: () => onTap(4),
            child: BottomNavItem(
              label: "Settings", 
              icon: Icons.settings_outlined, 
              isSelected: currentIndex==4,
               activeColor: Color(0xff6B7280)
               ),
          ),
        ],
      ),
    );
  }
}