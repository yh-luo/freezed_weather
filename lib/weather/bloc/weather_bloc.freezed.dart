// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weather_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? city) started,
    required TResult Function() refreshed,
    required TResult Function() unitsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? city)? started,
    TResult Function()? refreshed,
    TResult Function()? unitsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? city)? started,
    TResult Function()? refreshed,
    TResult Function()? unitsChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Refreshed value) refreshed,
    required TResult Function(_UnitsChanged value) unitsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Refreshed value)? refreshed,
    TResult Function(_UnitsChanged value)? unitsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Refreshed value)? refreshed,
    TResult Function(_UnitsChanged value)? unitsChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherEventCopyWith<$Res> {
  factory $WeatherEventCopyWith(
          WeatherEvent value, $Res Function(WeatherEvent) then) =
      _$WeatherEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$WeatherEventCopyWithImpl<$Res> implements $WeatherEventCopyWith<$Res> {
  _$WeatherEventCopyWithImpl(this._value, this._then);

  final WeatherEvent _value;
  // ignore: unused_field
  final $Res Function(WeatherEvent) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
  $Res call({String? city});
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res> extends _$WeatherEventCopyWithImpl<$Res>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, (v) => _then(v as _$_Started));

  @override
  _$_Started get _value => super._value as _$_Started;

  @override
  $Res call({
    Object? city = freezed,
  }) {
    return _then(_$_Started(
      city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started(this.city);

  @override
  final String? city;

  @override
  String toString() {
    return 'WeatherEvent.started(city: $city)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Started &&
            const DeepCollectionEquality().equals(other.city, city));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(city));

  @JsonKey(ignore: true)
  @override
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      __$$_StartedCopyWithImpl<_$_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? city) started,
    required TResult Function() refreshed,
    required TResult Function() unitsChanged,
  }) {
    return started(city);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? city)? started,
    TResult Function()? refreshed,
    TResult Function()? unitsChanged,
  }) {
    return started?.call(city);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? city)? started,
    TResult Function()? refreshed,
    TResult Function()? unitsChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(city);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Refreshed value) refreshed,
    required TResult Function(_UnitsChanged value) unitsChanged,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Refreshed value)? refreshed,
    TResult Function(_UnitsChanged value)? unitsChanged,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Refreshed value)? refreshed,
    TResult Function(_UnitsChanged value)? unitsChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements WeatherEvent {
  const factory _Started(final String? city) = _$_Started;

  String? get city => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RefreshedCopyWith<$Res> {
  factory _$$_RefreshedCopyWith(
          _$_Refreshed value, $Res Function(_$_Refreshed) then) =
      __$$_RefreshedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RefreshedCopyWithImpl<$Res> extends _$WeatherEventCopyWithImpl<$Res>
    implements _$$_RefreshedCopyWith<$Res> {
  __$$_RefreshedCopyWithImpl(
      _$_Refreshed _value, $Res Function(_$_Refreshed) _then)
      : super(_value, (v) => _then(v as _$_Refreshed));

  @override
  _$_Refreshed get _value => super._value as _$_Refreshed;
}

/// @nodoc

class _$_Refreshed implements _Refreshed {
  const _$_Refreshed();

  @override
  String toString() {
    return 'WeatherEvent.refreshed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Refreshed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? city) started,
    required TResult Function() refreshed,
    required TResult Function() unitsChanged,
  }) {
    return refreshed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? city)? started,
    TResult Function()? refreshed,
    TResult Function()? unitsChanged,
  }) {
    return refreshed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? city)? started,
    TResult Function()? refreshed,
    TResult Function()? unitsChanged,
    required TResult orElse(),
  }) {
    if (refreshed != null) {
      return refreshed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Refreshed value) refreshed,
    required TResult Function(_UnitsChanged value) unitsChanged,
  }) {
    return refreshed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Refreshed value)? refreshed,
    TResult Function(_UnitsChanged value)? unitsChanged,
  }) {
    return refreshed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Refreshed value)? refreshed,
    TResult Function(_UnitsChanged value)? unitsChanged,
    required TResult orElse(),
  }) {
    if (refreshed != null) {
      return refreshed(this);
    }
    return orElse();
  }
}

abstract class _Refreshed implements WeatherEvent {
  const factory _Refreshed() = _$_Refreshed;
}

/// @nodoc
abstract class _$$_UnitsChangedCopyWith<$Res> {
  factory _$$_UnitsChangedCopyWith(
          _$_UnitsChanged value, $Res Function(_$_UnitsChanged) then) =
      __$$_UnitsChangedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnitsChangedCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res>
    implements _$$_UnitsChangedCopyWith<$Res> {
  __$$_UnitsChangedCopyWithImpl(
      _$_UnitsChanged _value, $Res Function(_$_UnitsChanged) _then)
      : super(_value, (v) => _then(v as _$_UnitsChanged));

  @override
  _$_UnitsChanged get _value => super._value as _$_UnitsChanged;
}

/// @nodoc

class _$_UnitsChanged implements _UnitsChanged {
  const _$_UnitsChanged();

