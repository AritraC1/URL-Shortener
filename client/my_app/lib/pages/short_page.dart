import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/utils/colours.dart';
import 'package:my_app/widgets/custom_btn.dart';
import 'package:my_app/widgets/custom_header_text.dart';
import 'package:my_app/widgets/custom_text_form_field.dart';

class ShortPage extends StatefulWidget {
  final String shortUrl;

  const ShortPage({super.key, required this.shortUrl});

  @override
  State<ShortPage> createState() => _ShortPageState();
}

class _ShortPageState extends State<ShortPage> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    // Initialize the text controller with the shortened URL
    _textEditingController = TextEditingController(text: widget.shortUrl);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final shapeSize = screenWidth * 0.5;

    return Scaffold(
      backgroundColor: Colours.bgColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 40),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ),
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomHeaderText(text: 'Shortened URL'),
                const SizedBox(height: 30),
                CustomTextFormField(
                  textEditingController: _textEditingController,
                  text: '',
                ),
                const SizedBox(height: 16),
                CustomBtn(
                  text: 'Copy URL',
                  onPressed: () {
                    // Copy the shortened URL to the clipboard
                    Clipboard.setData(ClipboardData(text: _textEditingController.text));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("URL copied to clipboard!")),
                    );
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