import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';
import 'package:limix_test/features/ai_models/view/biomass_view.dart';
import 'package:limix_test/features/ai_models/view/fish_recommendations_view.dart';
import 'package:limix_test/features/ai_models/view/sensor_forecast_view.dart';
import 'package:limix_test/features/ai_models/widget/custom_container.dart';

import '../../../core/constants/custom_appbar.dart';
import 'fish_disease_screen.dart';

class AiModelScreen extends StatelessWidget {
  const AiModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(
          title: "AI Models",
          subTitle: "Advanced fish farming intelligence",
          showBackButton: false,
          onTap: () {},
          iconBgColor: Colors.white.withOpacity(0.2),
          icon: Icons.psychology_outlined,
          iconColor: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.height),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.height),

              CustomContainer(
                title: "Fish Disease Detection",
                subTitle: "Identify diseases from images",
                value: "5",
                icon: Icons.medication_rounded,
                iconColor: Color(0xffEF4444),
                borderColor: Color(0xffFB2C36),
                buttonColor: Color(0xffFB2C36),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FishDiseaseScreen(),
                    ),
                  );
                },
                backgroundColor: Color(0xffFFE2E2),
                valueName: "Detected:",
                valueColor: Color(0xffFB2C36),
              ),

              SizedBox(height: 16.height),

              CustomContainer(
                title: "Fish species Recommendations",
                subTitle: "recommend different species",
                value: "4      ",
                icon: Icons.water_drop_outlined,
                iconColor: Color(0xff3B82F6),
                borderColor: Color(0xff2B7FFF),
                buttonColor: Color(0xff2B7FFF),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FishRecommendationsView(),
                    ),
                  );
                },
                backgroundColor: Color(0xffDBEAFE),
                valueName: "Found:",
                valueColor: Color(0xff2B7FFF),
              ),

              SizedBox(height: 16.height),

              CustomContainer(
                title: "Sensor Forecast",
                subTitle: "Predict future readings",
                value: " 7d    ",
                icon: Icons.stacked_line_chart,
                iconColor: Color(0xffF59E0B),
                borderColor: Color(0xffFE9A00),
                buttonColor: Color(0xffFE9A00),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SensorForecastView(),
                    ),
                  );
                },
                backgroundColor: Color(0xffFEF3C6),
                valueName: "Period:",
                valueColor: Color(0xffFE9A00),
              ),

              SizedBox(height: 16.height),

              CustomContainer(
                title: "Biomass & Activity",
                subTitle: "Real-time monitoring",
                value: " 1.2k    ",
                icon: Icons.balance_outlined,
                iconColor: Color(0xff8B5CF6),
                borderColor: Color(0xff8E51FF),
                buttonColor: Color(0xff8E51FF),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BiomassView()),
                  );
                },
                backgroundColor: Color(0xffEDE9FE),
                valueName: "Total::",
                valueColor: Color(0xff8E51FF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
