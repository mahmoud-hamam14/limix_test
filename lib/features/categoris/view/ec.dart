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

class Ec extends StatefulWidget {
  const Ec({super.key});

  @override
  State<Ec> createState() => _EcState();
}

class _EcState extends State<Ec> {
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
        title: 'Electrical Conductivity',
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
                  value: '${data.ec}',
                  unit: 'μS/cm',
                  status: 'Optimal',
                  range: '150-500 μS/cm',
                  rate: '7.6%',
                  rateColor: const Color(0xFF00A63E),
                  icon: Icons.update,
                  iconColor: const Color(0xFF00A63E),
                  iconBgColor: const Color(0xFFDCFCE7),
                ),

                CustomHistoricalData(),

                CustomTrendAnalysis(
                  interval: 150,
                  herizontalInterval: 120,
                  maxY: 600,
                  lineColor: const Color(0xFF82B8FE),
                  gradientbeginColor: const Color(0xFF3B82F6).withOpacity(0.3),
                  gradientEndColor: const Color(0xFF3B82F6).withOpacity(0.0),

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
                  children: const [
                    CustomStatCard(title: 'Min', value: '150', unit: 'μS/cm'),
                    CustomStatCard(title: 'Avg', value: '275', unit: 'μS/cm'),
                    CustomStatCard(title: 'Max', value: '500', unit: 'μS/cm'),
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

// class Ec extends StatelessWidget {
//   const Ec({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: CustomAppBar(
//         title: 'Electrical Conductivity',
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
//               value: '544.09',
//               unit: 'μS/cm',
//               status: 'Optimal',
//               range: '150-500 μS/cm',
//               rate: '7.6%',
//               rateColor: Color(0xFF00A63E),
//               icon: Icons.update,
//               iconColor: Color(0xFF00A63E),
//               iconBgColor: Color(0xFFDCFCE7),
//             ),
//             CustomHistoricalData(),

//             CustomTrendAnalysis(
//               interval: 150,
//               herizontalInterval: 120,
//               maxY: 600,
//               lineColor: Color(0xFF82B8FE),
//               gradientbeginColor: Color(0xFF3B82F6).withOpacity(0.3),
//               gradientEndColor: Color(0xFF3B82F6).withOpacity(0.0),
//               spots: [
//                 FlSpot(0, 460),
//                 FlSpot(2, 520),
//                 FlSpot(4, 500),
//                 FlSpot(6, 450),
//                 FlSpot(8, 480),
//                 FlSpot(10, 520),
//                 FlSpot(12, 520),
//                 FlSpot(14, 470),
//                 FlSpot(16, 530),
//                 FlSpot(18, 520),
//                 FlSpot(20, 520),
//                 FlSpot(22, 510),
//                 FlSpot(23, 550),
//               ],
//             ),

//             const SizedBox(height: 30),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomStatCard(title: 'Min', value: '150', unit: 'μS/cm'),
//                 CustomStatCard(title: 'Avg', value: '275', unit: 'μS/cm'),
//                 CustomStatCard(title: 'Max', value: '500', unit: 'μS/cm'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
