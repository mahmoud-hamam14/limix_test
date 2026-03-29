// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:limix_test/features/home/presentation/view/home_view_body.dart';
import 'package:limix_test/features/home/presentation/view/widget/appbar_home_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: const AppBarHomeView(),
      ),
      backgroundColor: Colors.white,

      body: HomeViewBody(),
    );
  }
}
