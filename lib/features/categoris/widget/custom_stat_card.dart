import 'package:flutter/material.dart';

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
      height: 160,
      width: 110,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
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
              fontSize: 20,
              fontWeight: FontWeight.w500,

              // fontWeight: FontWeight.bold,
              color: Color(0xFF6A7282),
            ),
          ),

          // SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xFF224B8F),
            ),
          ),
          Text(
            unit,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF6A7282),
            ),
          ),
        ],
      ),
    );
  }
}
