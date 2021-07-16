// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draw.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrawDef _$DrawDefFromJson(Map<String, dynamic> json) {
  return DrawDef(
    drawType: _$enumDecode(_$DrawTypeEnumMap, json['drawType']),
    paintDef: json['paintDef'] == null
        ? null
        : PaintDef.fromJson(json['paintDef'] as Map<String, dynamic>),
    textDef: json['textDef'] == null
        ? null
        : DrawTextDef.fromJson(json['textDef'] as Map<String, dynamic>),
    arcDef: json['arcDef'] == null
        ? null
        : DrawArcDef.fromJson(json['arcDef'] as Map<String, dynamic>),
    circleDef: json['circleDef'] == null
        ? null
        : DrawCircleDef.fromJson(json['circleDef'] as Map<String, dynamic>),
    colorDef: json['colorDef'] == null
        ? null
        : DrawColorDef.fromJson(json['colorDef'] as Map<String, dynamic>),
    lineDef: json['lineDef'] == null
        ? null
        : DrawLineDef.fromJson(json['lineDef'] as Map<String, dynamic>),
    ovalDef: json['ovalDef'] == null
        ? null
        : DrawOvalDef.fromJson(json['ovalDef'] as Map<String, dynamic>),
    pathDef: json['pathDef'] == null
        ? null
        : DrawPathDef.fromJson(json['pathDef'] as Map<String, dynamic>),
    rectDef: json['rectDef'] == null
        ? null
        : DrawRectDef.fromJson(json['rectDef'] as Map<String, dynamic>),
    rrectDef: json['rrectDef'] == null
        ? null
        : DrawRrectDef.fromJson(json['rrectDef'] as Map<String, dynamic>),
    drrectDef: json['drrectDef'] == null
        ? null
        : DrawDRRectDef.fromJson(json['drrectDef'] as Map<String, dynamic>),
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
      'textDef': instance.textDef?.toJson(),
      'arcDef': instance.arcDef?.toJson(),
      'circleDef': instance.circleDef?.toJson(),
      'colorDef': instance.colorDef?.toJson(),
      'lineDef': instance.lineDef?.toJson(),
      'ovalDef': instance.ovalDef?.toJson(),
      'pathDef': instance.pathDef?.toJson(),
      'rectDef': instance.rectDef?.toJson(),
      'rrectDef': instance.rrectDef?.toJson(),
      'drrectDef': instance.drrectDef?.toJson(),
      'gradientShader': instance.gradientShader?.toJson(),
      'maskFilterDef': instance.maskFilterDef?.toJson(),
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

DrawTextDef _$DrawTextDefFromJson(Map<String, dynamic> json) {
  return DrawTextDef(
    text: json['text'] as String,
    color: json['color'] as int? ?? 0,
    offset: OffsetDef.fromJson(json['offset'] as Map<String, dynamic>),
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
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
  );
}

Map<String, dynamic> _$DrawTextDefToJson(DrawTextDef instance) =>
    <String, dynamic>{
      'text': instance.text,
      'color': instance.color,
      'fontWeightType': _$FontWeightTypeEnumMap[instance.fontWeightType],
      'fontSize': instance.fontSize,
      'fontFamily': instance.fontFamily,
      'fontStyle': _$FontStyleEnumMap[instance.fontStyle],
      'textAlign': _$TextAlignEnumMap[instance.textAlign],
      'textDirection': _$TextDirectionEnumMap[instance.textDirection],
      'offset': instance.offset.toJson(),
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
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

const _$BoxFitEnumMap = {
  BoxFit.fill: 'fill',
  BoxFit.contain: 'contain',
  BoxFit.cover: 'cover',
  BoxFit.fitWidth: 'fitWidth',
  BoxFit.fitHeight: 'fitHeight',
  BoxFit.none: 'none',
  BoxFit.scaleDown: 'scaleDown',
};

DrawArcDef _$DrawArcDefFromJson(Map<String, dynamic> json) {
  return DrawArcDef(
    rect: RectDef.fromJson(json['rect'] as Map<String, dynamic>),
    startAngle: (json['startAngle'] as num).toDouble(),
    sweepAngle: (json['sweepAngle'] as num).toDouble(),
    useCenter: json['useCenter'] as bool? ?? false,
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
  );
}

Map<String, dynamic> _$DrawArcDefToJson(DrawArcDef instance) =>
    <String, dynamic>{
      'rect': instance.rect.toJson(),
      'startAngle': instance.startAngle,
      'sweepAngle': instance.sweepAngle,
      'useCenter': instance.useCenter,
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
    };

DrawCircleDef _$DrawCircleDefFromJson(Map<String, dynamic> json) {
  return DrawCircleDef(
    offset: OffsetDef.fromJson(json['offset'] as Map<String, dynamic>),
    radius: (json['radius'] as num).toDouble(),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
  );
}

Map<String, dynamic> _$DrawCircleDefToJson(DrawCircleDef instance) =>
    <String, dynamic>{
      'offset': instance.offset.toJson(),
      'radius': instance.radius,
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
    };

DrawColorDef _$DrawColorDefFromJson(Map<String, dynamic> json) {
  return DrawColorDef(
    color: json['color'] as int,
    blendMode: _$enumDecode(_$BlendModeEnumMap, json['blendMode']),
  );
}

Map<String, dynamic> _$DrawColorDefToJson(DrawColorDef instance) =>
    <String, dynamic>{
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
    outerRect: RectDef.fromJson(json['outerRect'] as Map<String, dynamic>),
    outerRadius: (json['outerRadius'] as num).toDouble(),
    innerRect: RectDef.fromJson(json['innerRect'] as Map<String, dynamic>),
    innerRadius: (json['innerRadius'] as num).toDouble(),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
  );
}

Map<String, dynamic> _$DrawDRRectDefToJson(DrawDRRectDef instance) =>
    <String, dynamic>{
      'outerRect': instance.outerRect.toJson(),
      'outerRadius': instance.outerRadius,
      'innerRect': instance.innerRect.toJson(),
      'innerRadius': instance.innerRadius,
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
    };

DrawLineDef _$DrawLineDefFromJson(Map<String, dynamic> json) {
  return DrawLineDef(
    offset1: OffsetDef.fromJson(json['offset1'] as Map<String, dynamic>),
    offset2: OffsetDef.fromJson(json['offset2'] as Map<String, dynamic>),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
  );
}

Map<String, dynamic> _$DrawLineDefToJson(DrawLineDef instance) =>
    <String, dynamic>{
      'offset1': instance.offset1.toJson(),
      'offset2': instance.offset2.toJson(),
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
    };

DrawOvalDef _$DrawOvalDefFromJson(Map<String, dynamic> json) {
  return DrawOvalDef(
    rect: RectDef.fromJson(json['rect'] as Map<String, dynamic>),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
  );
}

Map<String, dynamic> _$DrawOvalDefToJson(DrawOvalDef instance) =>
    <String, dynamic>{
      'rect': instance.rect.toJson(),
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
    };

DrawPathDef _$DrawPathDefFromJson(Map<String, dynamic> json) {
  return DrawPathDef(
    pathDefList: (json['pathDefList'] as List<dynamic>)
        .map((e) => PathDef.fromJson(e as Map<String, dynamic>))
        .toList(),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
  );
}

Map<String, dynamic> _$DrawPathDefToJson(DrawPathDef instance) =>
    <String, dynamic>{
      'pathDefList': instance.pathDefList.map((e) => e.toJson()).toList(),
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
    };

DrawRectDef _$DrawRectDefFromJson(Map<String, dynamic> json) {
  return DrawRectDef(
    rect: RectDef.fromJson(json['rect'] as Map<String, dynamic>),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
  );
}

Map<String, dynamic> _$DrawRectDefToJson(DrawRectDef instance) =>
    <String, dynamic>{
      'rect': instance.rect.toJson(),
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
    };

DrawRrectDef _$DrawRrectDefFromJson(Map<String, dynamic> json) {
  return DrawRrectDef(
    rect: RectDef.fromJson(json['rect'] as Map<String, dynamic>),
    radius: (json['radius'] as num).toDouble(),
    boxFit:
        _$enumDecodeNullable(_$BoxFitEnumMap, json['boxFit']) ?? BoxFit.fill,
  );
}

Map<String, dynamic> _$DrawRrectDefToJson(DrawRrectDef instance) =>
    <String, dynamic>{
      'rect': instance.rect.toJson(),
      'radius': instance.radius,
      'boxFit': _$BoxFitEnumMap[instance.boxFit],
    };

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

const _$GradientTypeEnumMap = {
  GradientType.Linear: 'Linear',
  GradientType.Radial: 'Radial',
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
