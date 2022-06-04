import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

enum WeatherCondition {
  clear,
  rainy,
  cloudy,
  snowy,
  foggy,
  unknown,
}

@freezed
class Weather with _$Weather {
  const factory Weather({
    required String location,
    required double temperature,
    required WeatherCondition condition,
  }) = _Weather;
}
