
import 'package:flutter/material.dart';

class SensorForcastCard extends StatelessWidget {
  final Color borderColor;
  final String title;
  final String currentValue;
  final String forecastValue;
  final String change;
  final Color changeColor;
  final IconData trendIcon;


  const SensorForcastCard({super.key,
    required this.borderColor,
    required this.title,
    required this.currentValue,
    required this.forecastValue,
    required this.change,
    required this.changeColor,
    required this.trendIcon,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        border: Border(
          left: BorderSide(
            color: borderColor,
            width: 4,
          ),
        ),

        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 1),
            blurRadius: 2,
            spreadRadius: -1,
          ),

          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 1),
            blurRadius: 3,
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        /// Title
        Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),

      const SizedBox(height: 12),

      /// Values Row
      Row(
        children: [

          /// Current
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Current",
                style: TextStyle(
                  color: Color(0xFF6A7282),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Text(
                currentValue,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          const SizedBox(width: 20),

          Icon(
            trendIcon,
            color: changeColor,
            size: 18,
          ),

          const SizedBox(width: 20),

          /// Forecast
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Forecast",
                style: TextStyle(
                  color: Color(0xFF6A7282),
                  fontSize: 12,
                  fontWeight: FontWeight.w500
                ),
              ),

              Text(
                forecastValue,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),

      const SizedBox(height: 14),

      /// Change Container
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),

        decoration: BoxDecoration(
          color: const Color(0xffF9F9F9),
          borderRadius: BorderRadius.circular(12),
        ),

        child: Text(
          "Change: $change",
          style: TextStyle(
            color: changeColor,
            fontWeight: FontWeight.w500,
          ),
        ),

      )
        ],
      ),
    );
  }
}
