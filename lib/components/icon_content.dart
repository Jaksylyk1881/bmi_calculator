import 'package:flutter/material.dart';
import 'constants.dart';

class GenderColumn extends StatelessWidget {
  final IconData icon;
  final String text;

  const GenderColumn({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(text,style: kLabelTextStyle ,)
      ],
    );
  }
}

