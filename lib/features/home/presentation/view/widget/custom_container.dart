import 'package:flutter/material.dart';
import 'package:limix_test/features/home/presentation/view/widget/container_model.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.container, this.onTap});
  final VoidCallback? onTap;

  final ContainerModel container;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              container.startColor,
              container.endColor,
              // Color.fromARGB(255, 255, 249, 200),
              // Color.fromARGB(255, 255, 212, 131),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
          // color:
          //  Colors.amber,
          borderRadius: BorderRadius.circular(25),
        ),
        width: double.infinity,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 7),
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: container.iconBgColor,

                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Icon(
                    container.icon,
                    color: container.iconColor,

                    // Icons.thermostat, color: Colors.orange,
                  ),
                ),
                // SizedBox(width: 8),
                const Spacer(),
                Container(
                  width: 15,
                  height: 15,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 5),
              ],
            ),
            const SizedBox(height: 25),
            Text(
              container.title,
              // 'Avg Temp',
              style: TextStyle(
                color: Color(0xFF495464),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 22),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  container.value,
                  // '27',
                  style: TextStyle(
                    color: container.valueColor,
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // const SizedBox(width: 5),
                Text(
                  container.unit,
                  style: TextStyle(
                    color: Color(0xFF495464),
                    fontSize: 14,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
