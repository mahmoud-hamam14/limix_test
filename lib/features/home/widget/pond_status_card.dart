import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

class PondStatusCard extends StatelessWidget {
  final String title;
  final String status;
  final String temp;
  final String oxygen;
  final String ph;

  const PondStatusCard({
    super.key,
    required this.title,
    required this.status,
    required this.temp,
    required this.oxygen,
    required this.ph,
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
            blurRadius: 12.radius,
            offset: const Offset(3, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + arrow
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color(0xfff224b82),
                  fontSize: 20.font,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20.radius,
                color: Colors.black26,
              ),
            ],
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.02),

          // Status badge
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 14.width,
              vertical: 5.height,
            ),
            decoration: BoxDecoration(
              color: Color(0xff10B989),
              borderRadius: BorderRadius.circular(20.radius),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 14.font,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.02),

          // mini boxes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _MiniInfoBox(title: "Temp", value: temp),
              _MiniInfoBox(title: "O₂", value: oxygen),
              _MiniInfoBox(title: "pH", value: ph),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniInfoBox extends StatelessWidget {
  final String title;
  final String value;

  const _MiniInfoBox({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.width,
      padding: EdgeInsets.symmetric(vertical: 16.height),
      decoration: BoxDecoration(
        color: Color(0xffF9FAF9),
        borderRadius: BorderRadius.circular(20.radius),
        border: Border.all(color: Colors.black12.withOpacity(0.08)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.black54, fontSize: 18.font),
          ),
          SizedBox(height: 10.height),
          Text(
            value,
            style: TextStyle(
              color: Color(0xFF2454C2),
              fontSize: 18.font,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
