import 'package:flutter/material.dart';
class App extends StatelessWidget {
  const App({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrollable Widget!'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            FlutterLogo(size: 300),
            FlutterLogo(size: 300),
          ],
        ),
      )
    );
  }
}

/*
* ReorderableListView(
        header: const Text('header!'),
        children: List.generate(20, (index) => Text('index is $index', key: UniqueKey(),)),
        onReorder: (int oldIndex, int newIndex) => print('move from $oldIndex tp $newIndex'),
      ),
* */

/*
*PageView(
        pageSnapping: true,
        scrollDirection: Axis.vertical,
        children: [
          Container(color: Colors.blue),
          Container(color: Colors.orange),
        ],
        onPageChanged: (index) => print('selected$index'),
      ),
* */

/*
RotatedBox(
        quarterTurns: 1,
        child: ListWheelScrollView(
            itemExtent: 100,
            // offAxisFraction: -1.5,
            // diameterRatio: 0.8,
            // overAndUnderCenterOpacity: 0.5,
            magnification: 2.5,
            useMagnifier: true,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: (index) => print('selected $index'),
            children: List.generate(10, (index) => RotatedBox(
              quarterTurns: -1,
              child: Container(
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text('Hello'),
              ),
            ))
        ),
      ),
* */