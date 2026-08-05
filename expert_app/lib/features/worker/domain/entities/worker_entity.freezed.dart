// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkerEntity {

 String get id; String get fullName; String? get avatarUrl; String? get bio; int get experienceYears; double? get priceFrom; double? get priceTo; List<String> get serviceAreas; List<String> get portfolioImages; String? get contactPhone; double get rating; int get reviewCount; bool get isOnline; bool get isAvailable; bool get isApproved; List<String> get categoryNames;
/// Create a copy of WorkerEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkerEntityCopyWith<WorkerEntity> get copyWith => _$WorkerEntityCopyWithImpl<WorkerEntity>(this as WorkerEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkerEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.experienceYears, experienceYears) || other.experienceYears == experienceYears)&&(identical(other.priceFrom, priceFrom) || other.priceFrom == priceFrom)&&(identical(other.priceTo, priceTo) || other.priceTo == priceTo)&&const DeepCollectionEquality().equals(other.serviceAreas, serviceAreas)&&const DeepCollectionEquality().equals(other.portfolioImages, portfolioImages)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved)&&const DeepCollectionEquality().equals(other.categoryNames, categoryNames));
}


@override
int get hashCode => Object.hash(runtimeType,id,fullName,avatarUrl,bio,experienceYears,priceFrom,priceTo,const DeepCollectionEquality().hash(serviceAreas),const DeepCollectionEquality().hash(portfolioImages),contactPhone,rating,reviewCount,isOnline,isAvailable,isApproved,const DeepCollectionEquality().hash(categoryNames));

@override
String toString() {
  return 'WorkerEntity(id: $id, fullName: $fullName, avatarUrl: $avatarUrl, bio: $bio, experienceYears: $experienceYears, priceFrom: $priceFrom, priceTo: $priceTo, serviceAreas: $serviceAreas, portfolioImages: $portfolioImages, contactPhone: $contactPhone, rating: $rating, reviewCount: $reviewCount, isOnline: $isOnline, isAvailable: $isAvailable, isApproved: $isApproved, categoryNames: $categoryNames)';
}


}

