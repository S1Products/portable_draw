
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portable_draw/definitions/common.dart';

part 'path.g.dart';

enum PathType {
  Arc,
  Oval,
  Rect,
  RRect,
  ArcTo,
}

@JsonSerializable(explicitToJson: true)
class PathDef {

  PathType pathType;

  PathArcDef? arcDef;
  PathOvalDef? ovalDef;
  PathRectDef? rectDef;
  PathRRectDef? rrectDef;
  PathArcToDef? arcToDef;

  @JsonKey(defaultValue: BoxFit.fill)
  BoxFit boxFit;

  PathDef({
    required this.pathType,
    this.arcDef,
    this.ovalDef,
    this.rectDef,
    this.rrectDef,
    this.arcToDef,
    this.boxFit = BoxFit.fill});

  factory PathDef.fromJson(Map<String, dynamic> json) => _$PathDefFromJson(json);
  Map<String, dynamic> toJson() => _$PathDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PathArcDef {

  RectDef oval;
  double startAngle;
  double sweepAngle;

  PathArcDef({
    required this.oval,
    required this.startAngle,
    required this.sweepAngle,
  });

  factory PathArcDef.fromJson(Map<String, dynamic> json) => _$PathArcDefFromJson(json);
  Map<String, dynamic> toJson() => _$PathArcDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PathOvalDef {

  RectDef oval;

  PathOvalDef({
    required this.oval
  });

  factory PathOvalDef.fromJson(Map<String, dynamic> json) => _$PathOvalDefFromJson(json);
  Map<String, dynamic> toJson() => _$PathOvalDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PathRectDef {

  RectDef rect;

  PathRectDef({
    required this.rect
  });

  factory PathRectDef.fromJson(Map<String, dynamic> json) => _$PathRectDefFromJson(json);
  Map<String, dynamic> toJson() => _$PathRectDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PathRRectDef {

  RectDef rect;
  double radius;

  PathRRectDef({
    required this.rect,
    required this.radius
  });

  factory PathRRectDef.fromJson(Map<String, dynamic> json) => _$PathRRectDefFromJson(json);
  Map<String, dynamic> toJson() => _$PathRRectDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PathArcToDef {

  RectDef rect;
  double startAngle;
  double sweepAngle;
  bool forceMoveTo;

  PathArcToDef({
    required this.rect,
    required this.startAngle,
    required this.sweepAngle,
    this.forceMoveTo = false});

  factory PathArcToDef.fromJson(Map<String, dynamic> json) => _$PathArcToDefFromJson(json);
  Map<String, dynamic> toJson() => _$PathArcToDefToJson(this);
}