// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatModel {

 String get id; String get participantOne; String get participantTwo; String? get participantOneName; String? get participantOneAvatar; String? get participantTwoName; String? get participantTwoAvatar; String? get orderId; String? get lastMessageText; String? get lastMessageAt; String get createdAt;
/// Create a copy of ChatModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatModelCopyWith<ChatModel> get copyWith => _$ChatModelCopyWithImpl<ChatModel>(this as ChatModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatModel&&(identical(other.id, id) || other.id == id)&&(identical(other.participantOne, participantOne) || other.participantOne == participantOne)&&(identical(other.participantTwo, participantTwo) || other.participantTwo == participantTwo)&&(identical(other.participantOneName, participantOneName) || other.participantOneName == participantOneName)&&(identical(other.participantOneAvatar, participantOneAvatar) || other.participantOneAvatar == participantOneAvatar)&&(identical(other.participantTwoName, participantTwoName) || other.participantTwoName == participantTwoName)&&(identical(other.participantTwoAvatar, participantTwoAvatar) || other.participantTwoAvatar == participantTwoAvatar)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.lastMessageText, lastMessageText) || other.lastMessageText == lastMessageText)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,participantOne,participantTwo,participantOneName,participantOneAvatar,participantTwoName,participantTwoAvatar,orderId,lastMessageText,lastMessageAt,createdAt);

