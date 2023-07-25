import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            child: emailField(bloc!),
          ),
          passwordField(bloc),
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: submitButton(bloc),
          )
        ],
      ),
    );
  }
}

Widget emailField(Bloc bloc) {
  return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email Address',
            errorText: snapshot.error?.toString(),
          ),
        );
      });
}

Widget passwordField(Bloc bloc) {
  return StreamBuilder(
    stream: bloc.password,
    builder: (context, snapshot) {
      return TextField(
        onChanged: bloc.changePassword,
        decoration: InputDecoration(
          hintText: 'Password',
          labelText: 'Password',
          errorText: snapshot.error?.toString(),
        ),
      );
    },
  );
}

Widget submitButton(Bloc bloc) {
  return StreamBuilder(
    stream: bloc.submitValid,
    builder: (context, snapshot) {
      return MaterialButton(
        color: Colors.blue,
        onPressed: snapshot.hasData
            ? bloc.submit
            : null,
        child: const Text('Login'),
      );
    },
  );
}
