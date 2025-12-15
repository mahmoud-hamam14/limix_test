import 'package:flutter/material.dart';

import '../widget/appbar_setting_view.dart';
class DeviceMaintenanceScreen extends StatelessWidget {
  const DeviceMaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar:
      PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppbarSettingView(
          title: "Account Settings",
          subTitle: "Manage your information",
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xff8B5CF6),
                Color(0xffA78BFA)
              ]
          ),
          iconTheme: IconThemeData(color:Colors.white),
          showBackButton: false,
          onTap: (){},
          icon: Icons.build_outlined,
        ),
      ),
    );
  }
}
