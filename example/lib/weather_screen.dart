import 'package:flutter/material.dart';
import 'package:weather_plugin/weather.dart';
import 'package:weather_plugin_example/main.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherModel? weatherModel;
  @override
  void initState() {
    super.initState();
  }

  Future<WeatherModel> getWeather() async {
    WeatherMain.initClient(apiKey: WEATHER_API_KEY, unit: WeatherUnit.metric);
    return await WeatherMain.fetchWeatherByCityName(cityName: 'manali');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getWeather(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            final weatherdata = snapshot.data as WeatherModel;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(weatherdata.main!.temp!.toString()),
                  CurrentWeatherWidget(),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
