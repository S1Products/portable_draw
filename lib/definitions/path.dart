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

  @JsonKey(defaultValue: BoxFit.fill)
  BoxFit boxFit;

  PathDef({required this.pathType, this.boxFit = BoxFit.fill});

  factory PathDef.fromJson(Map<String, dynamic> json) =>
      _$PathDefFromJson(json);
  Map<String, dynamic> toJson() => _$PathDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PathArcDef extends PathDef {
  RectDef oval;
  double startAngle;
  double sweepAngle;

  PathArcDef(
      {required this.oval,
      required this.startAngle,
      required this.sweepAngle,
      BoxFit boxFit = BoxFit.fill})
      : super(pathType: PathType.Arc, boxFit: boxFit);

  factory PathArcDef.fromJson(Map<String, dynamic> json) =>
      _$PathArcDefFromJson(json);
  Map<String, dynamic> toJson() => _$PathArcDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PathOvalDef extends PathDef {
  RectDef oval;

  PathOvalDef({required this.oval, BoxFit boxFit = BoxFit.fill})
      : super(pathType: PathType.Oval, boxFit: boxFit);

  factory PathOvalDef.fromJson(Map<String, dynamic> json) =>
      _$PathOvalDefFromJson(json);
  Map<String, dynamic> toJson() => _$PathOvalDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PathRectDef extends PathDef {
  RectDef rect;

  PathRectDef({required this.rect, BoxFit boxFit = BoxFit.fill})
      : super(pathType: PathType.Rect, boxFit: boxFit);

  factory PathRectDef.fromJson(Map<String, dynamic> json) =>
      _$PathRectDefFromJson(json);
  Map<String, dynamic> toJson() => _$PathRectDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PathRRectDef extends PathDef {
  RectDef rect;
  double radius;

  PathRRectDef(
      {required this.rect, required this.radius, BoxFit boxFit = BoxFit.fill})
      : super(pathType: PathType.RRect, boxFit: boxFit);

  factory PathRRectDef.fromJson(Map<String, dynamic> json) =>
      _$PathRRectDefFromJson(json);
  Map<String, dynamic> toJson() => _$PathRRectDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PathArcToDef extends PathDef {
  RectDef rect;
  double startAngle;
  double sweepAngle;
  bool forceMoveTo;

  PathArcToDef(
      {required this.rect,
      required this.startAngle,
      required this.sweepAngle,
      this.forceMoveTo = false,
      BoxFit boxFit = BoxFit.fill})
      : super(pathType: PathType.ArcTo, boxFit: boxFit);

  factory PathArcToDef.fromJson(Map<String, dynamic> json) =>
      _$PathArcToDefFromJson(json);
  Map<String, dynamic> toJson() => _$PathArcToDefToJson(this);
}
