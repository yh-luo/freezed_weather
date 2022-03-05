// ignore_for_file: prefer_const_constructors
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:weather_repository/weather_repository.dart';

import 'package:freezed_weather/app.dart';
import 'package:freezed_weather/theme/theme.dart';
import 'package:freezed_weather/weather/weather.dart';

import 'helpers/hydrated_bloc.dart';

class MockThemeBloc extends MockBloc<ThemeEvent, ThemeState>
    implements ThemeBloc {}

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  group('WeatherApp', () {
    late WeatherRepository weatherRepository;

    setUp(() {
      weatherRepository = MockWeatherRepository();
    });

    testWidgets('renders WeatherAppView', (tester) async {
      await mockHydratedStorage(() async {
        await tester.pumpWidget(
          WeatherApp(weatherRepository: weatherRepository),
        );
      });
      expect(find.byType(WeatherAppView), findsOneWidget);
    });
  });

  group('WeatherAppView', () {
    late ThemeBloc themeBloc;
    late WeatherRepository weatherRepository;

    setUp(() {
      themeBloc = MockThemeBloc();
      weatherRepository = MockWeatherRepository();
    });

    testWidgets('renders WeatherPage', (tester) async {
      when(() => themeBloc.state)
          .thenReturn(const ThemeState.loaded(Colors.blue));
      await mockHydratedStorage(() async {
        await tester.pumpWidget(
          RepositoryProvider.value(
            value: weatherRepository,
            child: BlocProvider.value(
              value: themeBloc,
              child: WeatherAppView(),
            ),
          ),
        );
      });
      expect(find.byType(WeatherPage), findsOneWidget);
    });

    testWidgets('has correct theme primary color', (tester) async {
      const color = Color(0xFFD2D2D2);
      when(() => themeBloc.state).thenReturn(ThemeState.loaded(color));
      await mockHydratedStorage(() async {
        await tester.pumpWidget(
          RepositoryProvider.value(
            value: weatherRepository,
            child: BlocProvider.value(
              value: themeBloc,
              child: WeatherAppView(),
            ),
          ),
        );
      });
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.theme?.primaryColor, color);
    });
  });
}
