import 'package:flutter/material.dart';

class FishActivityCard extends StatelessWidget {
  final String image;
  final VoidCallback onTap;

  const FishActivityCard({
    super.key,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0,left: 8,right: 8),
      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(24),

          border: Border(
            left: BorderSide(
              color: Color(0xFF8E51FF),
              width: 4,
            ),
          ),

          boxShadow: [
            BoxShadow(
              color: Color(0x1A000000),
              offset: Offset(0, 1),
              blurRadius: 3,
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Title
            Row(
              children: const [

                Icon(
                  Icons.show_chart,
                  color: Color(0xFF7F22FE),
                ),

                SizedBox(width: 8),

                Text(
                  "Fish Activity",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// Live Preview
            GestureDetector(
              onTap: onTap,

              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),

                child: Stack(
                  alignment: Alignment.center,

                  children: [

                    Image.asset(
                      image,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),

                    Container(
                      color: Colors.black26,
                    ),

                    const Icon(
                      Icons.play_circle_fill,
                      color: Colors.white,
                      size: 60,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// Status Container
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),

              decoration: BoxDecoration(
                color: const Color(0xffF6F5FF),
                borderRadius: BorderRadius.circular(18),
              ),

              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

                children: [

                  const Text(
                    "Activity Status",
                    style: TextStyle(
                      color: Color(0xFF4A5565),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),

                    decoration: BoxDecoration(
                      color: Color(0xffDDF8E5),
                      borderRadius:
                      BorderRadius.circular(30),
                    ),

                    child: const Text(
                      "Healthy",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}