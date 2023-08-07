import 'dart:async';
import 'package:async_demo/key_pad.dart';
import 'package:async_demo/puzzle.dart';
import 'package:async_demo/tally_transformer.dart';
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
  final StreamController<int> _inputController = StreamController.broadcast();
  final StreamController<int> _scoreController = StreamController.broadcast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: _scoreController.stream.transform(TallyTransformer()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('Score: ${snapshot.data}');
              }
              return const Text('Score: 0');
            },
          )
        ),
        body: Stack(
          children: [
            ...List.generate(
                15,
                (index) => Puzzle(
                    inputStream: _inputController.stream,
                    scoreStream: _scoreController)),
            Align(
              alignment: Alignment.bottomCenter,
              child: KeyPad(inputController: _inputController, scoreController: _scoreController),
            ),
          ],
        ));
  }
}
