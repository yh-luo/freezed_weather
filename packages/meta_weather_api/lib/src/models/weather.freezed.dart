// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return _Weather.fromJson(json);
}

/// @nodoc
mixin _$Weather {
  int get id => throw _privateConstructorUsedError;
  String get weatherStateName => throw _privateConstructorUsedError;
  @JsonKey(unknownEnumValue: WeatherState.unknown)
  WeatherState get weatherStateAbbr => throw _privateConstructorUsedError;
  @JsonKey(unknownEnumValue: WindDirectionCompass.unknown)
  WindDirectionCompass get windDirectionCompass =>
      throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  DateTime get applicableDate => throw _privateConstructorUsedError;
  double get minTemp => throw _privateConstructorUsedError;
  double get maxTemp => throw _privateConstructorUsedError;
  double get theTemp => throw _privateConstructorUsedError;
  double get windSpeed => throw _privateConstructorUsedError;
  double get windDirection => throw _privateConstructorUsedError;
  double get airPressure => throw _privateConstructorUsedError;
  int get humidity => throw _privateConstructorUsedError;
  double get visibility => throw _privateConstructorUsedError;
  int get predictability => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String weatherStateName,
      @JsonKey(unknownEnumValue: WeatherState.unknown)
          WeatherState weatherStateAbbr,
      @JsonKey(unknownEnumValue: WindDirectionCompass.unknown)
          WindDirectionCompass windDirectionCompass,
      DateTime created,
      DateTime applicableDate,
      double minTemp,
      double maxTemp,
      double theTemp,
      double windSpeed,
      double windDirection,
      double airPressure,
      int humidity,
      double visibility,
      int predictability});
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res> implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  final Weather _value;
  // ignore: unused_field
  final $Res Function(Weather) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? weatherStateName = freezed,
    Object? weatherStateAbbr = freezed,
    Object? windDirectionCompass = freezed,
    Object? created = freezed,
    Object? applicableDate = freezed,
    Object? minTemp = freezed,
    Object? maxTemp = freezed,
    Object? theTemp = freezed,
    Object? windSpeed = freezed,
    Object? windDirection = freezed,
    Object? airPressure = freezed,
    Object? humidity = freezed,
    Object? visibility = freezed,
    Object? predictability = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      weatherStateName: weatherStateName == freezed
          ? _value.weatherStateName
          : weatherStateName // ignore: cast_nullable_to_non_nullable
              as String,
      weatherStateAbbr: weatherStateAbbr == freezed
          ? _value.weatherStateAbbr
          : weatherStateAbbr // ignore: cast_nullable_to_non_nullable
              as WeatherState,
      windDirectionCompass: windDirectionCompass == freezed
          ? _value.windDirectionCompass
          : windDirectionCompass // ignore: cast_nullable_to_non_nullable
              as WindDirectionCompass,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      applicableDate: applicableDate == freezed
          ? _value.applicableDate
          : applicableDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      minTemp: minTemp == freezed
          ? _value.minTemp
          : minTemp // ignore: cast_nullable_to_non_nullable
              as double,
      maxTemp: maxTemp == freezed
          ? _value.maxTemp
          : maxTemp // ignore: cast_nullable_to_non_nullable
              as double,
      theTemp: theTemp == freezed
          ? _value.theTemp
          : theTemp // ignore: cast_nullable_to_non_nullable
              as double,
      windSpeed: windSpeed == freezed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      windDirection: windDirection == freezed
          ? _value.windDirection
          : windDirection // ignore: cast_nullable_to_non_nullable
              as double,
      airPressure: airPressure == freezed
          ? _value.airPressure
          : airPressure // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: humidity == freezed
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as double,
      predictability: predictability == freezed
          ? _value.predictability
          : predictability // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_WeatherCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$$_WeatherCopyWith(
          _$_Weather value, $Res Function(_$_Weather) then) =
      __$$_WeatherCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String weatherStateName,
      @JsonKey(unknownEnumValue: WeatherState.unknown)
          WeatherState weatherStateAbbr,
      @JsonKey(unknownEnumValue: WindDirectionCompass.unknown)
          WindDirectionCompass windDirectionCompass,
      DateTime created,
      DateTime applicableDate,
      double minTemp,
      double maxTemp,
      double theTemp,
      double windSpeed,
      double windDirection,
      double airPressure,
      int humidity,
      double visibility,
      int predictability});
}

