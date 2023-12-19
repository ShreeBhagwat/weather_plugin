import 'package:dio/dio.dart';
import 'package:weather_plugin/src/core/dio/dio_client_options.dart';
import 'package:weather_plugin/src/core/dio/dio_exception.dart';

class DioClient {
  DioClient({Dio? dio, DioClientOptions? options})
      : _options = options ?? DioClientOptions(),
        dioClinet = dio ?? Dio() {
    dioClinet
      ..options.baseUrl = _options.baseUrl
      ..options.connectTimeout = _options.connectTimeout
      ..options.receiveTimeout = _options.receiveTimeout
      ..options.queryParameters = _options.queryParameters
      ..options.headers = _options.headers
      ..interceptors.add(LogInterceptor(responseBody: true));
  }

  final Dio dioClinet;

  final DioClientOptions _options;

  Future<Response<T>> get<T>(String path,
      {Map<String, Object>? queryParameters}) async {
    try {
      return await dioClinet.get<T>(path, queryParameters: queryParameters);
    } on DioExceptionType catch (e) {
      throw DioExceptions.fromDioError(e);
    }
  }
}
