import 'package:flutter/material.dart';

class MyDelegate extends MultiChildLayoutDelegate {
  late final double thickness;
  MyDelegate({this.thickness = 8.0});

  @override
  Size getSize(BoxConstraints constraints) {
    return const Size(300, 300);
  }
  @override
  void performLayout(Size size) {

    final sizeText = layoutChild(
        'text',
        BoxConstraints.loose(size),
    );
    final left = (size.width - sizeText.width) * 0.5;
    final top = (size.height - sizeText.height) * 0.5;

    positionChild('text', Offset(left, top));

    final sizeUnderline = layoutChild(
      'underline',
      BoxConstraints(
        minWidth: sizeText.width,
        minHeight: thickness,
        maxWidth: sizeText.width,
        maxHeight: thickness,
      ),
    );
    positionChild('underline', Offset(left, top + sizeText.height));
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}