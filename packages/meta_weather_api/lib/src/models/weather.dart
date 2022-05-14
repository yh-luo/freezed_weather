import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

enum WeatherState {
  @JsonValue('sn')
  snow,
  @JsonValue('sl')
  sleet,
  @JsonValue('h')
  hail,
  @JsonValue('t')
  thunderstorm,
  @JsonValue('hr')
  heavyRain,
  @JsonValue('lr')
  lightRain,
  @JsonValue('s')
  showers,
  @JsonValue('hc')
  heavyCloud,
  @JsonValue('lc')
  lightCloud,
  @JsonValue('c')
  clear,
  unknown
}

extension WeatherStateX on WeatherState {
  String? get abbr => _$WeatherStateEnumMap[this];
}

enum WindDirectionCompass {
  @JsonValue('N')
  north,
  @JsonValue('NE')
  northEast,
  @JsonValue('E')
  east,
  @JsonValue('SE')
  southEast,
  @JsonValue('S')
  south,
  @JsonValue('SW')
  southWest,
  @JsonValue('W')
  west,
  @JsonValue('NW')
  northWest,
  unknown,
}

@Freezed(toJson: false)
class Weather with _$Weather {
  const factory Weather({
    required int id,
    required String weatherStateName,
    @JsonKey(unknownEnumValue: WeatherState.unknown)
        required WeatherState weatherStateAbbr,
    @JsonKey(unknownEnumValue: WindDirectionCompass.unknown)
        required WindDirectionCompass windDirectionCompass,
    required DateTime created,
    required DateTime applicableDate,
    required double minTemp,
    required double maxTemp,
    required double theTemp,
    required double windSpeed,
    required double windDirection,
    required double airPressure,
    required int humidity,
    required double visibility,
    required int predictability,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
