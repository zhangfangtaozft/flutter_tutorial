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
        AnimationController(
            duration: const Duration(seconds: 1),
            vsync: this,
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
        title: const Text('Animation Eighth'),
      ),
      body: Center(
        child:
          ScaleTransition(
            scale: _controller,
            child: Container(
              width: 300,
              height: 300,
              color: Colors.blue,
            ),
          )
        // RotationTransition(
        //   turns: _controller,
        //   child: Container(
        //     width: 300,
        //     height: 300,
        //     color: Colors.blue,
        //   ),
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.repeat(reverse: true);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
