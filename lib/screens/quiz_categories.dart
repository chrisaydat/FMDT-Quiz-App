import 'package:flutter/material.dart';
import 'package:fmdt_quiz_app/widgets/category_card.dart';

class QuizCategoriesScreen extends StatelessWidget {
  QuizCategoriesScreen({super.key});

  final List<Map<String, dynamic>> categories = [
    {"icon": Icons.school, "label": "Mathematics"},
    {"icon": Icons.sports_football, "label": "Sports"},
    {"icon": Icons.menu_book_outlined, "label": "History"},
    {"icon": Icons.pets, "label": "Pets"},
    {"icon": Icons.people_alt, "label": "Anime"},
    {"icon": Icons.car_rental, "label": "Vehicles"},
    {"icon": Icons.movie, "label": "Film"},
    {"icon": Icons.gamepad_sharp, "label": "Games"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: const Text("Quiz Categories"),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GridView.builder(
              itemCount: categories.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryCard(
                  icon: category["icon"],
                  label: category["label"],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
