import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(25),
      width: double.infinity,
      height: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
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
              const Text(
                'Current Reading',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF4A5565),
                  // fontWeight: FontWeight.w600,
                ),
              ),

              const Spacer(),

              Container(
                width: 90,
                height: 35,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: iconBgColor, // Color(0xFFE0E7FF),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Icon(icon, color: iconColor),
                    const SizedBox(width: 6),
                    Text(
                      rate,
                      style: TextStyle(color: rateColor, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: Color(0xFF224B8F),
                  fontSize: 45,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                unit,
                style: TextStyle(
                  color: Color(0xFF495464),
                  fontSize: 25,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Divider(
            color: Colors.grey,
            thickness: 0.7,
            indent: 5,
            endIndent: 5,
          ),

          Row(
            children: [
              const Text(
                'Optimal Range',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF4A5565),
                  // fontWeight: FontWeight.w600,
                ),
              ),

              const Spacer(),

              const Text(
                'Status',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF4A5565),
                  // fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

          Row(
            children: [
              Text(
                range,
                style: TextStyle(fontSize: 22, color: Color(0xFF224B8F)),
              ),

              const Spacer(),

              Text(
                status,
                style: TextStyle(fontSize: 21, color: Color(0xFF00A63E)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
