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
        title: const Text('Async & Future'),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // _incrementCounter() {
  //   getFuture()
  //       .then((value) {
  //         print(value);
  //         return 5;
  //   })
  //       .then((value) => null)
  //       .catchError((err) => print(err))
  //       .whenComplete(() => print('complete'));
  //   print('Hi');
  //
  // }
  //
  // Future<int> getFuture() {
  //   return Future.value(100);
  // }

_incrementCounter() async {
    int id = await getFuture();
    print(id);
    id *= 2;
    print(id);
}

Future<int> getFuture() async {
    return 100;
}
}
