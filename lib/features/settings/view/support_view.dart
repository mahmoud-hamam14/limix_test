import 'package:flutter/material.dart';
import 'package:limix_test/features/settings/widget/contact_card.dart';
import 'package:limix_test/features/settings/widget/custom_support_container.dart';
import 'package:limix_test/features/settings/widget/support_card.dart';
class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
      AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xffF59E0B),
                      Color(0xffFBBF24)
                    ]
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 6,
                      spreadRadius: -4,
                      color: Color(0x1A000000)
                  ),
                  BoxShadow(
                      offset: Offset(0 ,10),
                      blurRadius:15,
                      spreadRadius: -3,
                      color: Color(0x1A000000)
                  )
                ]
            )
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text( 'Help & Support',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ), Text( 'We are here to help',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 18,),
            Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Text("Learning Resources",
                style: TextStyle(
                    color: Color(0xff0891B2),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter'
                ),
              ),
            ),
            SizedBox(height: 13),
            CustomSupportContainer(
                title: "User Guide",
                subTitle: "Complete documentation for all features",
                icon: Icons.book_outlined,
                iconColor: Color(0xff3B82F6),
                onTap: (){},
                backgroundColor: Color(0xffDBEAFE)
            ),
            SizedBox(height: 13,),
            CustomSupportContainer(
                title: "Video Tutorials",
                subTitle: "Step-by-step video guides",
                icon: Icons.videocam_outlined,
                iconColor: Color(0xffEF4444),
                onTap: (){},
                backgroundColor: Color(0xffFEE2E2)
            ),
            SizedBox(height: 13,),
            CustomSupportContainer(
                title: "FAQ",
                subTitle: "Frequently asked questions",
                icon: Icons.chat_bubble_outline_outlined,
                iconColor: Color(0xff10B981),
                onTap: (){},
                backgroundColor: Color(0xffD1FAE5)
            ),
            SizedBox(height: 22,),
            Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Text("Contact Support",
                style: TextStyle(
                    color: Color(0xff0891B2),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter'
                ),
              ),
            ),
            SizedBox(height: 13,),
            ContactCard()


    ]
        )
      )
    );
  }
}
