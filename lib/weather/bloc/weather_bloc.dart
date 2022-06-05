import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather_repository/weather_repository.dart'
    show WeatherRepository;

import '../models/models.dart';

part 'weather_event.dart';
part 'weather_state.dart';
part 'weather_bloc.freezed.dart';
part 'weather_bloc.g.dart';

class WeatherBloc extends HydratedBloc<WeatherEvent, WeatherState> {
  WeatherBloc(this._weatherRepository) : super(const WeatherState()) {
    on<_Started>(_onStarted);
    on<_Refreshed>(_onRefreshed);
    on<_UnitsChanged>(_onUnitsChanged);
  }
  final WeatherRepository _weatherRepository;

  Future<void> _onStarted(_Started event, Emitter<WeatherState> emit) async {
    if (event.city == null || event.city!.isEmpty) {
      return;
    }
    final city = event.city!;

    emit(state.copyWith(status: WeatherStatus.loading));

    try {
      final weather = Weather.fromRepository(
        await _weatherRepository.getWeather(city),
      );
      final units = state.temperatureUnits;
      final value = units.isFahrenheit
          ? weather.temperature.value.toFahrenheit()
          : weather.temperature.value;

      emit(
        state.copyWith(
          status: WeatherStatus.success,
          temperatureUnits: units,
          weather: weather.copyWith(temperature: Temperature(value: value)),
        ),
      );
    } on Exception catch (error, stackTrace) {
      // notify the bloc observer
      addError(error, stackTrace);
      emit(state.copyWith(status: WeatherStatus.failure));
    }
  }

  Future<void> _onRefreshed(
      _Refreshed event, Emitter<WeatherState> emit) async {
    if (!state.status.isSuccess || state.weather == null) {
      return;
    }

    try {
      // strip the area name
      final location = state.weather!.location.split('\n')[0];
      final weather = Weather.fromRepository(
        await _weatherRepository.getWeather(location),
      );
      final units = state.temperatureUnits;
      final value = units.isFahrenheit
          ? weather.temperature.value.toFahrenheit()
          : weather.temperature.value;

      emit(
        state.copyWith(
          status: WeatherStatus.success,
          temperatureUnits: units,
          weather: weather.copyWith(temperature: Temperature(value: value)),
        ),
      );
    } on Exception catch (error, stackTrace) {
      // notify the bloc observer
      addError(error, stackTrace);
      emit(state);
    }
  }

  void _onUnitsChanged(_UnitsChanged event, Emitter<WeatherState> emit) {
    final units = state.temperatureUnits.isFahrenheit
        ? TemperatureUnits.celsius
        : TemperatureUnits.fahrenheit;

    if (!state.status.isSuccess) {
      emit(state.copyWith(temperatureUnits: units));
      return;
    }

    final weather = state.weather;
    if (weather != Weather.empty) {
      final temperature = weather!.temperature;
      final value = units.isCelsius
          ? temperature.value.toCelsius()
          : temperature.value.toFahrenheit();

      emit(
        state.copyWith(
          temperatureUnits: units,
          weather: weather.copyWith(temperature: Temperature(value: value)),
        ),
      );
    }
  }

  @override
  WeatherState fromJson(Map<String, dynamic> json) =>
      WeatherState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(WeatherState state) {
    if (state.status.isSuccess) {
      return state.toJson();
    }
    return null;
  }
}

extension on double {
  double toFahrenheit() => ((this * 9 / 5) + 32);
  double toCelsius() => ((this - 32) * 5 / 9);
}
