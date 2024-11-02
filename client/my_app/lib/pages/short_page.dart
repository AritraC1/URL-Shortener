import 'package:flutter/material.dart';
import 'package:my_app/utils/colours.dart';
import 'package:my_app/widgets/custom_btn.dart';
import 'package:my_app/widgets/custom_header_text.dart';
import 'package:my_app/widgets/custom_text_form_field.dart';

class ShortPage extends StatefulWidget {
  const ShortPage({super.key});

  @override
  State<ShortPage> createState() => _ShortPageState();
}

class _ShortPageState extends State<ShortPage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final shapeSize = screenWidth * 0.5; // Adjust this as needed

    return Scaffold(
      backgroundColor: Colours.bgColor,
      body: Stack(
        children: [
          // Top-left corner arrow button
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous page
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Top-right decorative shape
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: shapeSize,
              height: shapeSize,
              decoration: const BoxDecoration(
                color: Colours.circlesColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(250)),
              ),
            ),
          ),
          // Bottom-left decorative shape
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: shapeSize,
              height: shapeSize,
              decoration: const BoxDecoration(
                color: Colours.circlesColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(250)),
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Header
                const CustomHeaderText(text: 'Shortened Url'),
                const SizedBox(height: 30),
                // Text form
                CustomTextFormField(
                  textEditingController: _textEditingController,
                  text: '',
                ),
                const SizedBox(height: 16),
                // Button
                CustomBtn(
                  text: 'Copy Url',
                  onPressed: () {
                    if (ModalRoute.of(context)?.settings.name != '/short') {
                      Navigator.pushNamed(context, '/short');
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}