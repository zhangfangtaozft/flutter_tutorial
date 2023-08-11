import 'package:flutter/material.dart';
import 'package:state_sixth/model/logo_model.dart';
import '../model/logo_model_provider.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({super.key});

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  @override
  Widget build(BuildContext context) {
    final model = context.dependOnInheritedWidgetOfExactType<LogoModelProvider>()!.model;
    return ListenableBuilder(
      listenable: model,
      builder: (BuildContext context, Widget? child) {
        return  Card(
          margin: const EdgeInsets.all(32),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Flip X: '),
                    Switch(
                        value: model.flipX,
                        onChanged: (value) {
                          model.flipX = value;
                        }),
                    const Text('Flip Y: '),
                    Switch(
                        value: model.flipY,
                        onChanged: (value) {
                          model.flipY = value;
                        }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Size: '),
                    Slider(
                        min: 50,
                        max: 300,
                        value: model.size,
                        onChanged: (value) {
                          model.size = value;
                        }),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
