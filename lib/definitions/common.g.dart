// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlignmentDef _$AlignmentDefFromJson(Map<String, dynamic> json) {
  return AlignmentDef(
    x: (json['x'] as num).toDouble(),
    y: (json['y'] as num).toDouble(),
  );
}

Map<String, dynamic> _$AlignmentDefToJson(AlignmentDef instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };

RectDef _$RectDefFromJson(Map<String, dynamic> json) {
  return RectDef(
    left: (json['left'] as num).toDouble(),
    top: (json['top'] as num).toDouble(),
    right: (json['right'] as num).toDouble(),
    bottom: (json['bottom'] as num).toDouble(),
  );
}

Map<String, dynamic> _$RectDefToJson(RectDef instance) => <String, dynamic>{
      'left': instance.left,
      'top': instance.top,
      'right': instance.right,
      'bottom': instance.bottom,
    };

OffsetDef _$OffsetDefFromJson(Map<String, dynamic> json) {
  return OffsetDef(
    x: (json['x'] as num).toDouble(),
    y: (json['y'] as num).toDouble(),
  );
}

Map<String, dynamic> _$OffsetDefToJson(OffsetDef instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };

PointDef _$PointDefFromJson(Map<String, dynamic> json) {
  return PointDef(
    x: (json['x'] as num).toDouble(),
    y: (json['y'] as num).toDouble(),
  );
}

Map<String, dynamic> _$PointDefToJson(PointDef instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };

GradientColorDef _$GradientColorDefFromJson(Map<String, dynamic> json) {
  return GradientColorDef(
    color: json['color'] as int,
    stop: (json['stop'] as num).toDouble(),
  );
}

Map<String, dynamic> _$GradientColorDefToJson(GradientColorDef instance) =>
    <String, dynamic>{
      'color': instance.color,
      'stop': instance.stop,
    };

ScalingDef _$ScalingDefFromJson(Map<String, dynamic> json) {
  return ScalingDef(
    designedWidth: (json['designedWidth'] as num).toDouble(),
    designedHeight: (json['designedHeight'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ScalingDefToJson(ScalingDef instance) =>
    <String, dynamic>{
      'designedWidth': instance.designedWidth,
      'designedHeight': instance.designedHeight,
    };
