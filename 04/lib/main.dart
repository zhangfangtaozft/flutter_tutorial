import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
void main() => runApp(XyloponeApp());

class XyloponeApp extends StatelessWidget {
  void playSound(int val) {
    final player = AudioPlayer();
    player.play(AssetSource('note$val.wav'));
  }

  Widget buildKey(Color color, int val) {
    return Expanded(
      child: MaterialButton(
        color: color,
        onPressed: () {
          final player = AudioPlayer();
          player.play(AssetSource('note$val.wav'));
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(Colors.red, 1),
              buildKey(Colors.orange, 2),
              buildKey(Colors.yellow, 3),
              buildKey(Colors.green, 4),
              buildKey(Colors.teal, 5),
              buildKey(Colors.blue, 6),
              buildKey(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }
}

