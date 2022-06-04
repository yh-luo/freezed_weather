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

/// @nodoc
mixin _$Weather {
  double get humidity => throw _privateConstructorUsedError;
  double get pressure => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  WeatherState get weatherState => throw _privateConstructorUsedError;
  Area get area => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res>;
  $Res call(
      {double humidity,
      double pressure,
      double temperature,
      WeatherState weatherState,
      Area area});

  $AreaCopyWith<$Res> get area;
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res> implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  final Weather _value;
  // ignore: unused_field
  final $Res Function(Weather) _then;

  @override
  $Res call({
    Object? humidity = freezed,
    Object? pressure = freezed,
    Object? temperature = freezed,
    Object? weatherState = freezed,
    Object? area = freezed,
  }) {
    return _then(_value.copyWith(
      humidity: humidity == freezed
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: pressure == freezed
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double,
      temperature: temperature == freezed
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      weatherState: weatherState == freezed
          ? _value.weatherState
          : weatherState // ignore: cast_nullable_to_non_nullable
              as WeatherState,
      area: area == freezed
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as Area,
    ));
  }

  @override
  $AreaCopyWith<$Res> get area {
    return $AreaCopyWith<$Res>(_value.area, (value) {
      return _then(_value.copyWith(area: value));
    });
  }
}

/// @nodoc
abstract class _$$_WeatherCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$$_WeatherCopyWith(
          _$_Weather value, $Res Function(_$_Weather) then) =
      __$$_WeatherCopyWithImpl<$Res>;
  @override
  $Res call(
      {double humidity,
      double pressure,
      double temperature,
      WeatherState weatherState,
      Area area});

  @override
  $AreaCopyWith<$Res> get area;
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
    Object? humidity = freezed,
    Object? pressure = freezed,
    Object? temperature = freezed,
    Object? weatherState = freezed,
    Object? area = freezed,
  }) {
    return _then(_$_Weather(
      humidity: humidity == freezed
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: pressure == freezed
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double,
      temperature: temperature == freezed
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      weatherState: weatherState == freezed
          ? _value.weatherState
          : weatherState // ignore: cast_nullable_to_non_nullable
              as WeatherState,
      area: area == freezed
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as Area,
    ));
  }
}

/// @nodoc

class _$_Weather implements _Weather {
  const _$_Weather(
      {required this.humidity,
      required this.pressure,
      required this.temperature,
      required this.weatherState,
      required this.area});

  @override
  final double humidity;
  @override
  final double pressure;
  @override
  final double temperature;
  @override
  final WeatherState weatherState;
  @override
  final Area area;

  @override
  String toString() {
    return 'Weather(humidity: $humidity, pressure: $pressure, temperature: $temperature, weatherState: $weatherState, area: $area)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Weather &&
            const DeepCollectionEquality().equals(other.humidity, humidity) &&
            const DeepCollectionEquality().equals(other.pressure, pressure) &&
            const DeepCollectionEquality()
                .equals(other.temperature, temperature) &&
            const DeepCollectionEquality()
                .equals(other.weatherState, weatherState) &&
            const DeepCollectionEquality().equals(other.area, area));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(humidity),
      const DeepCollectionEquality().hash(pressure),
      const DeepCollectionEquality().hash(temperature),
      const DeepCollectionEquality().hash(weatherState),
      const DeepCollectionEquality().hash(area));

  @JsonKey(ignore: true)
  @override
  _$$_WeatherCopyWith<_$_Weather> get copyWith =>
      __$$_WeatherCopyWithImpl<_$_Weather>(this, _$identity);
}

abstract class _Weather implements Weather {
  const factory _Weather(
      {required final double humidity,
      required final double pressure,
      required final double temperature,
      required final WeatherState weatherState,
      required final Area area}) = _$_Weather;

  @override
  double get humidity => throw _privateConstructorUsedError;
  @override
  double get pressure => throw _privateConstructorUsedError;
  @override
  double get temperature => throw _privateConstructorUsedError;
  @override
  WeatherState get weatherState => throw _privateConstructorUsedError;
  @override
  Area get area => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherCopyWith<_$_Weather> get copyWith =>
      throw _privateConstructorUsedError;
}
