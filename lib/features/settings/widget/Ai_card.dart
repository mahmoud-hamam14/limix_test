import 'package:flutter/material.dart';
class AiCard extends StatelessWidget {
  const AiCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){},
        child: Padding(
          padding: const EdgeInsets.only(left: 45),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),

              height: 70.5,
              width: 328.39,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
                boxShadow: [
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
                  )
                ],
                border: Border(
                    top: BorderSide(
                        color: Color(0xFFF3F4F6),
                        width: 1.27
                    )
                ),
              ),
              child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffF3E8FF),
                            Color(0xffFCE7F3)
                          ]
                        ),
                        shape: BoxShape.rectangle,
                      ),
                      child: const Icon(
                        Icons.chat_bubble_outline,
                        color: Color(0xff9810FA),
                        size: 22,
                      ),
                    ),
                    SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chat with AI Assistant',
                          style: TextStyle(
                              color: Color(0xff101828),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Inter'
                          ),
                        ),
                        SizedBox(height: 2,),
                        Text(
                            'Get help and insights',
                            style: TextStyle(
                                color: Color(0xff6A7282),
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                            )
                        )
                      ],
                    ),
                    Spacer(),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,color: Color(0xff99A1AF),size: 16,))
                  ]
              )
          ),
        )
    );
  }
}
