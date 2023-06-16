import 'package:flutter/material.dart';
class Photo {
  const Photo({required this.asset, required this.id});
  final String asset;
  final int id;
  @override
  bool operator == (dynamic other) {
    if (runtimeType != other.runtimeType) {
      return false;
    }
    final Photo typedOther = other;
    return id == typedOther.id;
  }

@override
  int get hashCode => id.hashCode;
}