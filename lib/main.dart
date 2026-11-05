import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_weather_activity_planner/providers/weather_provider.dart';
import 'package:flutter_weather_activity_planner/screens/activity_screen.dart';
import 'package:flutter_weather_activity_planner/screens/favorites_screen.dart';
import 'package:flutter_weather_activity_planner/screens/forecast_screen.dart';
import 'package:flutter_weather_activity_planner/screens/home_screen.dart';
import 'package:flutter_weather_activity_planner/screens/search_screen.dart';
import 'package:flutter_weather_activity_planner/screens/settings_screen.dart';
import 'package:flutter_weather_activity_planner/screens/splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => WeatherProvider(),
      child: const WeatherPlannerApp(),
    ),
  );
}

class WeatherPlannerApp extends StatelessWidget {
  const WeatherPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/search': (context) => const SearchScreen(),
        '/forecast': (context) => const ForecastScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/activity': (context) => const ActivityScreen(),
        '/favorites': (context) => const FavoritesScreen(),
      },
    );
  }
}
