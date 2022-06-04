import 'package:freezed_annotation/freezed_annotation.dart';

part 'area.freezed.dart';

@freezed
class Area with _$Area {
  const factory Area({
    required String name,
    required String country,
    required String region,
    required Coordinate coordinate,
  }) = _Area;

  factory Area.fromJson(Map<String, dynamic> json) {
    final name = ((json['areaName'] as List).first
        as Map<String, dynamic>)['value'] as String;
    final country = ((json['country'] as List).first
        as Map<String, dynamic>)['value'] as String;
    final region = ((json['region'] as List).first
        as Map<String, dynamic>)['value'] as String;
    final coordinate = Coordinate(
        latitude: double.tryParse(json['latitude']) ?? 0,
        longitude: double.tryParse(json['longitude']) ?? 0);

    return Area(
        name: name, country: country, region: region, coordinate: coordinate);
  }
}

@freezed
class Coordinate with _$Coordinate {
  const factory Coordinate(
      {required double latitude, required double longitude}) = _Coordinate;
}
