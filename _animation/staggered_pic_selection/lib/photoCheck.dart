import 'package:flutter/material.dart';

class PhotoCheck extends StatelessWidget {
  const PhotoCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      ),
      child: const Icon(
        Icons.check,
        size: 32.0,
        color: Colors.white,
      ),
    );
  }
}
