///Model class without using freezed package (we have to write all this method manually)
class PersonModel {
  String? name;

  PersonModel({this.name});

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is PersonModel && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;

  PersonModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }

  PersonModel copyWith({String? name}) => PersonModel(name: name ?? this.name);

  @override
  String toString() {
    return 'Person(name: $name)';
  }
}
