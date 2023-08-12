import 'package:flutter/cupertino.dart';
import 'logo_model.dart';

class MyInheritedWidget<T> extends InheritedWidget {
  final T model;
  const MyInheritedWidget(
      {super.key, required super.child, required this.model});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
