import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:portable_draw/definitions/clip.dart';
import 'package:portable_draw/definitions/common.dart';
import 'package:portable_draw/definitions/draw.dart';

part 'canvas.g.dart';

@JsonSerializable(explicitToJson: true)
class CanvasDef {

  String name;
  ScalingDef scalingDef;
  HitTargetDef hitTargetDef;
  List<LayerDef> layerDefList;

  CanvasDef({
    required this.name,
    required this.scalingDef,
    required this.hitTargetDef,
    required this.layerDefList,
  });

  factory CanvasDef.fromJson(Map<String, dynamic> json) => _$CanvasDefFromJson(json);
  Map<String, dynamic> toJson() => _$CanvasDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HitTargetDef {

  RectDef rectDef;

  @JsonKey(defaultValue: BoxFit.fill)
  BoxFit boxFit = BoxFit.fill;

  HitTargetDef({
    required this.rectDef,
    this.boxFit = BoxFit.fill
  });

  factory HitTargetDef.fromJson(Map<String, dynamic> json) => _$HitTargetDefFromJson(json);
  Map<String, dynamic> toJson() => _$HitTargetDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LayerDef {

  String name;
  List<DrawClipDef> drawClipList;

  LayerDef({
    required this.name,
    required this.drawClipList
  });

  factory LayerDef.fromJson(Map<String, dynamic> json) => _$LayerDefFromJson(json);
  Map<String, dynamic> toJson() => _$LayerDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DrawClipDef {

  DrawDef? drawDef;
  ClipDef? clipDef;

  DrawClipDef({
    required this.drawDef,
    required this.clipDef
  });

  factory DrawClipDef.fromJson(Map<String, dynamic> json) => _$DrawClipDefFromJson(json);
  Map<String, dynamic> toJson() => _$DrawClipDefToJson(this);
}
