import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:limix_test/core/errors/failure.dart';
import 'package:limix_test/core/models/water_quality_model.dart';

import 'dart:async';
// import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class WaterApiService {
  final Dio dio = Dio();

  final String baseUrl =
      'https://sensors-data-29031828413.europe-west3.run.app/get-data';

  Future<WaterQualityModel> getWaterData() async {
    try {
      final response = await dio.get(baseUrl);

      return WaterQualityModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerFailure.fromDioException(e);
    }
  }
}

// import 'package:http/http.dart' as http;

// class WaterApiService {
//   final String baseUrl =
//       'https://sensors-data-29031828413.europe-west3.run.app/get-data';

//   Future<WaterQualityModel> getWaterData() async {
//     try {
//       final response = await http
//           .get(Uri.parse(baseUrl))
//           .timeout(const Duration(seconds: 10));

//       switch (response.statusCode) {
//         case 200:
//           final jsonData = jsonDecode(response.body);
//           return WaterQualityModel.fromJson(jsonData);

//         case 404:
//           throw Exception('NOT_FOUND');

//         case 500:
//           throw Exception('SERVER_ERROR');

//         default:
//           throw Exception('HTTP_${response.statusCode}');
//       }
//     } on SocketException {
//       throw Exception('No Internet Connection');
//     } on TimeoutException {
//       throw Exception('timeout error');
//     } on FormatException {
//       throw Exception('Bad response format');
//     }
//   }
// }
