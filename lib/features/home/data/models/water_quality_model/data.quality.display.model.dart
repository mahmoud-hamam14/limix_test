import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final double? ammonia;
  final double? dissolvedOxygen;
  final double? ec;
  final double? ph;
  final double? temperature;
  final DateTime? timestamp;
  final double? turbidity;

  const Data({
    this.ammonia,
    this.dissolvedOxygen,
    this.ec,
    this.ph,
    this.temperature,
    this.timestamp,
    this.turbidity,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    ammonia: (json['ammonia'] as num?)?.toDouble(),
    dissolvedOxygen: (json['do'] as num?)?.toDouble(),
    ec: (json['ec'] as num?)?.toDouble(),
    ph: (json['ph'] as num?)?.toDouble(),
    temperature: (json['temperature'] as num?)?.toDouble(),
    timestamp:
        json['timestamp'] == null
            ? null
            : DateTime.parse(json['timestamp'] as String),
    turbidity: (json['turbidity'] as num?)?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'ammonia': ammonia,
    'do': dissolvedOxygen,
    'ec': ec,
    'ph': ph,
    'temperature': temperature,
    'timestamp': timestamp?.toIso8601String(),
    'turbidity': turbidity,
  };

  @override
  List<Object?> get props {
    return [
      ammonia,
      dissolvedOxygen,
      ec,
      ph,
      temperature,
      timestamp,
      turbidity,
    ];
  }
}
