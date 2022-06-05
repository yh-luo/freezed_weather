import 'meta_weather_repository.dart';
import 'wttr_in_repository.dart';

import '../models/models.dart';

enum WeatherRepositoryType {
  wttrIn,
  metaWeather,
}

abstract class WeatherRepository {
  Future<Weather> getWeather(String location);

  // get a concrete implementation of this class
  factory WeatherRepository.instance(
      [WeatherRepositoryType type = WeatherRepositoryType.wttrIn]) {
    switch (type) {
      case WeatherRepositoryType.metaWeather:
        return MetaWeatherWeatherRepository();
      default:
        return WttrInWeatherRepository();
    }
  }
}