  @override
  String toString() {
    return 'WeatherEvent.unitsChanged()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UnitsChanged);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? city) started,
    required TResult Function() refreshed,
    required TResult Function() unitsChanged,
  }) {
    return unitsChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? city)? started,
    TResult Function()? refreshed,
    TResult Function()? unitsChanged,
  }) {
    return unitsChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? city)? started,
    TResult Function()? refreshed,
    TResult Function()? unitsChanged,
    required TResult orElse(),
  }) {
    if (unitsChanged != null) {
      return unitsChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Refreshed value) refreshed,
    required TResult Function(_UnitsChanged value) unitsChanged,
  }) {
    return unitsChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Refreshed value)? refreshed,
    TResult Function(_UnitsChanged value)? unitsChanged,
  }) {
    return unitsChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Refreshed value)? refreshed,
    TResult Function(_UnitsChanged value)? unitsChanged,
    required TResult orElse(),
  }) {
    if (unitsChanged != null) {
      return unitsChanged(this);
    }
    return orElse();
  }
}

abstract class _UnitsChanged implements WeatherEvent {
  const factory _UnitsChanged() = _$_UnitsChanged;
}

WeatherState _$WeatherStateFromJson(Map<String, dynamic> json) {
  return _WeatherState.fromJson(json);
}

/// @nodoc
mixin _$WeatherState {
  WeatherStatus get status => throw _privateConstructorUsedError;
  TemperatureUnits get temperatureUnits => throw _privateConstructorUsedError;
  Weather? get weather => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherStateCopyWith<WeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res>;
  $Res call(
      {WeatherStatus status,
      TemperatureUnits temperatureUnits,
      Weather? weather});

  $WeatherCopyWith<$Res>? get weather;
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res> implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  final WeatherState _value;
  // ignore: unused_field
  final $Res Function(WeatherState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? temperatureUnits = freezed,
    Object? weather = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WeatherStatus,
      temperatureUnits: temperatureUnits == freezed
          ? _value.temperatureUnits
          : temperatureUnits // ignore: cast_nullable_to_non_nullable
              as TemperatureUnits,
      weather: weather == freezed
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
    ));
  }

  @override
  $WeatherCopyWith<$Res>? get weather {
    if (_value.weather == null) {
      return null;
    }

    return $WeatherCopyWith<$Res>(_value.weather!, (value) {
      return _then(_value.copyWith(weather: value));
    });
  }
}

/// @nodoc
abstract class _$$_WeatherStateCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$$_WeatherStateCopyWith(
          _$_WeatherState value, $Res Function(_$_WeatherState) then) =
      __$$_WeatherStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {WeatherStatus status,
      TemperatureUnits temperatureUnits,
      Weather? weather});

  @override
  $WeatherCopyWith<$Res>? get weather;
}

/// @nodoc
class __$$_WeatherStateCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res>
    implements _$$_WeatherStateCopyWith<$Res> {
  __$$_WeatherStateCopyWithImpl(
      _$_WeatherState _value, $Res Function(_$_WeatherState) _then)
      : super(_value, (v) => _then(v as _$_WeatherState));

  @override
  _$_WeatherState get _value => super._value as _$_WeatherState;

  @override
  $Res call({
    Object? status = freezed,
    Object? temperatureUnits = freezed,
    Object? weather = freezed,
  }) {
    return _then(_$_WeatherState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WeatherStatus,
      temperatureUnits: temperatureUnits == freezed
          ? _value.temperatureUnits
          : temperatureUnits // ignore: cast_nullable_to_non_nullable
              as TemperatureUnits,
      weather: weather == freezed
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherState implements _WeatherState {
  const _$_WeatherState(
      {this.status = WeatherStatus.initial,
      this.temperatureUnits = TemperatureUnits.celsius,
      this.weather});

  factory _$_WeatherState.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherStateFromJson(json);

  @override
  @JsonKey()
  final WeatherStatus status;
  @override
  @JsonKey()
  final TemperatureUnits temperatureUnits;
  @override
  final Weather? weather;

  @override
  String toString() {
    return 'WeatherState(status: $status, temperatureUnits: $temperatureUnits, weather: $weather)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.temperatureUnits, temperatureUnits) &&
            const DeepCollectionEquality().equals(other.weather, weather));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(temperatureUnits),
      const DeepCollectionEquality().hash(weather));

  @JsonKey(ignore: true)
  @override
  _$$_WeatherStateCopyWith<_$_WeatherState> get copyWith =>
      __$$_WeatherStateCopyWithImpl<_$_WeatherState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherStateToJson(this);
  }
}

abstract class _WeatherState implements WeatherState {
  const factory _WeatherState(
      {final WeatherStatus status,
      final TemperatureUnits temperatureUnits,
      final Weather? weather}) = _$_WeatherState;

  factory _WeatherState.fromJson(Map<String, dynamic> json) =
      _$_WeatherState.fromJson;

  @override
  WeatherStatus get status => throw _privateConstructorUsedError;
  @override
  TemperatureUnits get temperatureUnits => throw _privateConstructorUsedError;
  @override
  Weather? get weather => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherStateCopyWith<_$_WeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}
