// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shows.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Shows {

  String get name;

  String get permalink;

  String get end_date;

  String get network;

  String get image_thumbnail_path;

  String get status;

  /// Create a copy of Shows
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShowsCopyWith<Shows> get copyWith => _$ShowsCopyWithImpl<Shows>(this as Shows, _$identity);

  /// Serializes this Shows to a JSON map.
  Map<String, dynamic> toJson();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Shows && (identical(other.name, name) || other.name == name) &&
            (identical(other.permalink, permalink) || other.permalink == permalink) &&
            (identical(other.end_date, end_date) || other.end_date == end_date) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.image_thumbnail_path, image_thumbnail_path) || other.image_thumbnail_path == image_thumbnail_path) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(
          runtimeType,
          name,
          permalink,
          end_date,
          network,
          image_thumbnail_path,
          status);

  @override
  String toString() {
    return 'Shows(name: $name, permalink: $permalink, end_date: $end_date, network: $network, image_thumbnail_path: $image_thumbnail_path, status: $status)';
  }


}

/// @nodoc
abstract mixin class $ShowsCopyWith<$Res> {
  factory $ShowsCopyWith(Shows value, $Res Function(Shows) _then) = _$ShowsCopyWithImpl;

  @useResult
  $Res call({
    String name, String permalink, String end_date, String network, String image_thumbnail_path, String status
  });


}

/// @nodoc
class _$ShowsCopyWithImpl<$Res>
    implements $ShowsCopyWith<$Res> {
  _$ShowsCopyWithImpl(this._self, this._then);

  final Shows _self;
  final $Res Function(Shows) _then;

  /// Create a copy of Shows
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call(
      {Object? name = null, Object? permalink = null, Object? end_date = null, Object? network = null, Object? image_thumbnail_path = null, Object? status = null,}) {
    return _then(_self.copyWith(
      name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
      as String,
      permalink: null == permalink ? _self.permalink : permalink // ignore: cast_nullable_to_non_nullable
      as String,
      end_date: null == end_date ? _self.end_date : end_date // ignore: cast_nullable_to_non_nullable
      as String,
      network: null == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
      as String,
      image_thumbnail_path: null == image_thumbnail_path
          ? _self.image_thumbnail_path
          : image_thumbnail_path // ignore: cast_nullable_to_non_nullable
      as String,
      status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
      as String,
    ));
  }

}


/// Adds pattern-matching-related methods to [Shows].
extension ShowsPatterns on Shows {
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

  @optionalTypeArgs TResult maybeMap

  <

  TResult

  extends

  Object?

  >

  (

  TResult Function( _Shows value)? $default,{required TResult orElse(),}){
  final _that = this;
  switch (_that) {
  case _Shows() when $default != null:
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

  @optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Shows value) $default,){
  final _that = this;
  switch (_that) {
  case _Shows():
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

  @optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Shows value)? $default,){
  final _that = this;
  switch (_that) {
  case _Shows() when $default != null:
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

  @optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, String permalink, String end_date, String network, String image_thumbnail_path, String status)? $default,{required TResult orElse(),}) {final _that = this;
  switch (_that) {
  case _Shows() when $default != null:
  return $default(_that.name,_that.permalink,_that.end_date,_that.network,_that.image_thumbnail_path,_that.status);case _:
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

  @optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, String permalink, String end_date, String network, String image_thumbnail_path, String status) $default,) {final _that = this;
  switch (_that) {
  case _Shows():
  return $default(_that.name,_that.permalink,_that.end_date,_that.network,_that.image_thumbnail_path,_that.status);case _:
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

  @optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, String permalink, String end_date, String network, String image_thumbnail_path, String status)? $default,) {final _that = this;
  switch (_that) {
  case _Shows() when $default != null:
  return $default(_that.name,_that.permalink,_that.end_date,_that.network,_that.image_thumbnail_path,_that.status);case _:
  return null;

  }
  }

}

/// @nodoc
@JsonSerializable()
class _Shows implements Shows {
  _Shows({this.name = '', this.permalink = '', this.end_date = '', this.network = '', this.image_thumbnail_path = '', this.status = ''});

  factory _Shows.fromJson(Map<String, dynamic> json) => _$ShowsFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String permalink;
  @override
  @JsonKey()
  final String end_date;
  @override
  @JsonKey()
  final String network;
  @override
  @JsonKey()
  final String image_thumbnail_path;
  @override
  @JsonKey()
  final String status;

  /// Create a copy of Shows
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShowsCopyWith<_Shows> get copyWith => __$ShowsCopyWithImpl<_Shows>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ShowsToJson(this,);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Shows && (identical(other.name, name) || other.name == name) &&
            (identical(other.permalink, permalink) || other.permalink == permalink) &&
            (identical(other.end_date, end_date) || other.end_date == end_date) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.image_thumbnail_path, image_thumbnail_path) || other.image_thumbnail_path == image_thumbnail_path) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(
          runtimeType,
          name,
          permalink,
          end_date,
          network,
          image_thumbnail_path,
          status);

  @override
  String toString() {
    return 'Shows(name: $name, permalink: $permalink, end_date: $end_date, network: $network, image_thumbnail_path: $image_thumbnail_path, status: $status)';
  }


}

/// @nodoc
abstract mixin class _$ShowsCopyWith<$Res> implements $ShowsCopyWith<$Res> {
  factory _$ShowsCopyWith(_Shows value, $Res Function(_Shows) _then) = __$ShowsCopyWithImpl;

  @override
  @useResult
  $Res call({
    String name, String permalink, String end_date, String network, String image_thumbnail_path, String status
  });


}

/// @nodoc
class __$ShowsCopyWithImpl<$Res>
    implements _$ShowsCopyWith<$Res> {
  __$ShowsCopyWithImpl(this._self, this._then);

  final _Shows _self;
  final $Res Function(_Shows) _then;

  /// Create a copy of Shows
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call(
      {Object? name = null, Object? permalink = null, Object? end_date = null, Object? network = null, Object? image_thumbnail_path = null, Object? status = null,}) {
    return _then(_Shows(
      name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
      as String,
      permalink: null == permalink ? _self.permalink : permalink // ignore: cast_nullable_to_non_nullable
      as String,
      end_date: null == end_date ? _self.end_date : end_date // ignore: cast_nullable_to_non_nullable
      as String,
      network: null == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
      as String,
      image_thumbnail_path: null == image_thumbnail_path
          ? _self.image_thumbnail_path
          : image_thumbnail_path // ignore: cast_nullable_to_non_nullable
      as String,
      status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
      as String,
    ));
  }


}

// dart format on
