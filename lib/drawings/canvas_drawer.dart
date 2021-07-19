// Copyright 2020 Miura Acoustic
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:portable_draw/definitions/canvas.dart';
import 'package:portable_draw/definitions/clip.dart';
import 'package:portable_draw/definitions/common.dart';
import 'package:portable_draw/definitions/draw.dart';
import 'package:portable_draw/definitions/gradient.dart';
import 'package:portable_draw/definitions/path.dart';
import 'package:portable_draw/drawings/coordinate_calculator.dart';

/// Draw graphics for canvas class.
/// This utility is designed for CustomPainter class.
/// Use it in your CustomPainter paint method.
class CanvasDrawer {

  late CoordinateCalculator calc;

  CanvasDrawer(Size size, ScalingDef scalingDef) {
    calc = CoordinateCalculator(size, scalingDef);
  }

  /// Check tap position is inside drawings.
  /// If you don't define HitTarget then every time return true.
  bool isInside(Offset offset, HitTargetDef hitTarget){

    Rect rect = calc.calcScalingRect(hitTarget.rectDef, hitTarget.boxFit);

    if(offset.dx > rect.left && offset.dx < rect.right
      && offset.dy > rect.top && offset.dy < rect.bottom){
      return true;
    }
    return false;
  }

  /// Draw graphics by specified Canvas definition.
  /// If you want to override layer design at runtime, please use OverrideValues map.
  void drawCanvas(Canvas canvas, Size size, CanvasDef canvasDef, [Map<String, OverrideValuesMap>? overrideLayerMap]){

    drawLayers(canvas, size, canvasDef.layerDefList, canvasDef.scalingDef, overrideLayerMap);
  }

  /// Draw graphics by specified Layer definitions.
  /// If you want to draw several layers of Canvas definition, please use this method.
  void drawLayers(Canvas canvas, Size size, List<LayerDef> layerDefList,
      ScalingDef scaling, [Map<String, OverrideValuesMap>? overrideLayerMap]) {

    for (var layer in layerDefList) {
      drawLayer(canvas, size, layer, scaling, overrideLayerMap);
    }
  }

  /// Draw graphics by specified single layer definition.
  /// If you want to draw single layer of Canvas definition, please use this method.
  void drawLayer(Canvas canvas, Size size, LayerDef layer, ScalingDef scaling,
      [Map<String, OverrideValuesMap>? overrideLayerMap]) {

    if(overrideLayerMap == null){
      return ;
    }

    Map<String, Object> overrideValueMap = {};

    if(overrideLayerMap.containsKey(layer.name)){

      var overrideLayer = overrideLayerMap[layer.name];

      if(overrideLayer != null){
        overrideValueMap = overrideLayer.values;
      }
    }

    for (var drawClip in layer.drawClipList) {

      ClipDef? clipDef = drawClip.clipDef;

      if(clipDef != null){
        _clip(canvas, clipDef);
      }

      DrawDef? drawDef = drawClip.drawDef;

      if(drawDef != null){
        _draw(canvas, drawDef, overrideValueMap);
      }
    }
  }

  /// Main drawing method.
  void _draw(Canvas canvas, DrawDef drawDef, Map<String, Object>? overrideValueMap){

    switch(drawDef.drawType){
      case DrawType.Text:
        _drawText(canvas, drawDef, overrideValueMap);
        break;

      case DrawType.Arc:
        _drawArc(canvas, drawDef, overrideValueMap);
        break;

      case DrawType.Circle:
        _drawCircle(canvas, drawDef, overrideValueMap);
        break;

      case DrawType.Color:
        _drawColor(canvas, drawDef, overrideValueMap);
        break;

      case DrawType.DRRect:
        _drawDRRect(canvas, drawDef, overrideValueMap);
        break;

      case DrawType.Line:
        _drawLine(canvas, drawDef, overrideValueMap);
        break;

      case DrawType.Oval:
        _drawOval(canvas, drawDef, overrideValueMap);
        break;

      case DrawType.Path:
        _drawPath(canvas, drawDef, overrideValueMap);
        break;

      case DrawType.Rect:
        _drawRect(canvas, drawDef, overrideValueMap);
        break;

      case DrawType.RRect:
        _drawRrect(canvas, drawDef, overrideValueMap);
        break;
    }
  }

