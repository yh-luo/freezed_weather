// ignore_for_file: prefer_const_constructors
import 'package:json_annotation/json_annotation.dart';
import 'package:meta_weather_api/meta_weather_api.dart';
import 'package:test/test.dart';

void main() {
  group('Location', () {
    group('fromJson', () {
      test('works properly', () {
        final actual = Location.fromJson(<String, dynamic>{
          'title': 'London',
          'location_type': 'City',
          'latt_long': '51.506321,-0.12714',
          'woeid': 44418
        });
        expect(actual, isA<Location>());
      });

      test('throws CheckedFromJsonException when enum is unknown', () {
        expect(
          () => Location.fromJson(<String, dynamic>{
            'title': 'mock-title',
            'location_type': 'Unknown',
            'latt_long': '-34.75,83.28',
            'woeid': 42
          }),
          throwsA(TypeMatcher<CheckedFromJsonException>()),
        );
      });
    });
  });
}
