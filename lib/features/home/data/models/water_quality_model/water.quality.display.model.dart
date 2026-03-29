import 'package:equatable/equatable.dart';

import 'data.quality.display.model.dart';

class WaterQualityModel extends Equatable {
	final Data? data;
	final bool? success;

	const WaterQualityModel({this.data, this.success});

	factory WaterQualityModel.fromJson(Map<String, dynamic> json) => WaterQualityModel(
				data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
				success: json['success'] as bool?,
			);

	Map<String, dynamic> toJson() => {
				'data': data?.toJson(),
				'success': success,
			};

	@override
	List<Object?> get props => [data, success];
}
