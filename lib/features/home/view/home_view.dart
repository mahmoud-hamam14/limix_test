import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limix_test/core/cubit/water_quality_desplay_cubit/water_quality_desplay_cubit.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';
import 'package:limix_test/features/home/widget/ai_assistant_button.dart';
import 'package:limix_test/features/home/widget/appbar_home_view.dart';
import 'package:limix_test/features/home/widget/farm_overview_card.dart';
import 'package:limix_test/features/home/widget/pond_status_card.dart';
import 'package:limix_test/features/home/widget/recent_activity_card.dart';
import 'package:limix_test/features/home/widget/sensor_display_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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

      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarHomeView(),
      ),

      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 12),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                Text(
                  "Welcome back, Farmer",
                  style: TextStyle(
                    fontSize: 18.font,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff01378E),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                Text(
                  "Here's your pond overview for today",
                  style: TextStyle(
                    color: const Color(0xFF495464),
                    fontSize: 16.font,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                SensorDisplaySection(),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                Text(
                  'Water Quality',
                  style: TextStyle(
                    fontSize: 20.font,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff01378E),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                PondStatusCard(
                  title: 'Main pond',
                  status: 'Optimal',
                  temp: '26.5°C',
                  oxygen: '8.2',
                  ph: '7.3',
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                Text(
                  'Farm Overview',
                  style: TextStyle(
                    fontSize: 20.font,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff01378E),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                FarmOverviewCard(
                  fishCount: '~ 1,250',
                  waterVolume: '5,000 L',
                  usagePercent: 0.65,
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                Text(
                  'Recent Activity',
                  style: TextStyle(
                    fontSize: 20.font,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff01378E),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                RecentActivityCard(
                  activities: [
                    ActivityItem(
                      color: Colors.green,
                      title: 'Water quality test completed',
                      time: '2 hrs ago',
                    ),
                    ActivityItem(
                      color: Colors.blue,
                      title: 'Temperature adjusted',
                      time: '5 hrs ago',
                    ),
                    ActivityItem(
                      color: Colors.yellow,
                      title: 'Daily feeding schedule completed',
                      time: '1 day ago',
                    ),
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ],
            ),
          ),

          AiAssistantButton(),
        ],
      ),
    );
  }
}
