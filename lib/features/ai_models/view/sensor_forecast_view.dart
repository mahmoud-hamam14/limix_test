import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';
import 'package:limix_test/features/ai_models/widget/sensor_forcast_card.dart';

import '../../../core/constants/custom_appbar.dart';

class SensorForecastView extends StatelessWidget {
  const SensorForecastView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(
          title: 'Sensor Forecast',
          subTitle: 'AI-powered predictions',
          showBackButton: false,
          onTap: () {},
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.width),
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              SizedBox(height: 20.height),

              Container(
                height: 40.height,
                decoration: BoxDecoration(
                  color: const Color(0xffF1F1F1),
                  borderRadius: BorderRadius.circular(24.radius),
                ),

                child: TabBar(
                  dividerColor: Colors.transparent,

                  indicatorSize: TabBarIndicatorSize.tab,

                  labelPadding: EdgeInsets.symmetric(
                    horizontal: 8.width,
                    vertical: 4.height,
                  ),

                  indicator: BoxDecoration(
                    color: const Color(0xff224B8F),

                    borderRadius: BorderRadius.circular(20),

                    border: Border.all(
                      color: const Color(0xff224B8F),
                      width: 1.27,
                    ),
                  ),

                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,

                  labelStyle: TextStyle(
                    fontSize: 12.font,
                    fontWeight: FontWeight.w500,
                  ),

                  unselectedLabelStyle: TextStyle(
                    fontSize: 10.font,
                    fontWeight: FontWeight.w500,
                  ),

                  tabs: const [
                    Tab(text: "24 Hours"),
                    Tab(text: "Week"),
                    Tab(text: "Month"),
                  ],
                ),
              ),

              SizedBox(height: 20.height),

