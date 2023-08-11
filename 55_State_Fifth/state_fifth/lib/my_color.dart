import 'package:flutter/material.dart';

class MyColor extends InheritedWidget {
  final Color color;

  const MyColor({super.key, required super.child, required this.color});

  static MyColor? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyColor>();
  }

  static MyColor of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyColor>()!;
  }


  @override
  bool updateShouldNotify(covariant MyColor oldWidget) {
    return oldWidget.color != color;
  }

  // @override
  // bool updateShouldNotifyDependent(covariant InheritedModel oldWidget, Set dependencies) {
  //   return true;
  // }
}