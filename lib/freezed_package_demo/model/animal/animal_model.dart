import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal_model.freezed.dart';

part 'animal_model.g.dart';

@freezed
abstract class AnimalModel with _$AnimalModel {
  const factory AnimalModel({@Default('') String name, @Default(0) int age, @Default([]) List<String> petName}) = _AnimalModel;

  factory AnimalModel.fromJson(Map<String, dynamic> json) => _$AnimalModelFromJson(json);
}
