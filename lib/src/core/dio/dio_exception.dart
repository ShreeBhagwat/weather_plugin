import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  DioExceptions();

  DioExceptions.fromDioError(DioExceptionType dioError) {
    switch (dioError) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;
      case DioExceptionType.badResponse:
        message = 'Unexpected error occurred';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;
      case DioExceptionType.badCertificate:
        message = 'Unexpected error occurred';
        break;
      default:
        message = 'Something went wrong';
    }
  }
  /// The error message associated with the exception.
  late String message;

  @override
  String toString() => message;
}