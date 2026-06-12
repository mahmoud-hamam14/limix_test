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

class TemperatureView extends StatefulWidget {
  const TemperatureView({super.key});

  @override
  State<TemperatureView> createState() => _TemperatureViewState();
}

class _TemperatureViewState extends State<TemperatureView> {
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
        title: 'Temperature',
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
                  value: '${data.temperature}',
                  unit: '°C',
                  status: 'Optimal',
                  range: '24-28 °C',
                  rate: '2.4%',
                  rateColor: const Color(0xFFE7000B),
                  icon: Icons.update,
                  iconColor: const Color(0xFFE7000B),
                  iconBgColor: const Color(0xFFFFE2E2),
                ),

                CustomHistoricalData(),

                CustomTrendAnalysis(
                  interval: 8,
                  herizontalInterval: 6,
                  maxY: 32,
                  lineColor: const Color(0xFF82B8FE),
                  gradientbeginColor: const Color(0xFF3B82F6).withOpacity(0.3),
                  gradientEndColor: const Color(0xFF3B82F6).withOpacity(0.0),

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
                  children: const [
                    CustomStatCard(title: 'Min', value: '24', unit: '°C'),
                    CustomStatCard(title: 'Avg', value: '25', unit: '°C'),
                    CustomStatCard(title: 'Max', value: '28', unit: '°C'),
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

// class TemperatureView extends StatelessWidget {
//   const TemperatureView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: CustomAppBar(
//         title: 'Temperature',
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
//               value: '28.5',
//               unit: '°C',
//               status: 'Optimal',
//               range: '24-28 °C',
//               rate: '2.4%',
//               rateColor: Color(0xFFE7000B),
//               icon: Icons.update,
//               iconColor: Color(0xFFE7000B),
//               iconBgColor: Color(0xFFFFE2E2),
//             ),

//             CustomHistoricalData(),

//             CustomTrendAnalysis(
//               interval: 8,
//               herizontalInterval: 6,
//               maxY: 32,
//               lineColor: Color(0xFF82B8FE),
//               gradientbeginColor: Color(0xFF3B82F6).withOpacity(0.3),
//               gradientEndColor: Color(0xFF3B82F6).withOpacity(0.0),
//               spots: [
//                 FlSpot(0, 22),
//                 FlSpot(4, 21),
//                 FlSpot(8, 23),
//                 FlSpot(12, 22),
//                 FlSpot(16, 20),
//                 FlSpot(20, 23),
//                 FlSpot(23, 21),
//               ],
//             ),

//             const SizedBox(height: 30),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CustomStatCard(title: 'Min', value: '24', unit: '°C'),
//                 CustomStatCard(title: 'Avg', value: '25', unit: '°C'),
//                 CustomStatCard(title: 'Max', value: '28', unit: '°C'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
