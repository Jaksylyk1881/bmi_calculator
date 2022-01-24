import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  BottomButton({required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 10),
        height: kBottomContainerHeight,
        child: Center(
            child: Text(
          title,
          style: kLargeButtonTextStyle,
        )),
      ),
    );
  }
}
