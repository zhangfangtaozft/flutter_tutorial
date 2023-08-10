import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDelegate extends SliverPersistentHeaderDelegate {
  late final String title;
  late final Color color;
  MyDelegate(this.title, this.color);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 32,
        color: color,
        child: FittedBox(child: Text(title))
    );
  }

  @override
  double get maxExtent => 32;

  @override
  double get minExtent => 32;

  @override
  bool shouldRebuild(covariant MyDelegate oldDelegate) {
    return true;
  }
}
