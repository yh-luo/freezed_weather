part of 'theme_bloc.dart';

@freezed
class ThemeState with _$ThemeState {
  factory ThemeState.initial(
      {@ColorConverter() @Default(Color(0xFF2196F3)) Color color}) = _Initial;
  const factory ThemeState.loaded(@ColorConverter() Color color) = _Loaded;

  factory ThemeState.fromJson(Map<String, dynamic> json) =>
      _$ThemeStateFromJson(json);
}

class ColorConverter implements JsonConverter<Color, Map<String, dynamic>> {
  const ColorConverter();

  @override
  Map<String, dynamic> toJson(Color color) {
    return <String, dynamic>{'color': '${color.value}'};
  }

  @override
  Color fromJson(Map<String, dynamic> json) {
    return Color(int.parse(json['color'] as String));
  }
}
