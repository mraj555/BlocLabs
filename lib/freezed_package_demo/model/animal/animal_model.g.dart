// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnimalModel _$AnimalModelFromJson(Map<String, dynamic> json) => _AnimalModel(
  name: json['name'] as String? ?? '',
  age: (json['age'] as num?)?.toInt() ?? 0,
  petName:
      (json['petName'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$AnimalModelToJson(_AnimalModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'petName': instance.petName,
    };
