import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    String? phone,
    String? email,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @Default('customer') String role,
    @JsonKey(name: 'preferred_language') @Default('az') String preferredLanguage,
    @JsonKey(name: 'is_verified') @Default(false) bool isVerified,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      phone: phone,
      email: email,
      fullName: fullName,
      avatarUrl: avatarUrl,
      role: _roleFromDb(role),
      preferredLanguage: preferredLanguage,
      isVerified: isVerified,
    );
  }

  static UserRole _roleFromDb(String value) {
    switch (value) {
      case 'shop_owner':
        return UserRole.shopOwner;
      case 'worker':
        return UserRole.worker;
      case 'admin':
        return UserRole.admin;
      case 'customer':
      default:
        return UserRole.customer;
    }
  }
}