              /// Content
              Expanded(
                child: TabBarView(
                  children: [
                    /// 24 Hours
                    ListView(
                      children: const [
                        SizedBox(height: 5),
                        SensorForcastCard(
                          borderColor: Color(0xFFFF6900),
                          title: 'Temperature',
                          currentValue: '26.5°C',
                          forecastValue: '28.5°C',
                          change: '+2.0°C',
                          changeColor: Color(0xFF009966),
                          trendIcon: Icons.trending_up,
                        ),
                        SensorForcastCard(
                          borderColor: Color(0xFFA855F7),
                          title: 'pH Level',
                          currentValue: '7.2',
                          forecastValue: '7',
                          change: '-0.2',
                          changeColor: Color(0xFF155DFC),
                          trendIcon: Icons.trending_down,
                        ),
                        SensorForcastCard(
                          borderColor: Color(0xFF00B8DB),
                          title: 'Dissolved Oxygen',
                          currentValue: '6.8 mg/L',
                          forecastValue: '7.2 mg/L',
                          change: '+0.4 mg/L',
                          changeColor: Color(0xFF009966),
                          trendIcon: Icons.trending_up,
                        ),
                        SensorForcastCard(
                          borderColor: Color(0xFF10B981),
                          title: 'Ammonia',
                          currentValue: '15 mg/L',
                          forecastValue: '16 mg/L',
                          change: '+1 mg/L',
                          changeColor: Color(0xFF009966),
                          trendIcon: Icons.trending_up,
                        ),
                        SensorForcastCard(
                          borderColor: Color(0xFFFEAAAB),
                          title: 'Turbidity',
                          currentValue: '12 NTU',
                          forecastValue: '10 NTU',
                          change: '-2.0 NTU',
                          changeColor: Color(0xFF155DFC),
                          trendIcon: Icons.trending_down,
                        ),
                        SensorForcastCard(
                          borderColor: Color(0xFFEC4899),
                          title: 'Electrical Conductivity',
                          currentValue: '24.5 mS/cm',
                          forecastValue: '25.5 mS/cm',
                          change: '+1.0 mS/cm',
                          changeColor: Color(0xFF009966),
                          trendIcon: Icons.trending_up,
                        ),
                      ],
                    ),

                    /// Week
                    ListView(
                      children: const [
                        SizedBox(height: 5),

                        SensorForcastCard(
                          borderColor: Color(0xFFFF6900),
                          title: 'Temperature',
                          currentValue: '26.5°C',
                          forecastValue: '28.5°C',
                          change: '+2.0°C',
                          changeColor: Color(0xFF009966),
                          trendIcon: Icons.trending_up,
                        ),
                        SensorForcastCard(
                          borderColor: Color(0xFFA855F7),
                          title: 'pH Level',
                          currentValue: '7.2',
                          forecastValue: '7',
                          change: '-0.2',
                          changeColor: Color(0xFF155DFC),
                          trendIcon: Icons.trending_down,
                        ),
                        SensorForcastCard(
                          borderColor: Color(0xFF00B8DB),
                          title: 'Dissolved Oxygen',
                          currentValue: '6.8 mg/L',
                          forecastValue: '7.2 mg/L',
                          change: '+0.4 mg/L',
                          changeColor: Color(0xFF009966),
                          trendIcon: Icons.trending_up,
                        ),
                        SensorForcastCard(
                          borderColor: Color(0xFF10B981),
                          title: 'Ammonia',
                          currentValue: '15 mg/L',
                          forecastValue: '16 mg/L',
                          change: '+1 mg/L',
                          changeColor: Color(0xFF009966),
                          trendIcon: Icons.trending_up,
                        ),
                        SensorForcastCard(
                          borderColor: Color(0xFFFEAAAB),
                          title: 'Turbidity',
                          currentValue: '12 NTU',
                          forecastValue: '10 NTU',
                          change: '-2.0 NTU',
                          changeColor: Color(0xFF155DFC),
                          trendIcon: Icons.trending_down,
                        ),
                        SensorForcastCard(
                          borderColor: Color(0xFFEC4899),
                          title: 'Electrical Conductivity',
                          currentValue: '24.5 mS/cm',
                          forecastValue: '25.5 mS/cm',
                          change: '+1.0 mS/cm',
                          changeColor: Color(0xFF009966),
                          trendIcon: Icons.trending_up,
                        ),
                      ],
                    ),

                    /// Month
                    ListView(
                      children: const [
                        SizedBox(height: 5),

                        SensorForcastCard(
                          borderColor: Color(0xFFFF6900),
                          title: 'Temperature',
                          currentValue: '26.5°C',
                          forecastValue: '28.5°C',
                          change: '+2.0°C',
                          changeColor: Color(0xFF009966),
                          trendIcon: Icons.trending_up,
                        ),
                        SensorForcastCard(
                          borderColor: Color(0xFFA855F7),
                          title: 'pH Level',
                          currentValue: '7.2',
                          forecastValue: '7',
                          change: '-0.2',
                          changeColor: Color(0xFF155DFC),
                          trendIcon: Icons.trending_down,
                        ),
                        SensorForcastCard(
                          borderColor: Color(0xFF00B8DB),
                          title: 'Dissolved Oxygen',
                          currentValue: '6.8 mg/L',
                          forecastValue: '7.2 mg/L',
                          change: '+0.4 mg/L',
                          changeColor: Color(0xFF009966),
                          trendIcon: Icons.trending_up,
                        ),
                        SensorForcastCard(
                          borderColor: Color(0xFF10B981),
                          title: 'Ammonia',
                          currentValue: '15 mg/L',
                          forecastValue: '16 mg/L',
                          change: '+1 mg/L',
                          changeColor: Color(0xFF009966),
                          trendIcon: Icons.trending_up,
                        ),
                        SensorForcastCard(
                          borderColor: Color(0xFFFEAAAB),
                          title: 'Turbidity',
                          currentValue: '12 NTU',
                          forecastValue: '10 NTU',
                          change: '-2.0 NTU',
                          changeColor: Color(0xFF155DFC),
                          trendIcon: Icons.trending_down,
                        ),
                        SensorForcastCard(
                          borderColor: Color(0xFFEC4899),
                          title: 'Electrical Conductivity',
                          currentValue: '24.5 mS/cm',
                          forecastValue: '25.5 mS/cm',
                          change: '+1.0 mS/cm',
                          changeColor: Color(0xFF009966),
                          trendIcon: Icons.trending_up,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
