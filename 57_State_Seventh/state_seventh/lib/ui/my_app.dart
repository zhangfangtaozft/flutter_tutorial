import 'package:flutter/material.dart';
import 'package:state_seventh/model/change_notifier_provider.dart';
import 'package:state_seventh/ui/home_page.dart';
import 'package:state_seventh/model/logo_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: const MaterialApp(
        home: HomePage(),
      ),
      create: () => LogoModel(),
    );
  }
}
