import 'package:weather_plugin/src/core/service/weather_service.dart';
import 'package:weather_plugin/weather.dart';


class WeatherMain {
  static void initClient(
      {required String apiKey, WeatherUnit unit = WeatherUnit.metric}) {
    WeatherClient.create(apiKey: apiKey, unit: unit);
  }

  static Future<WeatherModel> fetchWeatherByCityName(
      {required String cityName}) async {
    return await WeatherService().getCurrentWeatherByCityName(cityName: cityName);
  }

  static Future<WeatherModel> fetchWeatherByLocation(
      {required double lat, required double lon}) async {
    return await WeatherService().getCurrentWeatherByLocation(lat: lat, lon: lon);
  }
}
