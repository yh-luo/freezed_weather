import 'dart:async';

import 'package:wttr_in_api/wttr_in_api.dart' hide Weather;

import '../models/models.dart';
import 'weather_repository.dart';

class WttrInWeatherRepository implements WeatherRepository {
  WttrInWeatherRepository({WttrInApiClient? wttrInApiClient})
      : _wttrInApiClient = wttrInApiClient ?? WttrInApiClient();

  final WttrInApiClient _wttrInApiClient;

  @override
  Future<Weather> getWeather(String location) async {
    final weather = await _wttrInApiClient.getWeather(location);
    var locationName = location;
    if (weather.area.name != location) {
      locationName = '$location\n(${weather.area.name})';
    }

    return Weather(
      temperature: weather.temperature,
      location: locationName,
      condition: weather.weatherState.toCondition,
    );
  }
}

extension on WeatherState {
  WeatherCondition get toCondition {
    switch (this) {
      case WeatherState.sunny:
        return WeatherCondition.clear;
      case WeatherState.lightSleetShowers:
      case WeatherState.lightSleetShowers2:
      case WeatherState.lightSleetShowers3:
      case WeatherState.lightSleetShowers4:
      case WeatherState.lightSleet:
      case WeatherState.lightSleet2:
      case WeatherState.lightSleet3:
      case WeatherState.lightSleet4:
      case WeatherState.lightSleet5:
      case WeatherState.lightSleet6:
      case WeatherState.lightSleet7:
      case WeatherState.lightSleet8:
      case WeatherState.lightSleet9:
      case WeatherState.lightSnow:
      case WeatherState.lightSnow2:
      case WeatherState.lightSnowShowers:
      case WeatherState.lightSnowShowers2:
      case WeatherState.lightSnowShowers3:
      case WeatherState.heavySnow:
      case WeatherState.heavySnow2:
      case WeatherState.heavySnow3:
      case WeatherState.heavySnow4:
      case WeatherState.heavySnowShowers:
      case WeatherState.heavySnowShowers2:
      case WeatherState.heavySnowShowers3:
      case WeatherState.thunderySnowShowers:
        return WeatherCondition.snowy;
      case WeatherState.lightShowers:
      case WeatherState.lightShowers2:
      case WeatherState.lightShowers3:
      case WeatherState.thunderyShowers:
      case WeatherState.thunderyShowers2:
      case WeatherState.lightRain:
      case WeatherState.lightRain2:
      case WeatherState.lightRain3:
      case WeatherState.heavyShowers:
      case WeatherState.heavyShowers2:
      case WeatherState.heavyShowers3:
      case WeatherState.heavyRain:
      case WeatherState.heavyRain2:
      case WeatherState.heavyRain3:
      case WeatherState.thunderyHeavyRain:
        return WeatherCondition.rainy;
      case WeatherState.partlyCloudy:
      case WeatherState.cloudy:
      case WeatherState.veryCloudy:
        return WeatherCondition.cloudy;
      case WeatherState.fog:
      case WeatherState.fog2:
      case WeatherState.fog3:
        return WeatherCondition.foggy;
      default:
        return WeatherCondition.unknown;
    }
  }
}
