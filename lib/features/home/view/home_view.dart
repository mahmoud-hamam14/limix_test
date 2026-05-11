// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limix_test/core/cubit/water_quality_desplay_cubit/water_quality_desplay_cubit.dart';
import 'package:limix_test/core/cubit/water_quality_desplay_cubit/water_quality_desplay_state.dart';
import 'package:limix_test/features/categoris/view/dissolved_oxygen.dart';
import 'package:limix_test/features/categoris/view/ec.dart';
import 'package:limix_test/features/categoris/view/ph_level.dart';
import 'package:limix_test/features/categoris/view/salinity.dart';
import 'package:limix_test/features/categoris/view/temperature.dart';
import 'package:limix_test/features/categoris/view/turbidity.dart';
import 'package:limix_test/features/home/models/container_model.dart';
import 'package:limix_test/features/home/widget/farm_overview_card.dart';
import 'package:limix_test/features/home/widget/pond_status_card.dart';
import 'package:limix_test/features/home/widget/recent_activity_card.dart';
import 'package:limix_test/features/home/widget/appbar_home_view.dart';
import 'package:limix_test/features/home/widget/custom_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: const AppBarHomeView(),
      ),
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            const Text(
              "Welcome back, Farmer",
              style: TextStyle(fontSize: 20, color: Color(0xff01378E)),
            ),

            const SizedBox(height: 4),

            const Text(
              "Here's your pond overview for today",
              style: TextStyle(color: Color(0xFF495464), fontSize: 18),
            ),

            const SizedBox(height: 16),

            SensorDisplaySection(),

            const SizedBox(height: 20),
            Text(
              'Pond Status',
              style: TextStyle(fontSize: 20, color: Color(0xff01378E)),
            ),
            const SizedBox(height: 15),

            PondStatusCard(
              title: 'Main pond',
              status: 'Optimal',
              temp: '26.5°C',
              oxygen: '8.2',
              ph: '7.3',
            ),
            const SizedBox(height: 20),
            Text(
              'Farm Overview',
              style: TextStyle(fontSize: 20, color: Color(0xff01378E)),
            ),
            const SizedBox(height: 15),
            FarmOverviewCard(
              fishCount: '~ 1,250',
              waterVolume: '5,000 L',
              usagePercent: 0.65,
            ),

            const SizedBox(height: 20),

            Text(
              'Recent Activity',
              style: TextStyle(fontSize: 20, color: Color(0xff01378E)),
            ),

            const SizedBox(height: 15),

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
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class SensorDisplaySection extends StatelessWidget {
  const SensorDisplaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterQualityDesplayCubit, WaterQualityDesplayState>(
      builder: (context, state) {
        // 🔹 Loading
        if (state is WaterQualityDesplayLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        // 🔹 Error
        if (state is WaterQualityDesplayError) {
          return Center(child: Text(state.message));
        }

        // 🔹 Success
        if (state is WaterQualityDesplaySuccess) {
          final data = state.data;

          return Column(
            children: [
              /// =========================
              /// First Row
              /// =========================
              Row(
                children: [
                  /// Temperature
                  Expanded(
                    child: CustomContainer(
                      container: ContainerModel(
                        icon: Icons.thermostat,
                        title: "Avg Temp",
                        value: data.temperature.toString(),
                        unit: "°C",
                        startColor: const Color(0xffFFFFFF),
                        endColor: const Color(0xffFEF3C7),
                        iconColor: Colors.orange,
                        iconBgColor: const Color(0xffFEF3C7),
                        valueColor: Colors.orange,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TemperatureView(),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(width: 15),

                  /// DO
                  Expanded(
                    child: CustomContainer(
                      container: ContainerModel(
                        icon: Icons.water_drop,
                        title: "Oxygen",
                        value: data.dissolvedOxygen.toString(),
                        unit: "mg/L",
                        startColor: const Color(0xffFFFFFF),
                        endColor: const Color(0xffDBEAFE),
                        iconColor: Colors.blue,
                        iconBgColor: const Color(0xffDBEAFE),
                        valueColor: Colors.blue,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DissolvedOxygen(),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(width: 15),

                  /// pH
                  Expanded(
                    child: CustomContainer(
                      container: ContainerModel(
                        icon: Icons.show_chart_outlined,
                        title: "pH Level",
                        value: data.ph.toString(),
                        unit: "pH",
                        startColor: const Color(0xffFFFFFF),
                        endColor: const Color(0xffE9D5FF),
                        iconColor: Colors.purple,
                        iconBgColor: const Color(0xffE9D5FF),
                        valueColor: Colors.purple,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const PhLevel()),
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// =========================
              /// Second Row
              /// =========================
              Row(
                children: [
                  /// Ammonia
                  Expanded(
                    child: CustomContainer(
                      container: ContainerModel(
                        icon: Icons.waves,
                        title: "Ammonia",
                        value: data.ammonia.toString(),
                        unit: "mg/L",
                        startColor: const Color(0xffFFFFFF),
                        endColor: const Color(0xffD1FAE5),
                        iconBgColor: const Color(0xffD1FAE5),
                        iconColor: Colors.green,
                        valueColor: Colors.green,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Salinity()),
                        );
                      },
                    ),
                  ),

                  const SizedBox(width: 15),

                  /// Turbidity
                  Expanded(
                    child: CustomContainer(
                      container: ContainerModel(
                        icon: Icons.speed_outlined,
                        title: "Turbidity",
                        value: data.turbidity.toString(),
                        unit: "NTU",
                        startColor: const Color(0xffFFFFFF),
                        endColor: const Color(0xffFEAAAB),
                        iconBgColor: const Color(0xffFED7AA),
                        iconColor: Color(0xffF67216),
                        valueColor: Color(0xffF67216),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Turbidity()),
                        );
                      },
                    ),
                  ),

                  const SizedBox(width: 15),

                  /// EC
                  Expanded(
                    child: CustomContainer(
                      container: ContainerModel(
                        icon: Icons.bolt_outlined,
                        title: "EC",
                        value: data.ec.toString(),
                        unit: "μS/cm",
                        startColor: const Color(0xffFFFFFF),
                        endColor: const Color(0xffFCE7F3),
                        iconColor: Colors.pinkAccent,
                        iconBgColor: const Color(0xffFCE7F3),
                        valueColor: Colors.pinkAccent,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Ec()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
