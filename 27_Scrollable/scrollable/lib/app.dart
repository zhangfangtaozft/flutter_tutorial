import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Scrollable!'),
        ),
        body: ListView.separated(
          itemCount: 6,
          cacheExtent: 0,
          separatorBuilder: (context, index) {
            if (index == 0) {
              return const Divider(thickness: 4);
            }
            return const Divider();
          }, 
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 60,
              alignment: Alignment.center,
              child: Text('$index'),
            );
          },
        ),
      ),
    );
  }
}
