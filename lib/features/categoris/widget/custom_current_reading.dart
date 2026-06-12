import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

class CustomCurrentReading extends StatelessWidget {
  const CustomCurrentReading({
    super.key,
    required this.value,
    required this.unit,
    required this.status,
    required this.range,
    required this.rate,
    required this.rateColor,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
  });

  final String value;
  final String unit;
  final String status;
  final String range;
  final String rate;
  final Color rateColor;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.radius),
      width: double.infinity,
      // height: 250.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.radius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Current Reading',
                style: TextStyle(
                  fontSize: 18.font,
                  color: Color(0xFF4A5565),
                  // fontWeight: FontWeight.w600,
                ),
              ),

              const Spacer(),

              Container(
                width: 100.width,
                height: 30.height,
                padding: EdgeInsets.symmetric(
                  horizontal: 12.width,
                  vertical: 6.height,
                ),
                decoration: BoxDecoration(
                  color: iconBgColor, // Color(0xFFE0E7FF),
                  borderRadius: BorderRadius.circular(18.radius),
                ),
                child: Row(
                  children: [
                    Icon(icon, color: iconColor),
                    Spacer(),
                    Text(
                      rate,
                      style: TextStyle(color: rateColor, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 5.height),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: Color(0xFF224B8F),
                  fontSize: 26.font,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 4.width),
              Text(
                unit,
                style: TextStyle(color: Color(0xFF495464), fontSize: 20.font),
              ),
            ],
          ),

          Divider(
            height: 35.height,
            color: Colors.grey,
            thickness: 0.7,
            indent: 5,
            endIndent: 5,
          ),

          Row(
            children: [
              Text(
                'Optimal Range',
                style: TextStyle(
                  fontSize: 16.font,
                  color: Color(0xFF4A5565),
                  // fontWeight: FontWeight.w600,
                ),
              ),

              const Spacer(),

              Text(
                'Status',
                style: TextStyle(
                  fontSize: 16.font,
                  color: Color(0xFF4A5565),
                  // fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          SizedBox(height: 10.height),

          Row(
            children: [
              Text(
                range,
                style: TextStyle(
                  fontSize: 18.font,
                  color: Color(0xFF224B8F),
                  fontWeight: FontWeight.w500,
                ),
              ),

              const Spacer(),

              Text(
                status,
                style: TextStyle(fontSize: 18.font, color: Color(0xFF00A63E)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
