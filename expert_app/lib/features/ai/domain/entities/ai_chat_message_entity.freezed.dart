// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_chat_message_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AiChatMessageEntity {

 AiMessageRole get role; String get content;
/// Create a copy of AiChatMessageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiChatMessageEntityCopyWith<AiChatMessageEntity> get copyWith => _$AiChatMessageEntityCopyWithImpl<AiChatMessageEntity>(this as AiChatMessageEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiChatMessageEntity&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,role,content);

@override
String toString() {
  return 'AiChatMessageEntity(role: $role, content: $content)';
}


}

/// @nodoc
abstract mixin class $AiChatMessageEntityCopyWith<$Res>  {
  factory $AiChatMessageEntityCopyWith(AiChatMessageEntity value, $Res Function(AiChatMessageEntity) _then) = _$AiChatMessageEntityCopyWithImpl;
@useResult
$Res call({
 AiMessageRole role, String content
});




}
/// @nodoc
class _$AiChatMessageEntityCopyWithImpl<$Res>
    implements $AiChatMessageEntityCopyWith<$Res> {
  _$AiChatMessageEntityCopyWithImpl(this._self, this._then);

  final AiChatMessageEntity _self;
  final $Res Function(AiChatMessageEntity) _then;

/// Create a copy of AiChatMessageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,Object? content = null,}) {
  return _then(_self.copyWith(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AiMessageRole,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AiChatMessageEntity].
extension AiChatMessageEntityPatterns on AiChatMessageEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiChatMessageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiChatMessageEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiChatMessageEntity value)  $default,){
final _that = this;
switch (_that) {
case _AiChatMessageEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiChatMessageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AiChatMessageEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AiMessageRole role,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiChatMessageEntity() when $default != null:
return $default(_that.role,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AiMessageRole role,  String content)  $default,) {final _that = this;
switch (_that) {
case _AiChatMessageEntity():
return $default(_that.role,_that.content);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AiMessageRole role,  String content)?  $default,) {final _that = this;
switch (_that) {
case _AiChatMessageEntity() when $default != null:
return $default(_that.role,_that.content);case _:
  return null;

}
}

}

/// @nodoc


class _AiChatMessageEntity implements AiChatMessageEntity {
  const _AiChatMessageEntity({required this.role, required this.content});
  

@override final  AiMessageRole role;
@override final  String content;

/// Create a copy of AiChatMessageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiChatMessageEntityCopyWith<_AiChatMessageEntity> get copyWith => __$AiChatMessageEntityCopyWithImpl<_AiChatMessageEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiChatMessageEntity&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,role,content);

@override
String toString() {
  return 'AiChatMessageEntity(role: $role, content: $content)';
}


}

/// @nodoc
abstract mixin class _$AiChatMessageEntityCopyWith<$Res> implements $AiChatMessageEntityCopyWith<$Res> {
  factory _$AiChatMessageEntityCopyWith(_AiChatMessageEntity value, $Res Function(_AiChatMessageEntity) _then) = __$AiChatMessageEntityCopyWithImpl;
@override @useResult
$Res call({
 AiMessageRole role, String content
});




}
/// @nodoc
class __$AiChatMessageEntityCopyWithImpl<$Res>
    implements _$AiChatMessageEntityCopyWith<$Res> {
  __$AiChatMessageEntityCopyWithImpl(this._self, this._then);

  final _AiChatMessageEntity _self;
  final $Res Function(_AiChatMessageEntity) _then;

/// Create a copy of AiChatMessageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,Object? content = null,}) {
  return _then(_AiChatMessageEntity(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AiMessageRole,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
