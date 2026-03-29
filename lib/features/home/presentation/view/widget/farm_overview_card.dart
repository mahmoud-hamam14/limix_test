import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
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

          const SizedBox(height: 24),

          const Text(
            "Capacity Usage",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(5),
                  value: usagePercent,
                  minHeight: 10,
                  backgroundColor: const Color(0xFFE6E6E6),
                  valueColor: const AlwaysStoppedAnimation(Color(0xFF1A1A2F)),
                ),
              ),
              const SizedBox(width: 12),
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
      width: 140,
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12.withOpacity(0.08)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF2454C2),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