/// @nodoc
abstract mixin class $WorkerEntityCopyWith<$Res>  {
  factory $WorkerEntityCopyWith(WorkerEntity value, $Res Function(WorkerEntity) _then) = _$WorkerEntityCopyWithImpl;
@useResult
$Res call({
 String id, String fullName, String? avatarUrl, String? bio, int experienceYears, double? priceFrom, double? priceTo, List<String> serviceAreas, List<String> portfolioImages, String? contactPhone, double rating, int reviewCount, bool isOnline, bool isAvailable, bool isApproved, List<String> categoryNames
});




}
/// @nodoc
class _$WorkerEntityCopyWithImpl<$Res>
    implements $WorkerEntityCopyWith<$Res> {
  _$WorkerEntityCopyWithImpl(this._self, this._then);

  final WorkerEntity _self;
  final $Res Function(WorkerEntity) _then;

/// Create a copy of WorkerEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? avatarUrl = freezed,Object? bio = freezed,Object? experienceYears = null,Object? priceFrom = freezed,Object? priceTo = freezed,Object? serviceAreas = null,Object? portfolioImages = null,Object? contactPhone = freezed,Object? rating = null,Object? reviewCount = null,Object? isOnline = null,Object? isAvailable = null,Object? isApproved = null,Object? categoryNames = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,experienceYears: null == experienceYears ? _self.experienceYears : experienceYears // ignore: cast_nullable_to_non_nullable
as int,priceFrom: freezed == priceFrom ? _self.priceFrom : priceFrom // ignore: cast_nullable_to_non_nullable
as double?,priceTo: freezed == priceTo ? _self.priceTo : priceTo // ignore: cast_nullable_to_non_nullable
as double?,serviceAreas: null == serviceAreas ? _self.serviceAreas : serviceAreas // ignore: cast_nullable_to_non_nullable
as List<String>,portfolioImages: null == portfolioImages ? _self.portfolioImages : portfolioImages // ignore: cast_nullable_to_non_nullable
as List<String>,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isApproved: null == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool,categoryNames: null == categoryNames ? _self.categoryNames : categoryNames // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkerEntity].
extension WorkerEntityPatterns on WorkerEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkerEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkerEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkerEntity value)  $default,){
final _that = this;
switch (_that) {
case _WorkerEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkerEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WorkerEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fullName,  String? avatarUrl,  String? bio,  int experienceYears,  double? priceFrom,  double? priceTo,  List<String> serviceAreas,  List<String> portfolioImages,  String? contactPhone,  double rating,  int reviewCount,  bool isOnline,  bool isAvailable,  bool isApproved,  List<String> categoryNames)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkerEntity() when $default != null:
return $default(_that.id,_that.fullName,_that.avatarUrl,_that.bio,_that.experienceYears,_that.priceFrom,_that.priceTo,_that.serviceAreas,_that.portfolioImages,_that.contactPhone,_that.rating,_that.reviewCount,_that.isOnline,_that.isAvailable,_that.isApproved,_that.categoryNames);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fullName,  String? avatarUrl,  String? bio,  int experienceYears,  double? priceFrom,  double? priceTo,  List<String> serviceAreas,  List<String> portfolioImages,  String? contactPhone,  double rating,  int reviewCount,  bool isOnline,  bool isAvailable,  bool isApproved,  List<String> categoryNames)  $default,) {final _that = this;
switch (_that) {
case _WorkerEntity():
return $default(_that.id,_that.fullName,_that.avatarUrl,_that.bio,_that.experienceYears,_that.priceFrom,_that.priceTo,_that.serviceAreas,_that.portfolioImages,_that.contactPhone,_that.rating,_that.reviewCount,_that.isOnline,_that.isAvailable,_that.isApproved,_that.categoryNames);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fullName,  String? avatarUrl,  String? bio,  int experienceYears,  double? priceFrom,  double? priceTo,  List<String> serviceAreas,  List<String> portfolioImages,  String? contactPhone,  double rating,  int reviewCount,  bool isOnline,  bool isAvailable,  bool isApproved,  List<String> categoryNames)?  $default,) {final _that = this;
switch (_that) {
case _WorkerEntity() when $default != null:
return $default(_that.id,_that.fullName,_that.avatarUrl,_that.bio,_that.experienceYears,_that.priceFrom,_that.priceTo,_that.serviceAreas,_that.portfolioImages,_that.contactPhone,_that.rating,_that.reviewCount,_that.isOnline,_that.isAvailable,_that.isApproved,_that.categoryNames);case _:
  return null;

}
}

}

/// @nodoc


class _WorkerEntity implements WorkerEntity {
  const _WorkerEntity({required this.id, required this.fullName, this.avatarUrl, this.bio, this.experienceYears = 0, this.priceFrom, this.priceTo, final  List<String> serviceAreas = const <String>[], final  List<String> portfolioImages = const <String>[], this.contactPhone, this.rating = 0, this.reviewCount = 0, this.isOnline = false, this.isAvailable = true, this.isApproved = false, final  List<String> categoryNames = const <String>[]}): _serviceAreas = serviceAreas,_portfolioImages = portfolioImages,_categoryNames = categoryNames;
  

@override final  String id;
@override final  String fullName;
@override final  String? avatarUrl;
@override final  String? bio;
@override@JsonKey() final  int experienceYears;
@override final  double? priceFrom;
@override final  double? priceTo;
 final  List<String> _serviceAreas;
@override@JsonKey() List<String> get serviceAreas {
  if (_serviceAreas is EqualUnmodifiableListView) return _serviceAreas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_serviceAreas);
}

 final  List<String> _portfolioImages;
@override@JsonKey() List<String> get portfolioImages {
  if (_portfolioImages is EqualUnmodifiableListView) return _portfolioImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_portfolioImages);
}

@override final  String? contactPhone;
@override@JsonKey() final  double rating;
@override@JsonKey() final  int reviewCount;
@override@JsonKey() final  bool isOnline;
@override@JsonKey() final  bool isAvailable;
@override@JsonKey() final  bool isApproved;
 final  List<String> _categoryNames;
