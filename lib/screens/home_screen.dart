import 'package:flutter/material.dart';
import 'package:fmdt_quiz_app/models/quiz_settings_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      foregroundImage: AssetImage("assets/images/pp.png"),
                      radius: 30,
                    ),
                  ),
                  Text(
                    "Hi, Emmanuel",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            // borderSide: BorderSide.none
                          ),
                          hintText: "Search",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        print("This button has been pressed");
                      },
                      label: Text(
                        "Filter",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      icon: Icon(Icons.filter_list, color: Colors.black),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories"),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/quiz-categories");
                      },
                      child: Text(
                        "See more",
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  shrinkWrap: true,
                  children: [
                    _CategoryCard(icon: Icons.school, label: "Mathematics"),
                    _CategoryCard(icon: Icons.sports_football, label: "Sports"),
                    _CategoryCard(icon: Icons.menu_book, label: "History"),
                    _CategoryCard(icon: Icons.pets, label: "Pets"),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Score History"),
                    Text("View All", style: TextStyle(color: Colors.orange)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 36, horizontal: 24),
                  child: Column(
                    children: [
                      Icon(
                        Icons.assignment,
                        size: 48,
                        color: Colors.grey.shade400,
                      ),
                      Text(
                        "You have no scores recorded yet.\n"
                        "Select a Category and challenge yourself",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  const _CategoryCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => QuizSettingsDialog(category: label),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.orange),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizSettingsDialog extends StatefulWidget {
  final String category;
  const QuizSettingsDialog({required this.category, super.key});

  @override
  State<QuizSettingsDialog> createState() => _QuizSettingsDialogState();
}

class _QuizSettingsDialogState extends State<QuizSettingsDialog> {
  int _count = 5;
  late final TextEditingController _countControl;

  @override
  void initState() {
    super.initState();
    _countControl = TextEditingController(text: '$_count');
  }

  @override
  void dispose() {
    _countControl.dispose();
    super.dispose();
  }

  void _setCount(int value) {
    final clamped = value.clamp(1, 99);
    setState(() {
      _count = clamped;
      _countControl.text = '$_count';
      _countControl.selection = TextSelection.fromPosition(
        TextPosition(offset: _countControl.text.length),
      );
    });
  }

  void _increment() => _setCount(_count + 1);
  void _decrement() => _setCount(_count - 1);

  void _syncFromText(String value) {
    if (value.isEmpty) return;
    final n = int.tryParse(value);
    if (n == null) return;
    _setCount(n);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 300,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Quiz Settings"),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    label: Icon(Icons.close),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text("How many questions would you like?"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _decrement,
                    child: Icon(Icons.remove),
                  ),
                  SizedBox(
                    width: 60,
                    child: TextField(
                      controller: _countControl,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: _increment, child: Icon(Icons.add)),
                ],
              ),
              Text("Select Difficulty"),
              SizedBox(height: 8),
              DropdownButton<Difficulty>(
                value: context.watch<QuizSettingsModel>().difficulty,
                items: const [
                  DropdownMenuItem(value: Difficulty.Easy, child: Text("Easy")),
                  DropdownMenuItem(value: Difficulty.Hard, child: Text("Hard")),
                  DropdownMenuItem(
                    value: Difficulty.Difficult,
                    child: Text("Difficult"),
                  ),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  context.read<QuizSettingsModel>().setDifficulty(value);
                },
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  print('this button has been pressed');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Start Quiz"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
