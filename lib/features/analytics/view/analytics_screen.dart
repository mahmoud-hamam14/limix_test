import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:limix_test/features/analytics/widget/farm_overview_widget.dart';
import 'package:limix_test/features/analytics/widget/sensor_performance_widget.dart';


class AnalyticsScreen extends StatefulWidget {
   AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff224B8F),
         leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Analytics",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Performance insights",
              style: TextStyle(
                color: Colors.white60,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
       // centerTitle: true,
       
        elevation: 0,
      ),
      body: SingleChildScrollView(
  child: Column(
    children: [
      SizedBox(height: 30),
      Padding(
        padding: const EdgeInsets.only(left: 47),
        child: SizedBox(
                width: 330, // adjust total width as needed
                height: 36,
                child: Stack(
                  children: [
                    // background
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffF3F4F6),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    // moving thumb
                    AnimatedAlign(
                      alignment: selectedValue == 1
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      child: Container(
                        width: 161.21, // same fixed width as thumb in your original
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xff224B8F),
                          borderRadius: BorderRadius.circular(30),
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
                            borderRadius: BorderRadius.circular(30),
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  // color depends on selected
                                  color: selectedValue == 1
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
                            borderRadius: BorderRadius.circular(30),
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: selectedValue == 2
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
            ),
            const SizedBox(height: 20),

            if (selectedValue == 1)
               FarmOverviewWidget()
            else
              SensorPerformanceWidget(),
      
    ]
  )
      ),
      
    );
  }
}