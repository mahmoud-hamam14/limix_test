import 'package:flutter/material.dart';
import 'package:limix_test/features/analytics/widget/farm_health_card.dart';
import 'package:limix_test/features/analytics/widget/monthly_production_card.dart';
import 'package:limix_test/features/analytics/widget/overview_cars_widget.dart';
import 'package:limix_test/features/analytics/widget/performance_trend_card.dart';


class FarmOverviewWidget extends StatelessWidget {
  const FarmOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       Column(
        children: [
         Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0), // عشان المسافات من الجنب
  child: Row(
    children: [
      // --- الكارت الأول ---
      Expanded(
        child: StatCard(
          title: "Efficiency",
          value: "91%",
          change: "+12%",
          icon: Icons.trending_up,
          baseColor: Colors.green,
        ),
      ),
      const SizedBox(width: 12), // مسافة بين الكروت

      // --- الكارت التاني ---
      Expanded(
        child: StatCard(
          title: "Production",
          value: "500kg",
          change: "+8%",
          icon: Icons.trending_up,
          baseColor: Colors.blue,
        ),
      ),
      const SizedBox(width: 12), // مسافة بين الكروت

      // --- الكارت التالت ---
      Expanded(
        child: StatCard(
          title: "Quality",
          value: "96%",
          change: "+4%",
          icon: Icons.trending_up,
          baseColor: Colors.purple,
        ),
      ),
    ],
  ),
),
const SizedBox(height: 16), // مسافة
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: FarmHealthCard(), // ده الكارت الجديد
      ),
      const SizedBox(height: 16), // مسافة
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: PerformanceTrendCard(), // ده الكارت الجديد
      ),
      // --- ----------------------- ---
      
      // ضيف مسافة تحت خالص عشان السكرول
      const SizedBox(height: 16),
      const SizedBox(height: 16), // مسافة
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: MonthlyProductionCard(), // ده الكارت الأخير
      ),
      // --- ----------------------- ---
      
      // ضيف مسافة تحت خالص عشان السكرول
      const SizedBox(height: 32),
          
        ]
        
      ) ;
    
}
}