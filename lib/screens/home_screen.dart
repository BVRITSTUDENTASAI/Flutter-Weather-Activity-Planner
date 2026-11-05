import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_weather_activity_planner/providers/weather_provider.dart';
import 'package:flutter_weather_activity_planner/widgets/weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<WeatherProvider>().fetchWeather('Hyderabad');
    });
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider = context.watch<WeatherProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Navigator.pushNamed(context, '/search'),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorites'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/favorites');
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Forecast'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/forecast');
              },
            ),
            ListTile(
              leading: const Icon(Icons.run_circle),
              title: const Text('Activities'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/activity');
              },
            ),
          ],
        ),
      ),
      body: weatherProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (weatherProvider.errorMessage.isNotEmpty && weatherProvider.currentWeather == null)
                      Text(
                        weatherProvider.errorMessage,
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                      )
                    else if (weatherProvider.currentWeather != null)
                      WeatherCard(weather: weatherProvider.currentWeather!),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Suggested Activities',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(context, '/activity'),
                          child: const Text('View all'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: const [
                        _ActivityChip(label: 'Walking'),
                        _ActivityChip(label: 'Cycling'),
                        _ActivityChip(label: 'Reading'),
                        _ActivityChip(label: 'Gym'),
                        _ActivityChip(label: 'Movie Night'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/search'),
        child: const Icon(Icons.search),
      ),
    );
  }
}

class _ActivityChip extends StatelessWidget {
  final String label;

  const _ActivityChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      avatar: const Icon(Icons.check_circle, size: 18),
    );
  }
}
