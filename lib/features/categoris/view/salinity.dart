import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:limix_test/core/cubit/water_quality_desplay_cubit/water_quality_desplay_state.dart';
import 'package:limix_test/features/categoris/widget/custom_app_bar.dart';
import 'package:limix_test/features/categoris/widget/custom_current_reading.dart';
import 'package:limix_test/features/categoris/widget/custom_historical_data.dart';
import 'package:limix_test/features/categoris/widget/custom_stat_card.dart';
import 'package:limix_test/features/categoris/widget/custom_trend_analysis.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limix_test/core/cubit/water_quality_desplay_cubit/water_quality_desplay_cubit.dart';

class Salinity extends StatefulWidget {
  const Salinity({super.key});

  @override
  State<Salinity> createState() => _SalinityState();
}

class _SalinityState extends State<Salinity> {
  late WaterQualityDesplayCubit cubit;

  @override
  void initState() {
    super.initState();

    cubit = context.read<WaterQualityDesplayCubit>();
    cubit.start();
  }

  @override
  void dispose() {
    cubit.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: CustomAppBar(
        title: 'Ammonia',
        beginColor: const Color(0xFF01378E),
        endColor: const Color(0xFF2563EB),
        leftIcon: Icons.arrow_back,
        onLeftIconTap: () {
          Navigator.pop(context);
        },
      ),

      body: BlocBuilder<WaterQualityDesplayCubit, WaterQualityDesplayState>(
        builder: (context, state) {
          final data = cubit.data;

          if (state is WaterQualityDesplayLoading && data == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is WaterQualityDesplayError && data == null) {
            return Center(child: Text(state.message));
          }

          if (data == null) {
            return const Center(child: Text("No data available"));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCurrentReading(
                  value: '${data.ammonia}',
                  unit: 'mg/L',
                  status: 'Optimal',
                  range: '28-35 mg/L',
                  rate: '0.8%',
                  rateColor: const Color(0xFF00A63E),
                  icon: Icons.update,
                  iconColor: const Color(0xFF00A63E),
                  iconBgColor: const Color(0xFFDCFCE7),
                ),

                CustomHistoricalData(),

                CustomTrendAnalysis(
                  interval: 8,
                  herizontalInterval: 7,
                  maxY: 40,
                  lineColor: const Color(0xFF82B8FE),
                  gradientbeginColor: const Color(0xFF3B82F6).withOpacity(0.3),
                  gradientEndColor: const Color(0xFF3B82F6).withOpacity(0.0),

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
                  children: const [
                    CustomStatCard(title: 'Min', value: '28', unit: 'ppt'),
                    CustomStatCard(title: 'Avg', value: '32', unit: 'ppt'),
                    CustomStatCard(title: 'Max', value: '35', unit: 'ppt'),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
