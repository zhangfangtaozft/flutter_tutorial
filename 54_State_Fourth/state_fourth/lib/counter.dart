import 'package:flutter/material.dart';
import 'package:state_fourth/counter_controller.dart';

class Counter extends StatefulWidget {
  final CounterController controller;
  const Counter({super.key, required this.controller});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          widget.controller.count.value ++;
          widget.controller.fontSize.value ++;
        },
        child: ListenableBuilder(
          listenable: Listenable.merge([
            widget.controller.count,
            widget.controller.fontSize,
          ]),
          builder: (BuildContext context, Widget? child) {
            return Text('Count: ${widget.controller.count.value}',
                style: TextStyle(fontSize: widget.controller.fontSize.value));
          },
        ));
  }
}
