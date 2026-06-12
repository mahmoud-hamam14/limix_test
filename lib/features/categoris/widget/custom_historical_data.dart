import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

class CustomHistoricalData extends StatelessWidget {
  const CustomHistoricalData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.height),
        Text(
          'Historical Data',
          style: TextStyle(fontSize: 20.font, color: Color(0xFF224B8F)),
        ),

        SizedBox(height: 20.height),

        Container(
          width: double.infinity,
          height: 45.height,
          decoration: BoxDecoration(
            color: Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(20.radius),
          ),
          child: Row(
            children: [
              Container(
                width: 100.width,
                height: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Color(0xFF224B8F),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Center(
                  child: Text(
                    '24 Hours',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.font,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              Spacer(),

              Container(
                width: 80.width,
                height: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Center(
                  child: Text(
                    '24 Hours',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.font,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              Spacer(),

              Container(
                width: 80.width,
                height: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Center(
                  child: Text(
                    '24 Hours',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.font,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.height),
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
      width: 100.width,
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
            fontSize: 14.font,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
