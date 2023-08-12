import 'package:flutter/material.dart';
import 'package:state_seventh/ui/control_panel.dart';
import 'package:state_seventh/ui/logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(),
            ControlPanel(),
          ],
        ),
      ),
    );
  }
}
