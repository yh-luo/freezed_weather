import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

enum LocationType {
  @JsonValue('City')
  city,
  @JsonValue('Region')
  region,
  @JsonValue('State')
  state,
  @JsonValue('Province')
  province,
  @JsonValue('Country')
  country,
  @JsonValue('Continent')
  continent,
}

@freezed
class Location with _$Location {
  const factory Location({
    required String title,
    @JsonKey(name: 'location_type') required LocationType locationType,
    @JsonKey(name: 'latt_long')
    @CoordinateConverter()
        required Coordinate coordinate,
    @JsonKey(name: 'woeid') required int id,
    int? distance,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
class Coordinate with _$Coordinate {
  const factory Coordinate(
      {required double latitude, required double longitude}) = _Coordinate;

  factory Coordinate.fromJson(Map<String, dynamic> json) =>
      _$CoordinateFromJson(json);
}

class CoordinateConverter implements JsonConverter<Coordinate, String> {
  const CoordinateConverter();

  @override
  String toJson(Coordinate latLng) {
    return '${latLng.latitude},${latLng.longitude}';
  }

  @override
  Coordinate fromJson(String jsonString) {
    final parts = jsonString.split(',');
    return Coordinate(
      latitude: double.tryParse(parts[0]) ?? 0,
      longitude: double.tryParse(parts[1]) ?? 0,
    );
  }
}
