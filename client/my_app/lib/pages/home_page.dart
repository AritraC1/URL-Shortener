import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app/pages/short_page.dart';
import 'package:my_app/utils/colours.dart';
import 'package:my_app/widgets/custom_btn.dart';
import 'package:my_app/widgets/custom_header_text.dart';
import 'package:my_app/widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();

  // Replace with your computer's IP address and the correct port number
  final String nodeServerUrl = 'http://localhost:5001';

  Future<void> shortUrl() async {
    final url = Uri.parse('$nodeServerUrl/url/shorten');

    // Make a POST request to send the original URL
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'originalURL': _textEditingController.text}),
      );

      print('Response status: ${response.statusCode}'); // Debugging output

      if (response.statusCode == 200) {
        // Parse the shortened URL from the response
        final data = jsonDecode(response.body);
        final shortUrl = data['shortUrl'];

        // Navigate to ShortPage with the shortened URL
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => ShortPage(shortUrl: shortUrl),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0); // Start from right
              const end = Offset.zero; // End at center
              const curve = Curves.easeInOut;

              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        );
      } else {
        print('Failed to shorten URL: ${response.statusCode}');
        showSnackBar('Failed to shorten URL');
      }
    } catch (e) {
      print('Error occurred: $e');
      showSnackBar('Unable to connect to server');
    }
  }

  // Snack bar for error messages
  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomHeaderText(text: 'URL Shortener'),
                const SizedBox(height: 30),
                CustomTextFormField(
                  textEditingController: _textEditingController,
                  text: 'Paste a long URL',
                ),
                const SizedBox(height: 16),
                CustomBtn(
                  text: 'Shorten',
                  onPressed: shortUrl,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
