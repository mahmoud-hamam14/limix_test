import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

// --- ويدجت لكارت الـ Bar Chart ---
class MonthlyProductionCard extends StatelessWidget {
  const MonthlyProductionCard({super.key});

  // اللون الأساسي للأعمدة
  static const Color barColor = Color(0xFF9AD8F1); 

  @override
  Widget build(BuildContext context) {
    return Container(
      // 1. الكارت الأبيض
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000), 
        offset: Offset(0, 1),     // (0px, 1px)
        blurRadius: 2.0,          // (2px)
        spreadRadius: -1.0,       // (-1px)
      ),
      
      BoxShadow(
        color: Color(0x1A000000), 
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
            "Monthly Production (kg)",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF224B8F),
            ),
          ),
          const SizedBox(height: 32), 

         
          AspectRatio(
            aspectRatio: 1.6, // نسبة الطول للعرض
            child: BarChart(
              BarChartData(
                
                minY: 0,
                maxY: 600, // أعلى قيمة في الـ y
                 // 6 شهور + مسافة
                
                // --- 5. الشبكة (Grid) ---
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true, 
                  horizontalInterval: 150,
                  verticalInterval: 1,
                  getDrawingHorizontalLine: (value) {
                    // دي اللي بتعمل الخطوط المنقطة
                    return FlLine(
                      color: Color(0xff9CA3AF),
                      strokeWidth: 1,
                      dashArray: [5, 5],
                    );
                  },
                ),
                // --- 6. الإطار (Border) ---
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    bottom: BorderSide(color: Color(0xff9CA3AF), width: 2),
                    left: BorderSide(color:Color(0xff9CA3AF), width: 2),
                  ),
                  
                ),
                // --- 7. إعدادات العناوين (الأرقام والشهور) ---
                titlesData: FlTitlesData(
                  // العناوين اللي فوق واليمين
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  // العناوين اللي عالشمال (الأرقام)
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: leftTitleWidgets, // دالة مساعدة تحت
                      interval: 150, // كل 150 (0, 150, 300, 450, 600)
                    ),
                  ),
                  // العناوين اللي تحت (الشهور)
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: bottomTitleWidgets, // دالة مساعدة تحت
                      interval: 1, // كل 1 (شهر)
                    ),
                  ),
                ),
                // --- 8. الأعمدة نفسها ---
                barGroups: getBarGroups(), // دالة مساعدة تحت
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- دوال مساعدة عشان الكود يبقى نضيف ---

  // دالة بترجع الأعمدة
  List<BarChartGroupData> getBarGroups() {
    // البيانات لكل شهر
    final List<double> monthlyData = [
      420, // Jan
      450, // Feb
      380, // Mar
      480, // Apr
      460, // May
      500, // Jun
    ];

    // بنحول البيانات دي لـ BarChartGroupData
    return List.generate(monthlyData.length, (index) {
      return BarChartGroupData(
        x: index, // الـ index بتاع الشهر هو الـ x
        barRods: [
          BarChartRodData(
            toY: monthlyData[index], // الـ y هو قيمة الشهر
            color: barColor,
            width: 25, // عرض العمود
            borderRadius: BorderRadius.circular(6), // تدوير حواف العمود
          ),
        ],
      );
    });
  }

  // دالة بترجع الأرقام اللي على الشمال
  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Color(0xff9CA3AF), fontSize: 11);
    // بما إننا عملنا interval: 150
    if (value == 0 || value == 150 || value == 300 || value == 450 || value == 600) {
      return Text(value.toInt().toString(), style: style, textAlign: TextAlign.right);
    }
    return Container();
  }

  // دالة بترجع الشهور اللي تحت
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