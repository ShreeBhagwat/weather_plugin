import 'package:flutter/material.dart';
import 'package:weather_plugin_example/weather_screen.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherScreen(),
    );
  }
}


const WEATHER_API_KEY = 'c6ffee661d487dae28b7f3244285f579';

const kLon = 4.8897;
const kLat = 52.374;
