import 'package:flutter/material.dart';
import 'package:state_fourth/counter.dart';
import 'package:state_fourth/counter_controller.dart';

class MyApp extends StatelessWidget {
  final CounterController _controller = CounterController();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('State Fourth'),
        ),
        body: Center(
          child: Counter(controller: _controller),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.clear),
          onPressed: () {
            _controller.reset();
          },
        ),
      ),
    );
  }
}
