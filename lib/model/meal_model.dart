import 'package:flutter/material.dart';

class MealProvider extends ChangeNotifier {
  int index = 0;

  void onIndexChanged(int a) {
    index = a;
    notifyListeners();
  }
}
