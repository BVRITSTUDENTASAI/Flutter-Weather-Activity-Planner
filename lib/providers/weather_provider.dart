import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter_weather_activity_planner/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  static const String _apiKey = '418f9eff8fc394e902016db864679394';

  WeatherModel? _currentWeather;
  List<WeatherForecast> _forecast = [];
  bool _isLoading = false;
  String _errorMessage = '';
  String _tempUnit = '°C';
  bool _darkMode = false;
  final List<String> _favoriteCities = ['Hyderabad', 'Delhi', 'Mumbai'];

  WeatherModel? get currentWeather => _currentWeather;
  List<WeatherForecast> get forecast => _forecast;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  String get tempUnit => _tempUnit;
  bool get darkMode => _darkMode;
  List<String> get favoriteCities => _favoriteCities;

  void toggleTemperatureUnit() {
    _tempUnit = _tempUnit == '°C' ? '°F' : '°C';
    notifyListeners();
  }

  void toggleDarkMode() {
    _darkMode = !_darkMode;
    notifyListeners();
  }

  Future<void> fetchWeather(String city) async {
    final sanitizedCity = city.trim();
    if (sanitizedCity.isEmpty) {
      _errorMessage = 'Please enter a valid city name.';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      if (_apiKey == '418f9eff8fc394e902016db864679394') {
        _currentWeather = WeatherModel(
          cityName: sanitizedCity,
          description: 'Clear Sky',
          temperature: 28.0,
          humidity: 52.0,
          windSpeed: 12.0,
          iconCode: '01d',
        );
        _forecast = [
          WeatherForecast(day: 'Mon', minTemp: 25, maxTemp: 31, description: 'Sunny'),
          WeatherForecast(day: 'Tue', minTemp: 24, maxTemp: 30, description: 'Cloudy'),
          WeatherForecast(day: 'Wed', minTemp: 23, maxTemp: 28, description: 'Rainy'),
          WeatherForecast(day: 'Thu', minTemp: 22, maxTemp: 27, description: 'Windy'),
          WeatherForecast(day: 'Fri', minTemp: 24, maxTemp: 29, description: 'Partly Cloudy'),
        ];
      } else {
        final weatherUrl = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$sanitizedCity&units=metric&appid=$_apiKey',
        );
        final response = await http.get(weatherUrl);

        if (response.statusCode != 200) {
          throw Exception('City not found or API call failed.');
        }

        final weatherJson = jsonDecode(response.body) as Map<String, dynamic>;
        _currentWeather = WeatherModel.fromJson(weatherJson);

        final forecastUrl = Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$sanitizedCity&units=metric&appid=$_apiKey',
        );
        final forecastResponse = await http.get(forecastUrl);

        if (forecastResponse.statusCode == 200) {
          final forecastJson = jsonDecode(forecastResponse.body) as Map<String, dynamic>;
          final list = (forecastJson['list'] as List<dynamic>? ?? const []);
          _forecast = list.take(5).map((item) => WeatherForecast.fromJson(item)).toList();
        }
      }

      _errorMessage = '';
    } catch (error) {
      _errorMessage = 'Unable to load weather data. Please try again.';
      _currentWeather = null;
      _forecast = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void addFavoriteCity(String city) {
    if (city.trim().isEmpty || _favoriteCities.contains(city.trim())) {
      return;
    }
    _favoriteCities.add(city.trim());
    notifyListeners();
  }
}

extension WeatherProviderContext on BuildContext {
  WeatherProvider get weatherProvider => read<WeatherProvider>();
}
