import 'package:bloc/bloc.dart';

import '../data/fish_recommendation_model.dart';
import '../data/fish_recommendation_data.dart';

part 'fish_recommendation_state.dart';

class FishRecommendationCubit
    extends Cubit<FishRecommendationState> {

  FishRecommendationCubit()
      : super(FishRecommendationInitial());

  FishRecommendationModel? fishModel;

  Future<void> getFish() async {

    emit(FishRecommendationLoading());

    try {

      fishModel =
      await FishData.getData();

      emit(FishRecommendationSuccess());

    } catch (e, s) {

      print("ERROR => $e");

      print("STACK => $s");

      emit(FishRecommendationError());
    }
    }
  }


