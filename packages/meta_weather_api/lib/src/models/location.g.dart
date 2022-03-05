// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_Location',
      json,
      ($checkedConvert) {
        final val = _$_Location(
          title: $checkedConvert('title', (v) => v as String),
          locationType: $checkedConvert(
              'location_type', (v) => $enumDecode(_$LocationTypeEnumMap, v)),
          coordinate: $checkedConvert('latt_long',
              (v) => const CoordinateConverter().fromJson(v as String)),
          id: $checkedConvert('woeid', (v) => v as int),
          distance: $checkedConvert('distance', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {
        'locationType': 'location_type',
        'coordinate': 'latt_long',
        'id': 'woeid'
      },
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'title': instance.title,
      'location_type': _$LocationTypeEnumMap[instance.locationType],
      'latt_long': const CoordinateConverter().toJson(instance.coordinate),
      'woeid': instance.id,
      'distance': instance.distance,
    };

const _$LocationTypeEnumMap = {
  LocationType.city: 'City',
  LocationType.region: 'Region',
  LocationType.state: 'State',
  LocationType.province: 'Province',
  LocationType.country: 'Country',
  LocationType.continent: 'Continent',
};

_$_Coordinate _$$_CoordinateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_Coordinate',
      json,
      ($checkedConvert) {
        final val = _$_Coordinate(
          latitude: $checkedConvert('latitude', (v) => (v as num).toDouble()),
          longitude: $checkedConvert('longitude', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_CoordinateToJson(_$_Coordinate instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
