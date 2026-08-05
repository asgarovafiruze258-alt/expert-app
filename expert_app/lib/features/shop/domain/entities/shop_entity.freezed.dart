// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShopEntity {

 String get id; String get name; String? get logoUrl; String? get address; String? get rayon; double get rating; bool get isApproved;
/// Create a copy of ShopEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShopEntityCopyWith<ShopEntity> get copyWith => _$ShopEntityCopyWithImpl<ShopEntity>(this as ShopEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShopEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.address, address) || other.address == address)&&(identical(other.rayon, rayon) || other.rayon == rayon)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,address,rayon,rating,isApproved);

@override
String toString() {
  return 'ShopEntity(id: $id, name: $name, logoUrl: $logoUrl, address: $address, rayon: $rayon, rating: $rating, isApproved: $isApproved)';
}


}

/// @nodoc
abstract mixin class $ShopEntityCopyWith<$Res>  {
  factory $ShopEntityCopyWith(ShopEntity value, $Res Function(ShopEntity) _then) = _$ShopEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? logoUrl, String? address, String? rayon, double rating, bool isApproved
});




}
/// @nodoc
class _$ShopEntityCopyWithImpl<$Res>
    implements $ShopEntityCopyWith<$Res> {
  _$ShopEntityCopyWithImpl(this._self, this._then);

  final ShopEntity _self;
  final $Res Function(ShopEntity) _then;

/// Create a copy of ShopEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logoUrl = freezed,Object? address = freezed,Object? rayon = freezed,Object? rating = null,Object? isApproved = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,rayon: freezed == rayon ? _self.rayon : rayon // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,isApproved: null == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ShopEntity].
extension ShopEntityPatterns on ShopEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShopEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShopEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShopEntity value)  $default,){
final _that = this;
switch (_that) {
case _ShopEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShopEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ShopEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? logoUrl,  String? address,  String? rayon,  double rating,  bool isApproved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShopEntity() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.address,_that.rayon,_that.rating,_that.isApproved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? logoUrl,  String? address,  String? rayon,  double rating,  bool isApproved)  $default,) {final _that = this;
switch (_that) {
case _ShopEntity():
return $default(_that.id,_that.name,_that.logoUrl,_that.address,_that.rayon,_that.rating,_that.isApproved);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? logoUrl,  String? address,  String? rayon,  double rating,  bool isApproved)?  $default,) {final _that = this;
switch (_that) {
case _ShopEntity() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.address,_that.rayon,_that.rating,_that.isApproved);case _:
  return null;

}
}

}

/// @nodoc


class _ShopEntity implements ShopEntity {
  const _ShopEntity({required this.id, required this.name, this.logoUrl, this.address, this.rayon, this.rating = 0, this.isApproved = false});
  

@override final  String id;
@override final  String name;
@override final  String? logoUrl;
@override final  String? address;
@override final  String? rayon;
@override@JsonKey() final  double rating;
@override@JsonKey() final  bool isApproved;

/// Create a copy of ShopEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShopEntityCopyWith<_ShopEntity> get copyWith => __$ShopEntityCopyWithImpl<_ShopEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShopEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.address, address) || other.address == address)&&(identical(other.rayon, rayon) || other.rayon == rayon)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,address,rayon,rating,isApproved);

@override
String toString() {
  return 'ShopEntity(id: $id, name: $name, logoUrl: $logoUrl, address: $address, rayon: $rayon, rating: $rating, isApproved: $isApproved)';
}


}

/// @nodoc
abstract mixin class _$ShopEntityCopyWith<$Res> implements $ShopEntityCopyWith<$Res> {
  factory _$ShopEntityCopyWith(_ShopEntity value, $Res Function(_ShopEntity) _then) = __$ShopEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? logoUrl, String? address, String? rayon, double rating, bool isApproved
});




}
/// @nodoc
class __$ShopEntityCopyWithImpl<$Res>
    implements _$ShopEntityCopyWith<$Res> {
  __$ShopEntityCopyWithImpl(this._self, this._then);

  final _ShopEntity _self;
  final $Res Function(_ShopEntity) _then;

/// Create a copy of ShopEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logoUrl = freezed,Object? address = freezed,Object? rayon = freezed,Object? rating = null,Object? isApproved = null,}) {
  return _then(_ShopEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,rayon: freezed == rayon ? _self.rayon : rayon // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,isApproved: null == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
