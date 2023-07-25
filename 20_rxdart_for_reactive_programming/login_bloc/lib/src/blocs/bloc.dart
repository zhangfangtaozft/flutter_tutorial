import 'dart:async';
import 'package:flutter/foundation.dart';

import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password  => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (e, p) => true);
  // Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;
    if (kDebugMode) {
      print("Email is: $validEmail,\nPassword is: $validPassword");
    }
  }

  dispose() {
    _email.close();
    _password.close();
  }
}

