import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
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

class QuizSettingsDialog extends StatelessWidget {
  final String category;
  const QuizSettingsDialog({required this.category, super.key});

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
                    onPressed: null,
                    label: Icon(Icons.close),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text("How many questions would you like?"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: null, child: Icon(Icons.remove)),
                  SizedBox(
                    width: 60,
                    child: TextField(
                      controller: TextEditingController(text: "5"),
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
                  ElevatedButton(onPressed: null, child: Icon(Icons.add)),
                ],
              ),
              Text("Select Difficulty"),
              SizedBox(height: 8),
              DropdownButton<String>(
                items: const [
                  DropdownMenuItem(value: "Easy", child: Text("Easy")),
                  DropdownMenuItem(value: "Hard", child: Text("Hard")),
                  DropdownMenuItem(
                    value: "Difficult",
                    child: Text("Difficult"),
                  ),
                ],
                onChanged: null,
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: null,
                child: Text("Start Quiz"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
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
