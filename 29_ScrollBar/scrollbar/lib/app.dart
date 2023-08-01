import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScrollBar'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
        },
        strokeWidth: 4.0,
        color: Colors.red,
        backgroundColor: Colors.black,
        child: Scrollbar(
          child: NotificationListener(
            onNotification: (ScrollNotification _event) {
              print(_event);
              return true;
            },
            child: ListView.builder(
              itemBuilder: (_, index) {
                return Container(
                  color: Colors.blue[index % 9 * 100],
                  height: 50,
                );
              },
              controller: _controller,
              itemCount: 200,
            ),
          ),
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
