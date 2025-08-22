import 'package:flutter/material.dart';
import 'package:fmdt_quiz_app/models/quiz_settings_model.dart';
import 'package:fmdt_quiz_app/screens/about_me.dart';
import 'package:fmdt_quiz_app/screens/home_screen.dart';
import 'package:fmdt_quiz_app/screens/onboarding_screen.dart';
import 'package:fmdt_quiz_app/screens/quiz_categories.dart';
import 'package:fmdt_quiz_app/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => QuizSettingsModel(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "/onboarding": (context) => const OnboardingScreen(),
        "/about-me": (context) => const AboutMe(),
        "/home": (context) => HomeScreen(),
        "/quiz-categories": (context) => QuizCategoriesScreen(),
      },
    );
  }
}
