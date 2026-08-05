// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_estimate_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BudgetEstimateItemEntity {

 ProjectItemType get itemType; String get label; double get estimatedCost;
/// Create a copy of BudgetEstimateItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetEstimateItemEntityCopyWith<BudgetEstimateItemEntity> get copyWith => _$BudgetEstimateItemEntityCopyWithImpl<BudgetEstimateItemEntity>(this as BudgetEstimateItemEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetEstimateItemEntity&&(identical(other.itemType, itemType) || other.itemType == itemType)&&(identical(other.label, label) || other.label == label)&&(identical(other.estimatedCost, estimatedCost) || other.estimatedCost == estimatedCost));
}


@override
int get hashCode => Object.hash(runtimeType,itemType,label,estimatedCost);

@override
String toString() {
  return 'BudgetEstimateItemEntity(itemType: $itemType, label: $label, estimatedCost: $estimatedCost)';
}


}

/// @nodoc
abstract mixin class $BudgetEstimateItemEntityCopyWith<$Res>  {
  factory $BudgetEstimateItemEntityCopyWith(BudgetEstimateItemEntity value, $Res Function(BudgetEstimateItemEntity) _then) = _$BudgetEstimateItemEntityCopyWithImpl;
@useResult
$Res call({
 ProjectItemType itemType, String label, double estimatedCost
});




}
/// @nodoc
class _$BudgetEstimateItemEntityCopyWithImpl<$Res>
    implements $BudgetEstimateItemEntityCopyWith<$Res> {
  _$BudgetEstimateItemEntityCopyWithImpl(this._self, this._then);

  final BudgetEstimateItemEntity _self;
  final $Res Function(BudgetEstimateItemEntity) _then;

/// Create a copy of BudgetEstimateItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemType = null,Object? label = null,Object? estimatedCost = null,}) {
  return _then(_self.copyWith(
itemType: null == itemType ? _self.itemType : itemType // ignore: cast_nullable_to_non_nullable
as ProjectItemType,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,estimatedCost: null == estimatedCost ? _self.estimatedCost : estimatedCost // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BudgetEstimateItemEntity].
extension BudgetEstimateItemEntityPatterns on BudgetEstimateItemEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BudgetEstimateItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BudgetEstimateItemEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BudgetEstimateItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _BudgetEstimateItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BudgetEstimateItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BudgetEstimateItemEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProjectItemType itemType,  String label,  double estimatedCost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BudgetEstimateItemEntity() when $default != null:
return $default(_that.itemType,_that.label,_that.estimatedCost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProjectItemType itemType,  String label,  double estimatedCost)  $default,) {final _that = this;
switch (_that) {
case _BudgetEstimateItemEntity():
return $default(_that.itemType,_that.label,_that.estimatedCost);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProjectItemType itemType,  String label,  double estimatedCost)?  $default,) {final _that = this;
switch (_that) {
case _BudgetEstimateItemEntity() when $default != null:
return $default(_that.itemType,_that.label,_that.estimatedCost);case _:
  return null;

}
}

}

/// @nodoc


class _BudgetEstimateItemEntity implements BudgetEstimateItemEntity {
  const _BudgetEstimateItemEntity({required this.itemType, required this.label, required this.estimatedCost});
  

@override final  ProjectItemType itemType;
@override final  String label;
@override final  double estimatedCost;

/// Create a copy of BudgetEstimateItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetEstimateItemEntityCopyWith<_BudgetEstimateItemEntity> get copyWith => __$BudgetEstimateItemEntityCopyWithImpl<_BudgetEstimateItemEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BudgetEstimateItemEntity&&(identical(other.itemType, itemType) || other.itemType == itemType)&&(identical(other.label, label) || other.label == label)&&(identical(other.estimatedCost, estimatedCost) || other.estimatedCost == estimatedCost));
}


@override
int get hashCode => Object.hash(runtimeType,itemType,label,estimatedCost);

@override
String toString() {
  return 'BudgetEstimateItemEntity(itemType: $itemType, label: $label, estimatedCost: $estimatedCost)';
}


}

