// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_stats_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdminStatsEntity {

 int get userCount; int get workerCount; int get pendingWorkerCount; int get shopCount; int get pendingShopCount; int get materialCount; int get orderCount;
/// Create a copy of AdminStatsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminStatsEntityCopyWith<AdminStatsEntity> get copyWith => _$AdminStatsEntityCopyWithImpl<AdminStatsEntity>(this as AdminStatsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminStatsEntity&&(identical(other.userCount, userCount) || other.userCount == userCount)&&(identical(other.workerCount, workerCount) || other.workerCount == workerCount)&&(identical(other.pendingWorkerCount, pendingWorkerCount) || other.pendingWorkerCount == pendingWorkerCount)&&(identical(other.shopCount, shopCount) || other.shopCount == shopCount)&&(identical(other.pendingShopCount, pendingShopCount) || other.pendingShopCount == pendingShopCount)&&(identical(other.materialCount, materialCount) || other.materialCount == materialCount)&&(identical(other.orderCount, orderCount) || other.orderCount == orderCount));
}


@override
int get hashCode => Object.hash(runtimeType,userCount,workerCount,pendingWorkerCount,shopCount,pendingShopCount,materialCount,orderCount);

@override
String toString() {
  return 'AdminStatsEntity(userCount: $userCount, workerCount: $workerCount, pendingWorkerCount: $pendingWorkerCount, shopCount: $shopCount, pendingShopCount: $pendingShopCount, materialCount: $materialCount, orderCount: $orderCount)';
}


}

/// @nodoc
abstract mixin class $AdminStatsEntityCopyWith<$Res>  {
  factory $AdminStatsEntityCopyWith(AdminStatsEntity value, $Res Function(AdminStatsEntity) _then) = _$AdminStatsEntityCopyWithImpl;
@useResult
$Res call({
 int userCount, int workerCount, int pendingWorkerCount, int shopCount, int pendingShopCount, int materialCount, int orderCount
});




}
/// @nodoc
class _$AdminStatsEntityCopyWithImpl<$Res>
    implements $AdminStatsEntityCopyWith<$Res> {
  _$AdminStatsEntityCopyWithImpl(this._self, this._then);

  final AdminStatsEntity _self;
  final $Res Function(AdminStatsEntity) _then;

/// Create a copy of AdminStatsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userCount = null,Object? workerCount = null,Object? pendingWorkerCount = null,Object? shopCount = null,Object? pendingShopCount = null,Object? materialCount = null,Object? orderCount = null,}) {
  return _then(_self.copyWith(
userCount: null == userCount ? _self.userCount : userCount // ignore: cast_nullable_to_non_nullable
as int,workerCount: null == workerCount ? _self.workerCount : workerCount // ignore: cast_nullable_to_non_nullable
as int,pendingWorkerCount: null == pendingWorkerCount ? _self.pendingWorkerCount : pendingWorkerCount // ignore: cast_nullable_to_non_nullable
as int,shopCount: null == shopCount ? _self.shopCount : shopCount // ignore: cast_nullable_to_non_nullable
as int,pendingShopCount: null == pendingShopCount ? _self.pendingShopCount : pendingShopCount // ignore: cast_nullable_to_non_nullable
as int,materialCount: null == materialCount ? _self.materialCount : materialCount // ignore: cast_nullable_to_non_nullable
as int,orderCount: null == orderCount ? _self.orderCount : orderCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminStatsEntity].
extension AdminStatsEntityPatterns on AdminStatsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminStatsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminStatsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminStatsEntity value)  $default,){
final _that = this;
switch (_that) {
case _AdminStatsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminStatsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AdminStatsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userCount,  int workerCount,  int pendingWorkerCount,  int shopCount,  int pendingShopCount,  int materialCount,  int orderCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminStatsEntity() when $default != null:
return $default(_that.userCount,_that.workerCount,_that.pendingWorkerCount,_that.shopCount,_that.pendingShopCount,_that.materialCount,_that.orderCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userCount,  int workerCount,  int pendingWorkerCount,  int shopCount,  int pendingShopCount,  int materialCount,  int orderCount)  $default,) {final _that = this;
switch (_that) {
case _AdminStatsEntity():
return $default(_that.userCount,_that.workerCount,_that.pendingWorkerCount,_that.shopCount,_that.pendingShopCount,_that.materialCount,_that.orderCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userCount,  int workerCount,  int pendingWorkerCount,  int shopCount,  int pendingShopCount,  int materialCount,  int orderCount)?  $default,) {final _that = this;
switch (_that) {
case _AdminStatsEntity() when $default != null:
return $default(_that.userCount,_that.workerCount,_that.pendingWorkerCount,_that.shopCount,_that.pendingShopCount,_that.materialCount,_that.orderCount);case _:
  return null;

}
}

}

/// @nodoc


class _AdminStatsEntity implements AdminStatsEntity {
  const _AdminStatsEntity({required this.userCount, required this.workerCount, required this.pendingWorkerCount, required this.shopCount, required this.pendingShopCount, required this.materialCount, required this.orderCount});
  

@override final  int userCount;
@override final  int workerCount;
@override final  int pendingWorkerCount;
@override final  int shopCount;
@override final  int pendingShopCount;
@override final  int materialCount;
@override final  int orderCount;

/// Create a copy of AdminStatsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminStatsEntityCopyWith<_AdminStatsEntity> get copyWith => __$AdminStatsEntityCopyWithImpl<_AdminStatsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminStatsEntity&&(identical(other.userCount, userCount) || other.userCount == userCount)&&(identical(other.workerCount, workerCount) || other.workerCount == workerCount)&&(identical(other.pendingWorkerCount, pendingWorkerCount) || other.pendingWorkerCount == pendingWorkerCount)&&(identical(other.shopCount, shopCount) || other.shopCount == shopCount)&&(identical(other.pendingShopCount, pendingShopCount) || other.pendingShopCount == pendingShopCount)&&(identical(other.materialCount, materialCount) || other.materialCount == materialCount)&&(identical(other.orderCount, orderCount) || other.orderCount == orderCount));
}


@override
int get hashCode => Object.hash(runtimeType,userCount,workerCount,pendingWorkerCount,shopCount,pendingShopCount,materialCount,orderCount);

@override
String toString() {
  return 'AdminStatsEntity(userCount: $userCount, workerCount: $workerCount, pendingWorkerCount: $pendingWorkerCount, shopCount: $shopCount, pendingShopCount: $pendingShopCount, materialCount: $materialCount, orderCount: $orderCount)';
}


}

