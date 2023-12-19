import 'package:weather_plugin/src/core/dio/dio_client.dart';
import 'package:weather_plugin/src/core/models/weather_model.dart';
import 'package:weather_plugin/src/core/service/ab_weather_service.dart';
import 'package:weather_plugin/src/core/service/weather_client.dart';

class WeatherService extends ABWeatherService {
  WeatherService();

  final DioClient _dioClient = DioClient();

  final weatherClient = WeatherClient.instance;

  @override
  Future<WeatherModel> getCurrentWeatherByCityName(
      {String cityName = "Pune"}) async {
    if (!weatherClient.isInitializedWithApiKey()) {
      throw Exception(
          'WeatherClient must be initialized before accessing instance');
    } else {
      final response =
          await _dioClient.get('/data/2.5/weather', queryParameters: {
        'q': cityName,
        'appid': weatherClient.apiKey,
        'units': weatherClient.unit.name,
      });
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load weather data ${response.statusCode}}');
      }
    }
  }

  @override
  Future<WeatherModel> getCurrentWeatherByLocation(
      {required double lat, required double lon}) async {
    if (!weatherClient.isInitializedWithApiKey()) {
      throw Exception(
          'WeatherClient must be initialized before accessing instance');
    } else {
      final response =
          await _dioClient.get('/data/2.5/weather', queryParameters: {
        'lat': lat,
        'lon': lon,
        'appid': weatherClient.apiKey,
        'units': weatherClient.unit.name,
      });
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load weather data ${response.statusCode}}');
      }
    }
  }

  @override
  String getWeatherIcon(int condition) {
    return 'icon';
  }
}
