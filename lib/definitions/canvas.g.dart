// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'canvas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CanvasDef _$CanvasDefFromJson(Map<String, dynamic> json) {
  return CanvasDef(
    name: json['name'] as String,
    scalingDef: ScalingDef.fromJson(json['scalingDef'] as Map<String, dynamic>),
    hitTargetDef:
        HitTargetDef.fromJson(json['hitTargetDef'] as Map<String, dynamic>),
    layerDefList: (json['layerDefList'] as List<dynamic>)
        .map((e) => LayerDef.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CanvasDefToJson(CanvasDef instance) => <String, dynamic>{
      'name': instance.name,
      'scalingDef': instance.scalingDef.toJson(),
      'hitTargetDef': instance.hitTargetDef.toJson(),
      'layerDefList': instance.layerDefList.map((e) => e.toJson()).toList(),
    };

HitTargetDef _$HitTargetDefFromJson(Map<String, dynamic> json) {
  return HitTargetDef(
    rectDef: RectDef.fromJson(json['rectDef'] as Map<String, dynamic>),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
  );
}

Map<String, dynamic> _$HitTargetDefToJson(HitTargetDef instance) =>
    <String, dynamic>{
      'rectDef': instance.rectDef.toJson(),
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

LayerDef _$LayerDefFromJson(Map<String, dynamic> json) {
  return LayerDef(
    name: json['name'] as String,
    drawClipList: (json['drawClipList'] as List<dynamic>)
        .map((e) => DrawClipDef.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LayerDefToJson(LayerDef instance) => <String, dynamic>{
      'name': instance.name,
      'drawClipList': instance.drawClipList.map((e) => e.toJson()).toList(),
    };

DrawClipDef _$DrawClipDefFromJson(Map<String, dynamic> json) {
  return DrawClipDef(
    drawDef: json['drawDef'] == null
        ? null
        : DrawDef.fromJson(json['drawDef'] as Map<String, dynamic>),
    clipDef: json['clipDef'] == null
        ? null
        : ClipDef.fromJson(json['clipDef'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DrawClipDefToJson(DrawClipDef instance) =>
    <String, dynamic>{
      'drawDef': instance.drawDef?.toJson(),
      'clipDef': instance.clipDef?.toJson(),
    };
