// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:limix_test/features/ai_assistant/view/ai_assistant_screen.dart';
import 'package:limix_test/features/categoris/view/dissolved_oxygen.dart';
import 'package:limix_test/features/categoris/view/ec.dart';
import 'package:limix_test/features/categoris/view/ph_level.dart';
import 'package:limix_test/features/categoris/view/salinity.dart';
import 'package:limix_test/features/categoris/view/temperature.dart';
import 'package:limix_test/features/categoris/view/turbidity.dart';

import 'package:limix_test/features/home/models/container_model.dart';
import 'package:limix_test/features/home/models/quick_actions_model.dart';

import 'package:limix_test/features/home/view/avg_temp_view.dart';

import 'package:limix_test/features/home/widget/appbar_home_view.dart';
import 'package:limix_test/features/home/widget/custom_container.dart';
import 'package:limix_test/features/home/widget/custom_quick_actions.dart';
import 'package:limix_test/features/home/widget/farm_overview_card.dart';
import 'package:limix_test/features/home/widget/pond_status_card.dart';
import 'package:limix_test/features/home/widget/recent_activity_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: PreferredSize(
        preferredSize:
        const Size.fromHeight(
          kToolbarHeight,
        ),

        child: const AppBarHomeView(),
      ),

      body: Stack(
        children: [

          /// Home Content
          SingleChildScrollView(

            padding:
            const EdgeInsets.symmetric(
              horizontal: 16,
            ),

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                const SizedBox(height: 16),

                const Text(
                  "Welcome back, Farmer",

                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff01378E),
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  "Here's your pond overview for today",

                  style: TextStyle(
                    color: Color(0xFF495464),
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 16),

                /// First Row
                Row(
                  children: [

                    Expanded(
                      child: CustomContainer(

                        container:
                        ContainerModel(

                          icon:
                          Icons.thermostat,

                          title: "Avg Temp",

                          value: "26",

                          unit: "°C",

                          startColor:
                          const Color(
                              0xffFFFFFF),

                          endColor:
                          const Color(
                              0xffFEF3C7),

                          iconColor:
                          Colors.orange,

                          iconBgColor:
                          const Color(
                              0xffFEF3C7),

                          valueColor:
                          Colors.orange,
                        ),

                        onTap: () {

                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                  TemperatureView(),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: CustomContainer(

                        container:
                        ContainerModel(

                          icon:
                          Icons.water_drop,

                          title: "Oxygen",

                          value: "7.5",

                          unit: "mg/L",

                          startColor:
                          const Color(
                              0xffFFFFFF),

                          endColor:
                          const Color(
                              0xffDBEAFE),

                          iconColor:
                          Colors.blue,

                          iconBgColor:
                          const Color(
                              0xffDBEAFE),

                          valueColor:
                          Colors.blue,
                        ),

                        onTap: () {

                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                  DissolvedOxygen(),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: CustomContainer(

                        container:
                        ContainerModel(

                          icon:
                          Icons.show_chart_outlined,

                          title: "pH Level",

                          value: "7.5",

                          unit: "pH",

                          startColor:
                          const Color(
                              0xffFFFFFF),

                          endColor:
                          const Color(
                              0xffE9D5FF),

                          iconColor:
                          Colors.purple,

                          iconBgColor:
                          const Color(
                              0xffE9D5FF),

                          valueColor:
                          Colors.purple,
                        ),

                        onTap: () {

                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                  PhLevel(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// Second Row
                Row(
                  children: [

                    Expanded(
                      child: CustomContainer(

                        container:
                        ContainerModel(

                          icon: Icons.waves,

                          title: "Ammonia",

                          value: "32",

                          unit: "mg/L",

                          startColor:
                          const Color(
                              0xffFFFFFF),

                          endColor:
                          const Color(
                              0xffD1FAE5),

                          iconBgColor:
                          const Color(
                              0xffD1FAE5),

                          iconColor:
                          Colors.green,

                          valueColor:
                          Colors.green,
                        ),

                        onTap: () {

                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                  Salinity(),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: CustomContainer(

                        container:
                        ContainerModel(

                          icon:
                          Icons.speed_outlined,

                          title: "Turbidity",

                          value: "12",

                          unit: "NTU",

                          startColor:
                          const Color(
                              0xffFFFFFF),

                          endColor:
                          const Color(
                              0xffFEAAAB),

                          iconBgColor:
                          const Color(
                              0xffFED7AA),

                          iconColor:
                          const Color(
                              0xffF67216),

                          valueColor:
                          const Color(
                              0xffF67216),
                        ),

                        onTap: () {

                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                  Turbidity(),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: CustomContainer(

                        container:
                        ContainerModel(

                          icon:
                          Icons.bolt_outlined,

                          title: "EC",

                          value: "485",

                          unit: "μS/cm",

                          startColor:
                          const Color(
                              0xffFFFFFF),

                          endColor:
                          const Color(
                              0xffFCE7F3),

                          iconColor:
                          Colors.pinkAccent,

                          iconBgColor:
                          const Color(
                              0xffFCE7F3),

                          valueColor:
                          Colors.pinkAccent,
                        ),

                        onTap: () {

                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                  Ec(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                const Text(
                  'Water Quality',

                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff01378E),
                  ),
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

                const Text(
                  'Farm Overview',

                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff01378E),
                  ),
                ),

                const SizedBox(height: 15),

                FarmOverviewCard(
                  fishCount: '~ 1,250',
                  waterVolume: '5,000 L',
                  usagePercent: 0.65,
                ),

                const SizedBox(height: 20),

                const Text(
                  'Recent Activity',

                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff01378E),
                  ),
                ),

                const SizedBox(height: 15),

                RecentActivityCard(
                  activities: [

                    ActivityItem(
                      color: Colors.green,
                      title:
                      'Water quality test completed',
                      time: '2 hrs ago',
                    ),

                    ActivityItem(
                      color: Colors.blue,
                      title:
                      'Temperature adjusted',
                      time: '5 hrs ago',
                    ),

                    ActivityItem(
                      color: Colors.yellow,
                      title:
                      'Daily feeding schedule completed',
                      time: '1 day ago',
                    ),
                  ],
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),

          /// Chat Bot Floating Button
          Positioned(
            bottom: 20,
            right: 20,

            child: GestureDetector(

              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AiAssistantScreen()),
                );
              },

              child: Container(

                width: 68,
                height: 68,

                decoration: BoxDecoration(

                  shape: BoxShape.circle,

                  gradient:
                  const LinearGradient(
                    colors: [
                      Color(0xff2457C5),
                      Color(0xff4F7DFF),
                    ],
                  ),

                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),

                  boxShadow: [

                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 12,
                      offset: Offset(0, 5),
                    ),

                    BoxShadow(
                      color: Color(0xff2457C5)
                          .withOpacity(0.35),

                      blurRadius: 18,
                      spreadRadius: 2,
                    ),
                  ],
                ),

                child: const Icon(
                  Icons.smart_toy,
                  color: Colors.white,
                  size: 34,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}