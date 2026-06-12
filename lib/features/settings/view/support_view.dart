import 'package:flutter/material.dart';
import 'package:limix_test/core/helpers/dimensions_helper.dart';
import 'package:limix_test/features/settings/widget/contact_card.dart';
import 'package:limix_test/features/settings/widget/custom_support_container.dart';

import '../widget/appbar_setting_view.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppbarSettingView(
          title: "Help & Support",
          subTitle: "We're here to help",
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xff01378E), Color(0xff2563EB)],
          ),
          iconTheme: IconThemeData(color: Colors.white),
          showBackButton: false,
          onTap: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.height),
              Text(
                "Learning Resources",
                style: TextStyle(
                  color: Color(0xff01378E),
                  fontSize: 18.font,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                ),
              ),
              SizedBox(height: 15.height),

              CustomSupportContainer(
                title: "User Guide",
                subTitle: "Complete documentation for all features",
                icon: Icons.book_outlined,
                iconColor: Color(0xff3B82F6),
                onTap: () {},
                backgroundColor: Color(0xffDBEAFE),
              ),
              SizedBox(height: 15.height),
              CustomSupportContainer(
                title: "Video Tutorials",
                subTitle: "Step-by-step video guides",
                icon: Icons.videocam_outlined,
                iconColor: Color(0xffEF4444),
                onTap: () {},
                backgroundColor: Color(0xffFEE2E2),
              ),
              SizedBox(height: 15.height),
              CustomSupportContainer(
                title: "FAQ",
                subTitle: "Frequently asked questions",
                icon: Icons.chat_bubble_outline_outlined,
                iconColor: Color(0xff10B981),
                onTap: () {},
                backgroundColor: Color(0xffD1FAE5),
              ),
              SizedBox(height: 20.height),
              Text(
                "Contact Support",
                style: TextStyle(
                  color: Color(0xff01378E),
                  fontSize: 18.font,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                ),
              ),
              SizedBox(height: 15.height),
              ContactCard(),
              SizedBox(height: 30.height),
            ],
          ),
        ),
      ),
    );
  }
}
