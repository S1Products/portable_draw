// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GradientShader _$GradientShaderFromJson(Map<String, dynamic> json) {
  return GradientShader(
    gradientType: _$enumDecode(_$GradientTypeEnumMap, json['gradientType']),
    rect: RectDef.fromJson(json['rect'] as Map<String, dynamic>),
    boxFit: _$enumDecode(_$BoxFitEnumMap, json['boxFit']),
    linearGradient: json['linearGradient'] == null
        ? null
        : LinearGradientDef.fromJson(
            json['linearGradient'] as Map<String, dynamic>),
    radialGradient: json['radialGradient'] == null
        ? null
        : RadialGradientDef.fromJson(
            json['radialGradient'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GradientShaderToJson(GradientShader instance) =>
    <String, dynamic>{
      'rect': instance.rect.toJson(),
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
      'gradientType': _$GradientTypeEnumMap[instance.gradientType],
      'linearGradient': instance.linearGradient?.toJson(),
      'radialGradient': instance.radialGradient?.toJson(),
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$GradientTypeEnumMap = {
  GradientType.Linear: 'Linear',
  GradientType.Radial: 'Radial',
};

const _$BoxFitEnumMap = {
  BoxFit.fill: 'fill',
  BoxFit.contain: 'contain',
  BoxFit.cover: 'cover',
  BoxFit.fitWidth: 'fitWidth',
  BoxFit.fitHeight: 'fitHeight',
  BoxFit.none: 'none',
  BoxFit.scaleDown: 'scaleDown',
};

LinearGradientDef _$LinearGradientDefFromJson(Map<String, dynamic> json) {
  return LinearGradientDef(
    begin: AlignmentDef.fromJson(json['begin'] as Map<String, dynamic>),
    end: AlignmentDef.fromJson(json['end'] as Map<String, dynamic>),
    gradientColorList: (json['gradientColorList'] as List<dynamic>)
        .map((e) => GradientColorDef.fromJson(e as Map<String, dynamic>))
        .toList(),
    tileMode: _$enumDecode(_$TileModeEnumMap, json['tileMode']),
  );
}

Map<String, dynamic> _$LinearGradientDefToJson(LinearGradientDef instance) =>
    <String, dynamic>{
      'begin': instance.begin.toJson(),
      'end': instance.end.toJson(),
      'gradientColorList':
          instance.gradientColorList.map((e) => e.toJson()).toList(),
      'tileMode': _$TileModeEnumMap[instance.tileMode],
    };

const _$TileModeEnumMap = {
  TileMode.clamp: 'clamp',
  TileMode.repeated: 'repeated',
  TileMode.mirror: 'mirror',
  TileMode.decal: 'decal',
};

RadialGradientDef _$RadialGradientDefFromJson(Map<String, dynamic> json) {
  return RadialGradientDef(
    center: PointDef.fromJson(json['center'] as Map<String, dynamic>),
    radius: (json['radius'] as num).toDouble(),
    gradientColorList: (json['gradientColorList'] as List<dynamic>)
        .map((e) => GradientColorDef.fromJson(e as Map<String, dynamic>))
        .toList(),
    tileMode: _$enumDecode(_$TileModeEnumMap, json['tileMode']),
  );
}

Map<String, dynamic> _$RadialGradientDefToJson(RadialGradientDef instance) =>
    <String, dynamic>{
      'center': instance.center.toJson(),
      'radius': instance.radius,
      'gradientColorList':
          instance.gradientColorList.map((e) => e.toJson()).toList(),
      'tileMode': _$TileModeEnumMap[instance.tileMode],
    };
