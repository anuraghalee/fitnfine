import 'package:flutter/material.dart';

class HealthModel {
  List<List<String>> healthList = [];
}

class FoodRestrictionsM extends ChangeNotifier {
  List<String> foodres = [];

  void addItem(String a) {
    foodres.add(a);
    notifyListeners();
  }

  void remItem(String a) {
    foodres.remove(a);
    notifyListeners();
  }

  @override
  String toString() {
    // TODO: implement toString
    return '$foodres';
  }
}

class DietM extends ChangeNotifier {
  List<String> dietres = [];

  void addItem(String a) {
    dietres.add(a);
    notifyListeners();
  }

  void remItem(String a) {
    dietres.remove(a);
    notifyListeners();
  }
}

class DiseaseM extends ChangeNotifier {
  List<String> disList = [];

  void addItem(String a) {
    disList.add(a);
    notifyListeners();
  }

  void remItem(String a) {
    disList.remove(a);
    notifyListeners();
  }
}
