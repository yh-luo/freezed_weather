import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

enum WeatherState {
  @JsonValue('113')
  sunny,
  @JsonValue('116')
  partlyCloudy,
  @JsonValue('119')
  cloudy,
  @JsonValue('122')
  veryCloudy,
  @JsonValue('143')
  fog,
  @JsonValue('176')
  lightShowers,
  @JsonValue('179')
  lightSleetShowers,
  @JsonValue('182')
  lightSleet,
  @JsonValue('185')
  lightSleet2,
  @JsonValue('200')
  thunderyShowers,
  @JsonValue('227')
  lightSnow,
  @JsonValue('230')
  heavySnow,
  @JsonValue('248')
  fog2,
  @JsonValue('260')
  fog3,
  @JsonValue('263')
  lightShowers2,
  @JsonValue('266')
  lightRain,
  @JsonValue('281')
  lightSleet3,
  @JsonValue('284')
  lightSleet4,
  @JsonValue('293')
  lightRain2,
  @JsonValue('296')
  lightRain3,
  @JsonValue('299')
  heavyShowers,
  @JsonValue('302')
  heavyRain,
  @JsonValue('305')
  heavyShowers2,
  @JsonValue('308')
  heavyRain2,
  @JsonValue('311')
  lightSleet5,
  @JsonValue('314')
  lightSleet6,
  @JsonValue('317')
  lightSleet7,
  @JsonValue('320')
  lightSnow2,
  @JsonValue('323')
  lightSnowShowers,
  @JsonValue('326')
  lightSnowShowers2,
  @JsonValue('329')
  heavySnow2,
  @JsonValue('332')
  heavySnow3,
  @JsonValue('335')
  heavySnowShowers,
  @JsonValue('338')
  heavySnow4,
  @JsonValue('350')
  lightSleet8,
  @JsonValue('353')
  lightShowers3,
  @JsonValue('356')
  heavyShowers3,
  @JsonValue('359')
  heavyRain3,
  @JsonValue('362')
  lightSleetShowers2,
  @JsonValue('365')
  lightSleetShowers3,
  @JsonValue('368')
  lightSnowShowers3,
  @JsonValue('371')
  heavySnowShowers2,
  @JsonValue('374')
  lightSleetShowers4,
  @JsonValue('377')
  lightSleet9,
  @JsonValue('386')
  thunderyShowers2,
  @JsonValue('389')
  thunderyHeavyRain,
  @JsonValue('392')
  thunderySnowShowers,
  @JsonValue('395')
  heavySnowShowers3,
  unknown,
}

@Freezed(toJson: false)
class Weather with _$Weather {
  const factory Weather({
    required String humidity,
    required String pressure,
    @JsonKey(name: 'temp_C') required String temperature,
    @JsonKey(name: 'weatherCode', unknownEnumValue: WeatherState.unknown)
        required WeatherState weatherState,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
