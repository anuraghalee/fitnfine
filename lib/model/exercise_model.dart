import 'package:flutter/material.dart';

class EProvider extends ChangeNotifier {
  var tabIndex = 0;
  var screenChanged = 0;

  void onTabChanged(int a) {
    tabIndex = a;
    notifyListeners();
  }

  void screenChange(int a) {
    screenChanged = a;
    notifyListeners();
  }
}
