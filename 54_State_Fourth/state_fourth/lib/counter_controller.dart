import 'package:flutter/cupertino.dart';

class CounterController {
  ValueNotifier<int> count = ValueNotifier(0);
  ValueNotifier<double> fontSize = ValueNotifier(48);
  // int _count = 0;
  // int get count => _count;
  //
  // set count(value) {
  //   _count = value;
  //   notifyListeners();
  // }
  //
  void reset() {
    count.value = 0;
  }
}