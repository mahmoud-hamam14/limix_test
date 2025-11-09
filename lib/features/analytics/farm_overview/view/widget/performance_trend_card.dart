import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class PerformanceTrendCard extends StatelessWidget {
  const PerformanceTrendCard({super.key});

  static const Color efficiencyColor = Color(0xFF0D47A1);
  static const Color qualityColor = Color(0xFF64B5F6);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
            "6-Month Performance Trend",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF224B8F),
            ),
          ),
          const SizedBox(height: 32),
          AspectRatio(
            aspectRatio: 1.7,
            child: LineChart(
              LineChartData(
                
            
                minY: 0,
                maxY: 100,

               
                minX: 0,
                maxX: 5, 
               

                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Color(0xff9CA3AF),
                      strokeWidth: 1,
                      dashArray: [5, 5],
                    );
                  },
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    bottom: BorderSide(color: Color(0xff9CA3AF), width: 2),
                    left: BorderSide(color: Color(0xff9CA3AF), width: 2),
                  ),
                ),
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: leftTitleWidgets,
                      
                      interval: 25, 
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: bottomTitleWidgets,
                     
                      interval: 1, 
                    ),
                  ),
                ),
                lineBarsData: [
                  buildLineChartBarData(
                    color: efficiencyColor,
                    spots: getEfficiencySpots(),
                  ),
                  buildLineChartBarData(
                    color: qualityColor,
                    spots: getQualitySpots(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildLegendItem(efficiencyColor, "efficiency"),
              const SizedBox(width: 24),
              buildLegendItem(qualityColor, "quality"),
            ],
          )
        ],
      ),
    );
  }

  

  List<FlSpot> getEfficiencySpots() {
    return const [
      FlSpot(0, 85),
      FlSpot(1, 88),
      FlSpot(2, 82),
      FlSpot(3, 90),
      FlSpot(4, 87),
      FlSpot(5, 91),
    ];
  }

  List<FlSpot> getQualitySpots() {
    return const [
      FlSpot(0, 92),
      FlSpot(1, 95),
      FlSpot(2, 90),
      FlSpot(3, 96),
      FlSpot(4, 93),
      FlSpot(5, 97),
    ];
  }

  LineChartBarData buildLineChartBarData(
      {required Color color, required List<FlSpot> spots}) {
    return LineChartBarData(
      spots: spots,
      isCurved: true,
      color: color,
      barWidth: 3,
      isStrokeCapRound: true,
      belowBarData: BarAreaData(show: false),
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, barData, index) {
          return FlDotCirclePainter(
            radius: 5,
            color: Colors.white,
            strokeWidth: 1,
            strokeColor: color,
          );
        },
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Color(0xff9CA3AF), fontSize: 12);
    
    if (value == 0 || value == 25 || value == 50 || value == 75 || value == 100) {
      return Text(value.toInt().toString(), style: style, textAlign: TextAlign.right);
    }
    return Container();
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.grey, fontSize: 12);
    String text;
    
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'Jun';
        break;
      default:
        return Container();
    }
    return Text(text, style: style);
  }

  Widget buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Icon(Icons.commit, color: color, size: 20),
        Icon(Icons.commit_rounded, color: color, size: 8),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(color: color, fontSize: 14)),
      ],
    );
  }
}