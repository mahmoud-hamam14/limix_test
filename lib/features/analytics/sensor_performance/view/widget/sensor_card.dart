import 'package:flutter/material.dart';

class SensorCard extends StatelessWidget {
  final String sensorName;
  final String accuracy;
  final String upTime;
  final String alarts;
  const SensorCard({super.key, required this.sensorName, required this.accuracy, required this.upTime, required this.alarts});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( horizontal: 20),
      height: 154.52,
      width: 328.39,
      padding: const EdgeInsets.only(top: 20, left:20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xffF3F4F6),
          width: 1.27,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A000000),
            offset: const Offset(0, 1),
            blurRadius: 2,
            spreadRadius: -1,
          ),
          BoxShadow(
            color: const Color(0x1A000000),
        offset: const Offset(0, 1),
        blurRadius: 3,
        spreadRadius: 0,
          )
        ]
      ),
      child: Column(
        children: [
          Row(children: [
            Text(sensorName,
            style:TextStyle(
              color: Color(0xff224B8F),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.5,
              fontFamily: 'Inter',
            ) ,
            ),
            Spacer(),
            Icon(Icons.show_chart_sharp,size: 20,color: Color(0xff82B8FE),),
          ],
          ),
          const SizedBox(height: 40,),
          Row(children: [
            Column(
              children: [
                Text("Accuracy",
                style: TextStyle(
                  color: Color(0xff6A7282),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 16/12,
                  fontFamily: 'Inter',
                ),
                ),
                const SizedBox(height: 4,),
                Text(accuracy,
                style: TextStyle(
                  color: Color(0xff224B8F),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  height: 28/18,
                  fontFamily: 'Inter',
                ),
                ),
              ],
              ),
              const SizedBox(width: 16,),
               Column(
              children: [
                Text("Uptime",
                style: TextStyle(
                  color: Color(0xff6A7282),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 16/12,
                  fontFamily: 'Inter',
                ),
                ),
                const SizedBox(height: 4,),
                Text(upTime,
                style: TextStyle(
                  color: Color(0xff00A63E),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  height: 28/18,
                  fontFamily: 'Inter',
                ),
                ),
              ],
              ),
               const SizedBox(width: 16,),
               Column(
              children: [
                Text("Alerts",
                style: TextStyle(
                  color: Color(0xff6A7282),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 16/12,
                  fontFamily: 'Inter',
                ),
                ),
                const SizedBox(height: 4,),
                Text(alarts,
                style: TextStyle(
                  color: Color(0xffE17100),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  height: 28/18,
                  fontFamily: 'Inter',
                ),
                ),
              ],
              ),
          ],
          ),
        ],
      ),

    );
  }
}