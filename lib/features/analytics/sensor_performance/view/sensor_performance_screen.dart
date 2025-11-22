import 'package:flutter/material.dart';
import 'package:limix_test/features/analytics/sensor_performance/view/widget/chart_card.dart';
import 'package:limix_test/features/analytics/sensor_performance/view/widget/sensor_card.dart';

class SensorPerformanceScreen extends StatelessWidget {
  const SensorPerformanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SensorCard(
          sensorName: "Temperature Sensor", 
          accuracy: "98%",
           upTime: "99.8%",
            alarts: "3",
            ),
        SizedBox(height: 12),
        SensorCard(
          sensorName: "pH Sensor", 
          accuracy: "96%",
           upTime: "99.5%",
            alarts: "5",
            ),
        SizedBox(height: 12),
        SensorCard(
          sensorName: "DO Sensor", 
          accuracy: "97%",
           upTime: "99.9%",
            alarts: "2",
            ),
            SizedBox(height: 12),
            SensorCard(
              sensorName: "Salinity Sensor", 
              accuracy: "95%",
               upTime: "98.5%",
                alarts: "7"
                ),
                SizedBox(height: 12),
                SensorCard( 
                  sensorName: "Turbidity Sensor", 
                  accuracy: "94%",
                   upTime: "99.2%",
                    alarts: "4",
                    ),
                    const SizedBox(height: 25),
                   SensorAccuracyChart(),
      ],
    );
  }
}