

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:limix_test/core/cubit/water_quality_desplay_cubit/water_quality_desplay_cubit.dart';
import 'package:limix_test/core/cubit/water_quality_desplay_cubit/water_quality_desplay_state.dart';
import 'package:limix_test/features/categoris/widget/custom_app_bar.dart';
import 'package:limix_test/features/categoris/widget/custom_current_reading.dart';
import 'package:limix_test/features/categoris/widget/custom_historical_data.dart';
import 'package:limix_test/features/categoris/widget/custom_stat_card.dart';
import 'package:limix_test/features/categoris/widget/custom_trend_analysis.dart';

class PhLevel extends StatefulWidget {
  const PhLevel({super.key});

  @override
  State<PhLevel> createState() => _PhLevelState();
}

class _PhLevelState extends State<PhLevel> {
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
        title: 'pH Level',
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
                  value: '${data.ph}',
                  unit: 'pH',
                  status: 'Optimal',
                  range: '6.5-8.5 pH',
                  rate: '4.2%',
                  rateColor: const Color(0xFF00A63E),
                  icon: Icons.update,
                  iconColor: const Color(0xFF00A63E),
                  iconBgColor: const Color(0xFFDCFCE7),
                ),

                CustomHistoricalData(),

                CustomTrendAnalysis(
                  interval: 2,
                  herizontalInterval: 1.7,
                  maxY: 8,
                  lineColor: const Color(0xFF82B8FE),
                  gradientbeginColor:
                      const Color(0xFF3B82F6).withOpacity(0.3),
                  gradientEndColor:
                      const Color(0xFF3B82F6).withOpacity(0.0),

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
                  children: const [
                    CustomStatCard(title: 'Min', value: '6.5', unit: 'pH'),
                    CustomStatCard(title: 'Avg', value: '7.5', unit: 'pH'),
                    CustomStatCard(title: 'Max', value: '8.5', unit: 'pH'),
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

// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:limix_test/features/categoris/widget/custom_app_bar.dart';
// import 'package:limix_test/features/categoris/widget/custom_current_reading.dart';
// import 'package:limix_test/features/categoris/widget/custom_historical_data.dart';
// import 'package:limix_test/features/categoris/widget/custom_stat_card.dart';
// import 'package:limix_test/features/categoris/widget/custom_trend_analysis.dart';

// class PhLevel extends StatelessWidget {
//   const PhLevel({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: CustomAppBar(
//         title: 'pH Level',
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
//               value: '7.74',
//               unit: 'pH',
//               status: 'Optimal',
//               range: '6.5-8.5 pH',
//               rate: '4.2%',
//               rateColor: Color(0xFF00A63E),
//               icon: Icons.update,
//               iconColor: Color(0xFF00A63E),
//               iconBgColor: Color(0xFFDCFCE7),
//             ),
//             CustomHistoricalData(),

//             CustomTrendAnalysis(
//               interval: 2,
//               herizontalInterval: 1.7,
//               maxY: 8,
//               lineColor: Color(0xFF82B8FE),
//               gradientbeginColor: Color(0xFF3B82F6).withOpacity(0.3),
//               gradientEndColor: Color(0xFF3B82F6).withOpacity(0.0),
//               spots: [
//                 FlSpot(0, 5.5),
//                 FlSpot(4, 5.9),
//                 FlSpot(8, 5.7),
//                 FlSpot(12, 6.4),
//                 FlSpot(16, 6),
//                 FlSpot(20, 6.9),
//                 FlSpot(23, 5.2),
//               ],
//             ),

//             const SizedBox(height: 30),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomStatCard(title: 'Min', value: '6.5', unit: 'pH'),
//                 CustomStatCard(title: 'Avg', value: '7.5', unit: 'pH'),
//                 CustomStatCard(title: 'Max', value: '8.5', unit: 'pH'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
