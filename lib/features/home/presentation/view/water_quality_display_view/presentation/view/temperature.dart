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

class TemperatureView extends StatelessWidget {
  const TemperatureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Temperature',
        // subtitle: 'Real-time monitoring',
        beginColor: Color(0xFFD97706),
        endColor: Color(0xFFF59E0B),
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
                        state.waterQualityData.data?.temperature
                            ?.toStringAsFixed(1) ??
                        "--",
                    unit: '°C',
                    status: 'Optimal',
                    range: '24-32 °C',
                    rate: '2.4%',
                    rateColor: Color(0xFFE7000B),
                    icon: Icons.update,
                    iconColor: Color(0xFFE7000B),
                    iconBgColor: Color(0xFFFFE2E2),
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
              interval: 8,
              herizontalInterval: 6,
              maxY: 32,
              lineColor: Color(0xFFF59E0B),
              gradientbeginColor: Color(0xFFF59E0B).withOpacity(0.18),
              gradientEndColor: Color(0xFFF59E0B).withOpacity(0.0),
              spots: [
                FlSpot(0, 22),
                FlSpot(4, 21),
                FlSpot(8, 23),
                FlSpot(12, 22),
                FlSpot(16, 20),
                FlSpot(20, 23),
                FlSpot(23, 21),
              ],
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomStatCard(title: 'Min', value: '24', unit: '°C'),
                CustomStatCard(title: 'Avg', value: '25', unit: '°C'),
                CustomStatCard(title: 'Max', value: '28', unit: '°C'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
