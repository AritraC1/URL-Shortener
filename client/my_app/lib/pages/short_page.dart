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
                if (ModalRoute.of(context)?.settings.name != '/short') { // ModalRoute.of(context) retrieves the current route (or screen) that the context belongs to
                  Navigator.pushNamed(context, '/short');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}