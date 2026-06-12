import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

class MonthlyProductionCard extends StatelessWidget {
  const MonthlyProductionCard({super.key});

  static const Color barColor = Color(0xFF9AD8F1);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.radius),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.radius),
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 1), // (0px, 1px)
            blurRadius: 2.0, // (2px)
            spreadRadius: -1.0, // (-1px)
          ),

          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 1), // (0px, 1px)
            blurRadius: 3.0, // (3px)
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Monthly Production (kg)",
            style: TextStyle(
              fontSize: 16.font,
              fontWeight: FontWeight.w500,
              color: Color(0xFF224B8F),
            ),
          ),
          SizedBox(height: 24.height),

          AspectRatio(
            aspectRatio: 1.2.radius,
            child: BarChart(
              BarChartData(
                minY: 0,
                maxY: 600,

                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 100,
                  verticalInterval: 50,
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
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 20,
                      getTitlesWidget: leftTitleWidgets,
                      interval: 1,
                    ),
                  ),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 20,
                      getTitlesWidget: bottomTitleWidgets,
                      interval: 1,
                    ),
                  ),
                ),

                barGroups: getBarGroups(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> getBarGroups() {
    final List<double> monthlyData = [
      420, // Jan
      450, // Feb
      380, // Mar
      480, // Apr
      460, // May
      500, // Jun
    ];

    return List.generate(monthlyData.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: monthlyData[index],
            color: barColor,
            width: 25.width, // عرض العمود
            borderRadius: BorderRadius.circular(6.radius),
          ),
        ],
      );
    });
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Color(0xff9CA3AF), fontSize: 11);

    if (value == 0 ||
        value == 150 ||
        value == 300 ||
        value == 450 ||
        value == 600) {
      return Text(
        value.toInt().toString(),
        style: style,
        textAlign: TextAlign.right,
      );
    }
    return Container();
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Color(0xff9CA3AF), fontSize: 11);
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
}
