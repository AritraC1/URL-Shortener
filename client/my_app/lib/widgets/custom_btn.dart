import 'package:flutter/material.dart';
import 'package:my_app/utils/colours.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomBtn({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colours.btnColor,
            padding: const EdgeInsets.all(11.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colours.textColor,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
