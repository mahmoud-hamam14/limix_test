import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:limix_test/features/home/data/models/water_quality_model/water.quality.display.model.dart';
import 'package:limix_test/features/home/data/services/water_api_service.dart';

part 'waret_quality_display_state.dart';

class WaretQualityDisplayCubit extends Cubit<WaretQualityDisplayState> {
  final WaterApiService apiService;

  WaretQualityDisplayCubit(this.apiService)
    : super(WaretQualityDisplayInitial());

  Future<void> fetchWaterData() async {
    try {
      emit(WaretQualityDisplayLoading());

      final data = await apiService.getWaterData();

      emit(WaretQualityDisplaySuccess(data));
    } catch (e) {
      emit(WaretQualityDisplayError(e.toString()));
    }
  }
}
