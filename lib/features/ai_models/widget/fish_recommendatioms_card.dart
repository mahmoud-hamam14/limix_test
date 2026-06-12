import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';

class FishRecommendatiomsCard extends StatelessWidget {
  final String image;
  final String type;
  const FishRecommendatiomsCard({
    super.key,
    required this.image,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 128,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(16.radius),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.radius),
        border: Border(left: BorderSide(color: Color(0xff2B7FFF), width: 4)),
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 1),
            blurRadius: 2,
            spreadRadius: -1,
          ),

          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 1),
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,

                builder: (context) {
                  return Dialog(
                    backgroundColor: Colors.transparent,

                    child: InteractiveViewer(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.radius),

                        child: Image.network(image, fit: BoxFit.fill),
                      ),
                    ),
                  );
                },
              );
            },

            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),

              child: Image.network(
                image,
                height: 90.height,
                width: 100.width,
                fit: BoxFit.fill,
              ),
            ),
          ),

          const Spacer(),

          Expanded(
            child: Text(
              type,
              style: TextStyle(fontSize: 16.font, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
