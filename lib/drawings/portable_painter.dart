
import 'package:flutter/cupertino.dart';
import 'package:portable_draw/definitions/common.dart';
import 'package:portable_draw/definitions/canvas.dart';
import 'package:portable_draw/drawings/canvas_drawer.dart';

class PortablePainter extends CustomPainter {

  final CanvasDef canvasDef;
  final Map<String, OverrideValuesMap>? dynamicValuesMap;

  Size canvasSize = Size.zero;

  PortablePainter(this.canvasDef, this.dynamicValuesMap);

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