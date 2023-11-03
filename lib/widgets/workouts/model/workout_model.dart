import 'package:fitness_app/model/model.dart';

class WorkoutModel {
  List<ExerciseInfo> getModelExercises(List a) {
    List<ExerciseInfo> rList = [];
    for (var i in a) {
      rList.add(ExerciseInfo.fromJson(i));
    }

    return rList;
  }

  Map<String, List<String>> desc = {
    'Chest': [
      "Desire to have toned pecs? Stop making wwishing lists, let's do it now! Here is a well-designed chest workout plan for you to build a muscular chest effectively.",
      "This plan targets the upper,mid & lower chest,as well as the inner & outer chest. Feel free to customize your reps, sets and rest time to fit your fitness level. Just go for it!",
    ],
    'Back': [
      "Want your body to look strong and big? Exercising back muscles is a must. Join this back workout plan to practice various customized movements and get a perfect back in no time!",
      "From trapezius to lats, multiple muscles in your upper, mid & lower back are targeted throughout this plan. Feel free to customize your reps, sets, and rest time to fit your fitness level.",
    ],
    'Arm': [
      "Got arm envy? Follow this workout plan to get wider and thicker arms in no time!",
      "It includes various movements that help you fully exercise your arm muscles and bild big biceps, triceps and forearms. Feel free to customize your reps, sets and rest time to fit your fitness level."
    ],
    'Shoulders': [
      "Wish to widen your shoulders fast? Join this workout plan and grow your shoulder like crazy!",
      "This plan brings up your front, middle, and rear delts, tones your rotator cuff, stabilizes your shoulder joint, and significantly strengthens your shoulders. Feel free to customize your reps, sets, and rest time to fit your fitness level."
    ],
    'LowerBody': [
      "This plan is a must-have for you to shred every muscle in your lower body. Great compound exercises for gaining strength and fat loss are collected to make your sweat session more efficient.",
      "You'll work with weights and resistance machines to maximize the venefits. Feel free to customize your reps, sets and rest time to fit your fitness level."
    ],
    'FullBody': [
      "Are you ready to become the strongest version of yourself> Welcome to this full-body plan to build muscle, burn fat and fit into your busy schedule.",
      "Whatever you need, we have compound exercises to hit all your major muscle groups: chest, arms, back, legs, etc. Feel free to cutomize your reps, sets and rest time to fit your fitness level."
    ],
    'UpperBody': [
      "Ready to set your upper body on fire? Use the best workout plan for men to build a sturdy upper body! It incorporates bodyweight exercises and equipment to make your shirtless look better.",
      "The plan works your chest, shoulders, back, trapezius, and arms, stripping away excess body fat and gaining significant muscle mass in your upper body. Feel free to customize your reps, sets, and rest time to fit your fitness level.",
    ],
    'Abs': [
      "Think of the time when everyone envies your perfectly sculpted six-pack. Getting your abs in shape is never too late, and the only thin you need to do is follow this workout plan.",
      "It strengthens your upper & lower abs and tones your external obliques. Feel free to customize your reps, sets, and rest time to fit your fintess level.",
    ],
  };
}
