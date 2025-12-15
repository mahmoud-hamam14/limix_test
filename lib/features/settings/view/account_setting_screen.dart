import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limix_test/core/constants/custom_appbar.dart';
import 'package:limix_test/features/settings/data/cubit/profile_cubit/profile_cubit.dart';
import 'package:limix_test/features/settings/widget/appbar_setting_view.dart';
import 'package:limix_test/features/settings/widget/profile_widgets/custom_button.dart';
import 'package:limix_test/features/settings/widget/profile_widgets/custom_profile_container.dart';
import 'package:limix_test/features/settings/widget/profile_widgets/profile_image_widget.dart';
import '../../auth/view/login_view.dart';
import '../widget/profile_widgets/costum_password_field.dart';
import '../widget/profile_widgets/custom_input_field.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
        PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppbarSettingView(
          title: "Account Settings",
          subTitle: "Manage your information",
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff0891B2),
                Color(0xff06B6D4)
              ]
          ),
        iconTheme: IconThemeData(color:Colors.white),
        showBackButton: false,
        onTap: (){},
      ),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
           ProfileImageWidget(),
            SizedBox(height: 24,),
            CustomProfileContainer(
                height: 460,
                width: 328.39,
                children: [
                  SizedBox(height: 20,),
                  Text("Personal Information",
                      style: TextStyle(
                        color: Color(0xff0891B2),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )
                  ),
                  SizedBox(height: 30,),
                  CustomInputField(
                    label: "Full Name",
                    hint: "Ahmed Mohamed",
                    icon: Icons.person_outline,
                    controller: TextEditingController(),
                  ),
                  CustomInputField(
                    label: "Email",
                    hint: "ahmed@limix.eg",
                    icon: Icons.email_outlined,
                    controller: TextEditingController(),
                  ),
                  CustomInputField(
                    label: "Phone",
                    hint: "+20 123 456 7890",
                    icon: Icons.phone,
                    controller: TextEditingController(),
                  ),
                  CustomInputField(
                    label: "Location",
                    hint: "Cairo, Egypt",
                    icon: Icons.location_on_outlined,
                    controller: TextEditingController(),
                  ),
                ]
            ),
            SizedBox(height: 24,),
            CustomProfileContainer(
                height: 280,
                width: 328.39,
                children: [
                  SizedBox(height: 18,),
                  Text(
                      "Farm Details",
                      style: TextStyle(
                        color: Color(0xff0891B2),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )
                  ),
                  SizedBox(height: 30,),
                  CustomInputField(
                    label: "Farm Name",
                    hint: "Farm Name",
                    icon: Icons.home_outlined,
                    controller: TextEditingController(),
                  ),
                  CustomInputField(
                    label: "Farm Size",
                    hint: "ex:2.5 hectares",
                    icon: Icons.crop_square_outlined,
                    controller: TextEditingController(),
                  ),
                ]
            ),
            SizedBox(height: 24,),
            CustomProfileContainer(
                height: 400,
                width: 328.29,
                children: [
                  SizedBox(height: 18,),
                  Text(
                      "Security",
                      style: TextStyle(
                        color: Color(0xff0891B2),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )
                  ),
                  SizedBox(height: 30,),
                  CustomPasswordField(
                    label: "Current Password",
                    controller: TextEditingController(),
                  ),
                  CustomPasswordField(
                    label: "New Password",
                    controller: TextEditingController(),
                  ),
                  CustomPasswordField(
                    label: "Confirm New Password",
                    controller: TextEditingController(),
                  ),
                ]
            ),
            SizedBox(height: 20,),
            CustomButton(
                title:"Save Changes",
                icon: Icons.save_outlined,
                iconColor: Colors.white,
                titleColor: Colors.white,
                onTap: (){},
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1A000000),
                    offset: Offset(0, 4),
                    blurRadius: 6,
                    spreadRadius: -4,
                  ),
                  BoxShadow(
                    color: Color(0x1A000000),
                    offset: Offset(0, 10),
                    blurRadius: 15,
                    spreadRadius: -3,
                  )
                ],
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff0891B2),
                    Color(0xff0E7490)
                  ]
              ),
            )
    ]
        )
      ),
    );
  }
}
