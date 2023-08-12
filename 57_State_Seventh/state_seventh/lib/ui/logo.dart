import 'package:flutter/material.dart';
import 'package:state_seventh/model/change_notifier_provider.dart';
import 'package:state_seventh/model/logo_model.dart';
import 'package:state_seventh/model/logo_model_provider.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final model =context.watch<LogoModel>();

    return Card(
        child: Transform.flip(
          flipX: model.flipX,
          flipY: model.flipY,
          child: FlutterLogo(size: model.size),
        )
    );
  }
}
