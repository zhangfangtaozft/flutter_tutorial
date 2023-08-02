import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  bool _loading = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder'),
      ),
      body: Center(
        child: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 2), () => 42),
          initialData: 72,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   return const CircularProgressIndicator();
            // }
            if (snapshot.hasError) {
              return const Icon(Icons.error, size: 100);
            }
            if (snapshot.hasData) {
              return Text('${snapshot.data}',style: const TextStyle(fontSize: 72),);
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
