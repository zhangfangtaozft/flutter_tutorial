import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:staggered_pic_selection/photoItem.dart';
import 'photoFrame.dart';
import 'photo.dart';

final List<Photo> allPhotos = List<Photo>.generate(30, (index) {
  return Photo(asset: 'images/pic${index + 1}.jpg', id: index);
});

final List<List<PhotoFrame>> photoBlockFrames = [
  [const PhotoFrame(width: 1.0, height: 0.4)],
  [
    const PhotoFrame(width: 0.25, height: 0.3),
    const PhotoFrame(width: 0.75, height: 0.3)
  ],
  [
    const PhotoFrame(width: 0.75, height: 0.3),
    const PhotoFrame(width: 0.25, height: 0.3)
  ],
];

class ImagesDemo extends StatefulWidget {
  const ImagesDemo({super.key});

  @override
  State<ImagesDemo> createState() => _ImagesDemoState();
}

class _ImagesDemoState extends State<ImagesDemo>
    with SingleTickerProviderStateMixin {
  static const double _photoBlockHeight = 576.0;

  int? _selectedPhotoIndex;

  void _selectPhoto(int photoIndex) {
    setState(() {
      _selectedPhotoIndex =
      photoIndex == _selectedPhotoIndex ? null : photoIndex;
    });
  }

  void _removeSelectedPhoto() {
    if (_selectedPhotoIndex == null) return;
    setState(() {
      allPhotos.removeAt(_selectedPhotoIndex!);
      _selectedPhotoIndex = null;
    });
  }

  Widget _buildPhotoBlock(
      BuildContext context, int blockIndex, int blockFrameCount) {
    final List<Widget> rows = [];

    int startPhotoIndex = blockIndex * blockFrameCount;
    final Color photoColor = Colors.grey[500]!;
    for (int rowIndex = 0; rowIndex < photoBlockFrames.length; rowIndex += 1) {
      final List<Widget> rowChildren = [];
      final int rowLength = photoBlockFrames[rowIndex].length;
      for (int frameIndex = 0; frameIndex < rowLength; frameIndex += 1) {
        final PhotoFrame frame = photoBlockFrames[rowIndex][frameIndex];
        final int photoIndex = startPhotoIndex + frameIndex;
        rowChildren.add(
          Expanded(
            flex: (frame.width * 100.0).toInt(),
            child: Container(
              padding: const EdgeInsets.all(4.0),
              height: frame.height * _photoBlockHeight,
              child: PhotoItem(
                photo: allPhotos[photoIndex],
                color: photoColor,
                selected: photoIndex == _selectedPhotoIndex,
                onTap: () {
                  _selectPhoto(photoIndex);
                },
              ),
            ),
          ),
        );
      }
      rows.add(Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: rowChildren,
      ));
      startPhotoIndex += rowLength;
    }

    return Column(children: rows);
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 20.0; // 1.0 is normal animation speed.

    // Number of PhotoBlockFrames in each _photoBlockHeight block
    final int photoBlockFrameCount =
    photoBlockFrames.map((l) => l.length).reduce((s, n) => s + n);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Images Demo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _removeSelectedPhoto,
          ),
        ],
      ),
      body: SizedBox.expand(
        child: ListView.builder(
          padding: const EdgeInsets.all(4.0),
          itemExtent: _photoBlockHeight,
          itemCount: (allPhotos.length / photoBlockFrameCount).floor(),
          itemBuilder: (context, blockIndex) {
            return _buildPhotoBlock(context, blockIndex, photoBlockFrameCount);
          },
        ),
      ),
    );
  }
}