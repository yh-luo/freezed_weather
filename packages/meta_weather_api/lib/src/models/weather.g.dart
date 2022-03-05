// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Weather _$$_WeatherFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_Weather',
      json,
      ($checkedConvert) {
        final val = _$_Weather(
          id: $checkedConvert('id', (v) => v as int),
          weatherStateName:
              $checkedConvert('weather_state_name', (v) => v as String),
          weatherStateAbbr: $checkedConvert(
              'weather_state_abbr',
              (v) => $enumDecode(_$WeatherStateEnumMap, v,
                  unknownValue: WeatherState.unknown)),
          windDirectionCompass: $checkedConvert(
              'wind_direction_compass',
              (v) => $enumDecode(_$WindDirectionCompassEnumMap, v,
                  unknownValue: WindDirectionCompass.unknown)),
          created:
              $checkedConvert('created', (v) => DateTime.parse(v as String)),
          applicableDate: $checkedConvert(
              'applicable_date', (v) => DateTime.parse(v as String)),
          minTemp: $checkedConvert('min_temp', (v) => (v as num).toDouble()),
          maxTemp: $checkedConvert('max_temp', (v) => (v as num).toDouble()),
          theTemp: $checkedConvert('the_temp', (v) => (v as num).toDouble()),
          windSpeed:
              $checkedConvert('wind_speed', (v) => (v as num).toDouble()),
          windDirection:
              $checkedConvert('wind_direction', (v) => (v as num).toDouble()),
          airPressure:
              $checkedConvert('air_pressure', (v) => (v as num).toDouble()),
          humidity: $checkedConvert('humidity', (v) => v as int),
          visibility:
              $checkedConvert('visibility', (v) => (v as num).toDouble()),
          predictability: $checkedConvert('predictability', (v) => v as int),
        );
        return val;
      },
      fieldKeyMap: const {
        'weatherStateName': 'weather_state_name',
        'weatherStateAbbr': 'weather_state_abbr',
        'windDirectionCompass': 'wind_direction_compass',
        'applicableDate': 'applicable_date',
        'minTemp': 'min_temp',
        'maxTemp': 'max_temp',
        'theTemp': 'the_temp',
        'windSpeed': 'wind_speed',
        'windDirection': 'wind_direction',
        'airPressure': 'air_pressure'
      },
    );

Map<String, dynamic> _$$_WeatherToJson(_$_Weather instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weather_state_name': instance.weatherStateName,
      'weather_state_abbr': _$WeatherStateEnumMap[instance.weatherStateAbbr],
      'wind_direction_compass':
          _$WindDirectionCompassEnumMap[instance.windDirectionCompass],
      'created': instance.created.toIso8601String(),
      'applicable_date': instance.applicableDate.toIso8601String(),
      'min_temp': instance.minTemp,
      'max_temp': instance.maxTemp,
      'the_temp': instance.theTemp,
      'wind_speed': instance.windSpeed,
      'wind_direction': instance.windDirection,
      'air_pressure': instance.airPressure,
      'humidity': instance.humidity,
      'visibility': instance.visibility,
      'predictability': instance.predictability,
    };

const _$WeatherStateEnumMap = {
  WeatherState.snow: 'sn',
  WeatherState.sleet: 'sl',
  WeatherState.hail: 'h',
  WeatherState.thunderstorm: 't',
  WeatherState.heavyRain: 'hr',
  WeatherState.lightRain: 'lr',
  WeatherState.showers: 's',
  WeatherState.heavyCloud: 'hc',
  WeatherState.lightCloud: 'lc',
  WeatherState.clear: 'c',
  WeatherState.unknown: 'unknown',
};

const _$WindDirectionCompassEnumMap = {
  WindDirectionCompass.north: 'N',
  WindDirectionCompass.northEast: 'NE',
  WindDirectionCompass.east: 'E',
  WindDirectionCompass.southEast: 'SE',
  WindDirectionCompass.south: 'S',
  WindDirectionCompass.southWest: 'SW',
  WindDirectionCompass.west: 'W',
  WindDirectionCompass.northWest: 'NW',
  WindDirectionCompass.unknown: 'unknown',
};
