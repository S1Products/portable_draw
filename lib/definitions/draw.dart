// Copyright 2020 Miura Acoustic
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portable_draw/definitions/common.dart';
import 'package:portable_draw/definitions/path.dart';

part 'draw.g.dart';

enum DrawType {
  Text,
  Rect,
  RRect,
  DRRect,
  Arc,
  Circle,
  Color,
  Line,
  Oval,
  Path,
}

@JsonSerializable(explicitToJson: true)
class DrawDef {

  DrawType drawType;

  PaintDef? paintDef;

  DrawTextDef? textDef;
  DrawArcDef? arcDef;
  DrawCircleDef? circleDef;
  DrawColorDef? colorDef;
  DrawLineDef? lineDef;
  DrawOvalDef? ovalDef;
  DrawPathDef? pathDef;
  DrawRectDef? rectDef;
  DrawRrectDef? rrectDef;
  DrawDRRectDef? drrectDef;

  GradientShader? gradientShader;
  MaskFilterDef? maskFilterDef;


  DrawDef({
    required this.drawType,
    required this.paintDef,
    this.textDef,
    this.arcDef,
    this.circleDef,
    this.colorDef,
    this.lineDef,
    this.ovalDef,
    this.pathDef,
    this.rectDef,
    this.rrectDef,
    this.drrectDef,
    this.gradientShader,
    this.maskFilterDef
  });

  factory DrawDef.fromJson(Map<String, dynamic> json) => _$DrawDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawDefToJson(this);
}

// Paint

@JsonSerializable(explicitToJson: true)
class PaintDef {

  @JsonKey(defaultValue: 0)
  int color;

  @JsonKey(defaultValue: PaintingStyle.fill)
  PaintingStyle paintingStyle;

  @JsonKey(defaultValue: 1)
  double strokeWidth;

  @JsonKey()
  StrokeCap strokeCap;

  PaintDef({
    this.color = 0,
    this.paintingStyle = PaintingStyle.fill,
    this.strokeWidth = 1,
    this.strokeCap = StrokeCap.square
  });

  factory PaintDef.fromJson(Map<String, dynamic> json) => _$PaintDefFromJson(json);
  Map<String, dynamic> toJson() => _$PaintDefToJson(this);
}

// Draw settings

enum FontWeightType {
  bold,
  normal,
  w100,
  w200,
  w300,
  w400,
  w500,
  w600,
  w700,
  w800,
  w900
}

@JsonSerializable(explicitToJson: true)
class DrawTextDef {

  String text;

  @JsonKey(defaultValue: 0)
  int color;

  @JsonKey(defaultValue: FontWeightType.normal)
  FontWeightType fontWeightType;

  @JsonKey(defaultValue: 12)
  double fontSize;

  @JsonKey(defaultValue: '')
  String fontFamily;

  @JsonKey(defaultValue: FontStyle.normal)
  FontStyle fontStyle;

  @JsonKey(defaultValue: TextAlign.start)
  TextAlign textAlign;

  @JsonKey(defaultValue: TextDirection.ltr)
  TextDirection textDirection;

  @JsonKey()
  OffsetDef offset;

  @JsonKey(defaultValue: BoxFit.fill)
  BoxFit boxFit;

  DrawTextDef({
    required this.text,
    required this.color,
    required this.offset,
    this.fontWeightType = FontWeightType.normal,
    this.fontSize = 12,
    this.fontFamily = '',
    this.fontStyle = FontStyle.normal,
    this.textAlign = TextAlign.start,
    this.textDirection = TextDirection.ltr,
    this.boxFit = BoxFit.fill
  });

  factory DrawTextDef.fromJson(Map<String, dynamic> json) => _$DrawTextDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawTextDefToJson(this);

  FontWeight convertFontWeight(){

    switch (fontWeightType) {
      case FontWeightType.bold:   return FontWeight.bold;
      case FontWeightType.normal: return FontWeight.normal;
      case FontWeightType.w100:   return FontWeight.w100;
      case FontWeightType.w200:   return FontWeight.w200;
      case FontWeightType.w300:   return FontWeight.w300;
      case FontWeightType.w400:   return FontWeight.w400;
      case FontWeightType.w500:   return FontWeight.w500;
      case FontWeightType.w600:   return FontWeight.w600;
      case FontWeightType.w700:   return FontWeight.w700;
      case FontWeightType.w800:   return FontWeight.w800;
      case FontWeightType.w900:   return FontWeight.w900;
    }
  }
}

@JsonSerializable(explicitToJson: true)
class DrawArcDef {

  RectDef rect;
  double startAngle;
  double sweepAngle;

  @JsonKey(defaultValue: false)
  bool useCenter;

  @JsonKey(defaultValue: BoxFit.fill)
  BoxFit boxFit;

  DrawArcDef({
    required this.rect,
    required this.startAngle,
    required this.sweepAngle,
    this.useCenter = false,
    this.boxFit = BoxFit.fill
  });

