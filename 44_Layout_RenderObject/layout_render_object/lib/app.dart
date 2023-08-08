import 'package:flutter/material.dart';
import 'package:layout_render_object/my_render_box.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Render Object'),
        ),
        body: Container(
          color: Colors.orange[200],
          child: const ShadowBox(
            distance: 4,
            child: Icon(Icons.category, size: 180),
          ),
        ),
      ),
    );
  }
}
