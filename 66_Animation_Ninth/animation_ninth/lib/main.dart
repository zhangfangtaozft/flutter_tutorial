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
  int _counter = 0;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _controller.repeat();
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
        title: const Text('Animation Ninth'),
      ),
      body: Center(
        child: SlideTransition(
          // position:_controller.drive(Tween(begin: const Offset(0, 0), end: const Offset(1, 1))),
          position: Tween(begin: const Offset(0, 0), end:  const Offset(1, 1))
          .chain(CurveTween(curve: const Interval(0.8, 1.0)))
              .animate(_controller),
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
          ),
        ),
        // ScaleTransition(
        //   scale: _controller.drive(Tween(begin: 0.5, end: 2.0)),
        //   child: Container(
        //     width: 300,
        //     height: 300,
        //     color: Colors.blue,
        //   ),
        // ),
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
