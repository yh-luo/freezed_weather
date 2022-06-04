// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:wttr_in_api/wttr_in_api.dart';

void main() {
  group('Weather', () {
    test('constructor', () {
      expect(
          Weather(
              humidity: 1,
              pressure: 1,
              temperature: 1,
              weatherState: WeatherState.sunny,
              area: Area(
                  name: '',
                  country: '',
                  region: '',
                  coordinate: Coordinate(latitude: 0.0, longitude: 0.0))),
          isNotNull);
    });

    test('fromJson', () {
      final json = {
        "current_condition": [
          {
            "FeelsLikeC": "47",
            "FeelsLikeF": "117",
            "cloudcover": "50",
            "humidity": "53",
            "localObsDateTime": "2022-06-03 11:15 AM",
            "observation_time": "03:15 AM",
            "precipInches": "0.0",
            "precipMM": "0.0",
            "pressure": "1007",
            "pressureInches": "30",
            "temp_C": "34",
            "temp_F": "93",
            "uvIndex": "7",
            "visibility": "10",
            "visibilityMiles": "6",
            "weatherCode": "116",
            "weatherDesc": [
              {"value": "Partly cloudy"}
            ],
            "weatherIconUrl": [
              {"value": ""}
            ],
            "winddir16Point": "WSW",
            "winddirDegree": "240",
            "windspeedKmph": "19",
            "windspeedMiles": "12"
          }
        ],
        "nearest_area": [
          {
            "areaName": [
              {"value": "Chiupokou"}
            ],
            "country": [
              {"value": "Taiwan"}
            ],
            "latitude": "25.033",
            "longitude": "121.567",
            "population": "0",
            "region": [
              {"value": "T'ai-pei"}
            ],
            "weatherUrl": [
              {"value": ""}
            ]
          }
        ],
      };

      final actual = Weather.fromJson(json);
      expect(actual.humidity, 53);
      expect(actual.pressure, 1007);
      expect(actual.temperature, 34);
      expect(actual.weatherState, WeatherState.partlyCloudy);
    });
  });
}
