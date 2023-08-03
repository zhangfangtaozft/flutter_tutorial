import 'dart:async';

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
  // final future = Future.delayed(const Duration(seconds: 1), () => 42);
  // final stream = Stream.periodic(const Duration(seconds: 1), (_) => 42);
  final controller = StreamController.broadcast();

  @override
  // void initState() {
    // future.then((value) => print('future completed: $value'));
    // stream.listen((event) {
    //   print('stream: $event');
    // });
  //
  //   controller.sink.add(72);
  //   controller.stream.listen((event) {
  //
  //   });
  //   super.initState();
  // }

  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      controller.stream.listen((event) => print('event: $event'),
        onError: (err) => print('ERROR: $err'),
        onDone: () => print('Done'),
      );
    });
    super.initState();
  }
  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  Stream<DateTime> getTime() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield DateTime.now();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream!'),
      ),
      body: Center(
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.headlineMedium!,
          child: Column(
            children: [
              MaterialButton(
                onPressed: () {
                  controller.sink.add(10);
                },
                color: Colors.grey,
                child: const Text('10'),
              ),
              MaterialButton(
                onPressed: () {
                  controller.sink.add(8);
                },
                color: Colors.grey,
                child: const Text('8'),
              ),
              MaterialButton(
                onPressed: () {
                  controller.sink.add('Hi');
                },
                color: Colors.grey,
                child: const Text('Hi'),
              ),
              MaterialButton(
                onPressed: () {
                  controller.sink.addError('oops');
                },
                color: Colors.grey,
                child: const Text('Error'),
              ),
              MaterialButton(
                onPressed: () {
                  controller.sink.close();
                },
                color: Colors.grey,
                child: const Text('Close'),
              ),
              StreamBuilder(
                // stream: controller.stream
                //     .where((event) => event > 5)
                //     .map((event) => event * 2),
                stream: getTime(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Text('none: there is no stream!');
                      break;
                    case ConnectionState.waiting:
                      return const Text('waiting: waiting the stream!');
                      break;
                    case ConnectionState.active:
                      if (snapshot.hasError) {
                        return Text('Active has error: ${snapshot.error}');
                      } else {
                        return Text('Active: hasData: ${snapshot.data}');
                      }
                      break;
                    case ConnectionState.done:
                      return const Text('done: the stream is done!');
                      break;
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
