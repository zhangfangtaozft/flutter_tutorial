import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
            onPressed: () {
            setState(() {
              counter += 1;
            });
        }),
        appBar: AppBar(
          title: Text("Lets see some images!$counter"),
        ),
        body: Center(
          child: Text(
              '$counter',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}


// class App extends StatelessWidget {
//   const App({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         floatingActionButton: FloatingActionButton(
//           child: const Icon(Icons.add),
//           onPressed: () {
//             if (kDebugMode) {
//               print('Hi There!');
//             }
//           },
//         ),
//         appBar: AppBar(
//           title: const Text('Lets see some images!'),
//         ),
//       ),
//     );
//   }
// }
