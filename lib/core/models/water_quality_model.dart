class WaterQualityModel {
  final double ammonia;
  final double dissolvedOxygen;
  final double ec;
  final double ph;
  final double temperature;
  final double turbidity;

  const WaterQualityModel({
    required this.ammonia,
    required this.dissolvedOxygen,
    required this.ec,
    required this.ph,
    required this.temperature,
    required this.turbidity,
  });

  factory WaterQualityModel.fromJson(Map<String, dynamic> json) {
    return WaterQualityModel(
      ammonia: (json['ammonia'] as num).toDouble(),
      dissolvedOxygen: (json['do'] as num).toDouble(),
      ec: (json['ec'] as num).toDouble(),
      ph: (json['ph'] as num).toDouble(),
      temperature: (json['temperature'] as num).toDouble(),
      turbidity: (json['turbidity'] as num).toDouble(),
    );
  }

  get salinity => null;
}