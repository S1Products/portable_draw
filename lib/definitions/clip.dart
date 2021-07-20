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

  @JsonKey(defaultValue: BoxFit.fill)
  BoxFit boxFit;

  ClipDef({
    required this.clipType,
    this.boxFit = BoxFit.fill,
  });

  Map<String, dynamic> toJson() => _$ClipDefToJson(this);

  factory ClipDef.fromJson(Map<String, dynamic> json) {
    switch (json['clipType'] as String) {
      case 'Rect':
        return ClipRectDef.fromJson(json);
      case 'RRect':
        return ClipRRectDef.fromJson(json);
      case 'Path':
        return ClipPathDef.fromJson(json);
    }

    throw ArgumentError(
        'Could not found clip type. Please check clip type value from JSON.');
  }
}

@JsonSerializable(explicitToJson: true)
class ClipRectDef extends ClipDef {
  RectDef rectDef;

  @JsonKey(defaultValue: ClipOp.intersect)
  ClipOp clipOp;

  @JsonKey(defaultValue: true)
  bool doAntiAlias;

  ClipRectDef(
      {required this.rectDef,
      this.clipOp = ClipOp.intersect,
      this.doAntiAlias = true,
      BoxFit boxFit = BoxFit.fill})
      : super(clipType: ClipType.Rect, boxFit: boxFit);

  factory ClipRectDef.fromJson(Map<String, dynamic> json) =>
      _$ClipRectDefFromJson(json);
  Map<String, dynamic> toJson() => _$ClipRectDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ClipRRectDef extends ClipDef {
  RectDef rectDef;

  double radius;

  @JsonKey(defaultValue: true)
  bool doAntiAlias;

  ClipRRectDef(
      {required this.rectDef,
      this.radius = 0,
      this.doAntiAlias = true,
      BoxFit boxFit = BoxFit.fill})
      : super(clipType: ClipType.RRect, boxFit: boxFit);

  factory ClipRRectDef.fromJson(Map<String, dynamic> json) =>
      _$ClipRRectDefFromJson(json);
  Map<String, dynamic> toJson() => _$ClipRRectDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ClipPathDef extends ClipDef {
  List<PathDef> pathDefList;

  @JsonKey(defaultValue: true)
  bool doAntiAlias;

  ClipPathDef(
      {required this.pathDefList,
      this.doAntiAlias = true,
      BoxFit boxFit = BoxFit.fill})
      : super(clipType: ClipType.Path, boxFit: boxFit);

  factory ClipPathDef.fromJson(Map<String, dynamic> json) =>
      _$ClipPathDefFromJson(json);
  Map<String, dynamic> toJson() => _$ClipPathDefToJson(this);
}