  /// Draw text object to canvas.
  void _drawText(Canvas canvas, DrawDef drawDef, Map<String, Object>? overrideValueMap){

    DrawTextDef textDef = drawDef as DrawTextDef;

    double textSize = calc.calcScalingTextSize(textDef.fontSize);

    TextSpan span = TextSpan(
        style: TextStyle(
          color: _getValue(overrideValueMap, OverrideValuesMap.ATTRIBUTE_COLOR, Color(textDef.color)),
          fontWeight: textDef.convertFontWeight(),
          fontSize: textSize,
          fontFamily: textDef.fontFamily,
          fontStyle: textDef.fontStyle,
        ),
        text: _getValue(overrideValueMap, OverrideValuesMap.ATTRIBUTE_TEXT, textDef.text),
    );

    TextPainter textPainter = TextPainter(
        text: span,
        textAlign: textDef.textAlign,
        textDirection: textDef.textDirection
    );

    Offset offset = calc.calcScalingOffset(textDef.offset, textDef.boxFit);

    textPainter.layout(
      minWidth: 0,
      maxWidth: calc.size.width - offset.dx * 2
    );

    textPainter.paint(canvas, offset);
  }

  /// Draw arc to canvas.
  void _drawArc(Canvas canvas, DrawDef drawDef, Map<String, Object>? overrideValueMap){

    DrawArcDef draw = drawDef as DrawArcDef;
    Paint? paint = _createPaint(drawDef, draw.boxFit, overrideValueMap);

    if(paint == null){
      throw ArgumentError.notNull('PaintDef is null. DrawArc needs PaintDef in json.');
    }

    RectDef rectDef = _getValue(overrideValueMap, OverrideValuesMap.ATTRIBUTE_RECT, draw.rect);
    Rect rect = calc.calcScalingRect(rectDef, draw.boxFit);
    canvas.drawArc(rect, draw.startAngle, draw.sweepAngle, draw.useCenter, paint);
  }

  /// Draw circle to canvas.
  void _drawCircle(Canvas canvas, DrawDef drawDef, Map<String, Object>? overrideValueMap){

    DrawCircleDef draw = drawDef as DrawCircleDef;
    Paint? paint = _createPaint(drawDef, draw.boxFit, overrideValueMap);

    if(paint == null){
      throw ArgumentError.notNull('PaintDef is null. DrawCircle needs PaintDef in json.');
    }

    Offset offset = calc.calcScalingOffset(draw.offset, draw.boxFit);

    canvas.drawCircle(offset, draw.radius, paint);
  }

  /// Paint color to canvas.
  void _drawColor(Canvas canvas, DrawDef drawDef, Map<String, Object>? overrideValueMap){

    DrawColorDef draw = drawDef as DrawColorDef;
    canvas.drawColor(Color(draw.color), draw.blendMode);
  }

  /// Draw double radial rectangles to canvas.
  void _drawDRRect(Canvas canvas, DrawDef drawDef, Map<String, Object>? overrideValueMap){

    DrawDRRectDef draw = drawDef as DrawDRRectDef;
    Paint? paint = _createPaint(drawDef, draw.boxFit, overrideValueMap);

    if(paint == null){
      throw ArgumentError.notNull('PaintDef is null. DrawDRRect needs PaintDef in json.');
    }

    RectDef outerRectDef = _getValue(overrideValueMap, OverrideValuesMap.ATTRIBUTE_OUTER_RECT, draw.outerRect);
    RRect outerRrect = calc.calcScalingRRect(outerRectDef, draw.outerRadius, draw.boxFit);

    RectDef innerRectDef = _getValue(overrideValueMap, OverrideValuesMap.ATTRIBUTE_INNER_RECT, draw.innerRect);
    RRect innerRrect = calc.calcScalingRRect(innerRectDef, draw.innerRadius, draw.boxFit);

    canvas.drawDRRect(outerRrect, innerRrect, paint);
  }

