import 'dart:async';
import 'package:flutter/material.dart';
import 'package:staggered_pic_selection/photo.dart';
import 'photoCheck.dart';

class PhotoItem extends StatefulWidget {
  const PhotoItem({super.key, required this.photo, this.color, this.onTap, required this.selected});
  final Photo photo;
  final Color? color;
  final VoidCallback? onTap;
  final bool selected;
  @override
  State<PhotoItem> createState() => _PhotoItemState();
}

class _PhotoItemState extends State<PhotoItem> with TickerProviderStateMixin {
  late AnimationController _selectController;
  late Animation<double> _stackScaleAnimation;
  late Animation<RelativeRect> _imagePositionAnimation;
  late Animation<double> _checkScaleAnimation;
  late Animation<double> _checkSelectedOpacityAnimation;
  late AnimationController _replaceController;
  late Animation<Offset> _replaceNewPhotoAnimation;
  late Animation<Offset> _replaceOldPhotoAnimation;
  late Animation<double> _removeCheckAnimation;
  late Photo _oldPhoto;
  Photo? _newPhoto;
  @override
  void initState() {
    super.initState();

    _oldPhoto = widget.photo;
    _selectController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    final Animation<double> easeSelection = CurvedAnimation(
      parent: _selectController,
      curve: Curves.easeIn,
    );
    _stackScaleAnimation = Tween<double>(begin: 1.0, end: 0.85).animate(easeSelection);
    _checkScaleAnimation = Tween<double>(begin: 0.0, end: 1.25).animate(easeSelection);
    _checkSelectedOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(easeSelection);
    _imagePositionAnimation = RelativeRectTween(begin: const RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),end: const RelativeRect.fromLTRB(12.0, 12.0, 12.0, 12.0)).animate(easeSelection);
    _replaceController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    final Animation<double> easeInsert = CurvedAnimation(parent: _replaceController, curve: Curves.easeIn);
    _replaceNewPhotoAnimation = Tween<Offset>(
      begin: const Offset(1.0, 1.0),
      end: Offset.zero,
    ).animate(easeInsert);
    _replaceOldPhotoAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(-1.0, 0.0),
    ).animate(easeInsert);

    _removeCheckAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _replaceController, curve: const Interval(0.0, 0.25, curve: Curves.easeIn)));
  }

  @override
  void dispose() {
    _selectController.dispose();
    _replaceController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant PhotoItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.photo != oldWidget.photo) {
      _replace(oldWidget.photo, widget.photo);
    }

    if (widget.selected != oldWidget.selected) {
      _select();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRect(
            child: SlideTransition(
              position: _replaceOldPhotoAnimation,
              child: Material(
                color: widget.color,
                child: InkWell(
                  onTap: widget.onTap,
                  child: ScaleTransition(
                    scale: _stackScaleAnimation,
                    child: Stack(
                      children: [
                        PositionedTransition(rect: _imagePositionAnimation, child: Image.asset(_oldPhoto.asset, fit: BoxFit.cover,)),
                        Positioned(
                          top: 0.0,
                          left: 0.0,
                          child: FadeTransition(
                            opacity: _checkSelectedOpacityAnimation,
                            child: FadeTransition(
                              opacity: _removeCheckAnimation,
                              child: ScaleTransition(
                                alignment: Alignment.topLeft,
                                scale: _checkScaleAnimation,
                                child: const PhotoCheck(),
                              ),
                            ),
                          ),
                        ),
                        PositionedTransition(
                            rect: _imagePositionAnimation,
                            child: Container(
                              margin: const EdgeInsets.all(8.0),
                              alignment: Alignment.topRight,
                              child: Text(
                                widget.photo.id.toString(),
                                style: const TextStyle(color: Colors.green),
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: ClipRect(
            child: SlideTransition(
              position: _replaceNewPhotoAnimation,
              child: _newPhoto == null ? null : Image.asset(_newPhoto!.asset, fit: BoxFit.cover,),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _replace(Photo oldPhoto, Photo newPhoto) async {
    try {
      setState(() {
        _oldPhoto = oldPhoto;
        _newPhoto = newPhoto;
      });
      await _replaceController.forward().orCancel;
      setState(() {
        _oldPhoto = newPhoto;
        _newPhoto = null;
        _replaceController.value = 0.0;
        _selectController.value = 0.0;
      });
    } on TickerCanceled {

    }
  }

  void _select() {
    if (widget.selected) {
      _selectController.forward();
    } else {
      _selectController.reverse();
    }
  }
}
