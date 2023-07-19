import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  var app = MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text('App Bar: left'),
        leading: const Icon(Icons.keyboard_double_arrow_left),
        leadingWidth: 100,
        backgroundColor: Colors.teal,
        bottom: const PreferredSize(
          preferredSize: Size(100, 20),
          child: Text(
            'This is bottom of AppBar!',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                textBaseline: TextBaseline.alphabetic),
          ),
        ),
        centerTitle: false,
        flexibleSpace: const SizedBox(width: 20, height: 20),
        // default is 4.0
        elevation: 5.0,
        shadowColor: Colors.orange,
        surfaceTintColor: Colors.blue,
        toolbarHeight: 100.0,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.green,
        backgroundColor: Colors.indigo,
        hoverColor: Colors.black54,
        splashColor: Colors.black54,
        focusColor: Colors.black54,
        onPressed: () {
          if (kDebugMode) {
            print('Clicked floating action Button');
          }
        },
        child: Icon(
          Icons.add,
          size: 50.0,
          fill: 20.0,
          weight: 20.0,
          grade: 20.0,
          opticalSize: 20.0,
          color: Colors.pinkAccent,
          shadows: const [Shadow(color: Colors.purple, offset: Offset(30.0, 30.0))],
          semanticLabel: 'SemanticLabel',
          textDirection: TextDirection.rtl,
        ),
      ),
    ),
  );
  runApp(app);
}
