import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:limix_test/features/home/data/models/water_quality_model/water.quality.display.model.dart';

class WaterApiService {
  final String baseUrl =
      'https://limix-api-29031828413.europe-west1.run.app/sensors/latest';

  Future<WaterQualityModel> getWaterData() async {
    try {
      final response = await http
          .get(Uri.parse(baseUrl))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return WaterQualityModel.fromJson(jsonData);
      } else {
        throw Exception('Error ${response.statusCode}: ${response.body}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
