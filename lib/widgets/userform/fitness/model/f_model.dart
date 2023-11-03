import 'package:flutter/material.dart';

class FitnessModel extends ChangeNotifier {
  String? fitnessGoal;
  String? activityLevel;
  String? fitnesslevel;
  String? workoutType;
  String? fitnessEquip;

  FitnessModel({this.fitnessGoal = '', this.activityLevel = '', this.fitnesslevel = '', this.workoutType = '', this.fitnessEquip = ''});

  void updateFitnessGoal(String a) {
    fitnessGoal = a;
    notifyListeners();
  }

  void updateactivityLevel(String a) {
    activityLevel = a;
    notifyListeners();
  }

  void updateFitnessLevel(String a) {
    fitnesslevel = a;
    notifyListeners();
  }

  void updateWorkoutType(String a) {
    workoutType = a;
    notifyListeners();
  }

  void updateFitnessEquipGoal(String a) {
    fitnessEquip = a;
    notifyListeners();
  }
}
