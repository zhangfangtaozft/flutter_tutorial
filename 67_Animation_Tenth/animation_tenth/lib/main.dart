import 'package:animation_tenth/sliding_box.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 4), vsync: this)
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Tenth'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlidingBox(controller: _controller, color: Colors.blue[100]!, interval: const Interval(0.0, 0.2),),
            SlidingBox(controller: _controller, color: Colors.blue[300]!, interval: const Interval(0.2, 0.4),),
            SlidingBox(controller: _controller, color: Colors.blue[500]!, interval: const Interval(0.4, 0.6),),
            SlidingBox(controller: _controller, color: Colors.blue[700]!, interval: const Interval(0.6, 0.8),),
            SlidingBox(controller: _controller, color: Colors.blue[900]!, interval: const Interval(0.8, 1.0),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.stop();
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
