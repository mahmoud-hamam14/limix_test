import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:limix_test/core/constants/custom_appbar.dart';
import 'package:limix_test/features/alerts/view/alerts_screen.dart';
import 'package:limix_test/features/auth/view/login_view.dart';
import 'package:limix_test/features/settings/view/account_setting_screen.dart';
import 'package:limix_test/features/settings/view/support_view.dart';
import 'package:limix_test/features/settings/widget/custom_setting_container.dart';
import 'package:limix_test/features/settings/widget/profile_widgets/custom_button.dart';

import '../data/cubit/profile_cubit/profile_cubit.dart';
import '../widget/appbar_setting_view.dart';
import '../widget/notification_card.dart';
import 'ai_assistant_screen.dart';
import 'device_maintenance_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
      PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(
            title: "Settings",
            subTitle: "Manage your preferences",
            showBackButton: true,
            onTap: (){}
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           SizedBox(height:16),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Text('Account',
                style: TextStyle(
                  color: Color(0xff0891B2),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter'
                ),
              ),
            ),
            SizedBox(height: 22,),
            CustomSettingContainer(
                title: "Account Settings ",
                subtitle: "Email, password, security",
                icon: Icons.lock_outline_rounded,
                backgroundColor: Color(0xFFDBEAFE),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSettingScreen(),));
                },
                iconColor: Color(0xff155DFC),
            ),
            SizedBox(height: 22,),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Text('Notifications',
                style: TextStyle(
                    color: Color(0xff0891B2),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter'
                ),
              ),
            ),
            SizedBox(height: 12,),
            NotificationsCard(),
            SizedBox(height: 22,),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Text('Device Maintenance',
                style: TextStyle(
                    color: Color(0xff0891B2),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter'
                ),
              ),
            ),
            SizedBox(height: 12,),
            CustomSettingContainer(
              title: 'Device Maintenance',
              subtitle: 'Manage device health',
              icon: Icons.build_outlined,
              backgroundColor: Color(0xFFF3E8FF),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DeviceMaintenanceScreen(),));
              },
              iconColor: Color(0xff9810FA),
            ),
            SizedBox(height: 22,),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Text('AI Assistant',
                style: TextStyle(
                    color: Color(0xff0891B2),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter'
                ),
              ),
            ),
            SizedBox(height: 12,),
            CustomSettingContainer(
              title: 'Chat with AI Assistant',
              subtitle: 'Get help and insights',
              icon: Icons.chat_bubble_outline,
              backgroundColor: Color(0xFFFCE7F3),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AiAssistantScreen(),));
              },
              iconColor: Color(0xff9810FA),
            ),
            SizedBox(height: 22,),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Text('Support',
                style: TextStyle(
                    color: Color(0xff0891B2),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter'
                ),
              ),
            ),
            SizedBox(height: 12,),
            CustomSettingContainer(
                title: "Help & Support",
                icon: Icons.help_outline_outlined,
                backgroundColor: Color(0xFFFEF3C6),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SupportView(),));
                },
                iconColor: Color(0xffE17100),
              titlePadding: EdgeInsets.only(top: 10),
            ),
            SizedBox(height: 25,),
           Center(child:
               CustomButton(
                   title: "logout",
                   icon: Icons.logout,
                   iconColor: Color(0xffE7000B),
                   titleColor: Color(0xffE7000B),
                   onTap: (){
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                   },
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
                   backgroundColor: Colors.white,
                 borderColor: Color(0xffE7000B),
               )
           )
        
          ],
        ),
      ),
      
    );
  }
}