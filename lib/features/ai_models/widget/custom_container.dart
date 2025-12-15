import 'package:flutter/material.dart';
class CustomContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final String valueName;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color borderColor;
  final Color backgroundColor;
  final Color buttonColor;
  final Color valueColor;
  final VoidCallback onTap;

  const CustomContainer({super.key,
    required this.title,
    required this.subTitle,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.borderColor,
    required this.buttonColor,
    required this.onTap,
    required this.backgroundColor,
    required this.valueName,
    required this.valueColor
  }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),

      height: 162.44,
      width:400,
     decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.circular(24),
      border: Border(
        top: BorderSide(
          color: borderColor,
          width: 1.27
        ),
        bottom: BorderSide(
          color: borderColor,
          width: 1.27
        ),
      right: BorderSide(
        color: borderColor,
        width: 1.27
      ),
      left: BorderSide(
        color: borderColor,
        width: 2.55
      )
      ),
       boxShadow: [
         BoxShadow(
           color: Color(0x1A000000),
           offset: Offset(0, 2),
           blurRadius: 4,
           spreadRadius: -2,
         ),
         BoxShadow(
           color: Color(0x1A000000),
           offset: Offset(0, 10),
           blurRadius: 6,
           spreadRadius: -1,
         )
       ]
      ),
     child: Row(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Padding(
           padding: const EdgeInsets.all(21),
           child: Container(
            // padding: const EdgeInsets.all(12),
             height: 119.9,
             width: 63.95,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               color: backgroundColor,
           ),
             child: Icon(icon,color: iconColor,size: 28,),
           ),
         ),
         SizedBox(width: 15,),
         Expanded(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Padding(
                 padding: const EdgeInsets.only(top: 20),
                 child: Text(
                   title,
                   style: TextStyle(
                     color: Color(0xff224B8F),
                     fontSize: 16,
                     fontWeight: FontWeight.w400,
                     fontFamily: 'Inter'
                   ),
                 ),
               ),
               SizedBox(height: 9.64,),

               Text(
                 subTitle,style: TextStyle(
                 color: Color(0xff4A5565),
                 fontSize: 14,
                 fontWeight: FontWeight.w400,
                 fontFamily: 'Inter'
               ),
               ),
               SizedBox(height: 7.97,),
               Row(
                 children: [
                   Text(
                     valueName,style: TextStyle(
                     color: Color(0xff6A7282),
                     fontSize: 12,
                     fontWeight: FontWeight.w400,
                     fontFamily: 'Inter'
                   ),
                   ),
                   SizedBox(width: 8,),
                   Text(
                     value,
                     style: TextStyle(
                       color: valueColor,
                       fontSize: 14,
                       fontWeight: FontWeight.w400,
                       fontFamily: 'Inter'
                     ),
                   ),
                   SizedBox(width: 15.54,),
                   ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       minimumSize: Size(94, 45),
                       backgroundColor: buttonColor,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(24),
                       ),
                     ),
                       onPressed: (){
                         onTap();
                       },
                       child: Text(
                         'View Details',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 14,
                           fontWeight: FontWeight.bold
                       )
                   )
                   )


                 ]
               )


             ]
           ),
         ),
       ]

    ),
    );
  }
}
