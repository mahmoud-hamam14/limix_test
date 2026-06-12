import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limix_test/core/api/water_api_service.dart';
import 'package:limix_test/core/cubit/water_quality_desplay_cubit/water_quality_desplay_state.dart';
import 'package:limix_test/core/errors/failure.dart';
import 'package:limix_test/core/models/water_quality_model.dart';

class WaterQualityDesplayCubit extends Cubit<WaterQualityDesplayState> {
  final WaterApiService api;

  WaterQualityModel? data;
  Timer? _timer;

  bool _isFetching = false;

  WaterQualityDesplayCubit(this.api)
      : super(WaterQualityDesplayInitial());

  Future<void> fetchData({bool showLoading = true}) async {
    if (_isFetching) return;

    _isFetching = true;

    try {
      if (showLoading) {
        emit(WaterQualityDesplayLoading());
      }

      final result = await api.getWaterData();

      data = result;

      emit(WaterQualityDesplaySuccess(result));
    } on Failure catch (e) {
      emit(
        WaterQualityDesplayError(
          e.message,
        ),
      );
    } catch (_) {
      emit(
        WaterQualityDesplayError(
          'حدث خطأ غير متوقع، حاول مرة أخرى',
        ),
      );
    } finally {
      _isFetching = false;
    }
  }

  void start() {
    _timer?.cancel();

    fetchData();

    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => fetchData(showLoading: false),
    );
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Future<void> close() {
    stop();
    return super.close();
  }
}