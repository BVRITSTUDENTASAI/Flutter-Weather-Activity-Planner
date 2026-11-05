import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_weather_activity_planner/providers/weather_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark theme'),
            value: provider.darkMode,
            onChanged: (_) => context.read<WeatherProvider>().toggleDarkMode(),
          ),
          ListTile(
            title: const Text('Temperature unit'),
            trailing: Text(provider.tempUnit),
            onTap: () => context.read<WeatherProvider>().toggleTemperatureUnit(),
          ),
          const ListTile(
            title: Text('Version'),
            trailing: Text('1.0.0'),
          ),
        ],
      ),
    );
  }
}
