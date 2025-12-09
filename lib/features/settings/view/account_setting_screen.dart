import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limix_test/core/constants/custom_appbar.dart';
import 'package:limix_test/features/settings/data/cubit/profile_cubit/profile_cubit.dart';
import 'package:limix_test/features/settings/widget/profile_widgets/farm_details_container.dart';
import 'package:limix_test/features/settings/widget/profile_widgets/profile_image_widget.dart';
import 'package:limix_test/features/settings/widget/profile_widgets/secuirty_container.dart';

import '../../auth/view/login_view.dart';
import '../widget/profile_widgets/profile_container.dart';
class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});

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
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff0891B2),
                      Color(0xff06B6D4)
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
            Text( 'Account Settings',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ), Text( 'Manage your information',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
           ProfileImageWidget(),
            SizedBox(height: 24,),
            ProfileContainer(),
            SizedBox(height: 24,),
            FarmDetailsContainer(),
            SizedBox(height: 24,),
            SecuirtyContainer(),
            SizedBox(height: 25,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff0891B2),
                    Color(0xff0E7490)
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
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: () {

                    print("Logout Tapped");
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.save_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Save Changes",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
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
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));

                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Color(0xffE7000B),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Delete Account",
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


    ]
        )
      ),
    );
  }
}
