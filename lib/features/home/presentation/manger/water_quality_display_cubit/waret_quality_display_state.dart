import 'package:equatable/equatable.dart';
import 'package:limix_test/features/home/data/models/water_quality_model/water.quality.display.model.dart';

sealed class WaterQualityDisplayState extends Equatable {
  const WaterQualityDisplayState();

  @override
  List<Object> get props => [];
}

// أول حالة عند البداية
final class WaterQualityDisplayInitial extends WaterQualityDisplayState {}

// حالة تحميل البيانات
final class WaterQualityDisplayLoading extends WaterQualityDisplayState {}

// حالة نجاح تحميل البيانات
final class WaterQualityDisplaySuccess extends WaterQualityDisplayState {
  final WaterQualityModel waterQualityData;

  const WaterQualityDisplaySuccess(this.waterQualityData);

  @override
  List<Object> get props => [waterQualityData];
}

// حالة وجود خطأ
final class WaterQualityDisplayError extends WaterQualityDisplayState {
  final String errorMessage;

  const WaterQualityDisplayError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
