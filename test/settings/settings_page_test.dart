// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_weather/settings/settings.dart';
import 'package:freezed_weather/weather/weather.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState>
    implements WeatherBloc {}

void main() {
  group('SettingsPage', () {
    late WeatherBloc weatherBloc;

    setUp(() {
      weatherBloc = MockWeatherBloc();
    });

    testWidgets('is routable', (tester) async {
      when(() => weatherBloc.state).thenReturn(WeatherState());
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push<void>(
                    SettingsPage.route(weatherBloc),
                  );
                },
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      expect(find.byType(SettingsPage), findsOneWidget);
    });

    testWidgets('calls toggleUnits when switch is changed', (tester) async {
      whenListen(
        weatherBloc,
        Stream.fromIterable([
          WeatherState(temperatureUnits: TemperatureUnits.celsius),
          WeatherState(temperatureUnits: TemperatureUnits.fahrenheit),
        ]),
      );
      when(() => weatherBloc.state).thenReturn(WeatherState());
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push<void>(
                    SettingsPage.route(weatherBloc),
                  );
                },
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(Switch));
      verify(() => weatherBloc.add(WeatherEvent.unitsChanged())).called(1);
    });
  });
}
