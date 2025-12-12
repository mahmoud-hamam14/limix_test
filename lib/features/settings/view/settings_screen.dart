import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:limix_test/core/constants/custom_appbar.dart';
import 'package:limix_test/features/alerts/view/alerts_screen.dart';
import 'package:limix_test/features/auth/view/login_view.dart';

import '../data/cubit/profile_cubit/profile_cubit.dart';
import '../widget/Ai_card.dart';
import '../widget/acount_setting_widget.dart';
import '../widget/contact_card.dart';
import '../widget/device_maintenance_card.dart';
import '../widget/notification_card.dart';
import '../widget/support_card.dart';

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
        AcountSettingWidget(),
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
            DeviceMaintenanceCard(),
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
            AiCard(),

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
            SupportCard(),
            SizedBox(height: 25,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.redAccent,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent, // عشان الـ InkWell يشتغل صح فوق الـ Container
            child: InkWell(
              borderRadius: BorderRadius.circular(24), // عشان التحديد لما تدوس يبقى واخد الكيرف
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                print("Logout Tapped");
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center, // سنتر الكلام والأيقونة
                children: [
                  Icon(
                    Icons.logout,
                    color: Color(0xffE7000B),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Logout",
                    style: TextStyle(
                      color: Color(0xffE7000B),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          )
        
          ],
        ),
      ),
      
    );
  }
}