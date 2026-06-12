import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

class SensorCard extends StatelessWidget {
  final String sensorName;
  final String accuracy;
  final String upTime;
  final String alarts;
  const SensorCard({
    super.key,
    required this.sensorName,
    required this.accuracy,
    required this.upTime,
    required this.alarts,
  });

  @override

  Widget build(BuildContext context) {
    return Container(
      height: 160.height,
      width: double.infinity,
      padding: EdgeInsets.all(15.radius),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.radius),
        border: Border.all(color: const Color(0xffF3F4F6)),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A000000),
            offset: const Offset(0, 1),
            blurRadius: 2.radius,
            spreadRadius: -1,
          ),
          BoxShadow(
            color: const Color(0x1A000000),
            offset: const Offset(0, 1),
            blurRadius: 3.radius,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                sensorName,
                style: TextStyle(
                  color: Color(0xff224B8F),
                  fontSize: 17.font,
                  fontWeight: FontWeight.w400,

                  fontFamily: 'Inter',
                ),
              ),
              const Spacer(),

              Icon(
                Icons.show_chart_outlined,
                size: 23.radius,
                color: Color(0xff82B8FE),
              ),
            ],
          ),
          SizedBox(height: 30.height),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.width),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Accuracy",
                      style: TextStyle(
                        color: Color(0xff6A7282),
                        fontSize: 14.font,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                      ),
                    ),
                    SizedBox(height: 5.height),

                    Text(
                      accuracy,
                      style: TextStyle(
                        color: Color(0xff224B8F),
                        fontSize: 15.font,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
                const Spacer(),

                Column(
                  children: [
                    Text(
                      "Uptime",
                      style: TextStyle(
                        color: Color(0xff6A7282),
                        fontSize: 14.font,
                        fontWeight: FontWeight.w400,

                        fontFamily: 'Inter',
                      ),
                    ),
                    SizedBox(height: 5.height),
                    Text(
                      upTime,
                      style: TextStyle(
                        color: Color(0xff00A63E),
                        fontSize: 15.font,
                        fontWeight: FontWeight.w500,

                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      "Alerts",
                      style: TextStyle(
                        color: Color(0xff6A7282),
                        fontSize: 14.font,
                        fontWeight: FontWeight.w400,

                        fontFamily: 'Inter',
                      ),
                    ),
                    SizedBox(height: 5.height),
                    Text(
                      alarts,
                      style: TextStyle(
                        color: Color(0xffE17100),
                        fontSize: 15.font,
                        fontWeight: FontWeight.w500,

                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
