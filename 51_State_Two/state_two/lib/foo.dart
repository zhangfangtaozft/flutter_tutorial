import 'package:flutter/material.dart';

class Foo extends StatelessWidget {
  final int count;
  final void Function(int) add;
  const Foo({super.key, required this.count, required this.add});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.red.withOpacity(0.5),
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Center(child: FlutterLogo(size: 50)),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            ElevatedButton(
                onPressed: () => add(2),
                child: const Text('+2')),
            ElevatedButton(
                onPressed: () => add(3),
                child: const Text('+3')),
          ],
        ));
  }

}
