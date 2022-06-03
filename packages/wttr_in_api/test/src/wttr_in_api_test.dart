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

      test('throws WeatherNotFoundFailure on empty response', () async {
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
