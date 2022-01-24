import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {

  final Color colour;
  final Widget? child;
  final VoidCallback? onPressed;

  const ReusableCard({required this.colour,  this.child,  this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: child,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: colour , borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }

}
