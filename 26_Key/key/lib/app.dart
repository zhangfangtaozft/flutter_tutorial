import 'dart:math';

import 'package:flutter/material.dart';
import 'package:key/box.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _color = Colors.blue;
  List<Color> _colors = [];
  late int _slot;

  @override
  initState() {
    super.initState();
    _shuffle();
  }

  _shuffle() {
    _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    _colors = List.generate(8, (index) => _color[(index + 1) * 100]!);
    setState(() => _colors.shuffle());
  }

  _checkWinCondition() {
    List<double> lum = _colors.map((c) => c.computeLuminance()).toList();
    bool success = true;
    for (int i = 0; i < lum.length - 1; i ++) {
      if (lum[i] > lum[i + 1]){
        success = false;
        break;
      }
    }
    print(success ? "Win" : "");
  }

  final _globalKey = GlobalKey();
  late double _offsetY;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keys',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hold on and remove the Box'),
          actions: [
            IconButton(
              onPressed: _shuffle,
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 32),
              const Text('Welcome:', style: TextStyle(fontSize: 32)),
              const SizedBox(height: 32),
              Container(
                decoration: BoxDecoration(
                  color: _color[900]!,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                margin: const EdgeInsets.all(8.0),
                width: Box.width - Box.margin * 2,
                height: Box.height - Box.margin * 2,
                child: const Icon(Icons.lock_outline, color: Colors.white),
              ),
              const SizedBox(height: Box.margin * 2),
              Expanded(
                child: Listener(
                  onPointerMove: (event) {
                    final y = event.position.dy - _offsetY;
                    if (y > (_slot + 1) * Box.height) {
                      if (_slot == _colors.length - 1) return;
                      setState(() {
                        final currentColor = _colors[_slot];
                        _colors[_slot] = _colors[_slot + 1];
                        _colors[_slot + 1] = currentColor;
                        _slot++;
                      });
                    } else if (y < (_slot) * Box.height) {
                      if (_slot == 0) return;
                      setState(() {
                        final currentColor = _colors[_slot];
                        _colors[_slot] = _colors[_slot - 1];
                        _colors[_slot - 1] = currentColor;
                        _slot--;
                      });
                    }
                  },
                  child: SizedBox(
                    width: Box.width,
                    child: Stack(
                      key: _globalKey,
                      children: List.generate(_colors.length, (index) {
                        return Box(
                          color: _colors[index],
                          x: -Box.margin * 2,
                          y: index * Box.height,
                          onDrag: (Color color) {
                            final renderBox = (_globalKey.currentContext
                                ?.findRenderObject() as RenderBox);
                            _offsetY = renderBox.localToGlobal(Offset.zero).dy;
                            final index = _colors.indexOf(color);
                            _slot = index;
                          },
                          onEnd: _checkWinCondition,
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