  /// Draw line to canvas
  void _drawLine(Canvas canvas, DrawDef drawDef, Map<String, Object>? overrideValueMap){

    DrawLineDef draw = drawDef as DrawLineDef;

    Paint? paint = _createPaint(drawDef, draw.boxFit, overrideValueMap);

    if(paint == null){
      throw ArgumentError.notNull('PaintDef is null. DrawLine needs PaintDef in json.');
    }

    Offset offset1 = calc.calcScalingOffset(draw.offset1, draw.boxFit);
    Offset offset2 = calc.calcScalingOffset(draw.offset2, draw.boxFit);

    canvas.drawLine(offset1, offset2, paint);
  }

  /// Draw oval to canvas
  void _drawOval(Canvas canvas, DrawDef drawDef, Map<String, Object>? overrideValueMap){

    DrawOvalDef draw = drawDef as DrawOvalDef;

    Paint? paint = _createPaint(drawDef, draw.boxFit, overrideValueMap);

    if(paint == null){
      throw ArgumentError.notNull('PaintDef is null. DrawOval needs PaintDef in json.');
    }

    RectDef rectDef = _getValue(overrideValueMap, OverrideValuesMap.ATTRIBUTE_RECT, draw.rect);
    Rect rect = calc.calcScalingRect(rectDef, draw.boxFit);
    canvas.drawOval(rect, paint);
  }

  /// Draw graphics by specified paths to canvas.
  void _drawPath(Canvas canvas, DrawDef drawDef, Map<String, Object>? overrideValueMap){

    DrawPathDef draw = drawDef as DrawPathDef;

    Paint? paint = _createPaint(drawDef, draw.boxFit, overrideValueMap);

    if(paint == null){
      throw ArgumentError.notNull('PaintDef is null. DrawPath needs PaintDef in json.');
    }

    Path path = Path();
    addPathList(path, draw.pathDefList);

    canvas.drawPath(path, paint);
  }

  void addPathList(Path path, List<PathDef> pathDefList){
    for (var pathDef in pathDefList) {
      addPath(path, pathDef);
    }
  }

  void addPath(Path path, PathDef source){

    switch(source.pathType){
      case PathType.Arc:
        PathArcDef pathDef = source.arcDef!;
        Rect rect = calc.calcScalingRect(pathDef.oval, source.boxFit);
        path.addArc(rect, pathDef.startAngle, pathDef.sweepAngle);
        break;

      case PathType.ArcTo:
        //TODO: Implement
        break;

      case PathType.Oval:
        PathOvalDef pathDef = source.ovalDef!;
        Rect rect = calc.calcScalingRect(pathDef.oval, source.boxFit);
        path.addOval(rect);
        break;

      case PathType.Rect:
        PathRectDef pathDef = source.rectDef!;
        Rect rect = calc.calcScalingRect(pathDef.rect, source.boxFit);
        path.addRect(rect);
        break;

      case PathType.RRect:
        PathRRectDef pathDef = source.rrectDef!;
        RRect rrect = calc.calcScalingRRect(pathDef.rect, pathDef.radius, source.boxFit);
        path.addRRect(rrect);
        break;
    }
  }

  /// Draw rectangle to canvas
  void _drawRect(Canvas canvas, DrawDef drawDef, Map<String, Object>? overrideValueMap){

    DrawRectDef draw = drawDef as DrawRectDef;

    Paint? paint = _createPaint(drawDef, draw.boxFit, overrideValueMap);

    if(paint == null){
      throw ArgumentError.notNull('PaintDef is null. DrawRect needs PaintDef in json.');
    }

    RectDef rectDef = _getValue(overrideValueMap, OverrideValuesMap.ATTRIBUTE_RECT, draw.rect);
    Rect rect = calc.calcScalingRect(rectDef, draw.boxFit);
    canvas.drawRect(rect, paint);
  }

  /// Draw radial rectangle to canvas
  void _drawRrect(Canvas canvas, DrawDef drawDef, Map<String, Object>? overrideValueMap){

    DrawRrectDef draw = drawDef as DrawRrectDef;

    Paint? paint = _createPaint(drawDef, draw.boxFit, overrideValueMap);

    if(paint == null){
      throw ArgumentError.notNull('PaintDef is null. DrawRRect needs PaintDef in json.');
    }

    RectDef rectDef = _getValue(overrideValueMap, OverrideValuesMap.ATTRIBUTE_RECT, draw.rect);
    Rect rect = calc.calcScalingRect(rectDef, draw.boxFit);
    RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(draw.radius));
    canvas.drawRRect(rrect, paint);
  }

