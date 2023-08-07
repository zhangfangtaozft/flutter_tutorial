import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.01,
      height: 0.01,
      color: Colors.red[200],
      child: Center(
        child: Container(
          color: Colors.white,
          width: 200,
          height: 200,
          child: const Align(
            alignment: Alignment(-1,0),
            child: FlutterLogo(size: 50),
          ),
        ),
      ),
    );
  }
}
