import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Slivers'),
        ),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: FlutterLogo(size: 100,),
            ),
            const SliverToBoxAdapter(
              child: FlutterLogo(size: 100,),
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    height: 200,
                    color: Colors.primaries[index % Colors.primaries.length],
                  );
                },
                  childCount: 23,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  height: 200,
                  color: Colors.primaries[index % Colors.primaries.length],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
