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
       AppBar(
         flexibleSpace:
         Container(
           decoration:
           BoxDecoration(
               gradient: LinearGradient(
                   begin: Alignment.topCenter,
                   end: Alignment.bottomCenter,
                   colors: [
                     Color(0xff6366F1),
                     Color(0xff8B5CF6),
                   ] ),
               boxShadow: [
                 BoxShadow(
                     offset: Offset(0, 4),
                     blurRadius: 6,
                     spreadRadius: -4,
                     color: Color(0x1A000000)
                 ),
                 BoxShadow(
                     offset: Offset(0, 10),
                     blurRadius: 15,
                     spreadRadius: -3,
                     color: Color(0x1A000000)
                 )
               ]
           ) ,
         ),
         title:
         Row(
           children: [
             IconButton(
                 onPressed: (){},
                 icon: Icon(Icons.arrow_back, color: Colors.white,size: 16,)
             ),
             SizedBox(width: 2,),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text( 'Settings',
                   style: TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.w400,
                     color: Colors.white,
                   ),
                 ),
                 Text( 'Manage your preferences',
                   style: TextStyle(
                     fontSize: 12,
                     fontWeight: FontWeight.w400,
                     color: Colors.white.withOpacity(0.7),
                   ),
                 ),
               ],
             ),
           ],
         ),
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
                iconColor: Color(0xffE17100)
            ),
            SizedBox(height: 25,),
           Center(child: CustomButton())
        
          ],
        ),
      ),
      
    );
  }
}