import 'package:flutter/material.dart';
import 'package:my_app/pages/short_page.dart';
import 'package:my_app/utils/colours.dart';
import 'package:my_app/widgets/custom_btn.dart';
import 'package:my_app/widgets/custom_header_text.dart';
import 'package:my_app/widgets/custom_page_route.dart';
import 'package:my_app/widgets/custom_text_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;

    // Set shape sizes relative to screen size
    final shapeSize = screenWidth * 0.5; // Adjust 0.5 based on preferred scale

    return Scaffold(
      backgroundColor: Colours.bgColor,
      body: Stack(
        children: [
          // Background elements
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: shapeSize,
              height: shapeSize,
              decoration: const BoxDecoration(
                color: Colours.circlesColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(250),
                ),
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
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(250),
                ),
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
                const CustomHeaderText(text: 'URL Shortener'),

                const SizedBox(height: 30),

                // Text form
                CustomTextFormField(
                  textEditingController: _textEditingController,
                  text: 'Paste a long URL',
                ),

                const SizedBox(height: 16),

                // Button
                CustomBtn(
                  text: 'Shorten',
                  onPressed: () {
                    // Send the link to the Node.js server to shorten
                    Navigator.of(context).push(createSlideRoute(const ShortPage()));
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