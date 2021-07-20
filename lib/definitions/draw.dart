// Copyright 2020 Miura Acoustic
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portable_draw/definitions/common.dart';
import 'package:portable_draw/definitions/gradient.dart';
import 'package:portable_draw/definitions/path.dart';

part 'draw.g.dart';

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

  PaintDef(
      {this.color = 0,
      this.paintingStyle = PaintingStyle.fill,
      this.strokeWidth = 1,
      this.strokeCap = StrokeCap.square});

  factory PaintDef.fromJson(Map<String, dynamic> json) =>
      _$PaintDefFromJson(json);
  Map<String, dynamic> toJson() => _$PaintDefToJson(this);
}

// Draw

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

  @JsonKey(defaultValue: BoxFit.fill)
  BoxFit boxFit;

  GradientShader? gradientShader;
  MaskFilterDef? maskFilterDef;

  DrawDef(
      {required this.drawType,
      required this.paintDef,
      required this.boxFit,
      this.gradientShader,
      this.maskFilterDef});

  Map<String, dynamic> toJson() => _$DrawDefToJson(this);

  factory DrawDef.fromJson(Map<String, dynamic> json) {
    switch (json['drawType'] as String) {
      case 'Text':
        return DrawTextDef.fromJson(json);
      case 'Rect':
        return DrawRectDef.fromJson(json);
      case 'RRect':
        return DrawRrectDef.fromJson(json);
      case 'DRRect':
        return DrawDRRectDef.fromJson(json);
      case 'Arc':
        return DrawArcDef.fromJson(json);
      case 'Circle':
        return DrawCircleDef.fromJson(json);
      case 'Color':
        return DrawColorDef.fromJson(json);
      case 'Line':
        return DrawLineDef.fromJson(json);
      case 'Oval':
        return DrawOvalDef.fromJson(json);
      case 'Path':
        return DrawPathDef.fromJson(json);
    }

    throw ArgumentError(
        'Could not found draw type. Please check draw type value from JSON.');
  }
}

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
class DrawTextDef extends DrawDef {
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
  OffsetDef offsetDef;

  DrawTextDef(
      {BoxFit boxFit = BoxFit.fill,
      GradientShader? gradientShader,
      MaskFilterDef? maskFilterDef,
      required this.text,
      required this.color,
      required this.offsetDef,
      this.fontWeightType = FontWeightType.normal,
      this.fontSize = 12,
      this.fontFamily = '',
      this.fontStyle = FontStyle.normal,
      this.textAlign = TextAlign.start,
      this.textDirection = TextDirection.ltr})
      : super(
            drawType: DrawType.Text,
            paintDef: null,
            boxFit: boxFit,
            gradientShader: gradientShader,
            maskFilterDef: maskFilterDef);

  factory DrawTextDef.fromJson(Map<String, dynamic> json) =>
      _$DrawTextDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawTextDefToJson(this);

  FontWeight convertFontWeight() {
    switch (fontWeightType) {
      case FontWeightType.bold:
        return FontWeight.bold;
      case FontWeightType.normal:
        return FontWeight.normal;
      case FontWeightType.w100:
        return FontWeight.w100;
      case FontWeightType.w200:
        return FontWeight.w200;
      case FontWeightType.w300:
        return FontWeight.w300;
      case FontWeightType.w400:
        return FontWeight.w400;
      case FontWeightType.w500:
        return FontWeight.w500;
      case FontWeightType.w600:
        return FontWeight.w600;
      case FontWeightType.w700:
        return FontWeight.w700;
      case FontWeightType.w800:
        return FontWeight.w800;
      case FontWeightType.w900:
        return FontWeight.w900;
    }
  }
}

@JsonSerializable(explicitToJson: true)
class DrawArcDef extends DrawDef {
  RectDef rectDef;
  double startAngle;
  double sweepAngle;

  @JsonKey(defaultValue: false)
  bool useCenter;

  DrawArcDef(
      {required PaintDef paintDef,
      BoxFit boxFit = BoxFit.fill,
      GradientShader? gradientShader,
      MaskFilterDef? maskFilterDef,
      required this.rectDef,
      required this.startAngle,
      required this.sweepAngle,
      this.useCenter = false})
      : super(
            drawType: DrawType.Arc,
            paintDef: paintDef,
            boxFit: boxFit,
            gradientShader: gradientShader,
            maskFilterDef: maskFilterDef);

