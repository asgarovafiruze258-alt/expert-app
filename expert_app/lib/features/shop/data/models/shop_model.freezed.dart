// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShopModel {

 String get id; String get name; String? get logoUrl; String? get address; String? get rayon; double? get latitude; double? get longitude; String? get contactPhone; double get rating; bool get isApproved;
/// Create a copy of ShopModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShopModelCopyWith<ShopModel> get copyWith => _$ShopModelCopyWithImpl<ShopModel>(this as ShopModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShopModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.address, address) || other.address == address)&&(identical(other.rayon, rayon) || other.rayon == rayon)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,address,rayon,latitude,longitude,contactPhone,rating,isApproved);

@override
String toString() {
  return 'ShopModel(id: $id, name: $name, logoUrl: $logoUrl, address: $address, rayon: $rayon, latitude: $latitude, longitude: $longitude, contactPhone: $contactPhone, rating: $rating, isApproved: $isApproved)';
}


}

/// @nodoc
abstract mixin class $ShopModelCopyWith<$Res>  {
  factory $ShopModelCopyWith(ShopModel value, $Res Function(ShopModel) _then) = _$ShopModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? logoUrl, String? address, String? rayon, double? latitude, double? longitude, String? contactPhone, double rating, bool isApproved
});




}
/// @nodoc
class _$ShopModelCopyWithImpl<$Res>
    implements $ShopModelCopyWith<$Res> {
  _$ShopModelCopyWithImpl(this._self, this._then);

  final ShopModel _self;
  final $Res Function(ShopModel) _then;

/// Create a copy of ShopModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logoUrl = freezed,Object? address = freezed,Object? rayon = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? contactPhone = freezed,Object? rating = null,Object? isApproved = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,rayon: freezed == rayon ? _self.rayon : rayon // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,isApproved: null == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ShopModel].
extension ShopModelPatterns on ShopModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShopModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShopModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShopModel value)  $default,){
final _that = this;
switch (_that) {
case _ShopModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShopModel value)?  $default,){
final _that = this;
switch (_that) {
case _ShopModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? logoUrl,  String? address,  String? rayon,  double? latitude,  double? longitude,  String? contactPhone,  double rating,  bool isApproved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShopModel() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.address,_that.rayon,_that.latitude,_that.longitude,_that.contactPhone,_that.rating,_that.isApproved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? logoUrl,  String? address,  String? rayon,  double? latitude,  double? longitude,  String? contactPhone,  double rating,  bool isApproved)  $default,) {final _that = this;
switch (_that) {
case _ShopModel():
return $default(_that.id,_that.name,_that.logoUrl,_that.address,_that.rayon,_that.latitude,_that.longitude,_that.contactPhone,_that.rating,_that.isApproved);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? logoUrl,  String? address,  String? rayon,  double? latitude,  double? longitude,  String? contactPhone,  double rating,  bool isApproved)?  $default,) {final _that = this;
switch (_that) {
case _ShopModel() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.address,_that.rayon,_that.latitude,_that.longitude,_that.contactPhone,_that.rating,_that.isApproved);case _:
  return null;

}
}

}

/// @nodoc


class _ShopModel extends ShopModel {
  const _ShopModel({required this.id, required this.name, this.logoUrl, this.address, this.rayon, this.latitude, this.longitude, this.contactPhone, required this.rating, required this.isApproved}): super._();
  

@override final  String id;
@override final  String name;
@override final  String? logoUrl;
@override final  String? address;
@override final  String? rayon;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? contactPhone;
@override final  double rating;
@override final  bool isApproved;

/// Create a copy of ShopModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShopModelCopyWith<_ShopModel> get copyWith => __$ShopModelCopyWithImpl<_ShopModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShopModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.address, address) || other.address == address)&&(identical(other.rayon, rayon) || other.rayon == rayon)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,address,rayon,latitude,longitude,contactPhone,rating,isApproved);

@override
String toString() {
  return 'ShopModel(id: $id, name: $name, logoUrl: $logoUrl, address: $address, rayon: $rayon, latitude: $latitude, longitude: $longitude, contactPhone: $contactPhone, rating: $rating, isApproved: $isApproved)';
}


}

/// @nodoc
abstract mixin class _$ShopModelCopyWith<$Res> implements $ShopModelCopyWith<$Res> {
  factory _$ShopModelCopyWith(_ShopModel value, $Res Function(_ShopModel) _then) = __$ShopModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? logoUrl, String? address, String? rayon, double? latitude, double? longitude, String? contactPhone, double rating, bool isApproved
});




}
/// @nodoc
class __$ShopModelCopyWithImpl<$Res>
    implements _$ShopModelCopyWith<$Res> {
  __$ShopModelCopyWithImpl(this._self, this._then);

  final _ShopModel _self;
  final $Res Function(_ShopModel) _then;

/// Create a copy of ShopModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logoUrl = freezed,Object? address = freezed,Object? rayon = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? contactPhone = freezed,Object? rating = null,Object? isApproved = null,}) {
  return _then(_ShopModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,rayon: freezed == rayon ? _self.rayon : rayon // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,isApproved: null == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
