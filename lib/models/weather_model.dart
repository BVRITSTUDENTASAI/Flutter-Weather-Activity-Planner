class WeatherModel {
  final String cityName;
  final String description;
  final double temperature;
  final double humidity;
  final double windSpeed;
  final String iconCode;

  WeatherModel({
    required this.cityName,
    required this.description,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.iconCode,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final weatherList = json['weather'] as List<dynamic>? ?? const [];
    final weather = weatherList.isNotEmpty ? weatherList.first : <String, dynamic>{};

    return WeatherModel(
      cityName: json['name'] ?? 'Unknown City',
      description: weather['description'] ?? 'Clear',
      temperature: (json['main']?['temp'] ?? 0.0).toDouble(),
      humidity: (json['main']?['humidity'] ?? 0.0).toDouble(),
      windSpeed: (json['wind']?['speed'] ?? 0.0).toDouble(),
      iconCode: weather['icon'] ?? '01d',
    );
  }
}

class WeatherForecast {
  final String day;
  final double minTemp;
  final double maxTemp;
  final String description;

  WeatherForecast({
    required this.day,
    required this.minTemp,
    required this.maxTemp,
    required this.description,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    final weatherList = json['weather'] as List<dynamic>? ?? const [];
    final weather = weatherList.isNotEmpty ? weatherList.first : <String, dynamic>{};

    return WeatherForecast(
      day: json['dt_txt'] ?? 'Today',
      minTemp: (json['main']?['temp_min'] ?? 0.0).toDouble(),
      maxTemp: (json['main']?['temp_max'] ?? 0.0).toDouble(),
      description: weather['description'] ?? 'Clear',
    );
  }
}
