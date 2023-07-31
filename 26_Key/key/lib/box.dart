import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  static const width = 250.0;
  static const height = 50.0;
  static const margin = 2.0;

  final Color color;
  final double x, y;
  final Function(Color color) onDrag;
  final Function() onEnd;

   Box({
      required this.color,
      required this.x,
      required this.y,
      required this.onDrag,
      required this.onEnd})
      : super(key: ValueKey(color));

  @override
  Widget build(BuildContext context) {
    final container = Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.all(8.0),
      width: width - margin * 2,
      height: height - margin * 2,
    );

    return AnimatedPositioned(
      top: y,
      left: x,
      duration: const Duration(milliseconds: 250),
      child: Draggable(
        onDragStarted: () => onDrag(color),
        feedback: container,
        childWhenDragging: Visibility(
          visible: false,
          child: container,
        ),
        onDragEnd: (_) => onEnd(),
        child: container,
      ),
    );
  }
}
