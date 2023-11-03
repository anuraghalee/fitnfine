import 'package:fitness_app/common/decider.dart';
import 'package:fitness_app/widgets/home.dart';
import 'package:fitness_app/widgets/meal.dart';
import 'package:fitness_app/widgets/profile.dart';
import 'package:fitness_app/widgets/exercises.dart';

var appRoutes = {
  '/': (context) => const DeciderScreen(),
  'workout': (context) => const ExerciseScreen(eList: []),
  'home': (context) => const HomeScreen1(),
  // 'user': (context) => const UserScreen(),
  'meal': (context) => const MealScreen(),
};
