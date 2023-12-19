const String kBaseUrl = 'https://api.openweathermap.org';

class DioClientOptions {
  final String baseUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final Map<String, Object?> queryParameters;
  final Map<String, Object?> headers;

  DioClientOptions(
      {String? baseUrl,
      this.connectTimeout = const Duration(seconds: 30),
      this.receiveTimeout = const Duration(seconds: 30),
      this.queryParameters = const {},
      this.headers = const {}})
      : baseUrl = baseUrl ?? kBaseUrl;
}
