import 'package:dio/dio.dart';

class AiAssistantData {
  static final Dio dio = Dio();

  static const String baseUrl =
      'https://chatbot-29031828413.europe-west3.run.app';
  static const String chatEndpoint = '/chat';

  static Future<String> sendMessage(String message) async {
    try {
      final response = await dio.post(
        '$baseUrl$chatEndpoint',
        data: {
          "message": message,
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
        return data["reply"] ?? 'No response';
      }

      return 'Unexpected response format';
    } catch (e) {
      return 'Error: $e';
    }
  }
}