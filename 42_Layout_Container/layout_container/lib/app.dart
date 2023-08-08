import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Container'),
        ),
        body: const Column(
          children:[
           SizedBox(
             height: 400,
             child: Placeholder(
               fallbackWidth: 20,
               fallbackHeight: 200,
             ),
           ),
          ],
          // [
          //   Container(
          //     margin: const EdgeInsets.only(top: 80),
          //     height: 50,
          //     color: Colors.orange,
          //     alignment: Alignment.center,
          //     child: const FlutterLogo(size: 100),
          //   )
          // ],
        ),
        // Container(
        //   color: Colors.black,
        //   width: 400,
        //   height: 400,
        //   alignment: Alignment.center,
        //   child: Container(
        //     width: 200,
        //     height: 200,
        //     color: Colors.orange,
        //     padding: const EdgeInsets.all(24.0),
        //     alignment: Alignment.topLeft,
        //     child: const FlutterLogo(size: 100),
        //   ),
        // ),
      ),
    );
  }
}
