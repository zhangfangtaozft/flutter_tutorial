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
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTap: () {
              _controller.animateTo(
                  -20.0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.linear
              );
            },
            child: const Text('ListView Demo'),
          )
        ),
        body: Scrollbar(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _controller,
            padding: const EdgeInsets.only(bottom: 48),
            itemBuilder: (context, index) {
              return const ListTile(
                leading: Icon(Icons.person),
                title: Text('Name'),
                subtitle: Text('subtitle'),
                trailing: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.delete_outline)
                ),
              );
          },
          itemCount: 200,
            // itemExtent: 60,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _controller.jumpTo(_controller.offset + 200.0);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.arrow_downward),
        ),
      ),
    );
  }
}
