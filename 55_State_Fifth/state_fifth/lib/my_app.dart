import 'package:flutter/material.dart';
import 'package:state_fifth/my_color.dart';
import 'package:state_fifth/my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyColor(
        color: Colors.red,
        child: MaterialApp(
          home: MyHomePage(),
        ),
    );
  }
}

