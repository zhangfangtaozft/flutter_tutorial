import 'package:flutter/material.dart';
import 'package:state_fifth/foo.dart';
import 'my_color.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return MyColor(
        color: _color,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('State Fifth!'),
          ),
          body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Foo(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                _color = Colors.black;
              });
            },
            child: const Icon(Icons.color_lens),
          ),
        ),
    );
  }
}
