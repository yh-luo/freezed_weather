// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:freezed_weather/theme/theme.dart';
import 'package:freezed_weather/weather/weather.dart';

import '../../helpers/hydrated_bloc.dart';

class MockWeather extends Mock implements Weather {
  MockWeather(this._condition);

  final WeatherCondition _condition;

  @override
  WeatherCondition get condition => _condition;
}

void main() {
  group('ThemeBloc', () {
    late ThemeBloc themeBloc;

    setUp(() async {
      themeBloc = await mockHydratedStorage(() => ThemeBloc());
    });
    test('initial state is correct', () {
      mockHydratedStorage(() {
        expect(ThemeBloc().state, ThemeState.initial());
      });
    });

    group('toJson/fromJson', () {
      test('work properly', () {
        mockHydratedStorage(() {
          final themeBloc = ThemeBloc();
          expect(
            themeBloc.fromJson(themeBloc.toJson(themeBloc.state)),
            themeBloc.state,
          );
        });
      });
    });

    group('updateTheme', () {
      final clearWeather = MockWeather(WeatherCondition.clear);
      final snowyWeather = MockWeather(WeatherCondition.snowy);
      final cloudyWeather = MockWeather(WeatherCondition.cloudy);
      final rainyWeather = MockWeather(WeatherCondition.rainy);
      final unknownWeather = MockWeather(WeatherCondition.unknown);

      blocTest<ThemeBloc, ThemeState>(
        'emits correct color for WeatherCondition.clear',
        build: () => themeBloc,
        act: (bloc) => bloc.add(ThemeEvent.changed(clearWeather)),
        expect: () => <ThemeState>[ThemeState.loaded(Colors.orangeAccent)],
      );

      blocTest<ThemeBloc, ThemeState>(
        'emits correct color for WeatherCondition.snowy',
        build: () => themeBloc,
        act: (bloc) => bloc.add(ThemeEvent.changed(snowyWeather)),
        expect: () => <ThemeState>[ThemeState.loaded(Colors.lightBlueAccent)],
      );

      blocTest<ThemeBloc, ThemeState>(
        'emits correct color for WeatherCondition.cloudy',
        build: () => themeBloc,
        act: (bloc) => bloc.add(ThemeEvent.changed(cloudyWeather)),
        expect: () => <ThemeState>[ThemeState.loaded(Colors.blueGrey)],
      );

      blocTest<ThemeBloc, ThemeState>(
        'emits correct color for WeatherCondition.rainy',
        build: () => themeBloc,
        act: (bloc) => bloc.add(ThemeEvent.changed(rainyWeather)),
        expect: () => <ThemeState>[ThemeState.loaded(Colors.indigoAccent)],
      );

      blocTest<ThemeBloc, ThemeState>(
        'emits correct color for WeatherCondition.unknown',
        build: () => themeBloc,
        act: (bloc) => bloc.add(ThemeEvent.changed(unknownWeather)),
        expect: () => <ThemeState>[ThemeState.loaded(Color(0xFF2196F3))],
      );
    });
  });
}
