import 'package:flutter/material.dart';
import 'package:state_sixth/model/logo_model_provider.dart';
import 'package:state_sixth/ui/home_page.dart';
import 'package:state_sixth/model/logo_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LogoModelProvider(
      model: LogoModel(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
