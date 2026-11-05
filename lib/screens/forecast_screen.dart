import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_weather_activity_planner/providers/weather_provider.dart';
import 'package:flutter_weather_activity_planner/widgets/forecast_tile.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Forecast'),
      ),
      body: provider.forecast.isEmpty
          ? const Center(child: Text('No forecast available'))
          : ListView.builder(
              itemCount: provider.forecast.length,
              itemBuilder: (context, index) {
                return ForecastTile(forecast: provider.forecast[index]);
              },
            ),
    );
  }
}
