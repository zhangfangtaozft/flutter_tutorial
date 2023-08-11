import 'package:flutter/cupertino.dart';

class FooController extends ChangeNotifier {
  double _value = 0.5;

  FooController(double d);

  double get value => _value;
  set value(double newValue) {
    _value = newValue;
    notifyListeners();
  }

  void setMax() {
    _value = 1.0;
    notifyListeners();
  }
}