  factory DrawArcDef.fromJson(Map<String, dynamic> json) =>
      _$DrawArcDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawArcDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DrawCircleDef extends DrawDef {
  OffsetDef offsetDef;
  double radius;

  DrawCircleDef(
      {required PaintDef paintDef,
      BoxFit boxFit = BoxFit.fill,
      GradientShader? gradientShader,
      MaskFilterDef? maskFilterDef,
      required this.offsetDef,
      required this.radius})
      : super(
            drawType: DrawType.Circle,
            paintDef: paintDef,
            boxFit: boxFit,
            gradientShader: gradientShader,
            maskFilterDef: maskFilterDef);

  factory DrawCircleDef.fromJson(Map<String, dynamic> json) =>
      _$DrawCircleDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawCircleDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DrawColorDef extends DrawDef {
  int color;
  BlendMode blendMode;

  DrawColorDef(
      {required PaintDef paintDef,
      GradientShader? gradientShader,
      MaskFilterDef? maskFilterDef,
      this.color = 0,
      this.blendMode = BlendMode.src})
      : super(
            drawType: DrawType.Color,
            paintDef: paintDef,
            boxFit: BoxFit.fill,
            gradientShader: gradientShader,
            maskFilterDef: maskFilterDef);

  factory DrawColorDef.fromJson(Map<String, dynamic> json) =>
      _$DrawColorDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawColorDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DrawDRRectDef extends DrawDef {
  RectDef outerRectDef;
  double outerRadius;

  RectDef innerRectDef;
  double innerRadius;

  DrawDRRectDef(
      {required PaintDef paintDef,
      BoxFit boxFit = BoxFit.fill,
      GradientShader? gradientShader,
      MaskFilterDef? maskFilterDef,
      required this.outerRectDef,
      required this.outerRadius,
      required this.innerRectDef,
      required this.innerRadius})
      : super(
            drawType: DrawType.DRRect,
            paintDef: paintDef,
            boxFit: boxFit,
            gradientShader: gradientShader,
            maskFilterDef: maskFilterDef);

  factory DrawDRRectDef.fromJson(Map<String, dynamic> json) =>
      _$DrawDRRectDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawDRRectDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DrawLineDef extends DrawDef {
  OffsetDef offsetDef1;
  OffsetDef offsetDef2;

  DrawLineDef(
      {required PaintDef paintDef,
      BoxFit boxFit = BoxFit.fill,
      GradientShader? gradientShader,
      MaskFilterDef? maskFilterDef,
      required this.offsetDef1,
      required this.offsetDef2})
      : super(
            drawType: DrawType.Line,
            paintDef: paintDef,
            boxFit: boxFit,
            gradientShader: gradientShader,
            maskFilterDef: maskFilterDef);

  factory DrawLineDef.fromJson(Map<String, dynamic> json) =>
      _$DrawLineDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawLineDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DrawOvalDef extends DrawDef {
  RectDef rectDef;

  DrawOvalDef(
      {required PaintDef paintDef,
      BoxFit boxFit = BoxFit.fill,
      GradientShader? gradientShader,
      MaskFilterDef? maskFilterDef,
      required this.rectDef})
      : super(
            drawType: DrawType.Oval,
            paintDef: paintDef,
            boxFit: boxFit,
            gradientShader: gradientShader,
            maskFilterDef: maskFilterDef);

  factory DrawOvalDef.fromJson(Map<String, dynamic> json) =>
      _$DrawOvalDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawOvalDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DrawPathDef extends DrawDef {
  List<PathDef> pathDefList;

  DrawPathDef(
      {required PaintDef paintDef,
      BoxFit boxFit = BoxFit.fill,
      GradientShader? gradientShader,
      MaskFilterDef? maskFilterDef,
      required this.pathDefList})
      : super(
            drawType: DrawType.Path,
            paintDef: paintDef,
            boxFit: boxFit,
            gradientShader: gradientShader,
            maskFilterDef: maskFilterDef);

  factory DrawPathDef.fromJson(Map<String, dynamic> json) =>
      _$DrawPathDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawPathDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DrawRectDef extends DrawDef {
  RectDef rectDef;

  DrawRectDef(
      {required PaintDef paintDef,
      BoxFit boxFit = BoxFit.fill,
      GradientShader? gradientShader,
      MaskFilterDef? maskFilterDef,
      required this.rectDef})
      : super(
            drawType: DrawType.Rect,
            paintDef: paintDef,
            boxFit: boxFit,
            gradientShader: gradientShader,
            maskFilterDef: maskFilterDef);

  factory DrawRectDef.fromJson(Map<String, dynamic> json) =>
      _$DrawRectDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawRectDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DrawRrectDef extends DrawDef {
  RectDef rectDef;
  double radius;

  DrawRrectDef(
      {required PaintDef paintDef,
      BoxFit boxFit = BoxFit.fill,
      GradientShader? gradientShader,
      MaskFilterDef? maskFilterDef,
      required this.rectDef,
      required this.radius})
      : super(
            drawType: DrawType.RRect,
            paintDef: paintDef,
            boxFit: boxFit,
            gradientShader: gradientShader,
            maskFilterDef: maskFilterDef);

  factory DrawRrectDef.fromJson(Map<String, dynamic> json) =>
      _$DrawRrectDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawRrectDefToJson(this);
}

// Mask Filter

@JsonSerializable(explicitToJson: true)
class MaskFilterDef {
  BlurStyle blurStyle;
  double sigma;

  MaskFilterDef({this.blurStyle = BlurStyle.inner, this.sigma = 0});

  factory MaskFilterDef.fromJson(Map<String, dynamic> json) =>
      _$MaskFilterDefFromJson(json);
  Map<String, dynamic> toJson() => _$MaskFilterDefToJson(this);
}
