import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:limix_test/core/models/water_quality_model.dart';

class WaterApiService {
  final String baseUrl =
      'https://sensors-data-29031828413.europe-west3.run.app/get-data';

  Future<WaterQualityModel> getWaterData() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return WaterQualityModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load water data');
    }
  }
}