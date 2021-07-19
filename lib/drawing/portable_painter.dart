
import 'package:flutter/cupertino.dart';
import 'package:json_draw/definitions/canvas.dart';
import 'package:json_draw/definitions/common.dart';
import 'package:json_draw/drawings/canvas_drawer.dart';

class PortablePainter extends CustomPainter {

  final CanvasDef canvasDef;
  final Map<String, OverrideValues>? dynamicValuesMap;

  Size canvasSize = Size.zero;

  JsonPainter(this.canvasDef, this.dynamicValuesMap);

  @override
  void paint(Canvas canvas, Size size) {
    canvasSize = size;

    CanvasDrawer drawer = CanvasDrawer(canvasSize, canvasDef.scalingDef);
    drawer.drawCanvas(canvas, size, canvasDef, dynamicValuesMap);
  }

  @override
  bool hitTest(Offset position) {

    CanvasDrawer drawer = CanvasDrawer(canvasSize, canvasDef.scalingDef);
    return drawer.isInside(position, canvasDef.hitTargetDef);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) { return true; }

}