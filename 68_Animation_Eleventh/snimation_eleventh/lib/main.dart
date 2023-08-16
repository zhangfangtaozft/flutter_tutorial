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

class _HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin {
  late AnimationController _controller;


  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(seconds: 1),
      vsync: this
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Animation opacityAnimation = Tween<double>(begin: 0.5, end: 0.8).animate(_controller);
    final Animation heightAnimation = Tween<double>(begin: 100.0, end: 150.0).animate(_controller);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Eleventh'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
                // opacity: _controller.value,
              opacity: opacityAnimation.value,
              child: Container(
                width: 300,
                // height: 200 + 100 * _controller.value,
                height: heightAnimation.value,
                color: Colors.blue,
                child: child,
              ),
            );
          },
          child: const Center(
            child: Text('Hi', style: TextStyle(fontSize: 72),),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
