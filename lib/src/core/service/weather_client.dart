class WeatherClient {
  final String apiKey;
  final bool isIniatialized;
  final WeatherUnit unit;

  static WeatherClient? _instance;

  WeatherClient._({required this.apiKey, this.unit = WeatherUnit.metric})
      : isIniatialized = true;

  static WeatherClient create(
      {required String apiKey, WeatherUnit unit = WeatherUnit.metric}) {
    _instance ??= WeatherClient._(apiKey: apiKey, unit: unit);
    return _instance!;
  }

  static WeatherClient get instance {
    if (_instance == null) {
      throw Exception(
          'WeatherClient must be initialized before accessing instance');
    }
    return _instance!;
  }

  bool isInitializedWithApiKey() {
    return isIniatialized;
  }
}

enum WeatherUnit {
  metric,
  imperial,
}
