import 'package:flutter/material.dart';
import '../screens/results_page.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.title, required this.onTap});
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColour,
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child:
            Center(child: Text(title, style: kLargeButtonTextStyle)),
      ),
    );
  }
}
