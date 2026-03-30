// import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limix_test/features/home/presentation/manger/water_quality_display_cubit/waret_quality_display_cubit.dart';
import 'package:limix_test/features/home/presentation/view/home_view_body.dart';
import 'package:limix_test/features/home/presentation/view/widget/appbar_home_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();

    context.read<WaterQualityDisplayCubit>().startLiveUpdates();
  }

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
