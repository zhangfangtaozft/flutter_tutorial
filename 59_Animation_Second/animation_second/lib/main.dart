import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        title: const Text('Animation Second'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 5),
          width: 300,
          height: 300,
          color: Colors.orange,
          child: AnimatedSwitcher(
            duration: const Duration(seconds: 5),
            transitionBuilder: (Widget child, Animation<double> animation) {
              // return FadeTransition(
              //   opacity: animation, child: child);

              // return RotationTransition(turns: animation, child: child,);

              return RotationTransition(
                turns: animation,
                child: FadeTransition(
                  opacity: animation,
                    child: ScaleTransition(scale: animation, child: child,)
                ),
              );
            },
            child: Text('I am Frank, Hi',key: UniqueKey(), style: const TextStyle(fontSize: 75),),
            // child: Image.network('https://th.bing.com/th/id/OIP.HLuY60jzx5puuKjbqmWRRwHaEK?pid=ImgDet&rs=1'),
          )
        ),
      ),
    );
  }
}
