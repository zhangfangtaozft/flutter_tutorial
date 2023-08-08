import 'package:flutter/material.dart';
import 'my_delegate.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom multi child layout!'),
        ),
        body:Container(
          color: Colors.orange[200],
          child: CustomMultiChildLayout(
            delegate: MyDelegate(thickness: 4),
            children: [
              LayoutId(
                id: 'underline',
                  child: Container(color: Colors.red,)
              ),
              LayoutId(
                id: 'text',
                child: const Text('WSBT', style: TextStyle(fontSize: 72)),
              ),
            ],
          ),
        ) ,
      ),
    );
  }
}
