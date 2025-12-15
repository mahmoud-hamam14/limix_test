import 'package:flutter/material.dart';
class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){},
        child: Padding(
          padding: const EdgeInsets.only(left: 45),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),

              height: 240,
              width: 328.39,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffF0FDFA),
                    Color(0xffF0FDFA)
                  ]
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
              child: Column(
                children: [
              Row(
              children: [
              Container(
              padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(12),
              color: Color(0xFFCBFBF1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.email_outlined,
              color: Color(0xff009689),
              size: 22,
            ),
          ),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email Us',
                style: TextStyle(
                    color: Color(0xff4A5565),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter'
                ),
              ),
              SizedBox(height: 2,),
              Text(
                  'support@limix.eg',
                  style: TextStyle(
                      color: Color(0xff101828),
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  )
              )
            ],
          ),
                ],
              ),
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFFDBEAFE),
                          shape: BoxShape.rectangle,
                        ),
                        child: const Icon(
                          Icons.phone_outlined,
                          color: Color(0xff155DFC),
                          size: 22,
                        ),
                      ),
                      SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Call Us',
                            style: TextStyle(
                                color: Color(0xff4A5565),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter'
                            ),
                          ),
                          SizedBox(height: 2,),
                          Text(
                              '+20 123 456 7890',
                              style: TextStyle(
                                  color: Color(0xff101828),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              )
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFFDCFCE7),
                          shape: BoxShape.rectangle,
                        ),
                        child: const Icon(
                          Icons.sports_volleyball_outlined,
                          color: Color(0xff00A63E),
                          size: 22,
                        ),
                      ),
                      SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Visit Website',
                            style: TextStyle(
                                color: Color(0xff4A5565),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter'
                            ),
                          ),
                          SizedBox(height: 2,),
                          Text(
                              'www.limix.eg',
                              style: TextStyle(
                                  color: Color(0xff101828),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              )
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12,),
                  const Divider(color: Color(0xFFEEEEEE),thickness: 1,),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text("🇪🇬",
                        style: TextStyle(
                            color: Color(0xff4A5565),
                            fontSize: 18,
                          fontWeight: FontWeight.w400
                      ),
                      ),
                      SizedBox(width: 6,),
                      Text(
                        'Cairo, Egypt',
                        style: TextStyle(
                            color: Color(0xff4A5565),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter'
                        ),
                      )
              ]
                      ),
      ]
        )
    )
    )

    );
  }
}
