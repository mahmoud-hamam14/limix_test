import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limix_test/core/api/water_api_service.dart';
import 'package:limix_test/core/cubit/water_quality_desplay_cubit/water_quality_desplay_state.dart';
import 'package:limix_test/core/models/water_quality_model.dart';

class WaterQualityDesplayCubit extends Cubit<WaterQualityDesplayState> {
  final WaterApiService api;

  WaterQualityModel? data;
  Timer? _timer;

  bool isLive = false;

  WaterQualityDesplayCubit(this.api) : super(WaterQualityDesplayInitial());

  Future<void> fetchData({bool showLoading = true}) async {
    try {
      if (showLoading) emit(WaterQualityDesplayLoading());

      data = await api.getWaterData();

      emit(WaterQualityDesplaySuccess(data!));
    } catch (e) {
      emit(WaterQualityDesplayError(e.toString()));
    }
  }

  void start() {
    if (isLive) {
      fetchData();

      _timer = Timer.periodic(
        const Duration(seconds: 5),
        (_) => fetchData(showLoading: false),
      );
    } else {
      fetchData();
    }
  }

  void stop() {
    _timer?.cancel();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
