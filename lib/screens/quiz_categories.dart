import 'package:flutter/material.dart';
import 'package:fmdt_quiz_app/widgets/category_card.dart';

class QuizCategoriesScreen extends StatelessWidget {
  QuizCategoriesScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: SafeArea(
          child: GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder),
        ),
      ),
    );
  }
}
