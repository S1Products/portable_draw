import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portable_draw/definitions/common.dart';

part 'gradient.g.dart';

enum GradientType {
  Linear,
  Radial,
}

const String GRADIENT_TYPE_LINEAR = 'Linear';
const String GRADIENT_TYPE_RADIAL = 'Radial';

@JsonSerializable(explicitToJson: true)
class GradientShader  {

  RectDef rect;
  BoxFit boxFit;

  GradientDef gradient;

  GradientShader({
    required this.gradient,
    required this.rect,
    this.boxFit = BoxFit.fill,
  });

  factory GradientShader.fromJson(Map<String, dynamic> json) => _$GradientShaderFromJson(json);
  Map<String, dynamic> toJson() => _$GradientShaderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GradientDef {

  GradientType gradientType;

  List<GradientColorDef> gradientColorList;
  TileMode tileMode;

  GradientDef({
    required this.gradientType,
    required this.gradientColorList,
    this.tileMode = TileMode.repeated
  });

  Map<String, dynamic> toJson() => _$GradientDefToJson(this);

  factory GradientDef.fromJson(Map<String, dynamic> json) {
    switch (json['gradientType'] as String) {
      case GRADIENT_TYPE_LINEAR:
        return LinearGradientDef.fromJson(json);

      case GRADIENT_TYPE_RADIAL:
        return RadialGradientDef.fromJson(json);
    }

    throw ArgumentError(
        'Could not found gradient type. Please check gradient type value from JSON.');
  }
}

@JsonSerializable(explicitToJson: true)
class LinearGradientDef extends GradientDef {

  AlignmentDef begin;
  AlignmentDef end;

  LinearGradientDef({
    required List<GradientColorDef> gradientColorList,
    TileMode tileMode = TileMode.repeated,
    required this.begin,
    required this.end,
  }): super(
    gradientType: GradientType.Linear,
    gradientColorList: gradientColorList,
    tileMode: tileMode
  );

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
class RadialGradientDef extends GradientDef {

  PointDef center;
  double radius;

  RadialGradientDef({
    required List<GradientColorDef> gradientColorList,
    TileMode tileMode = TileMode.repeated,
    required this.center,
    required this.radius,
  }): super(
      gradientType: GradientType.Radial,
      gradientColorList: gradientColorList,
      tileMode: tileMode
  );

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
