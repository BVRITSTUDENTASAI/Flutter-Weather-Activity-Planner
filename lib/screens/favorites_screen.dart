import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_weather_activity_planner/providers/weather_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: ListView.builder(
        itemCount: provider.favoriteCities.length,
        itemBuilder: (context, index) {
          final city = provider.favoriteCities[index];
          return ListTile(
            title: Text(city),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.read<WeatherProvider>().fetchWeather(city);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
