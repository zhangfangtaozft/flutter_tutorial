import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Slivers Second!'),
        ),
        body: DefaultTextStyle(
          style: const TextStyle(fontSize: 100, color: Colors.red),
          child: CustomScrollView(
            slivers: [
              SliverPrototypeExtentList(
                  prototypeItem: const Text('Hello'),
                  delegate: SliverChildListDelegate([
                    const Text('Hello'),
                    const Text('Hello'),
                    const Text('Hello'),
                    const FlutterLogo(),
                    const FlutterLogo(size: 220),
                    const FlutterLogo(),
                  ])),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      height: 50,
                      color: Colors.primaries[index % Colors.primaries.length],
                    );
                  },
                  childCount: 8,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
              ),
              SliverFillViewport(
                  delegate: SliverChildListDelegate(
                [
                  Container(color: Colors.red,),
                  Container(color: Colors.yellow,),
                  Container(color: Colors.blue,),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
