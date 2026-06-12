import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

class CustomStatCard extends StatelessWidget {
  const CustomStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
  });

  final String title;
  final String value;
  final String unit;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.height,
      width: 90.width,
      padding: EdgeInsets.all(15.radius),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.radius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.font,
              fontWeight: FontWeight.w500,

              color: Color(0xFF6A7282),
            ),
          ),

          Text(
            value,
            style: TextStyle(
              fontSize: 18.font,
              fontWeight: FontWeight.w500,
              color: Color(0xFF224B8F),
            ),
          ),
          Text(
            unit,
            style: TextStyle(
              fontSize: 14.font,
              fontWeight: FontWeight.w500,
              color: Color(0xFF6A7282),
            ),
          ),
        ],
      ),
    );
  }
}
