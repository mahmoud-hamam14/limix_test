import 'package:limix_test/core/models/water_quality_model.dart';

abstract class WaterQualityDesplayState {}

class WaterQualityDesplayInitial extends WaterQualityDesplayState {}

class WaterQualityDesplayLoading extends WaterQualityDesplayState {}

class WaterQualityDesplaySuccess extends WaterQualityDesplayState {
  final WaterQualityModel data;
  WaterQualityDesplaySuccess(this.data);
}

class WaterQualityDesplayError extends WaterQualityDesplayState {
  final String message;
  WaterQualityDesplayError(this.message);
}
