import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomTrendAnalysis extends StatelessWidget {
  const CustomTrendAnalysis({
    super.key,
    required this.interval,
    required this.maxY,
    required this.herizontalInterval,
    required this.lineColor,
    required this.gradientbeginColor,
    required this.gradientEndColor,
    required this.spots,
  });

  final double interval;
  final double maxY;
  final double herizontalInterval;
  final Color lineColor;
  final Color gradientbeginColor;
  final Color gradientEndColor;

  final List<FlSpot> spots;


  @override
  Widget build(BuildContext context) {
    ////////////////////////////////
    return Container(
      padding: const EdgeInsets.all(25),
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      ////////////////////////////////////
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trend Analysis',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF224B8F),
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 40),

          Expanded(
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 23,
                minY: 0,
                maxY: maxY, ///////////////////////////////////////
                // Grid
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  // verticalInterval: 4,
                  drawHorizontalLine: true,
                  horizontalInterval:
                      herizontalInterval, /////////////////////////
                ),

                // Borders
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    bottom: BorderSide(color: Color(0xFF9CA3AF), width: 1),
                    left: BorderSide(color: Color(0xFF9CA3AF), width: 1),

                    // دول هنخليهم شفافين علشان يختفوا
                    top: BorderSide(color: Colors.transparent, width: 0),
                    right: BorderSide(color: Colors.transparent, width: 0),
                  ),
                ),

                // Axis Titles (X & Y)
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 4,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          "${value.toInt()}h",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF9CA3AF),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval:
                          interval, ///////////////////////////////////////
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,

                            color: Color(0xFF9CA3AF),
                          ),
                        );
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

                // Chart Data
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    barWidth: 3,
                    color: lineColor, /////////////////////////////
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          gradientbeginColor, /////////////////////////////////
                          gradientEndColor, //////////////////////////////////
                        ],
                      ),
                    ),
                    dotData: FlDotData(show: false),
                    spots: spots,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    // );
  }
}
