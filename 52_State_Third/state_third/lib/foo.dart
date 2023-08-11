import 'package:flutter/material.dart';
import 'package:state_third/foo_controller.dart';
import 'foo_controller.dart';

class Foo extends StatefulWidget {
  final FooController controllere;
  const Foo({super.key, required this.controllere});

  @override
  State<Foo> createState() => _FooState();
}

class _FooState extends State<Foo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.withOpacity(0.5),
      child: ListenableBuilder(
        listenable: widget.controllere,
        builder: (BuildContext context, Widget? child) {
          return Column(
            children: [
              FlutterLogo(size: widget.controllere.value * 100 + 50),
              Slider(
                  value: widget.controllere.value,
                  onChanged: (double value) {
                    setState(() {
                      widget.controllere.value = value;
                    });
                  })
            ],
          );
        },
      ),
    );
  }
}
