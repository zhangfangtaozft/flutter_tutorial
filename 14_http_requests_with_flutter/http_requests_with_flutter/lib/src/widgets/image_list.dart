import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  const ImageList({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return buildImage(images[index]);
      },
    );
  }
}

Widget buildImage(ImageModel image) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
    ),
    padding: const EdgeInsets.all(20.0),
    margin: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Image.network(image.url),
        ),
        Text(
          image.title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
