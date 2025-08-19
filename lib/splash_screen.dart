import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFFE950B),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 150),
            Center(child: Image.asset("assets/icons/quizzia-logo.png")),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  children: [
                    TextSpan(text: "Developed by "),
                    TextSpan(
                      text: 'Festus Ayeh-Datey',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
