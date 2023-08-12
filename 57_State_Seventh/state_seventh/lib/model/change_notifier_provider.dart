import 'package:flutter/material.dart';
import 'package:state_seventh/model/logo_model_provider.dart';

class ChangeNotifierProvider<T extends Listenable> extends StatefulWidget {
  final T Function() create;
  final Widget child;

  const ChangeNotifierProvider(
      {super.key, required this.create, required this.child});

  @override
  State<ChangeNotifierProvider> createState() =>
      _ChangeNotifierProviderState<T>();

  static T of<T>(BuildContext context, {required bool listen}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<MyInheritedWidget<T>>()!
          .model;
    }
    return context.getInheritedWidgetOfExactType<MyInheritedWidget<T>>()!.model;
  }
}

class _ChangeNotifierProviderState<T extends Listenable>
    extends State<ChangeNotifierProvider<T>> {
  late T model;

  @override
  void initState() {
    super.initState();
    model = widget.create();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: model,
      builder: (BuildContext context, Widget? child) {
        return MyInheritedWidget(model: model, child: widget.child);
      },
    );
  }
}

extension Consumer on BuildContext {
  T watch<T>() => ChangeNotifierProvider.of(this, listen: true);
  T read<T>() => ChangeNotifierProvider.of(this, listen: false);
}
