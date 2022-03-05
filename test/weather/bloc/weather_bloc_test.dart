// ignore_for_file: prefer_const_constructors
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:weather_repository/weather_repository.dart'
    as weather_repository;

import 'package:freezed_weather/weather/weather.dart';

import '../../helpers/hydrated_bloc.dart';

const weatherLocation = 'London';
const weatherCondition = weather_repository.WeatherCondition.rainy;
const weatherTemperature = 9.8;

class MockWeatherRepository extends Mock
    implements weather_repository.WeatherRepository {}

class MockWeather extends Mock implements weather_repository.Weather {}

void main() {
  group('WeatherBloc', () {
    late weather_repository.Weather weather;
    late weather_repository.WeatherRepository weatherRepository;

    setUp(() {
      weather = MockWeather();
      weatherRepository = MockWeatherRepository();
      when(() => weather.condition).thenReturn(weatherCondition);
      when(() => weather.location).thenReturn(weatherLocation);
      when(() => weather.temperature).thenReturn(weatherTemperature);
      when(
        () => weatherRepository.getWeather(any()),
      ).thenAnswer((_) async => weather);
    });

    test('initial state is correct', () {
      mockHydratedStorage(() {
        final weatherBloc = WeatherBloc(weatherRepository);
        expect(weatherBloc.state, WeatherState());
      });
    });

    group('toJson/fromJson', () {
      test('work properly', () {
        mockHydratedStorage(() {
          final weatherBloc = WeatherBloc(weatherRepository);
          expect(
            weatherBloc.fromJson(weatherBloc.toJson(weatherBloc.state)),
            weatherBloc.state,
          );
        });
      });
    });

    group('fetchWeather', () {
      blocTest<WeatherBloc, WeatherState>(
        'emits nothing when city is null',
        build: () => mockHydratedStorage(() => WeatherBloc(weatherRepository)),
        act: (bloc) => bloc.add(WeatherEvent.started(null)),
        expect: () => <WeatherState>[],
      );

      blocTest<WeatherBloc, WeatherState>(
        'emits nothing when city is empty',
        build: () => mockHydratedStorage(() => WeatherBloc(weatherRepository)),
        act: (bloc) => bloc.add(WeatherEvent.started('')),
        expect: () => <WeatherState>[],
      );

      blocTest<WeatherBloc, WeatherState>(
        'calls getWeather with correct city',
        build: () => mockHydratedStorage(() => WeatherBloc(weatherRepository)),
        act: (bloc) => bloc.add(WeatherEvent.started(weatherLocation)),
        verify: (_) {
          verify(() => weatherRepository.getWeather(weatherLocation)).called(1);
        },
      );

      blocTest<WeatherBloc, WeatherState>(
        'emits [loading, failure] when getWeather throws',
        setUp: () {
          when(
            () => weatherRepository.getWeather(any()),
          ).thenThrow(Exception('oops'));
        },
        build: () => mockHydratedStorage(() => WeatherBloc(weatherRepository)),
        act: (bloc) => bloc.add(WeatherEvent.started(weatherLocation)),
        expect: () => <WeatherState>[
          WeatherState(status: WeatherStatus.loading),
          WeatherState(status: WeatherStatus.failure),
        ],
      );

      blocTest<WeatherBloc, WeatherState>(
        'emits [loading, success] when getWeather returns (celsius)',
        build: () => mockHydratedStorage(() => WeatherBloc(weatherRepository)),
        act: (bloc) => bloc.add(WeatherEvent.started(weatherLocation)),
        expect: () => <dynamic>[
          WeatherState(status: WeatherStatus.loading),
          isA<WeatherState>()
              .having((w) => w.status, 'status', WeatherStatus.success)
              .having(
                (w) => w.weather,
                'weather',
                isA<Weather>()
                    .having((w) => w.lastUpdated, 'lastUpdated', isNotNull)
                    .having((w) => w.condition, 'condition', weatherCondition)
                    .having(
                      (w) => w.temperature,
                      'temperature',
                      Temperature(value: weatherTemperature),
                    )
                    .having((w) => w.location, 'location', weatherLocation),
              ),
        ],
      );

      blocTest<WeatherBloc, WeatherState>(
        'emits [loading, success] when getWeather returns (fahrenheit)',
        build: () => mockHydratedStorage(() => WeatherBloc(weatherRepository)),
        seed: () => WeatherState(temperatureUnits: TemperatureUnits.fahrenheit),
        act: (bloc) => bloc.add(WeatherEvent.started(weatherLocation)),
        expect: () => <dynamic>[
          WeatherState(
            status: WeatherStatus.loading,
            temperatureUnits: TemperatureUnits.fahrenheit,
          ),
          isA<WeatherState>()
              .having((w) => w.status, 'status', WeatherStatus.success)
              .having(
                (w) => w.weather,
                'weather',
                isA<Weather>()
                    .having((w) => w.lastUpdated, 'lastUpdated', isNotNull)
                    .having((w) => w.condition, 'condition', weatherCondition)
                    .having(
                      (w) => w.temperature,
                      'temperature',
                      Temperature(value: weatherTemperature.toFahrenheit()),
                    )
                    .having((w) => w.location, 'location', weatherLocation),
              ),
        ],
      );
    });

    group('refreshWeather', () {
      blocTest<WeatherBloc, WeatherState>(
        'emits nothing when status is not success',
        build: () => mockHydratedStorage(() => WeatherBloc(weatherRepository)),
        act: (bloc) => bloc.add(WeatherEvent.refreshed()),
        expect: () => <WeatherState>[],
        verify: (_) {
          verifyNever(() => weatherRepository.getWeather(any()));
        },
      );

      blocTest<WeatherBloc, WeatherState>(
        'emits nothing when location is null',
        build: () => mockHydratedStorage(() => WeatherBloc(weatherRepository)),
        seed: () => WeatherState(status: WeatherStatus.success),
        act: (bloc) => bloc.add(WeatherEvent.refreshed()),
        expect: () => <WeatherState>[],
        verify: (_) {
          verifyNever(() => weatherRepository.getWeather(any()));
        },
      );

      blocTest<WeatherBloc, WeatherState>(
        'invokes getWeather with correct location',
        build: () => mockHydratedStorage(() => WeatherBloc(weatherRepository)),
        seed: () => WeatherState(
          status: WeatherStatus.success,
          weather: Weather(
            location: weatherLocation,
            temperature: Temperature(value: weatherTemperature),
            lastUpdated: DateTime(2020),
            condition: weatherCondition,
          ),
        ),
        act: (bloc) => bloc.add(WeatherEvent.refreshed()),
        verify: (_) {
          verify(() => weatherRepository.getWeather(weatherLocation)).called(1);
        },
      );

      blocTest<WeatherBloc, WeatherState>(
        'emits nothing when exception is thrown',
        setUp: () {
          when(
            () => weatherRepository.getWeather(any()),
          ).thenThrow(Exception('oops'));
        },
        build: () => mockHydratedStorage(() => WeatherBloc(weatherRepository)),
        seed: () => WeatherState(
          status: WeatherStatus.success,
          weather: Weather(
            location: weatherLocation,
            temperature: Temperature(value: weatherTemperature),
            lastUpdated: DateTime(2020),
            condition: weatherCondition,
          ),
        ),
        act: (bloc) => bloc.add(WeatherEvent.refreshed()),
        expect: () => <WeatherState>[],
      );

      blocTest<WeatherBloc, WeatherState>(
        'emits updated weather (celsius)',
        build: () => mockHydratedStorage(() => WeatherBloc(weatherRepository)),
        seed: () => WeatherState(
          status: WeatherStatus.success,
          weather: Weather(
            location: weatherLocation,
            temperature: Temperature(value: 0.0),
            lastUpdated: DateTime(2020),
            condition: weatherCondition,
          ),
        ),
        act: (bloc) => bloc.add(WeatherEvent.refreshed()),
        expect: () => <Matcher>[
          isA<WeatherState>()
              .having((w) => w.status, 'status', WeatherStatus.success)
              .having(
                (w) => w.weather,
                'weather',
                isA<Weather>()
                    .having((w) => w.lastUpdated, 'lastUpdated', isNotNull)
                    .having((w) => w.condition, 'condition', weatherCondition)
                    .having(
                      (w) => w.temperature,
                      'temperature',
                      Temperature(value: weatherTemperature),
                    )
                    .having((w) => w.location, 'location', weatherLocation),
              ),
        ],
      );

      blocTest<WeatherBloc, WeatherState>(
        'emits updated weather (fahrenheit)',
        build: () => mockHydratedStorage(() => WeatherBloc(weatherRepository)),
        seed: () => WeatherState(
          temperatureUnits: TemperatureUnits.fahrenheit,
          status: WeatherStatus.success,
          weather: Weather(
            location: weatherLocation,
            temperature: Temperature(value: 0.0),
            lastUpdated: DateTime(2020),
            condition: weatherCondition,
          ),
        ),
        act: (bloc) => bloc.add(WeatherEvent.refreshed()),
        expect: () => <Matcher>[
          isA<WeatherState>()
              .having((w) => w.status, 'status', WeatherStatus.success)
              .having(
                (w) => w.weather,
                'weather',
                isA<Weather>()
                    .having((w) => w.lastUpdated, 'lastUpdated', isNotNull)
                    .having((w) => w.condition, 'condition', weatherCondition)
                    .having(
                      (w) => w.temperature,
                      'temperature',
                      Temperature(value: weatherTemperature.toFahrenheit()),
                    )
                    .having((w) => w.location, 'location', weatherLocation),
              ),
        ],
      );
    });

    group('toggleUnits', () {
      blocTest<WeatherBloc, WeatherState>(
        'emits updated units when status is not success',
        build: () => mockHydratedStorage(() => WeatherBloc(weatherRepository)),
        act: (bloc) => bloc.add(WeatherEvent.unitsChanged()),
        expect: () => <WeatherState>[
          WeatherState(temperatureUnits: TemperatureUnits.fahrenheit),
        ],
      );

      blocTest<WeatherBloc, WeatherState>(
        'emits updated units and temperature '
        'when status is success (celsius)',
        build: () => mockHydratedStorage(() => WeatherBloc(weatherRepository)),
        seed: () => WeatherState(
          status: WeatherStatus.success,
          temperatureUnits: TemperatureUnits.fahrenheit,
          weather: Weather(
            location: weatherLocation,
            temperature: Temperature(value: weatherTemperature),
            lastUpdated: DateTime(2020),
            condition: WeatherCondition.rainy,
          ),
        ),
        act: (bloc) => bloc.add(WeatherEvent.unitsChanged()),
        expect: () => <WeatherState>[
          WeatherState(
            status: WeatherStatus.success,
            temperatureUnits: TemperatureUnits.celsius,
            weather: Weather(
              location: weatherLocation,
              temperature: Temperature(value: weatherTemperature.toCelsius()),
              lastUpdated: DateTime(2020),
              condition: WeatherCondition.rainy,
            ),
          ),
        ],
      );

      blocTest<WeatherBloc, WeatherState>(
        'emits updated units and temperature '
        'when status is success (fahrenheit)',
        build: () => mockHydratedStorage(() => WeatherBloc(weatherRepository)),
        seed: () => WeatherState(
          status: WeatherStatus.success,
          temperatureUnits: TemperatureUnits.celsius,
          weather: Weather(
            location: weatherLocation,
            temperature: Temperature(value: weatherTemperature),
            lastUpdated: DateTime(2020),
            condition: WeatherCondition.rainy,
          ),
        ),
        act: (bloc) => bloc.add(WeatherEvent.unitsChanged()),
        expect: () => <WeatherState>[
          WeatherState(
            status: WeatherStatus.success,
            temperatureUnits: TemperatureUnits.fahrenheit,
            weather: Weather(
              location: weatherLocation,
              temperature: Temperature(
                value: weatherTemperature.toFahrenheit(),
              ),
              lastUpdated: DateTime(2020),
              condition: WeatherCondition.rainy,
            ),
          ),
        ],
      );
    });
  });
}

extension on double {
  double toFahrenheit() => ((this * 9 / 5) + 32);
  double toCelsius() => ((this - 32) * 5 / 9);
}
