import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String change;
  final IconData icon;
  final Color baseColor;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.change,
    required this.icon,
    required this.baseColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color lightColor = baseColor.withOpacity(0.08);

    final Color veryLightColor = baseColor.withOpacity(0.02);

    return Container(
      height: 165.height,
      width: double.infinity,
      padding: EdgeInsets.all(10.radius),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [lightColor, veryLightColor],
        ),
        borderRadius: BorderRadius.circular(20.radius),

        border: Border.all(color: baseColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: baseColor, size: 20.radius),
              Text(
                change,
                style: TextStyle(
                  color: baseColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.font,
                ),
              ),
            ],
          ),
          const Spacer(),

          Text(
            value,
            style: TextStyle(
              fontSize: 18.font,
              fontWeight: FontWeight.bold,
              color: Color(0xFF224B8F),
            ),
          ),
          const Spacer(),
          Text(
            title,
            style: TextStyle(fontSize: 13.font, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
