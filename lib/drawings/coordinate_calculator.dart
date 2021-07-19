
import 'package:flutter/cupertino.dart';
import 'package:portable_draw/definitions/canvas.dart';
import 'package:portable_draw/definitions/common.dart';

/// Calculate coordination with scaling.
class CoordinateCalculator {

  // Canvas size
  Size size;

  // Designed canvas size
  ScalingDef scaling;

  CoordinateCalculator(this.size, this.scaling);

  /// Check tap position is inside drawings.
  /// If you don't define HitTarget then every time return true.
  bool isInside(Offset offset, HitTargetDef hitTarget, Size size, ScalingDef scaling){

    Rect rect = calcScalingRect(hitTarget.rectDef, hitTarget.boxFit);

    if(offset.dx > rect.left && offset.dx < rect.right
        && offset.dy > rect.top && offset.dy < rect.bottom){
      return true;
    }
    return false;
  }

// Calculate Rect

  /// Calculate scaring rectangle by designed rectangle definition.
  /// Scaling is considered by BoxFit enum.
  ///
  /// BoxFit enum values are using following document:
  /// https://api.flutter.dev/flutter/painting/BoxFit-class.html
  Rect calcScalingRect(RectDef rectDef, BoxFit boxFit){

    switch(boxFit){
      case BoxFit.fill:
        return _calcScalingFillRect(rectDef);

      case BoxFit.fitWidth:
        return _calcFitWidthRect(rectDef);

      case BoxFit.fitHeight:
        return _calcFitHeightRect(rectDef);

      case BoxFit.contain:
        return _calcContainRect(rectDef);

      default:
        throw UnimplementedError('BoxFit.ScaleDown and BoxFit.cover is not implemented yet.');
    }
  }

  /// Rectangle zoom up and down for BoxFit.Fill
  Rect _calcScalingFillRect(RectDef rectDef){

    double widthRatio  = size.width / scaling.designedWidth;
    double heightRatio = size.height / scaling.designedHeight;

    return Rect.fromLTRB(
        rectDef.left * widthRatio,
        rectDef.top  * heightRatio,
        rectDef.right * widthRatio,
        rectDef.bottom * heightRatio);
  }

  /// Rectangle zoom up and down for BoxFit.FitWidth
  Rect _calcFitWidthRect(RectDef rectDef){

    double widthRatio  = size.width / scaling.designedWidth;

    double newHeight = (rectDef.bottom - rectDef.top) * widthRatio;
    double halfDiffHeight = (size.height - newHeight) / 2;

    return Rect.fromLTRB(
        rectDef.left * widthRatio,
        halfDiffHeight,
        rectDef.right * widthRatio,
        size.height - halfDiffHeight);
  }

  /// Rectangle zoom up and down for BoxFit.FitHeight
  Rect _calcFitHeightRect(RectDef rectDef){

    double heightRatio = size.height / scaling.designedHeight;

    double newWidth = (rectDef.right - rectDef.left) * heightRatio;
    double halfDiffWidth = (size.width - newWidth) / 2;

    return Rect.fromLTRB(
        halfDiffWidth,
        rectDef.top * heightRatio,
        size.width - halfDiffWidth,
        rectDef.bottom * heightRatio);
  }

  /// Rectangle zoom up and down for BoxFit.Contain
  Rect _calcContainRect(RectDef rectDef){

    if(size.height > size.width){
      return _calcFitWidthRect(rectDef);

    }else{
      return _calcFitHeightRect(rectDef);
    }
  }

// Calculate RRect

  /// Calculate scaling rrect by designed rrect value.
  RRect calcScalingRRect(RectDef rectDef, double radius, BoxFit boxFit){

    Rect rect = calcScalingRect(rectDef, boxFit);
    Radius rad = calcScalingRadius(radius, boxFit);

    return RRect.fromRectAndRadius(rect, rad);
  }

  /// Calculate scaling radius by designed radius value.
  Radius calcScalingRadius(double radius, BoxFit boxFit){

    double widthRatio  = size.width / scaling.designedWidth;
    double heightRatio = size.height / scaling.designedHeight;

    if(size.height > size.width){
      return Radius.circular(radius * widthRatio);
    }else{
      return Radius.circular(radius * heightRatio);
    }
  }

  /// Calculate scaling text size by designed text size.
  double calcScalingTextSize(double textSize){

    double widthRatio  = size.width  / scaling.designedWidth;
    double heightRatio = size.height / scaling.designedHeight;

    if(heightRatio > widthRatio){
      return textSize * widthRatio;
    }else{
      return textSize * heightRatio;
    }
  }

// Calculate Offset

  /// Calculate scaling offset by designed offset
  Offset calcScalingOffset(OffsetDef offsetDef, BoxFit boxFit){

    switch(boxFit){
      case BoxFit.fill:
        return _calcScalingFillOffset(offsetDef);

      case BoxFit.fitWidth:
        return _calcScalingFitWidthOffset(offsetDef);

      case BoxFit.fitHeight:
        return _calcScalingFitHeightOffset(offsetDef);

      case BoxFit.contain:
        return _calcScalingContainOffset(offsetDef);

      default:
        throw UnimplementedError('BoxFit.ScaleDown and BoxFit.cover is not implemented yet.');
    }
  }

  /// Offset zoom up and down for BoxFit.Fill
  Offset _calcScalingFillOffset(OffsetDef offsetDef){

    double widthRatio  = size.width / scaling.designedWidth;
    double heightRatio = size.height / scaling.designedHeight;

    return Offset(offsetDef.x * widthRatio, offsetDef.y * heightRatio);
  }

  /// Offset zoom up and down for BoxFit.FitWidth
  Offset _calcScalingFitWidthOffset(OffsetDef offsetDef){

    RectDef rectDef = RectDef(left: 0, top: 0,
        right: scaling.designedWidth, bottom: scaling.designedHeight);

    Rect newRect = calcScalingRect(rectDef, BoxFit.fitWidth);

    double widthRatio  = size.width / scaling.designedWidth;

    return Offset(offsetDef.x * widthRatio, offsetDef.y * widthRatio + newRect.top);
  }

  /// Offset zoom up and down for BoxFit.FitHeight
  Offset _calcScalingFitHeightOffset(OffsetDef offsetDef){

    RectDef rectDef = RectDef(left: 0, top: 0,
        right: scaling.designedWidth, bottom: scaling.designedHeight);

    Rect newRect = calcScalingRect(rectDef, BoxFit.fitHeight);

    double heightRatio  = size.height / scaling.designedHeight;

    return Offset(offsetDef.x * heightRatio + newRect.left, offsetDef.y * heightRatio);
  }

  /// Offset zoom up and down for BoxFit.Contain
  Offset _calcScalingContainOffset(OffsetDef offsetDef){

    if(size.height > size.width){
      return _calcScalingFitWidthOffset(offsetDef);
    }else{
      return _calcScalingFitHeightOffset(offsetDef);
    }
  }
}