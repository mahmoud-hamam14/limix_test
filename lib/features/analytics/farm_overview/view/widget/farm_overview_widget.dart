import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';
import 'package:limix_test/features/analytics/farm_overview/view/widget/monthly_production_card.dart';
import 'package:limix_test/features/analytics/farm_overview/view/widget/overview_cars_widget.dart';
import 'package:limix_test/features/analytics/farm_overview/view/widget/performance_trend_card.dart';

class FarmOverviewWidget extends StatelessWidget {
  const FarmOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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

            SizedBox(width: 10.width),

            Expanded(
              child: StatCard(
                title: "Production",
                value: "500kg",
                change: "+8%",
                icon: Icons.trending_up,
                baseColor: Colors.blue,
              ),
            ),

            SizedBox(width: 10.width),

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

        SizedBox(height: 20.height),

        PerformanceTrendCard(),

        SizedBox(height: 20.height),

        MonthlyProductionCard(),

        SizedBox(height: 32.height),
      ],
    );
  }
}
