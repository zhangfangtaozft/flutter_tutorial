import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Layout!'),
        ),
        body: Center(
          child: Container(
            width: 400,
            height: 400,
            color: Colors.red[200],
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    print('constraints: $constraints');
                    return const FlutterLogo(size: 900);
                  }
              ),
            ),
          ),
        ),
      ),
    );
  }
}
