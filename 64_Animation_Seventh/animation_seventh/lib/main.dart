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

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late  AnimationController _controller;
  bool _loading = false;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this
    );
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
        title: const Text('Animation Seventh'),
      ),
      body: Center(
        child: RotationTransition(
          turns: _controller,
          child: const Icon(
            Icons.refresh,
            size: 100,
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _loading = !_loading;
          if (_loading) {
            _controller.repeat();
          } else {
            _controller.stop();
          }
        },
        child: const Icon(Icons.rotate_left),
      ),
    );
  }
}
