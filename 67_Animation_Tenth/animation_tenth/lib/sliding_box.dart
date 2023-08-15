import 'package:flutter/material.dart';

class SlidingBox extends StatelessWidget {
  late AnimationController controller;
  late final Color color;
  late final Interval interval;

  SlidingBox({super.key, required this.controller, required this.color, required this.interval});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: Tween(begin: const Offset(0.0, 0.0), end: const Offset(0.1, 0))
        .chain(CurveTween(curve: interval))
            .animate(controller),
      child: Container(
        width: 300,
        height: 100,
        color: color,
      ),
    );
  }
}
