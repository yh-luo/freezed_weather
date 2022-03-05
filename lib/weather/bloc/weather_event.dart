part of 'weather_bloc.dart';

@freezed
class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.started(String? city) = _Started;
  const factory WeatherEvent.refreshed() = _Refreshed;
  const factory WeatherEvent.unitsChanged() = _UnitsChanged;
}
