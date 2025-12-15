import 'package:flutter/material.dart';
import 'package:limix_test/features/analytics/farm_overview/view/widget/farm_health_card.dart';
import 'package:limix_test/features/analytics/farm_overview/view/widget/monthly_production_card.dart';
import 'package:limix_test/features/analytics/farm_overview/view/widget/overview_cars_widget.dart';
import 'package:limix_test/features/analytics/farm_overview/view/widget/performance_trend_card.dart';


class FarmOverviewWidget extends StatelessWidget {
  const FarmOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      Column(
       children: [
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), 
        child: Row(
          children: [
            
            Expanded(
       child: StatCard(
         title: "Efficiency",
         value: "91%",
         change: "+12%",
         icon: Icons.trending_up,
         baseColor: Colors.green,
       ),
            ),
            const SizedBox(width: 12), 
           
            Expanded(
       child: StatCard(
         title: "Production",
         value: "500kg",
         change: "+8%",
         icon: Icons.trending_up,
         baseColor: Colors.blue,
       ),
            ),
            const SizedBox(width: 12),
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
      const SizedBox(height: 16),
            const Padding(
       padding: EdgeInsets.symmetric(horizontal: 16.0),
       child: FarmHealthCard(), 
            ),
            const SizedBox(height: 16), 
            const Padding(
       padding: EdgeInsets.symmetric(horizontal: 16.0),
       child: PerformanceTrendCard(), 
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 16), 
            const Padding(
       padding: EdgeInsets.symmetric(horizontal: 16.0),
       child: MonthlyProductionCard(), 
            ),
            const SizedBox(height: 32),
         
       ]
       
            ) ;
    
}
}