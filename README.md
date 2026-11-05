# Flutter Weather & Activity Planner

A responsive Flutter application designed for UID/Flutter lab projects. It covers the key syllabus topics: widgets, navigation, state management, responsive layouts, forms, validation, animations, REST API integration, and testing.

## Features
- 3+ app screens for weather search and dashboard
- Responsive layout using Row/Column/Stack and MediaQuery
- Named route navigation
- Provider-based state management
- Search form with validation
- Activity recommendations based on weather
- Dark theme toggle and temperature unit toggle
- REST API ready structure with offline demo data fallback
- Basic widget testing

## Project Structure
```text
lib/
  main.dart
  models/
    weather_model.dart
  providers/
    weather_provider.dart
  screens/
    splash_screen.dart
    home_screen.dart
    search_screen.dart
    forecast_screen.dart
    settings_screen.dart
    activity_screen.dart
    favorites_screen.dart
    error_screen.dart
  widgets/
    weather_card.dart
    forecast_tile.dart
    activity_tile.dart

test/
  widget_test.dart
```

## Run the project
```bash
flutter pub get
flutter run
```

## Notes
This project is structured to match a UID assignment and can be extended with real API keys for OpenWeatherMap.
