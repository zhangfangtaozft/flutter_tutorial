import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            child: emailField(),
          ),
          passwordField(),
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: submitButton(),
          )
        ],
      ),
    );
  }
}
Widget emailField() {
  return const TextField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      hintText: 'you@example.com',
      labelText: 'Email Address',
    ),
  );
}

Widget passwordField() {
  return const TextField(
    decoration: InputDecoration(
      hintText: 'Password',
      labelText: 'Password'
    ),
  );
}

Widget submitButton() {
  return MaterialButton(
    color: Colors.blue,
    onPressed: () {},
    child: const Text('Login'),
  );
}