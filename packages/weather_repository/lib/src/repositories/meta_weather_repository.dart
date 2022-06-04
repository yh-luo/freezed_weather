import 'dart:async';

import 'package:meta_weather_api/meta_weather_api.dart' hide Weather;

import '../models/models.dart';
import 'weather_repository.dart';

class MetaWeatherWeatherRepository implements WeatherRepository {
  MetaWeatherWeatherRepository({MetaWeatherApiClient? weatherApiClient})
      : _weatherApiClient = weatherApiClient ?? MetaWeatherApiClient();

  final MetaWeatherApiClient _weatherApiClient;

  @override
  Future<Weather> getWeather(String city) async {
    final location = await _weatherApiClient.locationSearch(city);
    final id = location.id;
    final weather = await _weatherApiClient.getWeather(id);

    return Weather(
      temperature: weather.theTemp,
      location: location.title,
      condition: weather.weatherStateAbbr.toCondition,
    );
  }
}

extension on WeatherState {
  WeatherCondition get toCondition {
    switch (this) {
      case WeatherState.clear:
        return WeatherCondition.clear;
      case WeatherState.snow:
      case WeatherState.sleet:
      case WeatherState.hail:
        return WeatherCondition.snowy;
      case WeatherState.thunderstorm:
      case WeatherState.heavyRain:
      case WeatherState.lightRain:
      case WeatherState.showers:
        return WeatherCondition.rainy;
      case WeatherState.heavyCloud:
      case WeatherState.lightCloud:
        return WeatherCondition.cloudy;
      default:
        return WeatherCondition.unknown;
    }
  }
}
