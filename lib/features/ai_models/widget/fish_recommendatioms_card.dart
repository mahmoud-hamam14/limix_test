
import 'package:flutter/material.dart';

class FishRecommendatiomsCard extends StatelessWidget {
  final String image;
  final String type;
  const FishRecommendatiomsCard({super.key,
    required this.image,
    required this.type
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,

      margin:  const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border(
          left: BorderSide(
            color: Color(0xff2B7FFF),
            width: 4,
          ),
        ),
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

                           borderRadius:
                           BorderRadius.circular(20),

                           child: Image.network(
                             image,
                             fit: BoxFit.cover,
                           ),
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
                   height: 90,
                   width: 150,
                   fit: BoxFit.cover,
                 ),
               ),
             ),

           const SizedBox(width: 20),
           Expanded(
    child: Text(
    type,
    style: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    ),
    ),
           ),
         ]
       ),


    );
  }
}
