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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
      ),
      body: GridView.builder(
          // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //   crossAxisCount: 3,
          //   childAspectRatio: 16 / 9
          // ),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          childAspectRatio: 16 / 9
        ),
          itemBuilder: (_, index) => Container(
            color: Colors.blue[index % 8 * 100],
          )
      ),
    );
  }
}

