
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portable_draw/definitions/common.dart';
import 'package:portable_draw/definitions/path.dart';

part 'clip.g.dart';

enum ClipType {
  Path,
  Rect,
  RRect,
}

@JsonSerializable(explicitToJson: true)
class ClipDef {

  ClipType clipType;

  ClipRectDef? clipRectDef;

  ClipRRectDef? clipRRectDef;

  ClipPathDef? clipPathDef;

  ClipDef({
    required this.clipType,
    this.clipRectDef,
    this.clipRRectDef,
    this.clipPathDef
  });

  factory ClipDef.fromJson(Map<String, dynamic> json) => _$ClipDefFromJson(json);
  Map<String, dynamic> toJson() => _$ClipDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ClipRectDef {

  RectDef rect;

  @JsonKey(defaultValue: ClipOp.intersect)
  ClipOp clipOp;

  @JsonKey(defaultValue: true)
  bool doAntiAlias;

  @JsonKey(defaultValue: BoxFit.fill)
  BoxFit boxFit;

  ClipRectDef({
    required this.rect,
    this.clipOp = ClipOp.intersect,
    this.doAntiAlias = true,
    this.boxFit = BoxFit.fill
  });

  factory ClipRectDef.fromJson(Map<String, dynamic> json) => _$ClipRectDefFromJson(json);
  Map<String, dynamic> toJson() => _$ClipRectDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ClipRRectDef {

  RectDef rect;

  double radius;

  @JsonKey(defaultValue: true)
  bool doAntiAlias;

  @JsonKey(defaultValue: BoxFit.fill)
  BoxFit boxFit;

  ClipRRectDef({
    required this.rect,
    this.radius = 0,
    this.doAntiAlias = true,
    this.boxFit = BoxFit.fill
  });

  factory ClipRRectDef.fromJson(Map<String, dynamic> json) => _$ClipRRectDefFromJson(json);
  Map<String, dynamic> toJson() => _$ClipRRectDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ClipPathDef {

  List<PathDef> pathDefList;

  @JsonKey(defaultValue: true)
  bool doAntiAlias;

  @JsonKey(defaultValue: BoxFit.fill)
  BoxFit boxFit;

  ClipPathDef({
    required this.pathDefList,
    this.doAntiAlias = true,
    this.boxFit = BoxFit.fill
  });

  factory ClipPathDef.fromJson(Map<String, dynamic> json) => _$ClipPathDefFromJson(json);
  Map<String, dynamic> toJson() => _$ClipPathDefToJson(this);
}