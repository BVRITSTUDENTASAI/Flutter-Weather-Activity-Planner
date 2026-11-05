import 'package:flutter/material.dart';
import 'package:flutter_weather_activity_planner/widgets/weather_card.dart';
import 'package:flutter_weather_activity_planner/models/weather_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: WeatherCard(
            weather: WeatherModel(
              cityName: 'Hyderabad',
              description: 'Clear Sky',
              temperature: 29.0,
              humidity: 58,
              windSpeed: 14,
              iconCode: '01d',
            ),
          ),
        ),
      ),
    );
  }
}
