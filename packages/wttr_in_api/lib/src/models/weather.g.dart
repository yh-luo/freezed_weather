// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Weather _$$_WeatherFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_Weather',
      json,
      ($checkedConvert) {
        final val = _$_Weather(
          humidity: $checkedConvert('humidity', (v) => v as String),
          pressure: $checkedConvert('pressure', (v) => v as String),
          temperature: $checkedConvert('temp_C', (v) => v as String),
          weatherState: $checkedConvert(
              'weatherCode',
              (v) => $enumDecode(_$WeatherStateEnumMap, v,
                  unknownValue: WeatherState.unknown)),
        );
        return val;
      },
      fieldKeyMap: const {
        'temperature': 'temp_C',
        'weatherState': 'weatherCode'
      },
    );

const _$WeatherStateEnumMap = {
  WeatherState.sunny: '113',
  WeatherState.partlyCloudy: '116',
  WeatherState.cloudy: '119',
  WeatherState.veryCloudy: '122',
  WeatherState.fog: '143',
  WeatherState.lightShowers: '176',
  WeatherState.lightSleetShowers: '179',
  WeatherState.lightSleet: '182',
  WeatherState.lightSleet2: '185',
  WeatherState.thunderyShowers: '200',
  WeatherState.lightSnow: '227',
  WeatherState.heavySnow: '230',
  WeatherState.fog2: '248',
  WeatherState.fog3: '260',
  WeatherState.lightShowers2: '263',
  WeatherState.lightRain: '266',
  WeatherState.lightSleet3: '281',
  WeatherState.lightSleet4: '284',
  WeatherState.lightRain2: '293',
  WeatherState.lightRain3: '296',
  WeatherState.heavyShowers: '299',
  WeatherState.heavyRain: '302',
  WeatherState.heavyShowers2: '305',
  WeatherState.heavyRain2: '308',
  WeatherState.lightSleet5: '311',
  WeatherState.lightSleet6: '314',
  WeatherState.lightSleet7: '317',
  WeatherState.lightSnow2: '320',
  WeatherState.lightSnowShowers: '323',
  WeatherState.lightSnowShowers2: '326',
  WeatherState.heavySnow2: '329',
  WeatherState.heavySnow3: '332',
  WeatherState.heavySnowShowers: '335',
  WeatherState.heavySnow4: '338',
  WeatherState.lightSleet8: '350',
  WeatherState.lightShowers3: '353',
  WeatherState.heavyShowers3: '356',
  WeatherState.heavyRain3: '359',
  WeatherState.lightSleetShowers2: '362',
  WeatherState.lightSleetShowers3: '365',
  WeatherState.lightSnowShowers3: '368',
  WeatherState.heavySnowShowers2: '371',
  WeatherState.lightSleetShowers4: '374',
  WeatherState.lightSleet9: '377',
  WeatherState.thunderyShowers2: '386',
  WeatherState.thunderyHeavyRain: '389',
  WeatherState.thunderySnowShowers: '392',
  WeatherState.heavySnowShowers3: '395',
  WeatherState.unknown: 'unknown',
};