/// @nodoc
class __$$_WeatherCopyWithImpl<$Res> extends _$WeatherCopyWithImpl<$Res>
    implements _$$_WeatherCopyWith<$Res> {
  __$$_WeatherCopyWithImpl(_$_Weather _value, $Res Function(_$_Weather) _then)
      : super(_value, (v) => _then(v as _$_Weather));

  @override
  _$_Weather get _value => super._value as _$_Weather;

  @override
  $Res call({
    Object? id = freezed,
    Object? weatherStateName = freezed,
    Object? weatherStateAbbr = freezed,
    Object? windDirectionCompass = freezed,
    Object? created = freezed,
    Object? applicableDate = freezed,
    Object? minTemp = freezed,
    Object? maxTemp = freezed,
    Object? theTemp = freezed,
    Object? windSpeed = freezed,
    Object? windDirection = freezed,
    Object? airPressure = freezed,
    Object? humidity = freezed,
    Object? visibility = freezed,
    Object? predictability = freezed,
  }) {
    return _then(_$_Weather(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      weatherStateName: weatherStateName == freezed
          ? _value.weatherStateName
          : weatherStateName // ignore: cast_nullable_to_non_nullable
              as String,
      weatherStateAbbr: weatherStateAbbr == freezed
          ? _value.weatherStateAbbr
          : weatherStateAbbr // ignore: cast_nullable_to_non_nullable
              as WeatherState,
      windDirectionCompass: windDirectionCompass == freezed
          ? _value.windDirectionCompass
          : windDirectionCompass // ignore: cast_nullable_to_non_nullable
              as WindDirectionCompass,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      applicableDate: applicableDate == freezed
          ? _value.applicableDate
          : applicableDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      minTemp: minTemp == freezed
          ? _value.minTemp
          : minTemp // ignore: cast_nullable_to_non_nullable
              as double,
      maxTemp: maxTemp == freezed
          ? _value.maxTemp
          : maxTemp // ignore: cast_nullable_to_non_nullable
              as double,
      theTemp: theTemp == freezed
          ? _value.theTemp
          : theTemp // ignore: cast_nullable_to_non_nullable
              as double,
      windSpeed: windSpeed == freezed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      windDirection: windDirection == freezed
          ? _value.windDirection
          : windDirection // ignore: cast_nullable_to_non_nullable
              as double,
      airPressure: airPressure == freezed
          ? _value.airPressure
          : airPressure // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: humidity == freezed
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as double,
      predictability: predictability == freezed
          ? _value.predictability
          : predictability // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_Weather implements _Weather {
  const _$_Weather(
      {required this.id,
      required this.weatherStateName,
      @JsonKey(unknownEnumValue: WeatherState.unknown)
          required this.weatherStateAbbr,
      @JsonKey(unknownEnumValue: WindDirectionCompass.unknown)
          required this.windDirectionCompass,
      required this.created,
      required this.applicableDate,
      required this.minTemp,
      required this.maxTemp,
      required this.theTemp,
      required this.windSpeed,
      required this.windDirection,
      required this.airPressure,
      required this.humidity,
      required this.visibility,
      required this.predictability});

  factory _$_Weather.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherFromJson(json);

  @override
  final int id;
  @override
  final String weatherStateName;
  @override
  @JsonKey(unknownEnumValue: WeatherState.unknown)
  final WeatherState weatherStateAbbr;
  @override
  @JsonKey(unknownEnumValue: WindDirectionCompass.unknown)
  final WindDirectionCompass windDirectionCompass;
  @override
  final DateTime created;
  @override
  final DateTime applicableDate;
  @override
  final double minTemp;
  @override
  final double maxTemp;
  @override
  final double theTemp;
  @override
  final double windSpeed;
  @override
  final double windDirection;
  @override
  final double airPressure;
  @override
  final int humidity;
  @override
  final double visibility;
  @override
  final int predictability;

  @override
  String toString() {
    return 'Weather(id: $id, weatherStateName: $weatherStateName, weatherStateAbbr: $weatherStateAbbr, windDirectionCompass: $windDirectionCompass, created: $created, applicableDate: $applicableDate, minTemp: $minTemp, maxTemp: $maxTemp, theTemp: $theTemp, windSpeed: $windSpeed, windDirection: $windDirection, airPressure: $airPressure, humidity: $humidity, visibility: $visibility, predictability: $predictability)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Weather &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.weatherStateName, weatherStateName) &&
            const DeepCollectionEquality()
                .equals(other.weatherStateAbbr, weatherStateAbbr) &&
            const DeepCollectionEquality()
                .equals(other.windDirectionCompass, windDirectionCompass) &&
            const DeepCollectionEquality().equals(other.created, created) &&
            const DeepCollectionEquality()
                .equals(other.applicableDate, applicableDate) &&
            const DeepCollectionEquality().equals(other.minTemp, minTemp) &&
            const DeepCollectionEquality().equals(other.maxTemp, maxTemp) &&
            const DeepCollectionEquality().equals(other.theTemp, theTemp) &&
            const DeepCollectionEquality().equals(other.windSpeed, windSpeed) &&
            const DeepCollectionEquality()
                .equals(other.windDirection, windDirection) &&
            const DeepCollectionEquality()
                .equals(other.airPressure, airPressure) &&
            const DeepCollectionEquality().equals(other.humidity, humidity) &&
            const DeepCollectionEquality()
                .equals(other.visibility, visibility) &&
            const DeepCollectionEquality()
                .equals(other.predictability, predictability));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(weatherStateName),
      const DeepCollectionEquality().hash(weatherStateAbbr),
      const DeepCollectionEquality().hash(windDirectionCompass),
      const DeepCollectionEquality().hash(created),
      const DeepCollectionEquality().hash(applicableDate),
      const DeepCollectionEquality().hash(minTemp),
      const DeepCollectionEquality().hash(maxTemp),
      const DeepCollectionEquality().hash(theTemp),
      const DeepCollectionEquality().hash(windSpeed),
      const DeepCollectionEquality().hash(windDirection),
      const DeepCollectionEquality().hash(airPressure),
      const DeepCollectionEquality().hash(humidity),
      const DeepCollectionEquality().hash(visibility),
      const DeepCollectionEquality().hash(predictability));

  @JsonKey(ignore: true)
  @override
  _$$_WeatherCopyWith<_$_Weather> get copyWith =>
      __$$_WeatherCopyWithImpl<_$_Weather>(this, _$identity);
}

abstract class _Weather implements Weather {
  const factory _Weather(
      {required final int id,
      required final String weatherStateName,
      @JsonKey(unknownEnumValue: WeatherState.unknown)
          required final WeatherState weatherStateAbbr,
      @JsonKey(unknownEnumValue: WindDirectionCompass.unknown)
          required final WindDirectionCompass windDirectionCompass,
      required final DateTime created,
      required final DateTime applicableDate,
      required final double minTemp,
      required final double maxTemp,
      required final double theTemp,
      required final double windSpeed,
      required final double windDirection,
      required final double airPressure,
      required final int humidity,
      required final double visibility,
      required final int predictability}) = _$_Weather;

  factory _Weather.fromJson(Map<String, dynamic> json) = _$_Weather.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get weatherStateName => throw _privateConstructorUsedError;
  @override
  @JsonKey(unknownEnumValue: WeatherState.unknown)
  WeatherState get weatherStateAbbr => throw _privateConstructorUsedError;
  @override
  @JsonKey(unknownEnumValue: WindDirectionCompass.unknown)
  WindDirectionCompass get windDirectionCompass =>
      throw _privateConstructorUsedError;
  @override
  DateTime get created => throw _privateConstructorUsedError;
  @override
  DateTime get applicableDate => throw _privateConstructorUsedError;
  @override
  double get minTemp => throw _privateConstructorUsedError;
  @override
  double get maxTemp => throw _privateConstructorUsedError;
  @override
  double get theTemp => throw _privateConstructorUsedError;
  @override
  double get windSpeed => throw _privateConstructorUsedError;
  @override
  double get windDirection => throw _privateConstructorUsedError;
  @override
  double get airPressure => throw _privateConstructorUsedError;
  @override
  int get humidity => throw _privateConstructorUsedError;
  @override
  double get visibility => throw _privateConstructorUsedError;
  @override
  int get predictability => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherCopyWith<_$_Weather> get copyWith =>
      throw _privateConstructorUsedError;
}
