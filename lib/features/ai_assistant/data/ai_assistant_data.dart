import 'package:dio/dio.dart';

class AiAssistantData {
  static final Dio dio = Dio();

  static const String baseUrl =
      'https://hornless-maura-uncontrovertedly.ngrok-free.dev';
  static const String chatEndpoint = '/ask';

  static Future<String> sendMessage(String message) async {
    try {
      final response = await dio.post(
        '$baseUrl$chatEndpoint',
        data: {
          'question': message,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'ngrok-skip-browser-warning': 'true',
          },
        ),
      );

      final data = response.data;

      if (data is Map<String, dynamic>) {
        return data['answer'] ?? 'No response';
      }

      return 'Unexpected response format';
    } catch (e) {
      return 'Error: $e';
    }
  }
}