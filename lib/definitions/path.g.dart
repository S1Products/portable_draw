// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PathDef _$PathDefFromJson(Map<String, dynamic> json) {
  return PathDef(
    pathType: _$enumDecode(_$PathTypeEnumMap, json['pathType']),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
  );
}

Map<String, dynamic> _$PathDefToJson(PathDef instance) => <String, dynamic>{
      'pathType': _$PathTypeEnumMap[instance.pathType],
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
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

const _$PathTypeEnumMap = {
  PathType.Arc: 'Arc',
  PathType.Oval: 'Oval',
  PathType.Rect: 'Rect',
  PathType.RRect: 'RRect',
  PathType.ArcTo: 'ArcTo',
};

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
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

PathArcDef _$PathArcDefFromJson(Map<String, dynamic> json) {
  return PathArcDef(
    oval: RectDef.fromJson(json['oval'] as Map<String, dynamic>),
    startAngle: (json['startAngle'] as num).toDouble(),
    sweepAngle: (json['sweepAngle'] as num).toDouble(),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
  )..pathType = _$enumDecode(_$PathTypeEnumMap, json['pathType']);
}

Map<String, dynamic> _$PathArcDefToJson(PathArcDef instance) =>
    <String, dynamic>{
      'pathType': _$PathTypeEnumMap[instance.pathType],
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
      'oval': instance.oval.toJson(),
      'startAngle': instance.startAngle,
      'sweepAngle': instance.sweepAngle,
    };

PathOvalDef _$PathOvalDefFromJson(Map<String, dynamic> json) {
  return PathOvalDef(
    oval: RectDef.fromJson(json['oval'] as Map<String, dynamic>),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
  )..pathType = _$enumDecode(_$PathTypeEnumMap, json['pathType']);
}

Map<String, dynamic> _$PathOvalDefToJson(PathOvalDef instance) =>
    <String, dynamic>{
      'pathType': _$PathTypeEnumMap[instance.pathType],
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
      'oval': instance.oval.toJson(),
    };

PathRectDef _$PathRectDefFromJson(Map<String, dynamic> json) {
  return PathRectDef(
    rect: RectDef.fromJson(json['rect'] as Map<String, dynamic>),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
  )..pathType = _$enumDecode(_$PathTypeEnumMap, json['pathType']);
}

Map<String, dynamic> _$PathRectDefToJson(PathRectDef instance) =>
    <String, dynamic>{
      'pathType': _$PathTypeEnumMap[instance.pathType],
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
      'rect': instance.rect.toJson(),
    };

PathRRectDef _$PathRRectDefFromJson(Map<String, dynamic> json) {
  return PathRRectDef(
    rect: RectDef.fromJson(json['rect'] as Map<String, dynamic>),
    radius: (json['radius'] as num).toDouble(),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
  )..pathType = _$enumDecode(_$PathTypeEnumMap, json['pathType']);
}

Map<String, dynamic> _$PathRRectDefToJson(PathRRectDef instance) =>
    <String, dynamic>{
      'pathType': _$PathTypeEnumMap[instance.pathType],
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
      'rect': instance.rect.toJson(),
      'radius': instance.radius,
    };

PathArcToDef _$PathArcToDefFromJson(Map<String, dynamic> json) {
  return PathArcToDef(
    rect: RectDef.fromJson(json['rect'] as Map<String, dynamic>),
    startAngle: (json['startAngle'] as num).toDouble(),
    sweepAngle: (json['sweepAngle'] as num).toDouble(),
    forceMoveTo: json['forceMoveTo'] as bool,
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
  )..pathType = _$enumDecode(_$PathTypeEnumMap, json['pathType']);
}

Map<String, dynamic> _$PathArcToDefToJson(PathArcToDef instance) =>
    <String, dynamic>{
      'pathType': _$PathTypeEnumMap[instance.pathType],
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
      'rect': instance.rect.toJson(),
      'startAngle': instance.startAngle,
      'sweepAngle': instance.sweepAngle,
      'forceMoveTo': instance.forceMoveTo,
    };
