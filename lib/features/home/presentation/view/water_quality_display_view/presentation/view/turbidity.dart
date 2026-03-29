import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/widget/custom_app_bar.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/widget/custom_current_reading.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/widget/custom_historical_data.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/widget/custom_stat_card.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/widget/custom_trend_analysis.dart';

class Turbidity extends StatelessWidget {
  const Turbidity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Turbidity',
        // subtitle: 'Real-time monitoring',
        beginColor: Color(0xFFEA580C),
        endColor: Color(0xFFF97316),
        leftIcon: Icons.arrow_back,
        onLeftIconTap: () {
          Navigator.pop(context);
        },
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCurrentReading(
              value: '15.32',
              unit: 'NTU',
              status: 'Optimal',
              range: '< 20 NTU',
              rate: '1.6%',
              rateColor: Color(0xFF00A63E),
              icon: Icons.update,
              iconColor: Color(0xFF00A63E),
              iconBgColor: Color(0xFFDCFCE7),
            ),
            CustomHistoricalData(),

            CustomTrendAnalysis(
              interval: 4,
              herizontalInterval: 4.5,
              maxY: 20,
              lineColor: Color(0xFFF97316),
              gradientbeginColor: Color(0xFFF97316).withOpacity(0.18),
              gradientEndColor: Color(0xFFF97316).withOpacity(0.0),
              spots: [
                FlSpot(0, 16),
                FlSpot(4, 12),
                FlSpot(8, 14),
                FlSpot(12, 15),
                FlSpot(16, 10),
                FlSpot(20, 12),
                FlSpot(23, 13),
              ],
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomStatCard(title: 'Min', value: '12', unit: 'NTU'),
                CustomStatCard(title: 'Avg', value: '16', unit: 'NTU'),
                CustomStatCard(title: 'Max', value: '20', unit: 'NTU'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
