import 'package:animation_sixth/animated_counter.dart';
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
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation sixth'),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 120,
          // color: Colors.blue,
          child: AnimatedCounter(value: _counter,duration: const Duration(seconds: 1),),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         setState(() {
           _counter += 1;
         });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
