part of 'weather_bloc.dart';

enum WeatherStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == WeatherStatus.initial;
  bool get isLoading => this == WeatherStatus.loading;
  bool get isSuccess => this == WeatherStatus.success;
  bool get isFailure => this == WeatherStatus.failure;
}

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    @Default(WeatherStatus.initial) WeatherStatus status,
    @Default(TemperatureUnits.celsius) TemperatureUnits temperatureUnits,
    Weather? weather,
  }) = _WeatherState;

  factory WeatherState.fromJson(Map<String, dynamic> json) =>
      _$WeatherStateFromJson(json);
}
