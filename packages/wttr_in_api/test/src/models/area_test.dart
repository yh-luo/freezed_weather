// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:wttr_in_api/wttr_in_api.dart';

void main() {
  group('Area', () {
    test('constructor', () {
      expect(
          Area(
              name: '',
              country: '',
              region: '',
              coordinate: Coordinate(latitude: 0.0, longitude: 0.0)),
          isNotNull);
    });

    test('fromJson', () {
      final data = {
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
      };

      final area = Area.fromJson(data);
      expect(area.name, 'Chiupokou');
      expect(area.country, 'Taiwan');
      expect(area.region, 'T\'ai-pei');
      expect(area.coordinate, Coordinate(latitude: 25.033, longitude: 121.567));
    });
  });
}
