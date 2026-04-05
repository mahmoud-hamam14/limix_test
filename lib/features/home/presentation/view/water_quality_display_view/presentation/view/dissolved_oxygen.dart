import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limix_test/features/home/presentation/manger/water_quality_display_cubit/waret_quality_display_cubit.dart';
import 'package:limix_test/features/home/presentation/manger/water_quality_display_cubit/waret_quality_display_state.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/widget/custom_app_bar.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/widget/custom_current_reading.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/widget/custom_historical_data.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/widget/custom_stat_card.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/widget/custom_trend_analysis.dart';

class DissolvedOxygen extends StatelessWidget {
  const DissolvedOxygen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Dissolved Oxygen',
        // subtitle: 'Real-time monitoring',
        beginColor: Color(0xFF2563EB),
        endColor: Color(0xFF3B82F6),
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
            BlocBuilder<WaterQualityDisplayCubit, WaterQualityDisplayState>(
              builder: (context, state) {
                if (state is WaterQualityDisplaySuccess) {
                  return CustomCurrentReading(
                    value:
                        state.waterQualityData.data?.dissolvedOxygen
                            ?.toStringAsFixed(1) ??
                        "--",
                    unit: 'mg/L',
                    status: 'Optimal',
                    range: '5-9 mg/L',
                    rate: '2.4%',
                    rateColor: Color(0xFF00A63E),
                    icon: Icons.update,
                    iconColor: Color(0xFF00A63E),
                    iconBgColor: Color(0xFFDCFCE7),
                  );
                } else if (state is WaterQualityDisplayLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is WaterQualityDisplayError) {
                  return Center(child: Text('Error: ${state.errorMessage}'));
                } else {
                  return Center(child: Text('No data available'));
                }
              },
            ),
            CustomHistoricalData(),

            CustomTrendAnalysis(
              interval: 3,
              herizontalInterval: 2,
              maxY: 12,
              lineColor: Color(0xFF3B82F6),
              gradientbeginColor: Color(0xFF3B82F6).withOpacity(0.18),
              gradientEndColor: Color(0xFF3B82F6).withOpacity(0.0),
              spots: [
                FlSpot(0, 8.2),
                FlSpot(4, 7.5),
                FlSpot(8, 7.9),
                FlSpot(12, 8.5),
                FlSpot(16, 7.5),
                FlSpot(20, 8.5),
                FlSpot(23, 9.3),
              ],
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomStatCard(title: 'Min', value: '6', unit: 'mg/L'),
                CustomStatCard(title: 'Avg', value: '7.5', unit: 'mg/L'),
                CustomStatCard(title: 'Max', value: '9', unit: 'mg/L'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
