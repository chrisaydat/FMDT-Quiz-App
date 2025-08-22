import 'package:flutter/foundation.dart';

enum Difficulty { Easy, Hard, Difficult }

class QuizSettingsModel extends ChangeNotifier {
  Difficulty _difficulty = Difficulty.Easy;

  Difficulty get difficulty => _difficulty;

  void setDifficulty(Difficulty value) {
    if (_difficulty == value) return;
    _difficulty = value;
    notifyListeners();
  }
}
