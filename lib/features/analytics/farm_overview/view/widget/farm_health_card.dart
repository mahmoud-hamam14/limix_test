import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class FarmHealthCard extends StatelessWidget {
  const FarmHealthCard({super.key});

  @override
  Widget build(BuildContext Ccontext) {
    final List<String> titles = [
      'Water Quality',
      'Temperature',
      'Oxygen',
      'pH Balance',
      'Productivity',
      'Efficiency',
    ];

    final List<double> dataPoints = [
      80, // Water Quality
      65, // Temperature
      70, // Oxygen
      60, // pH Balance
      85, // Productivity
      90, // Efficiency
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border(top: BorderSide(color: Color(0xffF3F4F6))),
      
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000), // اللون (#0000001A)
        offset: Offset(0, 1),     // (0px, 1px)
        blurRadius: 2.0,          // (2px)
        spreadRadius: -1.0,       // (-1px)
      ),
      
      BoxShadow(
        color: Color(0x1A000000), // اللون (#0000001A)
        offset: Offset(0, 1),     // (0px, 1px)
        blurRadius: 3.0,          // (3px)
        spreadRadius: 0.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Farm Health Score",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF224B8F),
            ),
          ),
          const SizedBox(height: 24),
          AspectRatio(
            aspectRatio: 1.3,
            child: RadarChart(
              RadarChartData(
              
                radarShape: RadarShape.polygon,
              
                tickCount: 5,
                ticksTextStyle:
                    const TextStyle(color: Colors.grey, fontSize: 10),
                tickBorderData: BorderSide(color: Colors.grey[300]!, width: 1),

              
                titleTextStyle: const TextStyle(
                  color: Color(0xff808080),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                getTitle: (index, angle) {
                  return RadarChartTitle(
                    text: titles[index],
                    angle: angle,
                  );
                },

                
                gridBorderData: BorderSide(color: Colors.grey[300]!, width: 2),

                
                dataSets: [
                  RadarDataSet(
                    fillColor: Colors.blue.withOpacity(0.3),
                    borderColor: Colors.blue,
                    borderWidth: 2,
                    entryRadius: 0,
                    dataEntries: dataPoints
                        .map((point) => RadarEntry(value: point))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}