// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draw.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaintDef _$PaintDefFromJson(Map<String, dynamic> json) {
  return PaintDef(
    color: json['color'] as int? ?? 0,
    paintingStyle:
        _$enumDecodeNullable(_$PaintingStyleEnumMap, json['paintingStyle']) ??
            PaintingStyle.fill,
    strokeWidth: (json['strokeWidth'] as num?)?.toDouble() ?? 1,
    strokeCap: _$enumDecode(_$StrokeCapEnumMap, json['strokeCap']),
  );
}

Map<String, dynamic> _$PaintDefToJson(PaintDef instance) => <String, dynamic>{
      'color': instance.color,
      'paintingStyle': _$PaintingStyleEnumMap[instance.paintingStyle],
      'strokeWidth': instance.strokeWidth,
      'strokeCap': _$StrokeCapEnumMap[instance.strokeCap],
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

const _$PaintingStyleEnumMap = {
  PaintingStyle.fill: 'fill',
  PaintingStyle.stroke: 'stroke',
};

const _$StrokeCapEnumMap = {
  StrokeCap.butt: 'butt',
  StrokeCap.round: 'round',
  StrokeCap.square: 'square',
};

DrawDef _$DrawDefFromJson(Map<String, dynamic> json) {
  return DrawDef(
    drawType: _$enumDecode(_$DrawTypeEnumMap, json['drawType']),
    paintDef: json['paintDef'] == null
        ? null
        : PaintDef.fromJson(json['paintDef'] as Map<String, dynamic>),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
    gradientShader: json['gradientShader'] == null
        ? null
        : GradientShader.fromJson(
            json['gradientShader'] as Map<String, dynamic>),
    maskFilterDef: json['maskFilterDef'] == null
        ? null
        : MaskFilterDef.fromJson(json['maskFilterDef'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DrawDefToJson(DrawDef instance) => <String, dynamic>{
      'drawType': _$DrawTypeEnumMap[instance.drawType],
      'paintDef': instance.paintDef?.toJson(),
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
      'gradientShader': instance.gradientShader?.toJson(),
      'maskFilterDef': instance.maskFilterDef?.toJson(),
    };

const _$DrawTypeEnumMap = {
  DrawType.Text: 'Text',
  DrawType.Rect: 'Rect',
  DrawType.RRect: 'RRect',
  DrawType.DRRect: 'DRRect',
  DrawType.Arc: 'Arc',
  DrawType.Circle: 'Circle',
  DrawType.Color: 'Color',
  DrawType.Line: 'Line',
  DrawType.Oval: 'Oval',
  DrawType.Path: 'Path',
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

DrawTextDef _$DrawTextDefFromJson(Map<String, dynamic> json) {
  return DrawTextDef(
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
    gradientShader: json['gradientShader'] == null
        ? null
        : GradientShader.fromJson(
            json['gradientShader'] as Map<String, dynamic>),
    maskFilterDef: json['maskFilterDef'] == null
        ? null
        : MaskFilterDef.fromJson(json['maskFilterDef'] as Map<String, dynamic>),
    text: json['text'] as String,
    color: json['color'] as int? ?? 0,
    offsetDef: OffsetDef.fromJson(json['offsetDef'] as Map<String, dynamic>),
    fontWeightType:
        _$enumDecodeNullable(_$FontWeightTypeEnumMap, json['fontWeightType']) ??
            FontWeightType.normal,
    fontSize: (json['fontSize'] as num?)?.toDouble() ?? 12,
    fontFamily: json['fontFamily'] as String? ?? '',
    fontStyle: _$enumDecodeNullable(_$FontStyleEnumMap, json['fontStyle']) ??
        FontStyle.normal,
    textAlign: _$enumDecodeNullable(_$TextAlignEnumMap, json['textAlign']) ??
        TextAlign.start,
    textDirection:
        _$enumDecodeNullable(_$TextDirectionEnumMap, json['textDirection']) ??
            TextDirection.ltr,
  )
    ..drawType = _$enumDecode(_$DrawTypeEnumMap, json['drawType'])
    ..paintDef = json['paintDef'] == null
        ? null
        : PaintDef.fromJson(json['paintDef'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DrawTextDefToJson(DrawTextDef instance) =>
    <String, dynamic>{
      'drawType': _$DrawTypeEnumMap[instance.drawType],
      'paintDef': instance.paintDef?.toJson(),
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
      'gradientShader': instance.gradientShader?.toJson(),
      'maskFilterDef': instance.maskFilterDef?.toJson(),
      'text': instance.text,
      'color': instance.color,
      'fontWeightType': _$FontWeightTypeEnumMap[instance.fontWeightType],
      'fontSize': instance.fontSize,
      'fontFamily': instance.fontFamily,
      'fontStyle': _$FontStyleEnumMap[instance.fontStyle],
      'textAlign': _$TextAlignEnumMap[instance.textAlign],
      'textDirection': _$TextDirectionEnumMap[instance.textDirection],
      'offsetDef': instance.offsetDef.toJson(),
    };

const _$FontWeightTypeEnumMap = {
  FontWeightType.bold: 'bold',
  FontWeightType.normal: 'normal',
  FontWeightType.w100: 'w100',
  FontWeightType.w200: 'w200',
  FontWeightType.w300: 'w300',
  FontWeightType.w400: 'w400',
  FontWeightType.w500: 'w500',
  FontWeightType.w600: 'w600',
  FontWeightType.w700: 'w700',
  FontWeightType.w800: 'w800',
  FontWeightType.w900: 'w900',
};

const _$FontStyleEnumMap = {
  FontStyle.normal: 'normal',
  FontStyle.italic: 'italic',
};

const _$TextAlignEnumMap = {
  TextAlign.left: 'left',
  TextAlign.right: 'right',
  TextAlign.center: 'center',
  TextAlign.justify: 'justify',
  TextAlign.start: 'start',
  TextAlign.end: 'end',
};

const _$TextDirectionEnumMap = {
  TextDirection.rtl: 'rtl',
  TextDirection.ltr: 'ltr',
};

DrawArcDef _$DrawArcDefFromJson(Map<String, dynamic> json) {
  return DrawArcDef(
    paintDef: PaintDef.fromJson(json['paintDef'] as Map<String, dynamic>),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
    gradientShader: json['gradientShader'] == null
        ? null
        : GradientShader.fromJson(
            json['gradientShader'] as Map<String, dynamic>),
    maskFilterDef: json['maskFilterDef'] == null
        ? null
        : MaskFilterDef.fromJson(json['maskFilterDef'] as Map<String, dynamic>),
    rectDef: RectDef.fromJson(json['rectDef'] as Map<String, dynamic>),
    startAngle: (json['startAngle'] as num).toDouble(),
    sweepAngle: (json['sweepAngle'] as num).toDouble(),
    useCenter: json['useCenter'] as bool? ?? false,
  )..drawType = _$enumDecode(_$DrawTypeEnumMap, json['drawType']);
}

Map<String, dynamic> _$DrawArcDefToJson(DrawArcDef instance) =>
    <String, dynamic>{
      'drawType': _$DrawTypeEnumMap[instance.drawType],
      'paintDef': instance.paintDef?.toJson(),
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
      'gradientShader': instance.gradientShader?.toJson(),
      'maskFilterDef': instance.maskFilterDef?.toJson(),
      'rectDef': instance.rectDef.toJson(),
      'startAngle': instance.startAngle,
      'sweepAngle': instance.sweepAngle,
      'useCenter': instance.useCenter,
    };

DrawCircleDef _$DrawCircleDefFromJson(Map<String, dynamic> json) {
  return DrawCircleDef(
    paintDef: PaintDef.fromJson(json['paintDef'] as Map<String, dynamic>),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
    gradientShader: json['gradientShader'] == null
        ? null
        : GradientShader.fromJson(
            json['gradientShader'] as Map<String, dynamic>),
    maskFilterDef: json['maskFilterDef'] == null
        ? null
        : MaskFilterDef.fromJson(json['maskFilterDef'] as Map<String, dynamic>),
    offsetDef: OffsetDef.fromJson(json['offsetDef'] as Map<String, dynamic>),
    radius: (json['radius'] as num).toDouble(),
  )..drawType = _$enumDecode(_$DrawTypeEnumMap, json['drawType']);
}

Map<String, dynamic> _$DrawCircleDefToJson(DrawCircleDef instance) =>
    <String, dynamic>{
      'drawType': _$DrawTypeEnumMap[instance.drawType],
      'paintDef': instance.paintDef?.toJson(),
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
      'gradientShader': instance.gradientShader?.toJson(),
      'maskFilterDef': instance.maskFilterDef?.toJson(),
      'offsetDef': instance.offsetDef.toJson(),
      'radius': instance.radius,
    };

DrawColorDef _$DrawColorDefFromJson(Map<String, dynamic> json) {
  return DrawColorDef(
    paintDef: PaintDef.fromJson(json['paintDef'] as Map<String, dynamic>),
    gradientShader: json['gradientShader'] == null
        ? null
        : GradientShader.fromJson(
            json['gradientShader'] as Map<String, dynamic>),
    maskFilterDef: json['maskFilterDef'] == null
        ? null
        : MaskFilterDef.fromJson(json['maskFilterDef'] as Map<String, dynamic>),
    color: json['color'] as int,
    blendMode: _$enumDecode(_$BlendModeEnumMap, json['blendMode']),
  )
    ..drawType = _$enumDecode(_$DrawTypeEnumMap, json['drawType'])
    ..boxFit =
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill;
}

Map<String, dynamic> _$DrawColorDefToJson(DrawColorDef instance) =>
    <String, dynamic>{
      'drawType': _$DrawTypeEnumMap[instance.drawType],
      'paintDef': instance.paintDef?.toJson(),
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
      'gradientShader': instance.gradientShader?.toJson(),
      'maskFilterDef': instance.maskFilterDef?.toJson(),
      'color': instance.color,
      'blendMode': _$BlendModeEnumMap[instance.blendMode],
    };

const _$BlendModeEnumMap = {
  BlendMode.clear: 'clear',
  BlendMode.src: 'src',
  BlendMode.dst: 'dst',
  BlendMode.srcOver: 'srcOver',
  BlendMode.dstOver: 'dstOver',
  BlendMode.srcIn: 'srcIn',
  BlendMode.dstIn: 'dstIn',
  BlendMode.srcOut: 'srcOut',
  BlendMode.dstOut: 'dstOut',
  BlendMode.srcATop: 'srcATop',
  BlendMode.dstATop: 'dstATop',
  BlendMode.xor: 'xor',
  BlendMode.plus: 'plus',
  BlendMode.modulate: 'modulate',
  BlendMode.screen: 'screen',
  BlendMode.overlay: 'overlay',
  BlendMode.darken: 'darken',
  BlendMode.lighten: 'lighten',
  BlendMode.colorDodge: 'colorDodge',
  BlendMode.colorBurn: 'colorBurn',
  BlendMode.hardLight: 'hardLight',
  BlendMode.softLight: 'softLight',
  BlendMode.difference: 'difference',
  BlendMode.exclusion: 'exclusion',
  BlendMode.multiply: 'multiply',
  BlendMode.hue: 'hue',
  BlendMode.saturation: 'saturation',
  BlendMode.color: 'color',
  BlendMode.luminosity: 'luminosity',
};

DrawDRRectDef _$DrawDRRectDefFromJson(Map<String, dynamic> json) {
  return DrawDRRectDef(
    paintDef: PaintDef.fromJson(json['paintDef'] as Map<String, dynamic>),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
    gradientShader: json['gradientShader'] == null
        ? null
        : GradientShader.fromJson(
            json['gradientShader'] as Map<String, dynamic>),
    maskFilterDef: json['maskFilterDef'] == null
        ? null
        : MaskFilterDef.fromJson(json['maskFilterDef'] as Map<String, dynamic>),
    outerRectDef:
        RectDef.fromJson(json['outerRectDef'] as Map<String, dynamic>),
    outerRadius: (json['outerRadius'] as num).toDouble(),
    innerRectDef:
        RectDef.fromJson(json['innerRectDef'] as Map<String, dynamic>),
    innerRadius: (json['innerRadius'] as num).toDouble(),
  )..drawType = _$enumDecode(_$DrawTypeEnumMap, json['drawType']);
}

Map<String, dynamic> _$DrawDRRectDefToJson(DrawDRRectDef instance) =>
    <String, dynamic>{
      'drawType': _$DrawTypeEnumMap[instance.drawType],
      'paintDef': instance.paintDef?.toJson(),
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
      'gradientShader': instance.gradientShader?.toJson(),
      'maskFilterDef': instance.maskFilterDef?.toJson(),
      'outerRectDef': instance.outerRectDef.toJson(),
      'outerRadius': instance.outerRadius,
      'innerRectDef': instance.innerRectDef.toJson(),
      'innerRadius': instance.innerRadius,
    };

DrawLineDef _$DrawLineDefFromJson(Map<String, dynamic> json) {
  return DrawLineDef(
    paintDef: PaintDef.fromJson(json['paintDef'] as Map<String, dynamic>),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
    gradientShader: json['gradientShader'] == null
        ? null
        : GradientShader.fromJson(
            json['gradientShader'] as Map<String, dynamic>),
    maskFilterDef: json['maskFilterDef'] == null
        ? null
        : MaskFilterDef.fromJson(json['maskFilterDef'] as Map<String, dynamic>),
    offsetDef1: OffsetDef.fromJson(json['offsetDef1'] as Map<String, dynamic>),
    offsetDef2: OffsetDef.fromJson(json['offsetDef2'] as Map<String, dynamic>),
  )..drawType = _$enumDecode(_$DrawTypeEnumMap, json['drawType']);
}

Map<String, dynamic> _$DrawLineDefToJson(DrawLineDef instance) =>
    <String, dynamic>{
      'drawType': _$DrawTypeEnumMap[instance.drawType],
      'paintDef': instance.paintDef?.toJson(),
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
      'gradientShader': instance.gradientShader?.toJson(),
      'maskFilterDef': instance.maskFilterDef?.toJson(),
      'offsetDef1': instance.offsetDef1.toJson(),
      'offsetDef2': instance.offsetDef2.toJson(),
    };

DrawOvalDef _$DrawOvalDefFromJson(Map<String, dynamic> json) {
  return DrawOvalDef(
    paintDef: PaintDef.fromJson(json['paintDef'] as Map<String, dynamic>),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
    gradientShader: json['gradientShader'] == null
        ? null
        : GradientShader.fromJson(
            json['gradientShader'] as Map<String, dynamic>),
    maskFilterDef: json['maskFilterDef'] == null
        ? null
        : MaskFilterDef.fromJson(json['maskFilterDef'] as Map<String, dynamic>),
    rectDef: RectDef.fromJson(json['rectDef'] as Map<String, dynamic>),
  )..drawType = _$enumDecode(_$DrawTypeEnumMap, json['drawType']);
}

Map<String, dynamic> _$DrawOvalDefToJson(DrawOvalDef instance) =>
    <String, dynamic>{
      'drawType': _$DrawTypeEnumMap[instance.drawType],
      'paintDef': instance.paintDef?.toJson(),
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
      'gradientShader': instance.gradientShader?.toJson(),
      'maskFilterDef': instance.maskFilterDef?.toJson(),
      'rectDef': instance.rectDef.toJson(),
    };

DrawPathDef _$DrawPathDefFromJson(Map<String, dynamic> json) {
  return DrawPathDef(
    paintDef: PaintDef.fromJson(json['paintDef'] as Map<String, dynamic>),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
    gradientShader: json['gradientShader'] == null
        ? null
        : GradientShader.fromJson(
            json['gradientShader'] as Map<String, dynamic>),
    maskFilterDef: json['maskFilterDef'] == null
        ? null
        : MaskFilterDef.fromJson(json['maskFilterDef'] as Map<String, dynamic>),
    pathDefList: (json['pathDefList'] as List<dynamic>)
        .map((e) => PathDef.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..drawType = _$enumDecode(_$DrawTypeEnumMap, json['drawType']);
}

Map<String, dynamic> _$DrawPathDefToJson(DrawPathDef instance) =>
    <String, dynamic>{
      'drawType': _$DrawTypeEnumMap[instance.drawType],
      'paintDef': instance.paintDef?.toJson(),
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
      'gradientShader': instance.gradientShader?.toJson(),
      'maskFilterDef': instance.maskFilterDef?.toJson(),
      'pathDefList': instance.pathDefList.map((e) => e.toJson()).toList(),
    };

DrawRectDef _$DrawRectDefFromJson(Map<String, dynamic> json) {
  return DrawRectDef(
    paintDef: PaintDef.fromJson(json['paintDef'] as Map<String, dynamic>),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
    gradientShader: json['gradientShader'] == null
        ? null
        : GradientShader.fromJson(
            json['gradientShader'] as Map<String, dynamic>),
    maskFilterDef: json['maskFilterDef'] == null
        ? null
        : MaskFilterDef.fromJson(json['maskFilterDef'] as Map<String, dynamic>),
    rectDef: RectDef.fromJson(json['rectDef'] as Map<String, dynamic>),
  )..drawType = _$enumDecode(_$DrawTypeEnumMap, json['drawType']);
}

Map<String, dynamic> _$DrawRectDefToJson(DrawRectDef instance) =>
    <String, dynamic>{
      'drawType': _$DrawTypeEnumMap[instance.drawType],
      'paintDef': instance.paintDef?.toJson(),
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
      'gradientShader': instance.gradientShader?.toJson(),
      'maskFilterDef': instance.maskFilterDef?.toJson(),
      'rectDef': instance.rectDef.toJson(),
    };

DrawRrectDef _$DrawRrectDefFromJson(Map<String, dynamic> json) {
  return DrawRrectDef(
    paintDef: PaintDef.fromJson(json['paintDef'] as Map<String, dynamic>),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
    gradientShader: json['gradientShader'] == null
        ? null
        : GradientShader.fromJson(
            json['gradientShader'] as Map<String, dynamic>),
    maskFilterDef: json['maskFilterDef'] == null
        ? null
        : MaskFilterDef.fromJson(json['maskFilterDef'] as Map<String, dynamic>),
    rectDef: RectDef.fromJson(json['rectDef'] as Map<String, dynamic>),
    radius: (json['radius'] as num).toDouble(),
  )..drawType = _$enumDecode(_$DrawTypeEnumMap, json['drawType']);
}

Map<String, dynamic> _$DrawRrectDefToJson(DrawRrectDef instance) =>
    <String, dynamic>{
      'drawType': _$DrawTypeEnumMap[instance.drawType],
      'paintDef': instance.paintDef?.toJson(),
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
      'gradientShader': instance.gradientShader?.toJson(),
      'maskFilterDef': instance.maskFilterDef?.toJson(),
      'rectDef': instance.rectDef.toJson(),
      'radius': instance.radius,
    };

MaskFilterDef _$MaskFilterDefFromJson(Map<String, dynamic> json) {
  return MaskFilterDef(
    blurStyle: _$enumDecode(_$BlurStyleEnumMap, json['blurStyle']),
    sigma: (json['sigma'] as num).toDouble(),
  );
}

Map<String, dynamic> _$MaskFilterDefToJson(MaskFilterDef instance) =>
    <String, dynamic>{
      'blurStyle': _$BlurStyleEnumMap[instance.blurStyle],
      'sigma': instance.sigma,
    };

const _$BlurStyleEnumMap = {
  BlurStyle.normal: 'normal',
  BlurStyle.solid: 'solid',
  BlurStyle.outer: 'outer',
  BlurStyle.inner: 'inner',
};
