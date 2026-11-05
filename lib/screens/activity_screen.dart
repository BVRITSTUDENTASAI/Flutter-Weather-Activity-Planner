import 'package:flutter/material.dart';
import 'package:flutter_weather_activity_planner/widgets/activity_tile.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      ActivityTile(title: 'Morning Walk', detail: 'Best for clear weather'),
      ActivityTile(title: 'Indoor Workout', detail: 'Recommended when weather is rainy'),
      ActivityTile(title: 'Reading Time', detail: 'Perfect for a calm evening'),
      ActivityTile(title: 'Cycling', detail: 'Ideal for mild temperatures'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Activities')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: activities,
      ),
    );
  }
}
