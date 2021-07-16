// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GradientShader _$GradientShaderFromJson(Map<String, dynamic> json) {
  return GradientShader(
    gradient: GradientDef.fromJson(json['gradient'] as Map<String, dynamic>),
    rect: RectDef.fromJson(json['rect'] as Map<String, dynamic>),
    boxFit: _$enumDecode(_$BoxFitEnumMap, json['boxFit']),
  );
}

Map<String, dynamic> _$GradientShaderToJson(GradientShader instance) =>
    <String, dynamic>{
      'rect': instance.rect.toJson(),
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
      'gradient': instance.gradient.toJson(),
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

const _$BoxFitEnumMap = {
  BoxFit.fill: 'fill',
  BoxFit.contain: 'contain',
  BoxFit.cover: 'cover',
  BoxFit.fitWidth: 'fitWidth',
  BoxFit.fitHeight: 'fitHeight',
  BoxFit.none: 'none',
  BoxFit.scaleDown: 'scaleDown',
};

GradientDef _$GradientDefFromJson(Map<String, dynamic> json) {
  return GradientDef(
    gradientType: _$enumDecode(_$GradientTypeEnumMap, json['gradientType']),
    gradientColorList: (json['gradientColorList'] as List<dynamic>)
        .map((e) => GradientColorDef.fromJson(e as Map<String, dynamic>))
        .toList(),
    tileMode: _$enumDecode(_$TileModeEnumMap, json['tileMode']),
  );
}

Map<String, dynamic> _$GradientDefToJson(GradientDef instance) =>
    <String, dynamic>{
      'gradientType': _$GradientTypeEnumMap[instance.gradientType],
      'gradientColorList':
          instance.gradientColorList.map((e) => e.toJson()).toList(),
      'tileMode': _$TileModeEnumMap[instance.tileMode],
    };

const _$GradientTypeEnumMap = {
  GradientType.Linear: 'Linear',
  GradientType.Radial: 'Radial',
};

const _$TileModeEnumMap = {
  TileMode.clamp: 'clamp',
  TileMode.repeated: 'repeated',
  TileMode.mirror: 'mirror',
  TileMode.decal: 'decal',
};

LinearGradientDef _$LinearGradientDefFromJson(Map<String, dynamic> json) {
  return LinearGradientDef(
    gradientColorList: (json['gradientColorList'] as List<dynamic>)
        .map((e) => GradientColorDef.fromJson(e as Map<String, dynamic>))
        .toList(),
    tileMode: _$enumDecode(_$TileModeEnumMap, json['tileMode']),
    begin: AlignmentDef.fromJson(json['begin'] as Map<String, dynamic>),
    end: AlignmentDef.fromJson(json['end'] as Map<String, dynamic>),
  )..gradientType = _$enumDecode(_$GradientTypeEnumMap, json['gradientType']);
}

Map<String, dynamic> _$LinearGradientDefToJson(LinearGradientDef instance) =>
    <String, dynamic>{
      'gradientType': _$GradientTypeEnumMap[instance.gradientType],
      'gradientColorList':
          instance.gradientColorList.map((e) => e.toJson()).toList(),
      'tileMode': _$TileModeEnumMap[instance.tileMode],
      'begin': instance.begin.toJson(),
      'end': instance.end.toJson(),
    };

RadialGradientDef _$RadialGradientDefFromJson(Map<String, dynamic> json) {
  return RadialGradientDef(
    gradientColorList: (json['gradientColorList'] as List<dynamic>)
        .map((e) => GradientColorDef.fromJson(e as Map<String, dynamic>))
        .toList(),
    tileMode: _$enumDecode(_$TileModeEnumMap, json['tileMode']),
    center: PointDef.fromJson(json['center'] as Map<String, dynamic>),
    radius: (json['radius'] as num).toDouble(),
  )..gradientType = _$enumDecode(_$GradientTypeEnumMap, json['gradientType']);
}

Map<String, dynamic> _$RadialGradientDefToJson(RadialGradientDef instance) =>
    <String, dynamic>{
      'gradientType': _$GradientTypeEnumMap[instance.gradientType],
      'gradientColorList':
          instance.gradientColorList.map((e) => e.toJson()).toList(),
      'tileMode': _$TileModeEnumMap[instance.tileMode],
      'center': instance.center.toJson(),
      'radius': instance.radius,
    };