@override@JsonKey() List<String> get categoryNames {
  if (_categoryNames is EqualUnmodifiableListView) return _categoryNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoryNames);
}


/// Create a copy of WorkerEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkerEntityCopyWith<_WorkerEntity> get copyWith => __$WorkerEntityCopyWithImpl<_WorkerEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkerEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.experienceYears, experienceYears) || other.experienceYears == experienceYears)&&(identical(other.priceFrom, priceFrom) || other.priceFrom == priceFrom)&&(identical(other.priceTo, priceTo) || other.priceTo == priceTo)&&const DeepCollectionEquality().equals(other._serviceAreas, _serviceAreas)&&const DeepCollectionEquality().equals(other._portfolioImages, _portfolioImages)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved)&&const DeepCollectionEquality().equals(other._categoryNames, _categoryNames));
}


@override
int get hashCode => Object.hash(runtimeType,id,fullName,avatarUrl,bio,experienceYears,priceFrom,priceTo,const DeepCollectionEquality().hash(_serviceAreas),const DeepCollectionEquality().hash(_portfolioImages),contactPhone,rating,reviewCount,isOnline,isAvailable,isApproved,const DeepCollectionEquality().hash(_categoryNames));

@override
String toString() {
  return 'WorkerEntity(id: $id, fullName: $fullName, avatarUrl: $avatarUrl, bio: $bio, experienceYears: $experienceYears, priceFrom: $priceFrom, priceTo: $priceTo, serviceAreas: $serviceAreas, portfolioImages: $portfolioImages, contactPhone: $contactPhone, rating: $rating, reviewCount: $reviewCount, isOnline: $isOnline, isAvailable: $isAvailable, isApproved: $isApproved, categoryNames: $categoryNames)';
}


}

/// @nodoc
abstract mixin class _$WorkerEntityCopyWith<$Res> implements $WorkerEntityCopyWith<$Res> {
  factory _$WorkerEntityCopyWith(_WorkerEntity value, $Res Function(_WorkerEntity) _then) = __$WorkerEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String fullName, String? avatarUrl, String? bio, int experienceYears, double? priceFrom, double? priceTo, List<String> serviceAreas, List<String> portfolioImages, String? contactPhone, double rating, int reviewCount, bool isOnline, bool isAvailable, bool isApproved, List<String> categoryNames
});




}
/// @nodoc
class __$WorkerEntityCopyWithImpl<$Res>
    implements _$WorkerEntityCopyWith<$Res> {
  __$WorkerEntityCopyWithImpl(this._self, this._then);

  final _WorkerEntity _self;
  final $Res Function(_WorkerEntity) _then;

/// Create a copy of WorkerEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? avatarUrl = freezed,Object? bio = freezed,Object? experienceYears = null,Object? priceFrom = freezed,Object? priceTo = freezed,Object? serviceAreas = null,Object? portfolioImages = null,Object? contactPhone = freezed,Object? rating = null,Object? reviewCount = null,Object? isOnline = null,Object? isAvailable = null,Object? isApproved = null,Object? categoryNames = null,}) {
  return _then(_WorkerEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,experienceYears: null == experienceYears ? _self.experienceYears : experienceYears // ignore: cast_nullable_to_non_nullable
as int,priceFrom: freezed == priceFrom ? _self.priceFrom : priceFrom // ignore: cast_nullable_to_non_nullable
as double?,priceTo: freezed == priceTo ? _self.priceTo : priceTo // ignore: cast_nullable_to_non_nullable
as double?,serviceAreas: null == serviceAreas ? _self._serviceAreas : serviceAreas // ignore: cast_nullable_to_non_nullable
as List<String>,portfolioImages: null == portfolioImages ? _self._portfolioImages : portfolioImages // ignore: cast_nullable_to_non_nullable
as List<String>,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isApproved: null == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool,categoryNames: null == categoryNames ? _self._categoryNames : categoryNames // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
