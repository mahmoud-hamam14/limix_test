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

class DissolvedOxygen extends StatefulWidget {
  const DissolvedOxygen({super.key});

  @override
  State<DissolvedOxygen> createState() => _DissolvedOxygenState();
}

class _DissolvedOxygenState extends State<DissolvedOxygen> {
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
        title: 'Dissolved Oxygen',
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
                  value: '${data.dissolvedOxygen}',
                  unit: 'mg/L',
                  status: 'Optimal',
                  range: '6-9 mg/L',
                  rate: '2.4%',
                  rateColor: const Color(0xFF00A63E),
                  icon: Icons.update,
                  iconColor: const Color(0xFF00A63E),
                  iconBgColor: const Color(0xFFDCFCE7),
                ),

                CustomHistoricalData(),

                CustomTrendAnalysis(
                  interval: 3,
                  herizontalInterval: 2,
                  maxY: 12,
                  lineColor: const Color(0xFF3B82F6),
                  gradientbeginColor: const Color(0xFF3B82F6).withOpacity(0.3),
                  gradientEndColor: const Color(0xFF3B82F6).withOpacity(0.0),

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
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomStatCard(title: 'Min', value: '6', unit: 'mg/L'),
                    CustomStatCard(title: 'Avg', value: '7.5', unit: 'mg/L'),
                    CustomStatCard(title: 'Max', value: '9', unit: 'mg/L'),
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

// class DissolvedOxygen extends StatelessWidget {
//   const DissolvedOxygen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: CustomAppBar(
//         title: 'Dissolved Oxygen',
//         // subtitle: 'Real-time monitoring',
//         beginColor: Color(0xFF01378E),
//         endColor: Color(0xFF2563EB),
//         leftIcon: Icons.arrow_back,
//         onLeftIconTap: () {
//           Navigator.pop(context);
//         },
//       ),

//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomCurrentReading(
//               value: '9.2',
//               unit: 'mg/L',
//               status: 'Optimal',
//               range: '6-9 mg/L',
//               rate: '2.4%',
//               rateColor: Color(0xFF00A63E),
//               icon: Icons.update,
//               iconColor: Color(0xFF00A63E),
//               iconBgColor: Color(0xFFDCFCE7),
//             ),
//             CustomHistoricalData(),

//             CustomTrendAnalysis(
//               interval: 3,
//               herizontalInterval: 2,
//               maxY: 12,
//               lineColor: Color(0xFF3B82F6),
//               gradientbeginColor: Color(0xFF3B82F6).withOpacity(0.3),
//               gradientEndColor: Color(0xFF3B82F6).withOpacity(0.0),
//               spots: [
//                 FlSpot(0, 8.2),
//                 FlSpot(4, 7.5),
//                 FlSpot(8, 7.9),
//                 FlSpot(12, 8.5),
//                 FlSpot(16, 7.5),
//                 FlSpot(20, 8.5),
//                 FlSpot(23, 9.3),
//               ],
//             ),

//             const SizedBox(height: 30),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomStatCard(title: 'Min', value: '6', unit: 'mg/L'),
//                 CustomStatCard(title: 'Avg', value: '7.5', unit: 'mg/L'),
//                 CustomStatCard(title: 'Max', value: '9', unit: 'mg/L'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
