import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

class SensorAccuracyChart extends StatelessWidget {
  const SensorAccuracyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 360.height,
      padding: EdgeInsets.all(16.radius),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.radius),
        border: Border.all(color: const Color(0xFFF3F4F6), width: 1.27),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 1),
            blurRadius: 3,
            spreadRadius: -1,
          ),
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 1),
            blurRadius: 2,
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sensor Accuracy Comparison",
            style: TextStyle(
              color: Color(0xFF224B8F),
              fontFamily: 'Inter',
              fontSize: 16.font,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20.height),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1.3.radius,
              child: BarChart(
                BarChartData(
                  borderData: FlBorderData(show: true),
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 2,
                        reservedSize: 22.width,
                        getTitlesWidget: (value, meta) {
                          if (value % 2 == 0 && value >= 90 && value <= 100) {
                            return Text(
                              value.toInt().toString(),
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const sensors = [
                            'Temp',
                            'pH',
                            'DO',
                            'Amonia',
                            'Turbidity',
                          ];
                          if (value >= 0 && value < sensors.length) {
                            return Text(
                              sensors[value.toInt()],
                              style: TextStyle(
                                fontSize: 10.font,
                                color: Colors.black54,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          toY: 98,
                          color: Color(0xFF224B8F),
                          width: 20,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          toY: 96,
                          color: Color(0xFF224B8F),
                          width: 20,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(
                          toY: 97,
                          color: Color(0xFF224B8F),
                          width: 20,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(
                          toY: 95,
                          color: Color(0xFF224B8F),
                          width: 20,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 4,
                      barRods: [
                        BarChartRodData(
                          toY: 94,
                          color: Color(0xFF224B8F),
                          width: 20,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    ),
                  ],
                  minY: 90,
                  maxY: 100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
