import 'package:flutter/material.dart';

class CustomHistoricalData extends StatelessWidget {
  const CustomHistoricalData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 23),
        Text(
          'Historical Data',
          style: TextStyle(fontSize: 24, color: Color(0xFF224B8F)),
        ),

        const SizedBox(height: 23),

        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              historicalDataCustomContainer(
                title: '24 Hours',
                textColor: Colors.white,
                BgColor: Color(0xFF224B8F),
              ),
              historicalDataCustomContainer(
                title: 'Week',
                textColor: Colors.black,
                BgColor: Color(0xFFF3F4F6),
              ),
              historicalDataCustomContainer(
                title: 'Month',
                textColor: Colors.black,
                BgColor: Color(0xFFF3F4F6),
              ),
            ],
          ),
        ),
        const SizedBox(height: 23),
      ],
    );
  }
}

// ignore: camel_case_types
class historicalDataCustomContainer extends StatelessWidget {
  const historicalDataCustomContainer({
    super.key,
    required this.title,
    required this.textColor,
    required this.BgColor,
  });
  final String title;
  final Color textColor;
  final Color BgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: BgColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
