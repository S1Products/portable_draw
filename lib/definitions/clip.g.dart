// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClipDef _$ClipDefFromJson(Map<String, dynamic> json) {
  return ClipDef(
    clipType: _$enumDecode(_$ClipTypeEnumMap, json['clipType']),
    clipRectDef: json['clipRectDef'] == null
        ? null
        : ClipRectDef.fromJson(json['clipRectDef'] as Map<String, dynamic>),
    clipRRectDef: json['clipRRectDef'] == null
        ? null
        : ClipRRectDef.fromJson(json['clipRRectDef'] as Map<String, dynamic>),
    clipPathDef: json['clipPathDef'] == null
        ? null
        : ClipPathDef.fromJson(json['clipPathDef'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ClipDefToJson(ClipDef instance) => <String, dynamic>{
      'clipType': _$ClipTypeEnumMap[instance.clipType],
      'clipRectDef': instance.clipRectDef?.toJson(),
      'clipRRectDef': instance.clipRRectDef?.toJson(),
      'clipPathDef': instance.clipPathDef?.toJson(),
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

const _$ClipTypeEnumMap = {
  ClipType.Path: 'Path',
  ClipType.Rect: 'Rect',
  ClipType.RRect: 'RRect',
};

ClipRectDef _$ClipRectDefFromJson(Map<String, dynamic> json) {
  return ClipRectDef(
    rect: RectDef.fromJson(json['rect'] as Map<String, dynamic>),
    clipOp: _$enumDecodeNullable(_$ClipOpEnumMap, json['clipOp']) ??
        ClipOp.intersect,
    doAntiAlias: json['doAntiAlias'] as bool? ?? true,
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
  );
}

Map<String, dynamic> _$ClipRectDefToJson(ClipRectDef instance) =>
    <String, dynamic>{
      'rect': instance.rect.toJson(),
      'clipOp': _$ClipOpEnumMap[instance.clipOp],
      'doAntiAlias': instance.doAntiAlias,
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
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

const _$ClipOpEnumMap = {
  ClipOp.difference: 'difference',
  ClipOp.intersect: 'intersect',
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

ClipRRectDef _$ClipRRectDefFromJson(Map<String, dynamic> json) {
  return ClipRRectDef(
    rect: RectDef.fromJson(json['rect'] as Map<String, dynamic>),
    radius: (json['radius'] as num).toDouble(),
    doAntiAlias: json['doAntiAlias'] as bool? ?? true,
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
  );
}

Map<String, dynamic> _$ClipRRectDefToJson(ClipRRectDef instance) =>
    <String, dynamic>{
      'rect': instance.rect.toJson(),
      'radius': instance.radius,
      'doAntiAlias': instance.doAntiAlias,
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
    };

ClipPathDef _$ClipPathDefFromJson(Map<String, dynamic> json) {
  return ClipPathDef(
    pathDefList: (json['pathDefList'] as List<dynamic>)
        .map((e) => PathDef.fromJson(e as Map<String, dynamic>))
        .toList(),
    doAntiAlias: json['doAntiAlias'] as bool? ?? true,
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
  );
}

Map<String, dynamic> _$ClipPathDefToJson(ClipPathDef instance) =>
    <String, dynamic>{
      'pathDefList': instance.pathDefList.map((e) => e.toJson()).toList(),
      'doAntiAlias': instance.doAntiAlias,
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
    };
