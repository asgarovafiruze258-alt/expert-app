// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectItemModel {

 String get id; String get projectId; String get itemType; String get label; double get estimatedCost; double? get actualCost;
/// Create a copy of ProjectItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectItemModelCopyWith<ProjectItemModel> get copyWith => _$ProjectItemModelCopyWithImpl<ProjectItemModel>(this as ProjectItemModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.itemType, itemType) || other.itemType == itemType)&&(identical(other.label, label) || other.label == label)&&(identical(other.estimatedCost, estimatedCost) || other.estimatedCost == estimatedCost)&&(identical(other.actualCost, actualCost) || other.actualCost == actualCost));
}


@override
int get hashCode => Object.hash(runtimeType,id,projectId,itemType,label,estimatedCost,actualCost);

@override
String toString() {
  return 'ProjectItemModel(id: $id, projectId: $projectId, itemType: $itemType, label: $label, estimatedCost: $estimatedCost, actualCost: $actualCost)';
}


}

/// @nodoc
abstract mixin class $ProjectItemModelCopyWith<$Res>  {
  factory $ProjectItemModelCopyWith(ProjectItemModel value, $Res Function(ProjectItemModel) _then) = _$ProjectItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String projectId, String itemType, String label, double estimatedCost, double? actualCost
});




}
/// @nodoc
class _$ProjectItemModelCopyWithImpl<$Res>
    implements $ProjectItemModelCopyWith<$Res> {
  _$ProjectItemModelCopyWithImpl(this._self, this._then);

  final ProjectItemModel _self;
  final $Res Function(ProjectItemModel) _then;

/// Create a copy of ProjectItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = null,Object? itemType = null,Object? label = null,Object? estimatedCost = null,Object? actualCost = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,itemType: null == itemType ? _self.itemType : itemType // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,estimatedCost: null == estimatedCost ? _self.estimatedCost : estimatedCost // ignore: cast_nullable_to_non_nullable
as double,actualCost: freezed == actualCost ? _self.actualCost : actualCost // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectItemModel].
extension ProjectItemModelPatterns on ProjectItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjectItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String projectId,  String itemType,  String label,  double estimatedCost,  double? actualCost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectItemModel() when $default != null:
return $default(_that.id,_that.projectId,_that.itemType,_that.label,_that.estimatedCost,_that.actualCost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String projectId,  String itemType,  String label,  double estimatedCost,  double? actualCost)  $default,) {final _that = this;
switch (_that) {
case _ProjectItemModel():
return $default(_that.id,_that.projectId,_that.itemType,_that.label,_that.estimatedCost,_that.actualCost);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String projectId,  String itemType,  String label,  double estimatedCost,  double? actualCost)?  $default,) {final _that = this;
switch (_that) {
case _ProjectItemModel() when $default != null:
return $default(_that.id,_that.projectId,_that.itemType,_that.label,_that.estimatedCost,_that.actualCost);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectItemModel extends ProjectItemModel {
  const _ProjectItemModel({required this.id, required this.projectId, required this.itemType, required this.label, required this.estimatedCost, this.actualCost}): super._();
  

@override final  String id;
@override final  String projectId;
@override final  String itemType;
@override final  String label;
@override final  double estimatedCost;
@override final  double? actualCost;

/// Create a copy of ProjectItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectItemModelCopyWith<_ProjectItemModel> get copyWith => __$ProjectItemModelCopyWithImpl<_ProjectItemModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.itemType, itemType) || other.itemType == itemType)&&(identical(other.label, label) || other.label == label)&&(identical(other.estimatedCost, estimatedCost) || other.estimatedCost == estimatedCost)&&(identical(other.actualCost, actualCost) || other.actualCost == actualCost));
}


@override
int get hashCode => Object.hash(runtimeType,id,projectId,itemType,label,estimatedCost,actualCost);

@override
String toString() {
  return 'ProjectItemModel(id: $id, projectId: $projectId, itemType: $itemType, label: $label, estimatedCost: $estimatedCost, actualCost: $actualCost)';
}


}

/// @nodoc
abstract mixin class _$ProjectItemModelCopyWith<$Res> implements $ProjectItemModelCopyWith<$Res> {
  factory _$ProjectItemModelCopyWith(_ProjectItemModel value, $Res Function(_ProjectItemModel) _then) = __$ProjectItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String projectId, String itemType, String label, double estimatedCost, double? actualCost
});




}
/// @nodoc
class __$ProjectItemModelCopyWithImpl<$Res>
    implements _$ProjectItemModelCopyWith<$Res> {
  __$ProjectItemModelCopyWithImpl(this._self, this._then);

  final _ProjectItemModel _self;
  final $Res Function(_ProjectItemModel) _then;

/// Create a copy of ProjectItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = null,Object? itemType = null,Object? label = null,Object? estimatedCost = null,Object? actualCost = freezed,}) {
  return _then(_ProjectItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,itemType: null == itemType ? _self.itemType : itemType // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,estimatedCost: null == estimatedCost ? _self.estimatedCost : estimatedCost // ignore: cast_nullable_to_non_nullable
as double,actualCost: freezed == actualCost ? _self.actualCost : actualCost // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
