import 'package:flutter/material.dart';
import 'package:state_fifth/my_color.dart';

class Foo extends StatefulWidget {
  const Foo({super.key});

  @override
  State<Foo> createState() => _FooState();
}

class _FooState extends State<Foo> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: MyColor.maybeOf(context)?.color,
    );
  }
}
