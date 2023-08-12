import 'package:flutter/material.dart';

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
  double _height = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation first!'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: 300,
          height: 300,
          // color: Colors.blue,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.orange, Colors.white],
              stops: [0.2, 0.5],
            ),
            boxShadow: const [BoxShadow(spreadRadius: 25, blurRadius: 25)],
            borderRadius: BorderRadius.circular(150),
          ),
          // child: const Center(child: Text('Welcome', style: TextStyle(fontSize: 72),)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _height += 50;
            if (_height > 500) {
              _height = 200;
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
