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
  String get location => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  WeatherCondition get condition => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res>;
  $Res call({String location, double temperature, WeatherCondition condition});
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res> implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  final Weather _value;
  // ignore: unused_field
  final $Res Function(Weather) _then;

  @override
  $Res call({
    Object? location = freezed,
    Object? temperature = freezed,
    Object? condition = freezed,
  }) {
    return _then(_value.copyWith(
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: temperature == freezed
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      condition: condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as WeatherCondition,
    ));
  }
}

/// @nodoc
abstract class _$$_WeatherCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$$_WeatherCopyWith(
          _$_Weather value, $Res Function(_$_Weather) then) =
      __$$_WeatherCopyWithImpl<$Res>;
  @override
  $Res call({String location, double temperature, WeatherCondition condition});
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
    Object? location = freezed,
    Object? temperature = freezed,
    Object? condition = freezed,
  }) {
    return _then(_$_Weather(
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: temperature == freezed
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      condition: condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as WeatherCondition,
    ));
  }
}

/// @nodoc

class _$_Weather implements _Weather {
  const _$_Weather(
      {required this.location,
      required this.temperature,
      required this.condition});

  @override
  final String location;
  @override
  final double temperature;
  @override
  final WeatherCondition condition;

  @override
  String toString() {
    return 'Weather(location: $location, temperature: $temperature, condition: $condition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Weather &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality()
                .equals(other.temperature, temperature) &&
            const DeepCollectionEquality().equals(other.condition, condition));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(temperature),
      const DeepCollectionEquality().hash(condition));

  @JsonKey(ignore: true)
  @override
  _$$_WeatherCopyWith<_$_Weather> get copyWith =>
      __$$_WeatherCopyWithImpl<_$_Weather>(this, _$identity);
}

abstract class _Weather implements Weather {
  const factory _Weather(
      {required final String location,
      required final double temperature,
      required final WeatherCondition condition}) = _$_Weather;

  @override
  String get location => throw _privateConstructorUsedError;
  @override
  double get temperature => throw _privateConstructorUsedError;
  @override
  WeatherCondition get condition => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherCopyWith<_$_Weather> get copyWith =>
      throw _privateConstructorUsedError;
}
