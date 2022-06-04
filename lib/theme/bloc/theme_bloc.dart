import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../weather/weather.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';
part 'theme_bloc.g.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(_Initial()) {
    on<_Changed>(_onChanged);
  }

  void _onChanged(_Changed event, Emitter<ThemeState> emit) {
    emit(_Loaded(event.weather.toColor));
  }

  @override
  ThemeState fromJson(Map<String, dynamic> json) => ThemeState.fromJson(json);

  @override
  Map<String, dynamic> toJson(ThemeState state) => state.toJson();
}

extension on Weather {
  Color get toColor {
    switch (condition) {
      case WeatherCondition.clear:
        return Colors.orangeAccent;
      case WeatherCondition.snowy:
        return Colors.lightBlueAccent;
      case WeatherCondition.cloudy:
        return Colors.blueGrey;
      case WeatherCondition.rainy:
        return Colors.indigoAccent;
      case WeatherCondition.foggy:
        return Colors.grey;
      case WeatherCondition.unknown:
      default:
        return _Initial().color;
    }
  }
}
