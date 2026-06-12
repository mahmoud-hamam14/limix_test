import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';
import 'package:limix_test/features/home/models/container_model.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.container, this.onTap});
  final VoidCallback? onTap;

  final ContainerModel container;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.radius),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [container.startColor, container.endColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4.radius,
              offset: Offset(0, 3),
            ),
          ],
          // color:
          //  Colors.amber,
          borderRadius: BorderRadius.circular(20.radius),
        ),
        width: double.infinity,
        height: 165.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5.height),
                  width: 40.width,
                  height: 35.height,
                  decoration: BoxDecoration(
                    color: container.iconBgColor,

                    borderRadius: BorderRadius.circular(50.radius),
                  ),

                  child: Icon(container.icon, color: container.iconColor),
                ),

                Container(
                  width: 12.width,
                  height: 12.height,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            Text(
              container.title,
              style: TextStyle(
                color: Color(0xFF495464),
                fontSize: 16.font,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  container.value,
                  style: TextStyle(
                    color: container.valueColor,
                    fontSize: 15.font,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(width: 2.width),

                Text(
                  container.unit,
                  style: TextStyle(color: Color(0xFF495464), fontSize: 10.font),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
