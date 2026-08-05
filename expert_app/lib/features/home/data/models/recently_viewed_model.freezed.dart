// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recently_viewed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecentlyViewedModel {

 String get type; String get id; String get title; String? get imageUrl; String get viewedAt;
/// Create a copy of RecentlyViewedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecentlyViewedModelCopyWith<RecentlyViewedModel> get copyWith => _$RecentlyViewedModelCopyWithImpl<RecentlyViewedModel>(this as RecentlyViewedModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecentlyViewedModel&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.viewedAt, viewedAt) || other.viewedAt == viewedAt));
}


@override
int get hashCode => Object.hash(runtimeType,type,id,title,imageUrl,viewedAt);

@override
String toString() {
  return 'RecentlyViewedModel(type: $type, id: $id, title: $title, imageUrl: $imageUrl, viewedAt: $viewedAt)';
}


}

/// @nodoc
abstract mixin class $RecentlyViewedModelCopyWith<$Res>  {
  factory $RecentlyViewedModelCopyWith(RecentlyViewedModel value, $Res Function(RecentlyViewedModel) _then) = _$RecentlyViewedModelCopyWithImpl;
@useResult
$Res call({
 String type, String id, String title, String? imageUrl, String viewedAt
});




}
/// @nodoc
class _$RecentlyViewedModelCopyWithImpl<$Res>
    implements $RecentlyViewedModelCopyWith<$Res> {
  _$RecentlyViewedModelCopyWithImpl(this._self, this._then);

  final RecentlyViewedModel _self;
  final $Res Function(RecentlyViewedModel) _then;

/// Create a copy of RecentlyViewedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,Object? title = null,Object? imageUrl = freezed,Object? viewedAt = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,viewedAt: null == viewedAt ? _self.viewedAt : viewedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RecentlyViewedModel].
extension RecentlyViewedModelPatterns on RecentlyViewedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecentlyViewedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecentlyViewedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecentlyViewedModel value)  $default,){
final _that = this;
switch (_that) {
case _RecentlyViewedModel():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecentlyViewedModel value)?  $default,){
final _that = this;
switch (_that) {
case _RecentlyViewedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String id,  String title,  String? imageUrl,  String viewedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecentlyViewedModel() when $default != null:
return $default(_that.type,_that.id,_that.title,_that.imageUrl,_that.viewedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String id,  String title,  String? imageUrl,  String viewedAt)  $default,) {final _that = this;
switch (_that) {
case _RecentlyViewedModel():
return $default(_that.type,_that.id,_that.title,_that.imageUrl,_that.viewedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String id,  String title,  String? imageUrl,  String viewedAt)?  $default,) {final _that = this;
switch (_that) {
case _RecentlyViewedModel() when $default != null:
return $default(_that.type,_that.id,_that.title,_that.imageUrl,_that.viewedAt);case _:
  return null;

}
}

}

/// @nodoc


class _RecentlyViewedModel extends RecentlyViewedModel {
  const _RecentlyViewedModel({required this.type, required this.id, required this.title, this.imageUrl, required this.viewedAt}): super._();
  

@override final  String type;
@override final  String id;
@override final  String title;
@override final  String? imageUrl;
@override final  String viewedAt;

/// Create a copy of RecentlyViewedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecentlyViewedModelCopyWith<_RecentlyViewedModel> get copyWith => __$RecentlyViewedModelCopyWithImpl<_RecentlyViewedModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecentlyViewedModel&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.viewedAt, viewedAt) || other.viewedAt == viewedAt));
}


@override
int get hashCode => Object.hash(runtimeType,type,id,title,imageUrl,viewedAt);

@override
String toString() {
  return 'RecentlyViewedModel(type: $type, id: $id, title: $title, imageUrl: $imageUrl, viewedAt: $viewedAt)';
}


}

/// @nodoc
abstract mixin class _$RecentlyViewedModelCopyWith<$Res> implements $RecentlyViewedModelCopyWith<$Res> {
  factory _$RecentlyViewedModelCopyWith(_RecentlyViewedModel value, $Res Function(_RecentlyViewedModel) _then) = __$RecentlyViewedModelCopyWithImpl;
@override @useResult
$Res call({
 String type, String id, String title, String? imageUrl, String viewedAt
});




}
/// @nodoc
class __$RecentlyViewedModelCopyWithImpl<$Res>
    implements _$RecentlyViewedModelCopyWith<$Res> {
  __$RecentlyViewedModelCopyWithImpl(this._self, this._then);

  final _RecentlyViewedModel _self;
  final $Res Function(_RecentlyViewedModel) _then;

/// Create a copy of RecentlyViewedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? title = null,Object? imageUrl = freezed,Object? viewedAt = null,}) {
  return _then(_RecentlyViewedModel(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,viewedAt: null == viewedAt ? _self.viewedAt : viewedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