  factory DrawArcDef.fromJson(Map<String, dynamic> json) => _$DrawArcDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawArcDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DrawCircleDef {

  OffsetDef offset;
  double radius;

  @JsonKey(defaultValue: BoxFit.fill)
  BoxFit boxFit;

  DrawCircleDef({
    required this.offset,
    required this.radius,
    this.boxFit = BoxFit.fill});

  factory DrawCircleDef.fromJson(Map<String, dynamic> json) => _$DrawCircleDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawCircleDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DrawColorDef {

  int color;
  BlendMode blendMode;

  DrawColorDef({
    this.color = 0,
    this.blendMode = BlendMode.src
  });

  factory DrawColorDef.fromJson(Map<String, dynamic> json) => _$DrawColorDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawColorDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DrawDRRectDef {

  RectDef outerRect;
  double outerRadius;

  RectDef innerRect;
  double innerRadius;

  @JsonKey(defaultValue: BoxFit.fill)
  BoxFit boxFit;

  DrawDRRectDef({
    required this.outerRect,
    required this.outerRadius,
    required this.innerRect,
    required this.innerRadius,
    this.boxFit = BoxFit.fill
  });

  factory DrawDRRectDef.fromJson(Map<String, dynamic> json) => _$DrawDRRectDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawDRRectDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DrawLineDef {

  OffsetDef offset1;
  OffsetDef offset2;

  @JsonKey(defaultValue: BoxFit.fill)
  BoxFit boxFit;

  DrawLineDef({
    required this.offset1,
    required this.offset2,
    this.boxFit = BoxFit.fill
  });

  factory DrawLineDef.fromJson(Map<String, dynamic> json) => _$DrawLineDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawLineDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DrawOvalDef {

  RectDef rect;

  @JsonKey(defaultValue: BoxFit.fill)
  BoxFit boxFit;

  DrawOvalDef({
    required this.rect,
    this.boxFit = BoxFit.fill
  });

  factory DrawOvalDef.fromJson(Map<String, dynamic> json) => _$DrawOvalDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawOvalDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DrawPathDef {

  List<PathDef> pathDefList;

  @JsonKey(defaultValue: BoxFit.fill)
  BoxFit boxFit;

  DrawPathDef({
    required this.pathDefList,
    this.boxFit = BoxFit.fill
  });

  factory DrawPathDef.fromJson(Map<String, dynamic> json) => _$DrawPathDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawPathDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DrawRectDef {

  RectDef rect;

  @JsonKey(defaultValue: BoxFit.fill)
  BoxFit boxFit;

  DrawRectDef({
    required this.rect,
    this.boxFit = BoxFit.fill
  });

  factory DrawRectDef.fromJson(Map<String, dynamic> json) => _$DrawRectDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawRectDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DrawRrectDef {

  RectDef rect;
  double  radius;

  @JsonKey(defaultValue: BoxFit.fill)
  BoxFit boxFit;

  DrawRrectDef({
    required this.rect,
    required this.radius,
    this.boxFit = BoxFit.fill
  });

  factory DrawRrectDef.fromJson(Map<String, dynamic> json) => _$DrawRrectDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawRrectDefToJson(this);
}

// Gradient setting

enum GradientType {
  Linear,
  Radial,
}

@JsonSerializable(explicitToJson: true)
class GradientShader  {

  RectDef rect;
  BoxFit boxFit;

  GradientType gradientType;

  LinearGradientDef? linearGradient;

  RadialGradientDef? radialGradient;

  GradientShader({
    required this.gradientType,
    required this.rect,
    this.boxFit = BoxFit.fill,
    this.linearGradient,
    this.radialGradient
  });

  factory GradientShader.fromJson(Map<String, dynamic> json) => _$GradientShaderFromJson(json);
  Map<String, dynamic> toJson() => _$GradientShaderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LinearGradientDef {

  AlignmentDef begin;
  AlignmentDef end;

  List<GradientColorDef> gradientColorList;

  TileMode tileMode;

  LinearGradientDef({
    required this.begin,
    required this.end,
    required this.gradientColorList,
    this.tileMode = TileMode.repeated
  });

  factory LinearGradientDef.fromJson(Map<String, dynamic> json) => _$LinearGradientDefFromJson(json);
  Map<String, dynamic> toJson() => _$LinearGradientDefToJson(this);

  LinearGradient convert(){

    List<Color> colorList = [];
    List<double> stopList = [];

    for (var grad in gradientColorList) {
      colorList.add(Color(grad.color));
      stopList.add(grad.stop);
    }

    return LinearGradient(
      colors: colorList,
      begin: begin.convert(),
      end: end.convert(),
      stops: stopList,
      tileMode: tileMode
    );
  }
}

@JsonSerializable(explicitToJson: true)
class RadialGradientDef {

  PointDef center;
  double radius;
  List<GradientColorDef> gradientColorList;

  TileMode tileMode;

  RadialGradientDef({
    required this.center,
    required this.radius,
    required this.gradientColorList,
    this.tileMode = TileMode.repeated
  });

  factory RadialGradientDef.fromJson(Map<String, dynamic> json) => _$RadialGradientDefFromJson(json);
  Map<String, dynamic> toJson() => _$RadialGradientDefToJson(this);

  RadialGradient convert(){

    List<Color> colorList = [];
    List<double> stopList = [];
    for (var grad in gradientColorList) {
      colorList.add(Color(grad.color));
      stopList.add(grad.stop);
    }

    return RadialGradient(
      colors: colorList,
    );
  }
}

// Mask Filter

@JsonSerializable(explicitToJson: true)
class MaskFilterDef {

  BlurStyle blurStyle;
  double sigma;

  MaskFilterDef({
    this.blurStyle = BlurStyle.inner,
    this.sigma = 0
  });

  factory MaskFilterDef.fromJson(Map<String, dynamic> json) => _$MaskFilterDefFromJson(json);
  Map<String, dynamic> toJson() => _$MaskFilterDefToJson(this);
}

