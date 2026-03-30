import 'dart:async';
import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:limix_test/features/home/data/models/water_quality_model/water.quality.display.model.dart';
import 'package:limix_test/features/home/data/services/water_api_service.dart';
import 'package:limix_test/features/home/presentation/manger/water_quality_display_cubit/waret_quality_display_state.dart';

// part 'water_quality_display_state.dart';

class WaterQualityDisplayCubit extends Cubit<WaterQualityDisplayState> {
  final WaterApiService apiService;

  Timer? _timer;
  bool _isRunning = false;

  WaterQualityDisplayCubit(this.apiService)
    : super(WaterQualityDisplayInitial());

  // 🔹 Fetch Data
  Future<void> fetchWaterData({bool isFirstLoad = false}) async {
    try {
      if (isFirstLoad) {
        emit(WaterQualityDisplayLoading());
      }

      final data = await apiService.getWaterData();

      emit(WaterQualityDisplaySuccess(data));
    } catch (e) {
      emit(WaterQualityDisplayError(e.toString()));
    }
  }

  // 🔹 Start Live Updates
  void startLiveUpdates() {
    if (_isRunning) return; // يمنع تكرار الـ Timer

    _isRunning = true;

    // أول مرة (يظهر loading)
    fetchWaterData(isFirstLoad: true);

    // تحديث كل 5 ثواني
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      fetchWaterData(); // بدون loading
    });
  }

  // 🔹 Stop Live Updates (اختياري)
  void stopLiveUpdates() {
    _timer?.cancel();
    _isRunning = false;
  }

  // 🔹 Dispose
  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
