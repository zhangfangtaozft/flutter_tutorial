import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Layout Stack!')),
        body: Center(
          child: Container(
            color: Colors.green[200],
            // constraints: const BoxConstraints(
            //   minWidth: 20,
            //   maxWidth: 300,
            //   minHeight: 20,
            //   maxHeight: 300,
            // ),
            child: Stack(
              clipBehavior: Clip.hardEdge,
              // fit: StackFit.expand,
              alignment: Alignment.bottomCenter,
              children: [
                // const Positioned(
                //     top: 0,
                //     left: 0,
                //     child: FlutterLogo(
                //       size: 250,
                //     )),
                const FlutterLogo(size: 250),
                Positioned(
                    top: 20,
                    left: 10,
                    height: 50,
                    // right: 10,
                    width: 180,
                    child: Transform.translate(
                      offset: const Offset(-50, 0),
                      child: const ElevatedButton(
                        onPressed: null,
                        child: Text(''),
                      ),
                    )
                ),
                Text(
                  'You have',
                  style: TextStyle(fontSize: 70),
                ),
                Text('0', style: TextStyle(fontSize: 70)),
                // Positioned(
                //   right: 0,
                //   top: 0,
                //   child: Container(
                //     width: 24,
                //     height: 24,
                //     color: Colors.red,
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
