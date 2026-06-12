import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with API server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with API server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response!.statusCode!,
          e.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Cancel request with API server');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection');
      case DioExceptionType.unknown:
        return ServerFailure('Opps something went wrong, please try again 1');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, please try later');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, please try later!');
    } else if (statusCode == 429) {
      return ServerFailure('Too many requests, please try again later');
    } else if (statusCode == 502) {
      return ServerFailure('Bad gateway, please try again later');
    } else if (statusCode == 503) {
      return ServerFailure('Service unavailable, please try later');
    } else {
      print(statusCode);
      return ServerFailure('Opps something went wrong, please try again 2');
    }
  }
}
