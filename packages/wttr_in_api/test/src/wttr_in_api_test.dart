// ignore_for_file: prefer_const_constructors
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:wttr_in_api/wttr_in_api.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('WttrInApi', () {
    late http.Client httpClient;
    late WttrInApiClient wttrInApiClient;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockHttpClient();
      wttrInApiClient = WttrInApiClient(httpClient: httpClient);
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(WttrInApiClient(), isNotNull);
      });
    });

    group('getWeather', () {
      const String location = 'Taipei';

      test('makes correct http request', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('[]');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        try {
          await wttrInApiClient.getWeather(location);
        } catch (_) {}

        verify(() => httpClient.get(
            Uri.https('wttr.in', '/$location', {'format': 'j1'}))).called(1);
      });

      test('returns weather on valid response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('''
        {
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
                        {
                            "value": "Partly cloudy"
                        }
                    ],
                    "weatherIconUrl": [
                        {
                            "value": ""
                        }
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
                        {
                            "value": "Chiupokou"
                        }
                    ],
                    "country": [
                        {
                            "value": "Taiwan"
                        }
                    ],
                    "latitude": "25.033",
                    "longitude": "121.567",
                    "population": "0",
                    "region": [
                        {
                            "value": "T'ai-pei"
                        }
                    ],
                    "weatherUrl": [
                        {
                            "value": ""
                        }
                    ]
                }
            ]}
        ''');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        final actual = await wttrInApiClient.getWeather(location);
        expect(
            actual,
            isA<Weather>()
                .having((w) => w.humidity, 'humidity', 53)
                .having((w) => w.pressure, 'pressure', 1007)
                .having((w) => w.temperature, 'temperature', 34));
      });

      test('throws WeatherRequestFailure on non-200 response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(500);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        expect(() async => await wttrInApiClient.getWeather(location),
            throwsA(isA<WeatherRequestFailure>()));
      });

      test('throws LocationNotFoundFailure on 404 response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(404);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        expect(() async => await wttrInApiClient.getWeather(location),
            throwsA(isA<LocationNotFoundFailure>()));
      });

      test('throws WeatherNotFoundFailure on empty response body', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        expect(() async => await wttrInApiClient.getWeather(location),
            throwsA(isA<WeatherNotFoundFailure>()));
      });

      test('throws WeatherNotFoundFailure on empty current_condition',
          () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{"current_condition": []}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        expect(() async => await wttrInApiClient.getWeather(location),
            throwsA(isA<WeatherNotFoundFailure>()));
      });
    });
  });
}
