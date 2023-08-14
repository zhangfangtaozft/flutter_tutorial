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

class _HomePageState extends State<HomePage> {
  double _top = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Third'),
      ),
      body: AnimatedPadding(
        duration: const Duration(seconds: 2),
        curve: Curves.bounceOut,
        padding: EdgeInsets.only(top: _top),
        child: Container(
          width: 300,
          height: 300,
          color: Colors.blue,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _top += 50;
            if (_top == 500) {
              _top = 0;
            }
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

