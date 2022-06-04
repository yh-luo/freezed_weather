// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:weather_repository/weather_repository.dart';

void main() {
  group('WeatherRepository', () {
    test('create an instance of WttrInWeatherRepository', () {
      final actual = WeatherRepository.instance();

      expect(actual, isNotNull);
      expect(actual is WttrInWeatherRepository, true);
    });

    test('create an instance of MetaWeatherWeatherRepository', () {
      final actual =
          WeatherRepository.instance(WeatherRepositoryType.metaWeather);

      expect(actual, isNotNull);
      expect(actual is MetaWeatherWeatherRepository, true);
    });
  });
}
