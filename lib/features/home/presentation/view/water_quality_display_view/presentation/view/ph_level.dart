import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/widget/custom_app_bar.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/widget/custom_current_reading.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/widget/custom_historical_data.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/widget/custom_stat_card.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/widget/custom_trend_analysis.dart';

class PhLevel extends StatelessWidget {
  const PhLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'pH Level',
        // subtitle: 'Real-time monitoring',
        beginColor: Color(0xFF9333EA),
        endColor: Color(0xFFA855F7),
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
              value: '7.74',
              unit: 'pH',
              status: 'Optimal',
              range: '6.5-8.5 pH',
              rate: '4.2%',
              rateColor: Color(0xFF00A63E),
              icon: Icons.update,
              iconColor: Color(0xFF00A63E),
              iconBgColor: Color(0xFFDCFCE7),
            ),
            CustomHistoricalData(),

            CustomTrendAnalysis(
              interval: 2,
              herizontalInterval: 1.7,
              maxY: 8,
              lineColor: Color(0xFFA855F7),
              gradientbeginColor: Color(0xFFA855F7).withOpacity(0.18),
              gradientEndColor: Color(0xFFA855F7).withOpacity(0.0),
              spots: [
                FlSpot(0, 5.5),
                FlSpot(4, 5.9),
                FlSpot(8, 5.7),
                FlSpot(12, 6.4),
                FlSpot(16, 6),
                FlSpot(20, 6.9),
                FlSpot(23, 5.2),
              ],
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomStatCard(title: 'Min', value: '6.5', unit: 'pH'),
                CustomStatCard(title: 'Avg', value: '7.5', unit: 'pH'),
                CustomStatCard(title: 'Max', value: '8.5', unit: 'pH'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
