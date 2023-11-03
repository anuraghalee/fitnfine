import 'package:flutter/material.dart';

class PersonalData extends ChangeNotifier {
  String? name;
  String? gender;
  String? dob;
  String? height;
  String? weight;

  PersonalData({this.name = '', this.gender = '', this.dob = '', this.height = '', this.weight = ''});

  void updatename(String a) {
    name = a;
    notifyListeners();
  }

  void updategender(String a) {
    gender = a;
    notifyListeners();
  }

  void updatedob(String a) {
    dob = a;
    notifyListeners();
  }

  void updateheight(String a) {
    height = a;
    notifyListeners();
  }

  void updateweight(String a) {
    weight = a;
    notifyListeners();
  }
}
