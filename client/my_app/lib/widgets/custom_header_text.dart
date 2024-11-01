import 'package:flutter/material.dart';
import 'package:my_app/utils/colours.dart';

class CustomHeaderText extends StatelessWidget {
  final String text;

  const CustomHeaderText({
    super.key, required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colours.textColor,
        fontSize: 47,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
