import 'package:flutter/material.dart';
import 'package:my_app/utils/colours.dart';
import 'package:my_app/widgets/custom_btn.dart';
import 'package:my_app/widgets/custom_header_text.dart';
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
    return Scaffold(
      backgroundColor: Colours.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
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
              text: 'Paste a long url',
            ),

            const SizedBox(height: 16),

            // Button
            CustomBtn(
              text: 'Shorten',
              onPressed: () {
                // To Send the link to nodejs server to shorten
                Navigator.pushNamed(context, '/short');
              },
            ),
          ],
        ),
      ),
    );
  }
}