// Clip

  void _clip(Canvas canvas, ClipDef clipDef){

    switch(clipDef.clipType){
      case ClipType.Rect:
        _clipRect(canvas, clipDef.clipRectDef!);
        break;

      case ClipType.RRect:
        _clipRRect(canvas, clipDef.clipRRectDef!);
        break;

      case ClipType.Path:
        _clipPath(canvas, clipDef.clipPathDef!);
        break;
    }
  }

  void _clipRect(Canvas canvas, ClipRectDef clipRectDef){

    Rect rect = calc.calcScalingRect(clipRectDef.rect, clipRectDef.boxFit);
    canvas.clipRect(rect, clipOp: clipRectDef.clipOp, doAntiAlias: clipRectDef.doAntiAlias);
  }

  void _clipRRect(Canvas canvas, ClipRRectDef clipRRectDef){

    RRect rrect = calc.calcScalingRRect(clipRRectDef.rect, clipRRectDef.radius, clipRRectDef.boxFit);
    canvas.clipRRect(rrect, doAntiAlias: clipRRectDef.doAntiAlias);
  }

  void _clipPath(Canvas canvas, ClipPathDef clipPathDef){

    Path path = Path();
    addPathList(path, clipPathDef.pathDefList);

    canvas.clipPath(path, doAntiAlias: clipPathDef.doAntiAlias);
  }

// Create Painter

  /// Create paint brush
  Paint? _createPaint(DrawDef drawDef, BoxFit boxFit, Map<String, Object>? overrideValueMap){

    PaintDef? paintDef = drawDef.paintDef;
    if(paintDef == null){
      return null;
    }

    Paint paint = Paint();
    paint.strokeCap = paintDef.strokeCap;
    paint.style = paintDef.paintingStyle;
    paint.style = paintDef.paintingStyle;
    paint.strokeWidth = paintDef.strokeWidth;
    paint.shader = _createShader(drawDef.gradientShader, boxFit);
    paint.maskFilter = _createMaskFilter(drawDef, boxFit);

    paint.color = _getValue(overrideValueMap, OverrideValuesMap.ATTRIBUTE_COLOR, Color(paintDef.color));

    return paint;
  }

// Create Shader

  /// Create gradient shader
  Shader? _createShader(GradientShader? gradientShader, BoxFit boxFit){

    if(gradientShader == null){
      return null;
    }

    Rect rect = calc.calcScalingRect(gradientShader.rect, boxFit);

    if(gradientShader.gradient.gradientType == GradientType.Radial){

      RadialGradientDef gradDef = gradientShader.gradient as RadialGradientDef;
      return gradDef.convert().createShader(rect);

    }else{
      LinearGradientDef gradDef = gradientShader.gradient as LinearGradientDef;
      return gradDef.convert().createShader(rect);
    }
  }

  /// Create Mask filter (for blur effect)
  MaskFilter? _createMaskFilter(DrawDef drawDef, BoxFit boxFit){

    MaskFilterDef? mask = drawDef.maskFilterDef;

    if(mask == null){
      return null;
    }

    double widthRatio  = calc.size.width / calc.scaling.designedWidth;
    double heightRatio = calc.size.height / calc.scaling.designedHeight;

    if(widthRatio > heightRatio){
      return MaskFilter.blur(mask.blurStyle, mask.sigma * widthRatio);
    }else{
      return MaskFilter.blur(mask.blurStyle, mask.sigma * heightRatio);
    }
  }

// Utility methods

  /// Get override value from override value map.
  dynamic _getValue<T>(Map<String, dynamic>? overrideValueMap, String attribute, T defaultValue){

    if(overrideValueMap == null){
      return defaultValue;
    }

    T? value = overrideValueMap[attribute];
    if(value == null){

      if(defaultValue != null){
        return defaultValue;
      }else{
        return null;
      }

    }else{
      return value;
    }
  }
}