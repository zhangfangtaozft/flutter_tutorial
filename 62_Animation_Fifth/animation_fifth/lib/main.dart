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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Fifth'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 120,
          color: Colors.blue,
          child: TweenAnimationBuilder(
            duration: const Duration(seconds: 1),
            tween: Tween(begin: 1.0, end: 9.0),
            builder: (BuildContext context, double value, Widget? child) {
              final whole = value ~/ 1;
              final decimal = value - whole;
              return Stack(
                children: [
                  Positioned(
                      top: -100 * decimal,
                      child: Opacity(
                        opacity: 1.0 - decimal,
                          child: Text('$whole',
                              style: const TextStyle(fontSize: 100)
                          )
                      )
                  ),
                  Positioned(
                      top: 100 - 100 * decimal,
                      child: Opacity(
                          opacity: decimal,
                          child: Text('${whole + 1}',
                              style: const TextStyle(fontSize: 100)
                          )
                      )
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