/// @nodoc
abstract mixin class _$AdminStatsEntityCopyWith<$Res> implements $AdminStatsEntityCopyWith<$Res> {
  factory _$AdminStatsEntityCopyWith(_AdminStatsEntity value, $Res Function(_AdminStatsEntity) _then) = __$AdminStatsEntityCopyWithImpl;
@override @useResult
$Res call({
 int userCount, int workerCount, int pendingWorkerCount, int shopCount, int pendingShopCount, int materialCount, int orderCount
});




}
/// @nodoc
class __$AdminStatsEntityCopyWithImpl<$Res>
    implements _$AdminStatsEntityCopyWith<$Res> {
  __$AdminStatsEntityCopyWithImpl(this._self, this._then);

  final _AdminStatsEntity _self;
  final $Res Function(_AdminStatsEntity) _then;

/// Create a copy of AdminStatsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userCount = null,Object? workerCount = null,Object? pendingWorkerCount = null,Object? shopCount = null,Object? pendingShopCount = null,Object? materialCount = null,Object? orderCount = null,}) {
  return _then(_AdminStatsEntity(
userCount: null == userCount ? _self.userCount : userCount // ignore: cast_nullable_to_non_nullable
as int,workerCount: null == workerCount ? _self.workerCount : workerCount // ignore: cast_nullable_to_non_nullable
as int,pendingWorkerCount: null == pendingWorkerCount ? _self.pendingWorkerCount : pendingWorkerCount // ignore: cast_nullable_to_non_nullable
as int,shopCount: null == shopCount ? _self.shopCount : shopCount // ignore: cast_nullable_to_non_nullable
as int,pendingShopCount: null == pendingShopCount ? _self.pendingShopCount : pendingShopCount // ignore: cast_nullable_to_non_nullable
as int,materialCount: null == materialCount ? _self.materialCount : materialCount // ignore: cast_nullable_to_non_nullable
as int,orderCount: null == orderCount ? _self.orderCount : orderCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