@override
String toString() {
  return 'ChatModel(id: $id, participantOne: $participantOne, participantTwo: $participantTwo, participantOneName: $participantOneName, participantOneAvatar: $participantOneAvatar, participantTwoName: $participantTwoName, participantTwoAvatar: $participantTwoAvatar, orderId: $orderId, lastMessageText: $lastMessageText, lastMessageAt: $lastMessageAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ChatModelCopyWith<$Res>  {
  factory $ChatModelCopyWith(ChatModel value, $Res Function(ChatModel) _then) = _$ChatModelCopyWithImpl;
@useResult
$Res call({
 String id, String participantOne, String participantTwo, String? participantOneName, String? participantOneAvatar, String? participantTwoName, String? participantTwoAvatar, String? orderId, String? lastMessageText, String? lastMessageAt, String createdAt
});




}
/// @nodoc
class _$ChatModelCopyWithImpl<$Res>
    implements $ChatModelCopyWith<$Res> {
  _$ChatModelCopyWithImpl(this._self, this._then);

  final ChatModel _self;
  final $Res Function(ChatModel) _then;

/// Create a copy of ChatModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? participantOne = null,Object? participantTwo = null,Object? participantOneName = freezed,Object? participantOneAvatar = freezed,Object? participantTwoName = freezed,Object? participantTwoAvatar = freezed,Object? orderId = freezed,Object? lastMessageText = freezed,Object? lastMessageAt = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,participantOne: null == participantOne ? _self.participantOne : participantOne // ignore: cast_nullable_to_non_nullable
as String,participantTwo: null == participantTwo ? _self.participantTwo : participantTwo // ignore: cast_nullable_to_non_nullable
as String,participantOneName: freezed == participantOneName ? _self.participantOneName : participantOneName // ignore: cast_nullable_to_non_nullable
as String?,participantOneAvatar: freezed == participantOneAvatar ? _self.participantOneAvatar : participantOneAvatar // ignore: cast_nullable_to_non_nullable
as String?,participantTwoName: freezed == participantTwoName ? _self.participantTwoName : participantTwoName // ignore: cast_nullable_to_non_nullable
as String?,participantTwoAvatar: freezed == participantTwoAvatar ? _self.participantTwoAvatar : participantTwoAvatar // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,lastMessageText: freezed == lastMessageText ? _self.lastMessageText : lastMessageText // ignore: cast_nullable_to_non_nullable
as String?,lastMessageAt: freezed == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatModel].
extension ChatModelPatterns on ChatModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String participantOne,  String participantTwo,  String? participantOneName,  String? participantOneAvatar,  String? participantTwoName,  String? participantTwoAvatar,  String? orderId,  String? lastMessageText,  String? lastMessageAt,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatModel() when $default != null:
return $default(_that.id,_that.participantOne,_that.participantTwo,_that.participantOneName,_that.participantOneAvatar,_that.participantTwoName,_that.participantTwoAvatar,_that.orderId,_that.lastMessageText,_that.lastMessageAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String participantOne,  String participantTwo,  String? participantOneName,  String? participantOneAvatar,  String? participantTwoName,  String? participantTwoAvatar,  String? orderId,  String? lastMessageText,  String? lastMessageAt,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _ChatModel():
return $default(_that.id,_that.participantOne,_that.participantTwo,_that.participantOneName,_that.participantOneAvatar,_that.participantTwoName,_that.participantTwoAvatar,_that.orderId,_that.lastMessageText,_that.lastMessageAt,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String participantOne,  String participantTwo,  String? participantOneName,  String? participantOneAvatar,  String? participantTwoName,  String? participantTwoAvatar,  String? orderId,  String? lastMessageText,  String? lastMessageAt,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ChatModel() when $default != null:
return $default(_that.id,_that.participantOne,_that.participantTwo,_that.participantOneName,_that.participantOneAvatar,_that.participantTwoName,_that.participantTwoAvatar,_that.orderId,_that.lastMessageText,_that.lastMessageAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _ChatModel extends ChatModel {
  const _ChatModel({required this.id, required this.participantOne, required this.participantTwo, this.participantOneName, this.participantOneAvatar, this.participantTwoName, this.participantTwoAvatar, this.orderId, this.lastMessageText, this.lastMessageAt, required this.createdAt}): super._();
  

@override final  String id;
@override final  String participantOne;
@override final  String participantTwo;
@override final  String? participantOneName;
@override final  String? participantOneAvatar;
@override final  String? participantTwoName;
@override final  String? participantTwoAvatar;
@override final  String? orderId;
@override final  String? lastMessageText;
@override final  String? lastMessageAt;
@override final  String createdAt;

/// Create a copy of ChatModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatModelCopyWith<_ChatModel> get copyWith => __$ChatModelCopyWithImpl<_ChatModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatModel&&(identical(other.id, id) || other.id == id)&&(identical(other.participantOne, participantOne) || other.participantOne == participantOne)&&(identical(other.participantTwo, participantTwo) || other.participantTwo == participantTwo)&&(identical(other.participantOneName, participantOneName) || other.participantOneName == participantOneName)&&(identical(other.participantOneAvatar, participantOneAvatar) || other.participantOneAvatar == participantOneAvatar)&&(identical(other.participantTwoName, participantTwoName) || other.participantTwoName == participantTwoName)&&(identical(other.participantTwoAvatar, participantTwoAvatar) || other.participantTwoAvatar == participantTwoAvatar)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.lastMessageText, lastMessageText) || other.lastMessageText == lastMessageText)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,participantOne,participantTwo,participantOneName,participantOneAvatar,participantTwoName,participantTwoAvatar,orderId,lastMessageText,lastMessageAt,createdAt);

@override
String toString() {
  return 'ChatModel(id: $id, participantOne: $participantOne, participantTwo: $participantTwo, participantOneName: $participantOneName, participantOneAvatar: $participantOneAvatar, participantTwoName: $participantTwoName, participantTwoAvatar: $participantTwoAvatar, orderId: $orderId, lastMessageText: $lastMessageText, lastMessageAt: $lastMessageAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ChatModelCopyWith<$Res> implements $ChatModelCopyWith<$Res> {
  factory _$ChatModelCopyWith(_ChatModel value, $Res Function(_ChatModel) _then) = __$ChatModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String participantOne, String participantTwo, String? participantOneName, String? participantOneAvatar, String? participantTwoName, String? participantTwoAvatar, String? orderId, String? lastMessageText, String? lastMessageAt, String createdAt
});




}
/// @nodoc
class __$ChatModelCopyWithImpl<$Res>
    implements _$ChatModelCopyWith<$Res> {
  __$ChatModelCopyWithImpl(this._self, this._then);

  final _ChatModel _self;
  final $Res Function(_ChatModel) _then;

/// Create a copy of ChatModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? participantOne = null,Object? participantTwo = null,Object? participantOneName = freezed,Object? participantOneAvatar = freezed,Object? participantTwoName = freezed,Object? participantTwoAvatar = freezed,Object? orderId = freezed,Object? lastMessageText = freezed,Object? lastMessageAt = freezed,Object? createdAt = null,}) {
  return _then(_ChatModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,participantOne: null == participantOne ? _self.participantOne : participantOne // ignore: cast_nullable_to_non_nullable
as String,participantTwo: null == participantTwo ? _self.participantTwo : participantTwo // ignore: cast_nullable_to_non_nullable
as String,participantOneName: freezed == participantOneName ? _self.participantOneName : participantOneName // ignore: cast_nullable_to_non_nullable
as String?,participantOneAvatar: freezed == participantOneAvatar ? _self.participantOneAvatar : participantOneAvatar // ignore: cast_nullable_to_non_nullable
as String?,participantTwoName: freezed == participantTwoName ? _self.participantTwoName : participantTwoName // ignore: cast_nullable_to_non_nullable
as String?,participantTwoAvatar: freezed == participantTwoAvatar ? _self.participantTwoAvatar : participantTwoAvatar // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,lastMessageText: freezed == lastMessageText ? _self.lastMessageText : lastMessageText // ignore: cast_nullable_to_non_nullable
as String?,lastMessageAt: freezed == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
