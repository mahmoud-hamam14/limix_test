import 'package:flutter/material.dart';
import 'package:limix_test/core/constants/custom_appbar.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';
import 'package:limix_test/features/analytics/farm_overview/view/widget/farm_overview_widget.dart';
import 'package:limix_test/features/analytics/sensor_performance/view/sensor_performance_screen.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(
          title: 'analytics',
          subTitle: "Performance insights",
          showBackButton: false,
          onTap: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.width),
          child: Column(
            children: [
              SizedBox(height: 25.height),
              SizedBox(
                width: 400.width,
                height: 40.height,
                child: Stack(
                  children: [
                    // background
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffF3F4F6),
                        borderRadius: BorderRadius.circular(30.radius),
                      ),
                    ),
                    // moving thumb
                    AnimatedAlign(
                      alignment:
                          selectedValue == 1
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      child: Container(
                        width: 170.width, //
                        decoration: BoxDecoration(
                          color: const Color(0xff224B8F),
                          borderRadius: BorderRadius.circular(30.radius),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.white24,
                              blurRadius: 4.0,
                              spreadRadius: 0.5,
                              offset: Offset(0.0, 2.0),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: const SizedBox.shrink(), // visual thumb only
                      ),
                    ),

                    // touch areas & texts
                    Row(
                      children: [
                        // left segment
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(30.radius),
                            onTap: () {
                              setState(() {
                                selectedValue = 1;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              // make text above thumb by using transparent bg
                              child: Text(
                                'Farm Overview',
                                style: TextStyle(
                                  fontSize:
                                      selectedValue == 1 ? 14.font : 13.font,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      selectedValue == 1
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // right segment
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(30.radius),
                            onTap: () {
                              setState(() {
                                selectedValue = 2;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Sensor Performance',
                                style: TextStyle(
                                  fontSize:
                                      selectedValue == 2 ? 14.font : 13.font,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      selectedValue == 2
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.height),
              if (selectedValue == 1)
                FarmOverviewWidget()
              else
                SensorPerformanceScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
