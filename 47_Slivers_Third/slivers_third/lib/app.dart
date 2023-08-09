import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Slivers Third!'),
        // ),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              // title: Text('Sliver App Bar'),
              floating: true,
              snap: true,
              stretch: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: FlutterLogo(),
                title: Text('Sliver App Bar FlexibleSpace'),
                stretchModes: [
                  StretchMode.blurBackground,
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle,
                ],
                collapseMode: CollapseMode.parallax,
              ),
              // pinned: true,
            ),
            const SliverToBoxAdapter(
              child: Placeholder(),
            ),
            SliverList(delegate: SliverChildListDelegate(
              [
                const FlutterLogo(),
                const FlutterLogo(size: 200,),
                const FlutterLogo(size: 200,),
                const FlutterLogo(size: 200,),
                const FlutterLogo(),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
