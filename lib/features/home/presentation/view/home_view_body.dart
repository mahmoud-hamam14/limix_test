import 'package:flutter/material.dart';
// import 'package:limix_test/features/ai_models/widget/custom_container.dart';
import 'package:limix_test/features/home/presentation/view/widget/container_model.dart';
import 'package:limix_test/features/home/presentation/view/widget/custom_container.dart';
import 'package:limix_test/features/home/presentation/view/widget/farm_overview_card.dart';
import 'package:limix_test/features/home/presentation/view/widget/pond_status_card.dart';
import 'package:limix_test/features/home/presentation/view/widget/recent_activity_card.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/dissolved_oxygen.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/ec.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/ph_level.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/salinity.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/temperature.dart';
import 'package:limix_test/features/home/presentation/view/water_quality_display_view/presentation/view/turbidity.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    
          Row(
            children: [
              Expanded(
                child: CustomContainer(
                  container: ContainerModel(
                    icon: Icons.thermostat,
                    title: "Avg Temp",
                    value: "26",
                    unit: "°C",
                    startColor: Color(0xffFFFFFF),
                    endColor: Color(0xffFEF3C7),
                    iconColor: Colors.orange,
                    iconBgColor: Color(0xffFEF3C7),
                    valueColor: Colors.orange,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TemperatureView(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: CustomContainer(
                  container: ContainerModel(
                    icon: Icons.water_drop,
                    title: "Oxygen",
                    value: "7.5",
                    unit: "mg/L",
                    startColor: Color(0xffFFFFFF),
                    endColor: Color(0xffDBEAFE),
                    iconColor: Colors.blue,
                    iconBgColor: Color(0xffDBEAFE),
                    valueColor: Colors.blue,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DissolvedOxygen(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: CustomContainer(
                  container: ContainerModel(
                    icon: Icons.show_chart_outlined,
                    title: "pH Level",
                    value: "7.5",
                    unit: "pH",
                    startColor: Color(0xffFFFFFF),
                    endColor: Color(0xffE9D5FF),
                    iconColor: Colors.purple,
                    iconBgColor: Color(0xffE9D5FF),
                    valueColor: Colors.purple,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PhLevel()),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
    
          Row(
            children: [
              Expanded(
                child: CustomContainer(
                  container: ContainerModel(
                    icon: Icons.waves,
                    title: "Salinty",
                    value: "32",
                    unit: "ppt",
                    startColor: Color(0xffFFFFFF),
                    endColor: Color(0xffD1FAE5),
                    iconBgColor: Color(0xffD1FAE5),
                    iconColor: Colors.green,
                    valueColor: Colors.green,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Salinity()),
                    );
                  },
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: CustomContainer(
                  container: ContainerModel(
                    icon: Icons.speed_outlined,
                    title: "Turbidity",
                    value: "12",
                    unit: "NTU",
                    startColor: Color(0xffFFFFFF),
                    endColor: Color(0xffFEAAAB),
                    iconBgColor: Color(0xffFED7AA),
                    iconColor: Color(0xffF67216),
                    valueColor: Color(0xffF67216),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Turbidity()),
                    );
                  },
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: CustomContainer(
                  container: ContainerModel(
                    icon: Icons.bolt_outlined,
                    title: "EC",
                    value: "485",
                    unit: "μS/cm",
                    startColor: Color(0xffFFFFFF),
                    endColor: Color(0xffFCE7F3),
                    iconColor: Colors.pinkAccent,
                    iconBgColor: Color(0xffFCE7F3),
                    valueColor: Colors.pinkAccent,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Ec()),
                    );
                  },
                ),
              ),
            ],
          ),
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
    );
  }
}