/// @nodoc
abstract mixin class _$BudgetEstimateItemEntityCopyWith<$Res> implements $BudgetEstimateItemEntityCopyWith<$Res> {
  factory _$BudgetEstimateItemEntityCopyWith(_BudgetEstimateItemEntity value, $Res Function(_BudgetEstimateItemEntity) _then) = __$BudgetEstimateItemEntityCopyWithImpl;
@override @useResult
$Res call({
 ProjectItemType itemType, String label, double estimatedCost
});




}
/// @nodoc
class __$BudgetEstimateItemEntityCopyWithImpl<$Res>
    implements _$BudgetEstimateItemEntityCopyWith<$Res> {
  __$BudgetEstimateItemEntityCopyWithImpl(this._self, this._then);

  final _BudgetEstimateItemEntity _self;
  final $Res Function(_BudgetEstimateItemEntity) _then;

/// Create a copy of BudgetEstimateItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemType = null,Object? label = null,Object? estimatedCost = null,}) {
  return _then(_BudgetEstimateItemEntity(
itemType: null == itemType ? _self.itemType : itemType // ignore: cast_nullable_to_non_nullable
as ProjectItemType,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,estimatedCost: null == estimatedCost ? _self.estimatedCost : estimatedCost // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$BudgetEstimateEntity {

 double get estimatedBudget; List<BudgetEstimateItemEntity> get items;
/// Create a copy of BudgetEstimateEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetEstimateEntityCopyWith<BudgetEstimateEntity> get copyWith => _$BudgetEstimateEntityCopyWithImpl<BudgetEstimateEntity>(this as BudgetEstimateEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetEstimateEntity&&(identical(other.estimatedBudget, estimatedBudget) || other.estimatedBudget == estimatedBudget)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,estimatedBudget,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'BudgetEstimateEntity(estimatedBudget: $estimatedBudget, items: $items)';
}


}

/// @nodoc
abstract mixin class $BudgetEstimateEntityCopyWith<$Res>  {
  factory $BudgetEstimateEntityCopyWith(BudgetEstimateEntity value, $Res Function(BudgetEstimateEntity) _then) = _$BudgetEstimateEntityCopyWithImpl;
@useResult
$Res call({
 double estimatedBudget, List<BudgetEstimateItemEntity> items
});




}
/// @nodoc
class _$BudgetEstimateEntityCopyWithImpl<$Res>
    implements $BudgetEstimateEntityCopyWith<$Res> {
  _$BudgetEstimateEntityCopyWithImpl(this._self, this._then);

  final BudgetEstimateEntity _self;
  final $Res Function(BudgetEstimateEntity) _then;

/// Create a copy of BudgetEstimateEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? estimatedBudget = null,Object? items = null,}) {
  return _then(_self.copyWith(
estimatedBudget: null == estimatedBudget ? _self.estimatedBudget : estimatedBudget // ignore: cast_nullable_to_non_nullable
as double,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<BudgetEstimateItemEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [BudgetEstimateEntity].
extension BudgetEstimateEntityPatterns on BudgetEstimateEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BudgetEstimateEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BudgetEstimateEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BudgetEstimateEntity value)  $default,){
final _that = this;
switch (_that) {
case _BudgetEstimateEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BudgetEstimateEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BudgetEstimateEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double estimatedBudget,  List<BudgetEstimateItemEntity> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BudgetEstimateEntity() when $default != null:
return $default(_that.estimatedBudget,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double estimatedBudget,  List<BudgetEstimateItemEntity> items)  $default,) {final _that = this;
switch (_that) {
case _BudgetEstimateEntity():
return $default(_that.estimatedBudget,_that.items);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double estimatedBudget,  List<BudgetEstimateItemEntity> items)?  $default,) {final _that = this;
switch (_that) {
case _BudgetEstimateEntity() when $default != null:
return $default(_that.estimatedBudget,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _BudgetEstimateEntity implements BudgetEstimateEntity {
  const _BudgetEstimateEntity({required this.estimatedBudget, required final  List<BudgetEstimateItemEntity> items}): _items = items;
  

@override final  double estimatedBudget;
 final  List<BudgetEstimateItemEntity> _items;
@override List<BudgetEstimateItemEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of BudgetEstimateEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetEstimateEntityCopyWith<_BudgetEstimateEntity> get copyWith => __$BudgetEstimateEntityCopyWithImpl<_BudgetEstimateEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BudgetEstimateEntity&&(identical(other.estimatedBudget, estimatedBudget) || other.estimatedBudget == estimatedBudget)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,estimatedBudget,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'BudgetEstimateEntity(estimatedBudget: $estimatedBudget, items: $items)';
}


}

/// @nodoc
abstract mixin class _$BudgetEstimateEntityCopyWith<$Res> implements $BudgetEstimateEntityCopyWith<$Res> {
  factory _$BudgetEstimateEntityCopyWith(_BudgetEstimateEntity value, $Res Function(_BudgetEstimateEntity) _then) = __$BudgetEstimateEntityCopyWithImpl;
@override @useResult
$Res call({
 double estimatedBudget, List<BudgetEstimateItemEntity> items
});




}
/// @nodoc
class __$BudgetEstimateEntityCopyWithImpl<$Res>
    implements _$BudgetEstimateEntityCopyWith<$Res> {
  __$BudgetEstimateEntityCopyWithImpl(this._self, this._then);

  final _BudgetEstimateEntity _self;
  final $Res Function(_BudgetEstimateEntity) _then;

/// Create a copy of BudgetEstimateEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? estimatedBudget = null,Object? items = null,}) {
  return _then(_BudgetEstimateEntity(
estimatedBudget: null == estimatedBudget ? _self.estimatedBudget : estimatedBudget // ignore: cast_nullable_to_non_nullable
as double,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<BudgetEstimateItemEntity>,
  ));
}


}

// dart format on
