import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

class CustomProfileContainer extends StatelessWidget {
  final double height;
  final double width;
  final List<Widget> children;
  const CustomProfileContainer({
    super.key,
    required this.height,
    required this.width,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 12.width),
      padding: EdgeInsets.all(20.radius),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.radius),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 2),
            blurRadius: 4,
            spreadRadius: -2,
          ),
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 4),
            blurRadius: 6,
            spreadRadius: -1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
