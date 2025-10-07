// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'animal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnimalModel {

 String get name; int get age; List<String> get petName;
/// Create a copy of AnimalModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnimalModelCopyWith<AnimalModel> get copyWith => _$AnimalModelCopyWithImpl<AnimalModel>(this as AnimalModel, _$identity);

  /// Serializes this AnimalModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnimalModel&&(identical(other.name, name) || other.name == name)&&(identical(other.age, age) || other.age == age)&&const DeepCollectionEquality().equals(other.petName, petName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,age,const DeepCollectionEquality().hash(petName));

@override
String toString() {
  return 'AnimalModel(name: $name, age: $age, petName: $petName)';
}


}

/// @nodoc
abstract mixin class $AnimalModelCopyWith<$Res>  {
  factory $AnimalModelCopyWith(AnimalModel value, $Res Function(AnimalModel) _then) = _$AnimalModelCopyWithImpl;
@useResult
$Res call({
 String name, int age, List<String> petName
});




}
/// @nodoc
class _$AnimalModelCopyWithImpl<$Res>
    implements $AnimalModelCopyWith<$Res> {
  _$AnimalModelCopyWithImpl(this._self, this._then);

  final AnimalModel _self;
  final $Res Function(AnimalModel) _then;

/// Create a copy of AnimalModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? age = null,Object? petName = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,petName: null == petName ? _self.petName : petName // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [AnimalModel].
extension AnimalModelPatterns on AnimalModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnimalModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnimalModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnimalModel value)  $default,){
final _that = this;
switch (_that) {
case _AnimalModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnimalModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnimalModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int age,  List<String> petName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnimalModel() when $default != null:
return $default(_that.name,_that.age,_that.petName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int age,  List<String> petName)  $default,) {final _that = this;
switch (_that) {
case _AnimalModel():
return $default(_that.name,_that.age,_that.petName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int age,  List<String> petName)?  $default,) {final _that = this;
switch (_that) {
case _AnimalModel() when $default != null:
return $default(_that.name,_that.age,_that.petName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnimalModel implements AnimalModel {
  const _AnimalModel({this.name = '', this.age = 0, final  List<String> petName = const []}): _petName = petName;
  factory _AnimalModel.fromJson(Map<String, dynamic> json) => _$AnimalModelFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  int age;
 final  List<String> _petName;
@override@JsonKey() List<String> get petName {
  if (_petName is EqualUnmodifiableListView) return _petName;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_petName);
}


/// Create a copy of AnimalModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnimalModelCopyWith<_AnimalModel> get copyWith => __$AnimalModelCopyWithImpl<_AnimalModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnimalModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnimalModel&&(identical(other.name, name) || other.name == name)&&(identical(other.age, age) || other.age == age)&&const DeepCollectionEquality().equals(other._petName, _petName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,age,const DeepCollectionEquality().hash(_petName));

@override
String toString() {
  return 'AnimalModel(name: $name, age: $age, petName: $petName)';
}


}

/// @nodoc
abstract mixin class _$AnimalModelCopyWith<$Res> implements $AnimalModelCopyWith<$Res> {
  factory _$AnimalModelCopyWith(_AnimalModel value, $Res Function(_AnimalModel) _then) = __$AnimalModelCopyWithImpl;
@override @useResult
$Res call({
 String name, int age, List<String> petName
});




}
/// @nodoc
class __$AnimalModelCopyWithImpl<$Res>
    implements _$AnimalModelCopyWith<$Res> {
  __$AnimalModelCopyWithImpl(this._self, this._then);

  final _AnimalModel _self;
  final $Res Function(_AnimalModel) _then;

/// Create a copy of AnimalModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? age = null,Object? petName = null,}) {
  return _then(_AnimalModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,petName: null == petName ? _self._petName : petName // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
