import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'widgets/image_list.dart';


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  Future<void> fetchImages() async {
    counter ++;
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter');
    var response = await get(url);
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ImageList(images: images),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImages,
          child: const Icon(Icons.add)
          ),
        appBar: AppBar(
          title: const Text('lets see some images!'),
        ),
      ),
    );
  }
}
