import 'dart:async';

import 'package:flutter/material.dart';
import 'app.dart';

void main() {

  // Future.delayed(Duration(seconds: 1), () => print('event 3'));
  // Future(() => print('event 1'));
  // Future.delayed(Duration.zero, () => print('event 2'));
  //
  // scheduleMicrotask(() {
  //   print('microtask 1');
  // });
  // Future.microtask(() => print('microtask 2'));
  // Future.value(123).then((value) => print('microtask 3'));
  //
  // print('main');
  // Future.sync(() => print('sync 1'));
  // Future.value(getName());
  // print('main 2');

  // Future.delayed(Duration(seconds: 1), () => print('delayed'))
  // .then((value) {
  //   scheduleMicrotask(() {
  //     print('micro');
  //   });
  //   print('then');
  // })
  // .then((value) => print('then2'));
  runApp(const App());
}

String getName() {
  print('get name');
  return 'bob';
}
