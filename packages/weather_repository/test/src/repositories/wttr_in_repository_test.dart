// ignore_for_file: prefer_const_constructors
import 'package:wttr_in_api/wttr_in_api.dart' as wttr_in_api;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:weather_repository/weather_repository.dart';

class MockWttrInApiClient extends Mock implements wttr_in_api.WttrInApiClient {}

class MockArea extends Mock implements wttr_in_api.Area {}

class MockWeather extends Mock implements wttr_in_api.Weather {}

void main() {
  group('WttrInWeatherRepository', () {
    late wttr_in_api.WttrInApiClient wttrInApiClient;
    late WttrInWeatherRepository weatherRepository;

    setUp(() {
      wttrInApiClient = MockWttrInApiClient();
      weatherRepository = WttrInWeatherRepository(
        wttrInApiClient: wttrInApiClient,
      );
    });

    group('constructor', () {
      test('instantiates internal WttrInWeatherRepository when not injected',
          () {
        expect(WttrInWeatherRepository(), isNotNull);
      });
    });

    group('getWeather', () {
      const city = 'London';

      test('calls getWeather', () async {
        try {
          await weatherRepository.getWeather(city);
        } catch (_) {}
        verify(() => wttrInApiClient.getWeather(city)).called(1);
      });

      test('throws when getWeather fails', () async {
        final exception = Exception('oops');

        when(() => wttrInApiClient.getWeather(any())).thenThrow(exception);
        expect(
          () async => await weatherRepository.getWeather(city),
          throwsA(exception),
        );
      });

      test('returns correct weather on success (clear)', () async {
        final area = MockArea();
        final weather = MockWeather();
        when(() => weather.temperature).thenReturn(42.42);
        when(() => weather.weatherState)
            .thenReturn(wttr_in_api.WeatherState.sunny);
        when(() => weather.area).thenReturn(area);
        when(() => area.name).thenReturn(city);
        when(() => wttrInApiClient.getWeather(any())).thenAnswer(
          (_) async => weather,
        );

        final actual = await weatherRepository.getWeather(city);
        expect(
          actual,
          Weather(
            temperature: 42.42,
            location: 'London',
            condition: WeatherCondition.clear,
          ),
        );
      });

      test('returns correct weather on success (rainy)', () async {
        final area = MockArea();
        final weather = MockWeather();
        when(() => weather.temperature).thenReturn(42.42);
        when(() => weather.weatherState)
            .thenReturn(wttr_in_api.WeatherState.lightShowers);
        when(() => weather.area).thenReturn(area);
        when(() => area.name).thenReturn(city);
        when(() => wttrInApiClient.getWeather(any())).thenAnswer(
          (_) async => weather,
        );

        final actual = await weatherRepository.getWeather(city);
        expect(
          actual,
          Weather(
            temperature: 42.42,
            location: 'London',
            condition: WeatherCondition.rainy,
          ),
        );
      });

      test('returns correct weather on success (cloudy)', () async {
        final area = MockArea();
        final weather = MockWeather();
        when(() => weather.temperature).thenReturn(42.42);
        when(() => weather.weatherState)
            .thenReturn(wttr_in_api.WeatherState.cloudy);
        when(() => weather.area).thenReturn(area);
        when(() => area.name).thenReturn(city);
        when(() => wttrInApiClient.getWeather(any())).thenAnswer(
          (_) async => weather,
        );

        final actual = await weatherRepository.getWeather(city);
        expect(
          actual,
          Weather(
            temperature: 42.42,
            location: 'London',
            condition: WeatherCondition.cloudy,
          ),
        );
      });

      test('returns correct weather on success (snowy)', () async {
        final area = MockArea();
        final weather = MockWeather();
        when(() => weather.temperature).thenReturn(42.42);
        when(() => weather.weatherState)
            .thenReturn(wttr_in_api.WeatherState.lightSnow);
        when(() => weather.area).thenReturn(area);
        when(() => area.name).thenReturn(city);
        when(() => wttrInApiClient.getWeather(any())).thenAnswer(
          (_) async => weather,
        );

        final actual = await weatherRepository.getWeather(city);
        expect(
          actual,
          Weather(
            temperature: 42.42,
            location: 'London',
            condition: WeatherCondition.snowy,
          ),
        );
      });

      test('returns correct weather on success (foggy)', () async {
        final area = MockArea();
        final weather = MockWeather();
        when(() => weather.temperature).thenReturn(42.42);
        when(() => weather.weatherState)
            .thenReturn(wttr_in_api.WeatherState.fog3);
        when(() => weather.area).thenReturn(area);
        when(() => area.name).thenReturn(city);
        when(() => wttrInApiClient.getWeather(any())).thenAnswer(
          (_) async => weather,
        );

        final actual = await weatherRepository.getWeather(city);
        expect(
          actual,
          Weather(
            temperature: 42.42,
            location: 'London',
            condition: WeatherCondition.foggy,
          ),
        );
      });

      test('update name of location', () async {
        final area = MockArea();
        final weather = MockWeather();
        when(() => weather.temperature).thenReturn(42.42);
        when(() => weather.weatherState)
            .thenReturn(wttr_in_api.WeatherState.fog3);
        when(() => weather.area).thenReturn(area);
        when(() => area.name).thenReturn('River Thames');
        when(() => wttrInApiClient.getWeather(any())).thenAnswer(
          (_) async => weather,
        );

        final actual = await weatherRepository.getWeather(city);
        expect(
          actual,
          Weather(
            temperature: 42.42,
            location: 'London\n(River Thames)',
            condition: WeatherCondition.foggy,
          ),
        );
      });
    });
  });
}
