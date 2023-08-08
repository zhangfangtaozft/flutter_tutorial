import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class ShadowBox extends SingleChildRenderObjectWidget {
  final double distance;
  const ShadowBox({super.key, required Widget child, required this.distance}) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderShadowBox(distance: distance);
  }

  @override
  void updateRenderObject(BuildContext context, covariant RenderShadowBox renderObject) {
    renderObject.distance = distance;
  }
}

class RenderShadowBox extends RenderProxyBox with DebugOverflowIndicatorMixin {
  double distance;
  RenderShadowBox({required this.distance});

  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(child!, offset);
    context.pushOpacity(offset, 127, (context, offset) {
      context.paintChild(child!, offset + Offset(distance, distance));
    });
    
    paintOverflowIndicator(
        context,
        offset,
        offset & size,
        offset & child!.size,
        // Rect.fromLTWH(0, 0, size.width, size.height),
        // const Rect.fromLTWH(0, 0, 320, 300),
    );
  }
}
// class RenderShadowBox extends RenderBox with RenderObjectWithChildMixin {
//   late  double distance;
//   RenderShadowBox({required this.distance});
//
// @override
//   void performLayout() {
//     child?.layout(constraints, parentUsesSize: true);
//     size = (child as RenderBox).size; // relayout boundary
//   }
//
//   @override
//   void paint(PaintingContext context, Offset offset) {
//     context.paintChild(child!, offset);
//     context.pushOpacity(offset, 127, (context, offset) {
//       context.paintChild(child!, offset + Offset(distance, distance));
//     });
//   }
// }