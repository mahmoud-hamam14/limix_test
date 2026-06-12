
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:limix_test/core/constants/custom_appbar.dart';

import 'package:limix_test/features/ai_models/cubit/fish_recommendation_cubit.dart';


import 'package:limix_test/features/ai_models/widget/fish_recommendatioms_card.dart';

class FishRecommendationsView extends StatelessWidget {
  const FishRecommendationsView({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(

      create: (context) =>
      FishRecommendationCubit()
        ..getFish(),

      child: Scaffold(

        backgroundColor: Colors.white,

        appBar: PreferredSize(

          preferredSize:
          const Size.fromHeight(
            kToolbarHeight,
          ),

          child: CustomAppbar(

            title:
            'Fish species Recommendations',

            subTitle:
            'Based on your water quality',

            showBackButton: false,

            onTap: () {},

            iconTheme:
            const IconThemeData(
              color: Colors.white,
            ),
          ),
        ),

        body:
        BlocBuilder<
            FishRecommendationCubit,
            FishRecommendationState>(

          builder: (context, state) {

            final cubit =
            context.read<
                FishRecommendationCubit>();
            /// Loading
            if (state
            is FishRecommendationLoading) {

              return const Center(
                child:
                CircularProgressIndicator(
                  color: Colors.blueAccent,
                ),
              );
            }

            /// Success
            if (state
            is FishRecommendationSuccess) {

              final fish =
              cubit.fishModel!;

              return Padding(

                padding:
                const EdgeInsets.only(
                  left: 10,
                  top: 12,
                  right: 12,
                ),

                child: Column(
                  children: [

                    FishRecommendatiomsCard(

                      image:
                      fish.fishImage,

                      type: fish.fishName,
                    ),
                  ],
                ),
              );
            }

            /// Error
            if (state
            is FishRecommendationError) {

              return const Center(
                child: Text(
                  "Something went wrong",
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}