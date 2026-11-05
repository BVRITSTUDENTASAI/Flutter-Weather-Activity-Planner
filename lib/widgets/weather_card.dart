import 'package:flutter/material.dart';
import 'package:flutter_weather_activity_planner/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.lightBlueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            weather.cityName,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            weather.description,
            style: const TextStyle(fontSize: 16, color: Colors.white70),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Icon(Icons.thermostat, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                '${weather.temperature.toStringAsFixed(1)}°C',
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Metric(icon: Icons.water_drop, label: 'Humidity', value: '${weather.humidity.toStringAsFixed(0)}%'),
              _Metric(icon: Icons.air, label: 'Wind', value: '${weather.windSpeed.toStringAsFixed(0)} km/h'),
            ],
          ),
        ],
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _Metric({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white70)),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
