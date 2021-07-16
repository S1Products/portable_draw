import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portable_draw/definitions/common.dart';

part 'gradient.g.dart';

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
