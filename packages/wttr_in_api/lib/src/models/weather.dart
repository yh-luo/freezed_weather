import 'package:freezed_annotation/freezed_annotation.dart';

import 'area.dart';

part 'weather.freezed.dart';

enum WeatherState {
  sunny('113'),
  partlyCloudy('116'),
  cloudy('119'),
  veryCloudy('122'),
  fog('143'),
  lightShowers('176'),
  lightSleetShowers('179'),
  lightSleet('182'),
  lightSleet2('185'),
  thunderyShowers('200'),
  lightSnow('227'),
  heavySnow('230'),
  fog2('248'),
  fog3('260'),
  lightShowers2('263'),
  lightRain('266'),
  lightSleet3('281'),
  lightSleet4('284'),
  lightRain2('293'),
  lightRain3('296'),
  heavyShowers('299'),
  heavyRain('302'),
  heavyShowers2('305'),
  heavyRain2('308'),
  lightSleet5('311'),
  lightSleet6('314'),
  lightSleet7('317'),
  lightSnow2('320'),
  lightSnowShowers('323'),
  lightSnowShowers2('326'),
  heavySnow2('329'),
  heavySnow3('332'),
  heavySnowShowers('335'),
  heavySnow4('338'),
  lightSleet8('350'),
  lightShowers3('353'),
  heavyShowers3('356'),
  heavyRain3('359'),
  lightSleetShowers2('362'),
  lightSleetShowers3('365'),
  lightSnowShowers3('368'),
  heavySnowShowers2('371'),
  lightSleetShowers4('374'),
  lightSleet9('377'),
  thunderyShowers2('386'),
  thunderyHeavyRain('389'),
  thunderySnowShowers('392'),
  heavySnowShowers3('395'),
  unknown(null);

  final String? weatherCode;

  const WeatherState(this.weatherCode);

  factory WeatherState.fromData(String data) {
    switch (data) {
      case '113':
        return sunny;
      case '116':
        return partlyCloudy;
      case '119':
        return cloudy;
      case '122':
        return veryCloudy;
      case '143':
        return fog;
      case '176':
        return lightShowers;
      case '179':
        return lightSleetShowers;
      case '182':
        return lightSleet;
      case '185':
        return lightSleet2;
      case '200':
        return thunderyShowers;
      case '227':
        return lightSnow;
      case '230':
        return heavySnow;
      case '248':
        return fog2;
      case '260':
        return fog3;
      case '263':
        return lightShowers2;
      case '266':
        return lightRain;
      case '281':
        return lightSleet3;
      case '284':
        return lightSleet4;
      case '293':
        return lightRain2;
      case '296':
        return lightRain3;
      case '299':
        return heavyShowers;
      case '302':
        return heavyRain;
      case '305':
        return heavyShowers2;
      case '308':
        return heavyRain2;
      case '311':
        return lightSleet5;
      case '314':
        return lightSleet6;
      case '317':
        return lightSleet7;
      case '320':
        return lightSnow2;
      case '323':
        return lightSnowShowers;
      case '326':
        return lightSnowShowers2;
      case '329':
        return heavySnow2;
      case '332':
        return heavySnow3;
      case '335':
        return heavySnowShowers;
      case '338':
        return heavySnow4;
      case '350':
        return lightSleet8;
      case '353':
        return lightShowers3;
      case '356':
        return heavyShowers3;
      case '359':
        return heavyRain3;
      case '362':
        return lightSleetShowers2;
      case '365':
        return lightSleetShowers3;
      case '368':
        return lightSnowShowers3;
      case '371':
        return heavySnowShowers2;
      case '374':
        return lightSleetShowers4;
      case '377':
        return lightSleet9;
      case '386':
        return thunderyShowers2;
      case '389':
        return thunderyHeavyRain;
      case '392':
        return thunderySnowShowers;
      case '395':
        return heavySnowShowers3;
      default:
        return unknown;
    }
  }
}

@freezed
class Weather with _$Weather {
  const factory Weather({
    required double humidity,
    required double pressure,
    required double temperature,
    required WeatherState weatherState,
    required Area area,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weatherJson =
        (json['current_condition'] as List).first as Map<String, dynamic>;
    final areaJson =
        (json['nearest_area'] as List).first as Map<String, dynamic>;
    final area = Area.fromJson(areaJson);

    return Weather(
        humidity: double.parse(weatherJson['humidity'] as String),
        pressure: double.parse(weatherJson['pressure'] as String),
        temperature: double.parse(weatherJson['temp_C'] as String),
        weatherState:
            WeatherState.fromData(weatherJson['weatherCode'] as String),
        area: area);
  }
}
