// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseInfo _$ExerciseInfoFromJson(Map<String, dynamic> json) => ExerciseInfo(
      json['bodyPart'] as String,
      json['equipment'] as String,
      json['gifUrl'] as String,
      json['id'] as String,
      json['name'] as String,
      json['target'] as String,
      (json['secondaryMuscles'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      (json['instructions'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ExerciseInfoToJson(ExerciseInfo instance) =>
    <String, dynamic>{
      'bodyPart': instance.bodyPart,
      'equipment': instance.equipment,
      'gifUrl': instance.gifUrl,
      'id': instance.id,
      'name': instance.name,
      'target': instance.target,
      'secondaryMuscles': instance.secondaryMuscles,
      'instructions': instance.instructions,
    };

PilatesInfo _$PilatesInfoFromJson(Map<String, dynamic> json) => PilatesInfo(
      json['name'] as String,
      json['level'] as String,
      (json['primaryMuscles'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      (json['instructions'] as List<dynamic>).map((e) => e as String).toList(),
      (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PilatesInfoToJson(PilatesInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'level': instance.level,
      'primaryMuscles': instance.primaryMuscles,
      'instructions': instance.instructions,
      'images': instance.images,
    };

StretchingInfo _$StretchingInfoFromJson(Map<String, dynamic> json) =>
    StretchingInfo(
      json['name'] as String,
      json['level'] as String,
      (json['primaryMuscles'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      (json['instructions'] as List<dynamic>).map((e) => e as String).toList(),
      (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$StretchingInfoToJson(StretchingInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'level': instance.level,
      'primaryMuscles': instance.primaryMuscles,
      'instructions': instance.instructions,
      'images': instance.images,
    };

CrossfitInfo _$CrossfitInfoFromJson(Map<String, dynamic> json) => CrossfitInfo(
      json['name'] as String,
      json['level'] as String,
      (json['primaryMuscles'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      (json['instructions'] as List<dynamic>).map((e) => e as String).toList(),
      (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CrossfitInfoToJson(CrossfitInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'level': instance.level,
      'primaryMuscles': instance.primaryMuscles,
      'instructions': instance.instructions,
      'images': instance.images,
    };

YogaCategory _$YogaCategoryFromJson(Map<String, dynamic> json) => YogaCategory(
      json['category_name'] as String,
      json['category_description'] as String,
      (json['poses'] as List<dynamic>)
          .map((e) => Yoga.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$YogaCategoryToJson(YogaCategory instance) =>
    <String, dynamic>{
      'category_name': instance.category_name,
      'category_description': instance.category_description,
      'poses': instance.poses,
    };

Yoga _$YogaFromJson(Map<String, dynamic> json) => Yoga(
      json['category_name'] as String,
      json['english_name'] as String,
      json['pose_description'] as String,
      json['pose_benefits'] as String,
      json['url_png'] as String,
    );

Map<String, dynamic> _$YogaToJson(Yoga instance) => <String, dynamic>{
      'category_name': instance.category_name,
      'english_name': instance.english_name,
      'pose_description': instance.pose_description,
      'pose_benefits': instance.pose_benefits,
      'url_png': instance.url_png,
    };
