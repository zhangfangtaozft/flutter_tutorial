import 'package:flutter/material.dart';
import 'package:state_sixth/model/logo_model.dart';
import 'package:state_sixth/model/logo_model_provider.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final model = LogoModelProvider.of(context).model;

    return ListenableBuilder(
      listenable: model,

      builder: (BuildContext context, Widget? child) {
        return Card(
            child: Transform.flip(
              flipX: model.flipX,
              flipY: model.flipY,
              child: FlutterLogo(size: model.size),
            )
        );
      },
    );
  }
}
