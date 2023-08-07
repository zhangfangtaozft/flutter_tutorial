import 'dart:async';
import 'package:flutter/material.dart';

class KeyPad extends StatelessWidget {
 final StreamController _inputController;
 final StreamController _scoreController;

 const KeyPad({super.key, required StreamController<dynamic> inputController, required StreamController<dynamic> scoreController}) : _scoreController = scoreController, _inputController = inputController;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      padding: const EdgeInsets.all(0.0),
      childAspectRatio: 2 / 1,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(9, (index) {
        return MaterialButton(
          shape: const RoundedRectangleBorder(),
          color: Colors.primaries[index][200],
          child: Text('${index + 1}', style: const TextStyle(fontSize: 24)),
          onPressed: () {
            _inputController.add(index + 1);
            _scoreController.add(-2);
          },
        );
      }),
    );
  }
}
