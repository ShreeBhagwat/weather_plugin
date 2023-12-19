import 'package:weather_plugin/src/core/models/weather_model.dart';

abstract class ABWeatherService {
  Future<WeatherModel> getCurrentWeatherByLocation(
      {required double lat, required double lon});


  Future<WeatherModel> getCurrentWeatherByCityName(
      {required String cityName});



  String getWeatherIcon(int condition);        
}
