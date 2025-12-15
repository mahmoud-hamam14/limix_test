import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:limix_test/features/categoris/widget/custom_app_bar.dart';
import 'package:limix_test/features/categoris/widget/custom_current_reading.dart';
import 'package:limix_test/features/categoris/widget/custom_historical_data.dart';
import 'package:limix_test/features/categoris/widget/custom_stat_card.dart';
import 'package:limix_test/features/categoris/widget/custom_trend_analysis.dart';

class Salinity extends StatelessWidget {
  const Salinity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Salinity',
        // subtitle: 'Real-time monitoring',
        beginColor: Color(0xFF059669),
        endColor: Color(0xFF10B981),
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
              value: '35.02',
              unit: 'ppt',
              status: 'Optimal',
              range: '28-35 ppt',
              rate: '0.8%',
              rateColor: Color(0xFF00A63E),
              icon: Icons.update,
              iconColor: Color(0xFF00A63E),
              iconBgColor: Color(0xFFDCFCE7),
            ),
            CustomHistoricalData(),

            CustomTrendAnalysis(
              interval: 8,
              herizontalInterval: 7,
              maxY: 40,
              lineColor: Color(0xFF10B981),
              gradientbeginColor: Color(0xFF10B981).withOpacity(0.18),
              gradientEndColor: Color(0xFF10B981).withOpacity(0.0),
              spots: [
                FlSpot(0, 32),
                FlSpot(4, 26),
                FlSpot(8, 30),
                FlSpot(12, 34),
                FlSpot(16, 29),
                FlSpot(20, 35),
                FlSpot(23, 31),
              ],
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomStatCard(title: 'Min', value: '28', unit: 'ppt'),
                CustomStatCard(title: 'Avg', value: '32', unit: 'ppt'),
                CustomStatCard(title: 'Max', value: '35', unit: 'ppt'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
