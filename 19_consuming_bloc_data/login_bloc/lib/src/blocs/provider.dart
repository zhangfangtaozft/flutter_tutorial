import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  Provider({super.key, required super.child});
  @override
  bool updateShouldNotify(oldWidget) => true;

  static Bloc? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>())!.bloc;
  }
}