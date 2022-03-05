// ignore_for_file: prefer_const_constructors
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:weather_repository/weather_repository.dart' hide Weather;

import 'package:freezed_weather/search/search.dart';
import 'package:freezed_weather/settings/settings.dart';
import 'package:freezed_weather/weather/weather.dart';
import 'package:freezed_weather/theme/theme.dart';

import '../../helpers/hydrated_bloc.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

class MockThemeBloc extends MockBloc<ThemeEvent, ThemeState>
    implements ThemeBloc {}

class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState>
    implements WeatherBloc {}

void main() {
  group('WeatherPage', () {
    late WeatherRepository weatherRepository;

    setUp(() {
      weatherRepository = MockWeatherRepository();
    });

    testWidgets('renders WeatherView', (tester) async {
      await mockHydratedStorage(() async {
        await tester.pumpWidget(RepositoryProvider.value(
          value: weatherRepository,
          child: MaterialApp(home: WeatherPage()),
        ));
      });
      expect(find.byType(WeatherView), findsOneWidget);
    });
  });

  group('WeatherView', () {
    final weather = Weather(
      temperature: Temperature(value: 4.2),
      condition: WeatherCondition.cloudy,
      lastUpdated: DateTime(2020),
      location: 'London',
    );
    late ThemeBloc themeBloc;
    late WeatherBloc weatherBloc;

    setUp(() {
      themeBloc = MockThemeBloc();
      weatherBloc = MockWeatherBloc();
    });

    testWidgets('renders WeatherEmpty for WeatherStatus.initial',
        (tester) async {
      when(() => weatherBloc.state).thenReturn(WeatherState());
      await tester.pumpWidget(BlocProvider.value(
        value: weatherBloc,
        child: MaterialApp(home: WeatherView()),
      ));
      expect(find.byType(WeatherEmpty), findsOneWidget);
    });

    testWidgets('renders WeatherLoading for WeatherStatus.loading',
        (tester) async {
      when(() => weatherBloc.state).thenReturn(WeatherState(
        status: WeatherStatus.loading,
      ));
      await tester.pumpWidget(BlocProvider.value(
        value: weatherBloc,
        child: MaterialApp(home: WeatherView()),
      ));
      expect(find.byType(WeatherLoading), findsOneWidget);
    });

    testWidgets('renders WeatherPopulated for WeatherStatus.success',
        (tester) async {
      when(() => weatherBloc.state).thenReturn(WeatherState(
        status: WeatherStatus.success,
        weather: weather,
      ));
      await tester.pumpWidget(BlocProvider.value(
        value: weatherBloc,
        child: MaterialApp(home: WeatherView()),
      ));
      expect(find.byType(WeatherPopulated), findsOneWidget);
    });

    testWidgets('renders WeatherError for WeatherStatus.failure',
        (tester) async {
      when(() => weatherBloc.state).thenReturn(WeatherState(
        status: WeatherStatus.failure,
      ));
      await tester.pumpWidget(BlocProvider.value(
        value: weatherBloc,
        child: MaterialApp(home: WeatherView()),
      ));
      expect(find.byType(WeatherError), findsOneWidget);
    });

    testWidgets('state is cached', (tester) async {
      final storage = MockStorage();
      when<dynamic>(() => storage.read('WeatherBloc')).thenReturn(
        WeatherState(
          status: WeatherStatus.success,
          weather: weather,
          temperatureUnits: TemperatureUnits.fahrenheit,
        ).toJson(),
      );
      await mockHydratedStorage(() async {
        await tester.pumpWidget(BlocProvider.value(
          value: WeatherBloc(MockWeatherRepository()),
          child: MaterialApp(home: WeatherView()),
        ));
      }, storage: storage);
      expect(find.byType(WeatherPopulated), findsOneWidget);
    });

    testWidgets('navigates to SettingsPage when settings icon is tapped',
        (tester) async {
      when(() => weatherBloc.state).thenReturn(WeatherState());
      await tester.pumpWidget(BlocProvider.value(
        value: weatherBloc,
        child: MaterialApp(home: WeatherView()),
      ));
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      expect(find.byType(SettingsPage), findsOneWidget);
    });

    testWidgets('navigates to SearchPage when search button is tapped',
        (tester) async {
      when(() => weatherBloc.state).thenReturn(WeatherState());
      await tester.pumpWidget(BlocProvider.value(
        value: weatherBloc,
        child: MaterialApp(home: WeatherView()),
      ));
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      expect(find.byType(SearchPage), findsOneWidget);
    });

    testWidgets('calls updateTheme when whether changes', (tester) async {
      whenListen(
        weatherBloc,
        Stream<WeatherState>.fromIterable([
          WeatherState(),
          WeatherState(status: WeatherStatus.success, weather: weather),
        ]),
      );
      when(() => weatherBloc.state).thenReturn(WeatherState(
        status: WeatherStatus.success,
        weather: weather,
      ));
      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider.value(value: themeBloc),
          BlocProvider.value(value: weatherBloc),
        ],
        child: MaterialApp(home: WeatherView()),
      ));
      verify(() => themeBloc.add(ThemeEvent.changed(weather))).called(1);
    });

    testWidgets('triggers refreshWeather on pull to refresh', (tester) async {
      when(() => weatherBloc.state).thenReturn(WeatherState(
        status: WeatherStatus.success,
        weather: weather,
      ));
      when(() => weatherBloc.add(WeatherEvent.refreshed()))
          .thenAnswer((_) async {});
      await tester.pumpWidget(BlocProvider.value(
        value: weatherBloc,
        child: MaterialApp(home: WeatherView()),
      ));
      await tester.fling(
        find.text('London'),
        const Offset(0.0, 500.0),
        1000.0,
      );
      await tester.pumpAndSettle();
      verify(() => weatherBloc.add(WeatherEvent.refreshed())).called(1);
    });

    testWidgets('triggers fetch on search pop', (tester) async {
      when(() => weatherBloc.state).thenReturn(WeatherState());
      when(() => weatherBloc.add(WeatherEvent.started('London')))
          .thenAnswer((_) async {});
      await tester.pumpWidget(BlocProvider.value(
        value: weatherBloc,
        child: MaterialApp(home: WeatherView()),
      ));
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), 'Chicago');
      await tester.tap(find.byKey(const Key('searchPage_search_iconButton')));
      await tester.pumpAndSettle();
      verify(() => weatherBloc.add(WeatherEvent.started('Chicago'))).called(1);
    });
  });
}
