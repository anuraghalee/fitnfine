import 'package:fitness_app/model/model.dart';
import 'package:fitness_app/services/api.dart';
import 'package:flutter/material.dart';

class Tprovider extends ChangeNotifier {
  int tap = 0;
  int index = 0;

  void updateTap(int a) {
    tap = a;
    notifyListeners();
  }

  void updateTab(int a) {
    index = a;
    notifyListeners();
  }
}

class DataProvider extends ChangeNotifier {
  List<PilatesInfo> pList = [];
  List<StretchingInfo> sList = [];
  List<CrossfitInfo> cList = [];
  List<YogaCategory> yList = [];

  Future<void> fetchAPIdata() async {
    pList = await APIservice().getPilatesInfo();

    sList = await APIservice().getStretchingInfo();

    cList = await APIservice().getCrossfitInfo();

    yList = await APIservice().getYoga();

    notifyListeners();
  }
}
