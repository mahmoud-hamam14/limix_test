import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String value;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),

          border: Border(
            left: BorderSide(
              color: Color(0xFF8E51FF),
              width: 4,
            ),
          ),
        ),

        child: Row(
          children: [

            Container(
              padding: const EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: Color(0xffF4EEFF),
                borderRadius:
                BorderRadius.circular(16),
              ),

              child:
                icon,

            ),

            const SizedBox(width: 16),

            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF4A5565),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.purple,
                    fontWeight: FontWeight.w400,

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