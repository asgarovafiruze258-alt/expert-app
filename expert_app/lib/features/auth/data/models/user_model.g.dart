// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  fullName: json['full_name'] as String,
  avatarUrl: json['avatar_url'] as String?,
  dateOfBirth: json['date_of_birth'] == null
      ? null
      : DateTime.parse(json['date_of_birth'] as String),
  role: json['role'] as String? ?? 'customer',
  preferredLanguage: json['preferred_language'] as String? ?? 'az',
  isVerified: json['is_verified'] as bool? ?? false,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'email': instance.email,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
      'role': instance.role,
      'preferred_language': instance.preferredLanguage,
      'is_verified': instance.isVerified,
    };
