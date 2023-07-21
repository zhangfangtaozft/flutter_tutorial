import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../mixins/validation_mixins.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,

        child: Column(
          children: [
            Container(margin: const EdgeInsets.only(bottom: 100.0)),
            emailField(),
            passwordField(),
            Container(margin: const EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: validateEmail,
      onSaved: (value) {
       email = value!;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      onSaved: (value) {
        password = value!;
      },
      validator: validatePassword,
    );
  }

  Widget submitButton() {
    return MaterialButton(
      color: Colors.blue,
      child: const Text('Submit!'),
      onPressed: () {
       if (formKey.currentState!.validate()) {
         formKey.currentState!.save();
         if (kDebugMode) {
           print('Time to post $email and $password to My API!');
         }
       }
      },
    );
  }
}
