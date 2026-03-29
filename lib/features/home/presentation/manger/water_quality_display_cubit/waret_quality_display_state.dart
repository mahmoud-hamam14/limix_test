part of 'waret_quality_display_cubit.dart';

sealed class WaretQualityDisplayState extends Equatable {
  const WaretQualityDisplayState();

  @override
  List<Object> get props => [];
}

final class WaretQualityDisplayInitial extends WaretQualityDisplayState {}

final class WaretQualityDisplayLoading extends WaretQualityDisplayState {}

final class WaretQualityDisplaySuccess extends WaretQualityDisplayState {
  final WaterQualityModel waterQualityData;

  const WaretQualityDisplaySuccess(this.waterQualityData);
}

final class WaretQualityDisplayError extends WaretQualityDisplayState {
  final String errmessage;

  const WaretQualityDisplayError(this.errmessage);
}
