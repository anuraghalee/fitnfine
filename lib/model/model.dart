// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class ExerciseInfo {
  final String bodyPart;
  final String equipment;
  final String gifUrl;
  final String id;
  final String name;
  final String target;
  final List<String> secondaryMuscles;
  final List<String> instructions;

  ExerciseInfo(this.bodyPart, this.equipment, this.gifUrl, this.id, this.name, this.target, this.secondaryMuscles, this.instructions);

  factory ExerciseInfo.fromJson(Map<String, dynamic> json) => _$ExerciseInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseInfoToJson(this);
}

@JsonSerializable()
class PilatesInfo {
  final String name;
  final String level;
  final List<String> primaryMuscles;
  final List<String> instructions;
  final List<String> images;

  PilatesInfo(this.name, this.level, this.primaryMuscles, this.instructions, this.images);

  factory PilatesInfo.fromJson(Map<String, dynamic> json) => _$PilatesInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PilatesInfoToJson(this);
}

@JsonSerializable()
class StretchingInfo {
  final String name;
  final String level;
  final List<String> primaryMuscles;
  final List<String> instructions;
  final List<String> images;

  StretchingInfo(this.name, this.level, this.primaryMuscles, this.instructions, this.images);

  factory StretchingInfo.fromJson(Map<String, dynamic> json) => _$StretchingInfoFromJson(json);
  Map<String, dynamic> toJson() => _$StretchingInfoToJson(this);
}

@JsonSerializable()
class CrossfitInfo {
  final String name;
  final String level;
  final List<String> primaryMuscles;
  final List<String> instructions;
  final List<String> images;

  CrossfitInfo(this.name, this.level, this.primaryMuscles, this.instructions, this.images);

  factory CrossfitInfo.fromJson(Map<String, dynamic> json) => _$CrossfitInfoFromJson(json);
  Map<String, dynamic> toJson() => _$CrossfitInfoToJson(this);
}

@JsonSerializable()
class YogaCategory {
  final String category_name;
  final String category_description;
  final List<Yoga> poses;

  YogaCategory(this.category_name, this.category_description, this.poses);

  factory YogaCategory.fromJson(Map<String, dynamic> json) => _$YogaCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$YogaCategoryToJson(this);
}

@JsonSerializable()
class Yoga {
  final String category_name;
  final String english_name;
  final String pose_description;
  final String pose_benefits;
  final String url_png;

  Yoga(this.category_name, this.english_name, this.pose_description, this.pose_benefits, this.url_png);
  factory Yoga.fromJson(Map<String, dynamic> json) => _$YogaFromJson(json);
  Map<String, dynamic> toJson() => _$YogaToJson(this);
}
