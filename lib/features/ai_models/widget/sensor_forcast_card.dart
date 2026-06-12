import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

class SensorForcastCard extends StatelessWidget {
  final Color borderColor;
  final String title;
  final String currentValue;
  final String forecastValue;
  final String change;
  final Color changeColor;
  final IconData trendIcon;

  const SensorForcastCard({
    super.key,
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
      margin: EdgeInsets.only(bottom: 16.height),

      padding: EdgeInsets.all(15.radius),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20.radius),

        border: Border(left: BorderSide(color: borderColor, width: 4)),

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
            style: TextStyle(fontSize: 14.font, fontWeight: FontWeight.w500),
          ),

          SizedBox(height: 15.height),

          /// Values Row
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Current
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Current",
                    style: TextStyle(
                      color: Color(0xFF6A7282),
                      fontSize: 12.font,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Text(
                    currentValue,
                    style: TextStyle(
                      fontSize: 16.font,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              SizedBox(width: 30.width),

              Icon(trendIcon, color: changeColor, size: 22.radius),

              SizedBox(width: 30.width),

              /// Forecast
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forecast",
                    style: TextStyle(
                      color: Color(0xFF6A7282),
                      fontSize: 12.font,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Text(
                    forecastValue,
                    style: TextStyle(
                      fontSize: 16.font,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 15.height),

          /// Change Container
          Container(
            padding: EdgeInsets.all(10.radius),

            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 241, 241, 241),
              borderRadius: BorderRadius.circular(16.radius),
            ),

            child: Text(
              "Change: $change",
              style: TextStyle(color: changeColor, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
