import 'package:flutter/material.dart';
import 'package:my_app/utils/colours.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;

  const CustomTextFormField({
    super.key,
    required this.text,
    required TextEditingController textEditingController,
  }) : _textEditingController = textEditingController;

  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextFormField(
        controller: _textEditingController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colours.textFieldColor,
          hintText: text,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.black.withOpacity(0.5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xFF6200EE)),
          ),
        ),
      ),
    );
  }
}
