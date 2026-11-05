import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_weather_activity_planner/providers/weather_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter city',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_city),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final city = _controller.text;
                context.read<WeatherProvider>().fetchWeather(city);
                Navigator.pop(context);
              },
              child: const Text('Search Weather'),
            ),
          ],
        ),
      ),
    );
  }
}
