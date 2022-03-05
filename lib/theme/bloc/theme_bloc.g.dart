// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Initial _$$_InitialFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_Initial',
      json,
      ($checkedConvert) {
        final val = _$_Initial(
          color: $checkedConvert(
              'color',
              (v) => v == null
                  ? const Color(0xFF2196F3)
                  : const ColorConverter().fromJson(v as Map<String, dynamic>)),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$$_InitialToJson(_$_Initial instance) =>
    <String, dynamic>{
      'color': const ColorConverter().toJson(instance.color),
      'runtimeType': instance.$type,
    };

_$_Loaded _$$_LoadedFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_Loaded',
      json,
      ($checkedConvert) {
        final val = _$_Loaded(
          $checkedConvert(
              'color',
              (v) =>
                  const ColorConverter().fromJson(v as Map<String, dynamic>)),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {r'$type': 'runtimeType'},
    );

Map<String, dynamic> _$$_LoadedToJson(_$_Loaded instance) => <String, dynamic>{
      'color': const ColorConverter().toJson(instance.color),
      'runtimeType': instance.$type,
    };
