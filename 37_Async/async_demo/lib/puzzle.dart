import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class Puzzle extends StatefulWidget {
  final Stream<int> inputStream;
  final StreamController<int> scoreStream;
  const Puzzle({super.key, required this.inputStream, required this.scoreStream});

  @override
  State<Puzzle> createState() => _PuzzleState();
}

class _PuzzleState extends State<Puzzle> with SingleTickerProviderStateMixin {
  late int a;
  late int b;
  late Color color;
  late double x;
  late AnimationController _controller;

  reset([from = 0.0]) {
    a = Random().nextInt(5) + 1;
    b = Random().nextInt(5);
    x = Random().nextDouble() * 300;
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)][200]!;
    _controller.duration =
        Duration(milliseconds: Random().nextInt(5000) + 5000);
    _controller.forward(from: from);
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    reset(Random().nextDouble());

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        reset();
        widget.scoreStream.add(-3);
      }
    });
    widget.inputStream.listen((int input) {
      if (input == a + b) {
        reset();
        widget.scoreStream.add(5);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Positioned(
          top: 700 * _controller.value - 100,
          left: x,
          child: Container(
              decoration: BoxDecoration(
                color: color.withOpacity(0.5),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Text('$a + $b', style: const TextStyle(fontSize: 24))),
        );
      },
    );
  }
}
