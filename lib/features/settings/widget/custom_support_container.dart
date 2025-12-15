import 'package:flutter/material.dart';
class CustomSupportContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  const CustomSupportContainer({super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.iconColor,
    required this.onTap,
    required this.backgroundColor,

  }
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 103,
      width:350,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
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
                height: 47,
                width: 47,
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
                            color: Colors.black,
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

                        ]
                    )
              ),
            Center(
              child: IconButton(onPressed: onTap,
                  icon:Icon(Icons.open_in_new,color: Color(0xff99A1AF),size: 20,
                  )),
            )
          ]

      ),
    );
  }
}