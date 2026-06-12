import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

class FarmOverviewCard extends StatelessWidget {
  final String fishCount;
  final String waterVolume;
  final double usagePercent;

  const FarmOverviewCard({
    super.key,
    required this.fishCount,
    required this.waterVolume,
    required this.usagePercent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.radius),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: const Offset(3, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Two info boxes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _FarmInfoBox(title: "Fish Count", value: fishCount),
              _FarmInfoBox(title: "Water Volume", value: waterVolume),
            ],
          ),

          SizedBox(height: 20.height),

          Text(
            "Capacity Usage",
            style: TextStyle(
              fontSize: 18.font,
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8.height),

          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(5.radius),
                  value: usagePercent,
                  minHeight: 8.height,
                  backgroundColor: const Color(0xFFE6E6E6),
                  valueColor: const AlwaysStoppedAnimation(Color(0xFF1A1A2F)),
                ),
              ),
              SizedBox(width: 12.width),
              Text(
                "${(usagePercent * 100).toInt()}%",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FarmInfoBox extends StatelessWidget {
  final String title;
  final String value;

  const _FarmInfoBox({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.width,
      padding: EdgeInsets.symmetric(vertical: 16.height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.radius),
        border: Border.all(color: Colors.black12.withOpacity(0.08)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.font,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 10.height),
          Text(
            value,
            style: TextStyle(
              color: Color(0xFF2454C2),
              fontSize: 22.font,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
