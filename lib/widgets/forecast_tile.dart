import 'package:flutter/material.dart';
import 'package:flutter_weather_activity_planner/models/weather_model.dart';

class ForecastTile extends StatelessWidget {
  final WeatherForecast forecast;

  const ForecastTile({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.cloud, color: Colors.blue),
        title: Text(forecast.day),
        subtitle: Text(forecast.description),
        trailing: Text(
          '${forecast.minTemp.toStringAsFixed(0)}° / ${forecast.maxTemp.toStringAsFixed(0)}°',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
