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
                Color(0xff01378E),
                Color(0xff2563EB)
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
