import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common.g.dart';

@JsonSerializable(explicitToJson: true)
class AlignmentDef {
  double x;
  double y;

  AlignmentDef({this.x = 0, this.y = 0});

  factory AlignmentDef.fromJson(Map<String, dynamic> json) =>
      _$AlignmentDefFromJson(json);
  Map<String, dynamic> toJson() => _$AlignmentDefToJson(this);

  static AlignmentDef topLeft() {
    return AlignmentDef(x: -1.0, y: -1.0);
  }

  static AlignmentDef topCenter() {
    return AlignmentDef(x: 0, y: -1.0);
  }

  static AlignmentDef topRight() {
    return AlignmentDef(x: 1.0, y: -1.0);
  }

  static AlignmentDef centerLeft() {
    return AlignmentDef(x: -1.0, y: 0);
  }

  static AlignmentDef center() {
    return AlignmentDef(x: 0, y: 0);
  }

  static AlignmentDef centerRight() {
    return AlignmentDef(x: 1.0, y: 0);
  }

  static AlignmentDef bottomLeft() {
    return AlignmentDef(x: -1.0, y: 1.0);
  }

  static AlignmentDef bottomCenter() {
    return AlignmentDef(x: 0, y: 1.0);
  }

  static AlignmentDef bottomRight() {
    return AlignmentDef(x: 1.0, y: 1.0);
  }

  Alignment convert() {
    return Alignment(x, y);
  }
}

@JsonSerializable(explicitToJson: true)
class RectDef {
  double left;
  double top;
  double right;
  double bottom;

  RectDef({this.left = 0, this.top = 0, this.right = 0, this.bottom = 0});

  factory RectDef.fromJson(Map<String, dynamic> json) =>
      _$RectDefFromJson(json);
  Map<String, dynamic> toJson() => _$RectDefToJson(this);

  Rect convert() {
    return Rect.fromLTRB(left, top, right, bottom);
  }
}

@JsonSerializable(explicitToJson: true)
class OffsetDef {
  double x;
  double y;

  OffsetDef({this.x = 0, this.y = 0});

  factory OffsetDef.fromJson(Map<String, dynamic> json) =>
      _$OffsetDefFromJson(json);
  Map<String, dynamic> toJson() => _$OffsetDefToJson(this);

  Offset convert() {
    return Offset(x, y);
  }
}

@JsonSerializable(explicitToJson: true)
class PointDef {
  double x;
  double y;

  PointDef({this.x = 0, this.y = 0});

  factory PointDef.fromJson(Map<String, dynamic> json) =>
      _$PointDefFromJson(json);
  Map<String, dynamic> toJson() => _$PointDefToJson(this);

  Point convert() {
    return Point(x, y);
  }
}

@JsonSerializable(explicitToJson: true)
class GradientColorDef {
  int color;
  double stop;

  GradientColorDef({this.color = 0, this.stop = 0});

  factory GradientColorDef.fromJson(Map<String, dynamic> json) =>
      _$GradientColorDefFromJson(json);
  Map<String, dynamic> toJson() => _$GradientColorDefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ScalingDef {
  double designedWidth;
  double designedHeight;

  ScalingDef({this.designedWidth = 0, this.designedHeight = 0});

  factory ScalingDef.fromJson(Map<String, dynamic> json) =>
      _$ScalingDefFromJson(json);
  Map<String, dynamic> toJson() => _$ScalingDefToJson(this);
}

/// Store override data for drawing JSON file.
class OverrideValuesMap {
  static const ATTRIBUTE_TEXT = 'text';
  static const ATTRIBUTE_TEXT_SIZE = 'textSize';
  static const ATTRIBUTE_COLOR = 'color';
  static const ATTRIBUTE_RECT = 'rect';
  static const ATTRIBUTE_OUTER_RECT = 'outerRect';
  static const ATTRIBUTE_INNER_RECT = 'innerRect';
  static const ATTRIBUTE_OFFSET = 'offset';
  static const ATTRIBUTE_TEXT_ALIGN = 'textAlign';

  Map<String, Object> values = new Map();

  OverrideValuesMap();
}
