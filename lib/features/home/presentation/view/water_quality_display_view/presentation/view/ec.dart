import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/widget/custom_app_bar.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/widget/custom_current_reading.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/widget/custom_historical_data.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/widget/custom_stat_card.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/widget/custom_trend_analysis.dart';

class Ec extends StatelessWidget {
  const Ec({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Electrical Conductivity',
        // subtitle: 'Real-time monitoring',
        beginColor: Color(0xFFDB2777),
        endColor: Color(0xFFEC4899),
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
              value: '544.09',
              unit: 'μS/cm',
              status: 'Optimal',
              range: '150-500 μS/cm',
              rate: '7.6%',
              rateColor: Color(0xFF00A63E),
              icon: Icons.update,
              iconColor: Color(0xFF00A63E),
              iconBgColor: Color(0xFFDCFCE7),
            ),
            CustomHistoricalData(),

            CustomTrendAnalysis(
              interval: 150,
              herizontalInterval: 120,
              maxY: 600,
              lineColor: Color(0xFFEC4899),
              gradientbeginColor: Color(0xFFEC4899).withOpacity(0.18),
              gradientEndColor: Color(0xFFEC4899).withOpacity(0.0),
              spots: [
                FlSpot(0, 460),
                FlSpot(2, 520),
                FlSpot(4, 500),
                FlSpot(6, 450),
                FlSpot(8, 480),
                FlSpot(10, 520),
                FlSpot(12, 520),
                FlSpot(14, 470),
                FlSpot(16, 530),
                FlSpot(18, 520),
                FlSpot(20, 520),
                FlSpot(22, 510),
                FlSpot(23, 550),
              ],
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomStatCard(title: 'Min', value: '150', unit: 'μS/cm'),
                CustomStatCard(title: 'Avg', value: '275', unit: 'μS/cm'),
                CustomStatCard(title: 'Max', value: '500', unit: 'μS/cm'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
