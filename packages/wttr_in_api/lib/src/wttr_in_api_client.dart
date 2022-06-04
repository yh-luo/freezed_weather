import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/models.dart';

/// Exception thrown when the provided location is not found.
class LocationNotFoundFailure implements Exception {}

/// Exception thrown when getWeather fails.
class WeatherRequestFailure implements Exception {}

/// Exception thrown when weather for provided location is not found.
class WeatherNotFoundFailure implements Exception {}

class WttrInApiClient {
  WttrInApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'wttr.in';
  final http.Client _httpClient;

  /// Fetches [Weather] for a given [location].
  Future<Weather> getWeather(String location) async {
    final weatherRequest = Uri.https(_baseUrl, '/$location', {'format': 'j1'});
    final weatherResponse = await _httpClient.get(weatherRequest);

    if (weatherResponse.statusCode == 404) {
      throw LocationNotFoundFailure();
    }
    if (weatherResponse.statusCode != 200) {
      throw WeatherRequestFailure();
    }

    final bodyJson = jsonDecode(weatherResponse.body) as Map<String, dynamic>;

    if (bodyJson.isEmpty) {
      throw WeatherNotFoundFailure();
    }
    if ((bodyJson['current_condition'] as List).isEmpty) {
      throw WeatherNotFoundFailure();
    }

    return Weather.fromJson(bodyJson);
  }
}
