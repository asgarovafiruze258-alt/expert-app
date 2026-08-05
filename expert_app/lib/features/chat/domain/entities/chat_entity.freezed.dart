// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatEntity {

 String get id; String get otherUserId; String get otherUserName; String? get otherUserAvatarUrl; String? get orderId; String? get lastMessageText; DateTime? get lastMessageAt; DateTime get createdAt;
/// Create a copy of ChatEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatEntityCopyWith<ChatEntity> get copyWith => _$ChatEntityCopyWithImpl<ChatEntity>(this as ChatEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.otherUserId, otherUserId) || other.otherUserId == otherUserId)&&(identical(other.otherUserName, otherUserName) || other.otherUserName == otherUserName)&&(identical(other.otherUserAvatarUrl, otherUserAvatarUrl) || other.otherUserAvatarUrl == otherUserAvatarUrl)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.lastMessageText, lastMessageText) || other.lastMessageText == lastMessageText)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,otherUserId,otherUserName,otherUserAvatarUrl,orderId,lastMessageText,lastMessageAt,createdAt);

@override
String toString() {
  return 'ChatEntity(id: $id, otherUserId: $otherUserId, otherUserName: $otherUserName, otherUserAvatarUrl: $otherUserAvatarUrl, orderId: $orderId, lastMessageText: $lastMessageText, lastMessageAt: $lastMessageAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ChatEntityCopyWith<$Res>  {
  factory $ChatEntityCopyWith(ChatEntity value, $Res Function(ChatEntity) _then) = _$ChatEntityCopyWithImpl;
@useResult
$Res call({
 String id, String otherUserId, String otherUserName, String? otherUserAvatarUrl, String? orderId, String? lastMessageText, DateTime? lastMessageAt, DateTime createdAt
});




}
/// @nodoc
class _$ChatEntityCopyWithImpl<$Res>
    implements $ChatEntityCopyWith<$Res> {
  _$ChatEntityCopyWithImpl(this._self, this._then);

  final ChatEntity _self;
  final $Res Function(ChatEntity) _then;

/// Create a copy of ChatEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? otherUserId = null,Object? otherUserName = null,Object? otherUserAvatarUrl = freezed,Object? orderId = freezed,Object? lastMessageText = freezed,Object? lastMessageAt = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,otherUserId: null == otherUserId ? _self.otherUserId : otherUserId // ignore: cast_nullable_to_non_nullable
as String,otherUserName: null == otherUserName ? _self.otherUserName : otherUserName // ignore: cast_nullable_to_non_nullable
as String,otherUserAvatarUrl: freezed == otherUserAvatarUrl ? _self.otherUserAvatarUrl : otherUserAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,lastMessageText: freezed == lastMessageText ? _self.lastMessageText : lastMessageText // ignore: cast_nullable_to_non_nullable
as String?,lastMessageAt: freezed == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatEntity].
extension ChatEntityPatterns on ChatEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatEntity value)  $default,){
final _that = this;
switch (_that) {
case _ChatEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ChatEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String otherUserId,  String otherUserName,  String? otherUserAvatarUrl,  String? orderId,  String? lastMessageText,  DateTime? lastMessageAt,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatEntity() when $default != null:
return $default(_that.id,_that.otherUserId,_that.otherUserName,_that.otherUserAvatarUrl,_that.orderId,_that.lastMessageText,_that.lastMessageAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String otherUserId,  String otherUserName,  String? otherUserAvatarUrl,  String? orderId,  String? lastMessageText,  DateTime? lastMessageAt,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ChatEntity():
return $default(_that.id,_that.otherUserId,_that.otherUserName,_that.otherUserAvatarUrl,_that.orderId,_that.lastMessageText,_that.lastMessageAt,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String otherUserId,  String otherUserName,  String? otherUserAvatarUrl,  String? orderId,  String? lastMessageText,  DateTime? lastMessageAt,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ChatEntity() when $default != null:
return $default(_that.id,_that.otherUserId,_that.otherUserName,_that.otherUserAvatarUrl,_that.orderId,_that.lastMessageText,_that.lastMessageAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _ChatEntity implements ChatEntity {
  const _ChatEntity({required this.id, required this.otherUserId, required this.otherUserName, this.otherUserAvatarUrl, this.orderId, this.lastMessageText, this.lastMessageAt, required this.createdAt});
  

@override final  String id;
@override final  String otherUserId;
@override final  String otherUserName;
@override final  String? otherUserAvatarUrl;
@override final  String? orderId;
@override final  String? lastMessageText;
@override final  DateTime? lastMessageAt;
@override final  DateTime createdAt;

/// Create a copy of ChatEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatEntityCopyWith<_ChatEntity> get copyWith => __$ChatEntityCopyWithImpl<_ChatEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.otherUserId, otherUserId) || other.otherUserId == otherUserId)&&(identical(other.otherUserName, otherUserName) || other.otherUserName == otherUserName)&&(identical(other.otherUserAvatarUrl, otherUserAvatarUrl) || other.otherUserAvatarUrl == otherUserAvatarUrl)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.lastMessageText, lastMessageText) || other.lastMessageText == lastMessageText)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,otherUserId,otherUserName,otherUserAvatarUrl,orderId,lastMessageText,lastMessageAt,createdAt);

@override
String toString() {
  return 'ChatEntity(id: $id, otherUserId: $otherUserId, otherUserName: $otherUserName, otherUserAvatarUrl: $otherUserAvatarUrl, orderId: $orderId, lastMessageText: $lastMessageText, lastMessageAt: $lastMessageAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ChatEntityCopyWith<$Res> implements $ChatEntityCopyWith<$Res> {
  factory _$ChatEntityCopyWith(_ChatEntity value, $Res Function(_ChatEntity) _then) = __$ChatEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String otherUserId, String otherUserName, String? otherUserAvatarUrl, String? orderId, String? lastMessageText, DateTime? lastMessageAt, DateTime createdAt
});




}
/// @nodoc
class __$ChatEntityCopyWithImpl<$Res>
    implements _$ChatEntityCopyWith<$Res> {
  __$ChatEntityCopyWithImpl(this._self, this._then);

  final _ChatEntity _self;
  final $Res Function(_ChatEntity) _then;

/// Create a copy of ChatEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? otherUserId = null,Object? otherUserName = null,Object? otherUserAvatarUrl = freezed,Object? orderId = freezed,Object? lastMessageText = freezed,Object? lastMessageAt = freezed,Object? createdAt = null,}) {
  return _then(_ChatEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,otherUserId: null == otherUserId ? _self.otherUserId : otherUserId // ignore: cast_nullable_to_non_nullable
as String,otherUserName: null == otherUserName ? _self.otherUserName : otherUserName // ignore: cast_nullable_to_non_nullable
as String,otherUserAvatarUrl: freezed == otherUserAvatarUrl ? _self.otherUserAvatarUrl : otherUserAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,lastMessageText: freezed == lastMessageText ? _self.lastMessageText : lastMessageText // ignore: cast_nullable_to_non_nullable
as String?,lastMessageAt: freezed == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
