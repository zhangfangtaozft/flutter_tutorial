import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Sliver Third!'),
            ),
            const SliverPadding(
              padding: EdgeInsets.all(40),
              sliver: SliverIgnorePointer(
                ignoring: false,
                sliver: SliverToBoxAdapter(
                  child: ElevatedButton(
                    onPressed: null,
                    child: FlutterLogo(
                      size: 100,
                    ),
                  ),
                ),
              ),
            ),
            SliverGrid(
                delegate: SliverChildListDelegate(
                    [
                      const Icon(Icons.animation),
                      const Icon(Icons.translate),
                      const Icon(Icons.save),
                      const Icon(Icons.person),
                    ]
                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 180)
            ),
            const SliverToBoxAdapter(
              child: Divider(thickness: 4.0,color: Colors.red,),
            ),
            SliverLayoutBuilder(
                builder: (BuildContext context, SliverConstraints constraints) {
                  print(constraints);
                  return const SliverToBoxAdapter(
                    child: FlutterLogo(),
                  );
                }
            ),
            const SliverToBoxAdapter(
              child: Placeholder(fallbackHeight: 2000,),
            )
          ],
        ),
      ),
    );
  }
}
